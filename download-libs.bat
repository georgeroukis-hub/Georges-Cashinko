@echo off
cd /d "%~dp0"
echo Downloading game libraries (one-time)...
powershell -ExecutionPolicy Bypass -File "%~dp0download-libs.ps1"
if errorlevel 1 pause

@echo off
cd /d "%~dp0"
echo Starting CASHINKO...
echo.

REM Prefer Python (fast startup, no build) for standalone.html
where python >nul 2>&1
if %errorlevel% equ 0 (
  echo Starting server on http://localhost:8080
  start "CASHINKO Server" /D "%~dp0" cmd /k "python -m http.server 8080"
  echo Waiting for server to start...
  timeout /t 4 /nobreak >nul
  start "" "http://localhost:8080/standalone.html?v=%random%"
  echo.
  echo If the browser says "Cannot be reached", wait 5 seconds and refresh.
  echo Or open: http://localhost:8080/standalone.html
  echo.
  echo Leave the "CASHINKO Server" window open while playing.
  pause
  exit /b 0
)

REM Fallback: Node/Vite (takes longer to start)
where npm >nul 2>&1
if %errorlevel% equ 0 (
  echo Starting Vite dev server...
  start "CASHINKO Server" /D "%~dp0" cmd /k "npm run dev"
  echo Waiting for server (may take 10-15 sec on first run)...
  timeout /t 10 /nobreak >nul
  start "" "http://localhost:5173/standalone.html?v=%random%"
  echo.
  echo If the browser says "Cannot be reached", wait a bit and refresh.
  echo Or open: http://localhost:5173/standalone.html
  echo.
  pause
  exit /b 0
)

echo Neither Python nor Node.js was found.
echo.
echo Install one of these, then run this file again:
echo   - Python: https://www.python.org/downloads/
echo   - Node.js: https://nodejs.org
echo.
echo Or run manually:  python -m http.server 8080
echo Then open: http://localhost:8080/standalone.html
echo.
pause

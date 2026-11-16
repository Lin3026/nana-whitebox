@echo off
chcp 65001 >nul
title NANA WHITEBOX - Director Workbench
cd /d "%~dp0"

set PORT=8000
set URL=http://localhost:%PORT%/

echo.
echo   NANA WHITEBOX / Director Workbench
echo   ---------------------------------
echo   Local: %URL%
echo   Folder: %CD%
echo.
echo   Keep this window open while using the tool.
echo   Press Ctrl+C to stop the server.
echo.

start "" "%URL%"

python -m http.server %PORT% --bind 127.0.0.1
if errorlevel 1 (
  echo.
  echo   [ERROR] python not found or port %PORT% busy.
  echo   Try: py -m http.server %PORT%
  echo.
  pause
)

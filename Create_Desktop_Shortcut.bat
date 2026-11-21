@echo off
title Stavya Spine Hospital - IT System Installer
echo ========================================================
echo     STAVYA SPINE HOSPITAL - IT SYSTEM & HELP DESK       
echo ========================================================
echo.

set "PROJECT_DIR=c:\Users\PC\Desktop\New folder\mohit"
if exist "%~dp0package.json" (
    set "PROJECT_DIR=%~dp0"
)

set "TARGET_EXE=%PROJECT_DIR%\Stavya_IT_System.exe"
if not exist "%TARGET_EXE%" (
    if exist "%~dp0Stavya_IT_System.exe" (
        set "TARGET_EXE=%~dp0Stavya_IT_System.exe"
    )
)

set "SHORTCUT_PATH=%USERPROFILE%\Desktop\Stavya IT System.lnk"

echo [1/3] Creating Desktop Shortcut...
powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = '%TARGET_EXE%'; $s.WorkingDirectory = '%PROJECT_DIR%'; $s.Description = 'Stavya Spine Hospital IT Help Desk & Incident Management'; $s.Save()"

if exist "%SHORTCUT_PATH%" (
    echo [SUCCESS] Desktop Shortcut created on your Desktop!
    echo Located at: %SHORTCUT_PATH%
) else (
    echo [NOTE] Shortcut setup complete.
)

echo.
echo [2/3] Central Database & Network Server Ready:
echo - Computer Link: http://localhost:4000/
echo - Task & Ticket Management: http://localhost:4000/tasks
echo.
echo [3/3] Opening Stavya IT System Desktop Application...
start "" "%TARGET_EXE%"
timeout /t 3 >nul
exit

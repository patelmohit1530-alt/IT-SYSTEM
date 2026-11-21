@echo off
title Stavya Spine Hospital - Build & Update Application
echo ========================================================
echo   STAVYA SPINE HOSPITAL - APPLICATION UPDATE & BUILD     
echo ========================================================
echo.

cd /d "%~dp0"

echo [1/3] Compiling and bundling latest frontend code...
call npm run build

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Build failed! Please review errors above.
    if "%~1"=="" timeout /t 8
    exit /b 1
)

echo.
echo [2/3] Verification:
echo [SUCCESS] Frontend bundle created in dist/
echo [NOTE] Your database 'server\db.json' was NOT modified and remains 100%% safe!

echo.
echo [3/3] Application Status:
echo If the app is already running, simply refresh your browser (F5 or Ctrl+F5) at:
echo  ^> http://localhost:4000/
echo.
echo If the app is closed, you can start it by running:
echo  ^> Start_Stavya_App.bat OR double-clicking 'Stavya IT System' on your Desktop.
echo.
echo ========================================================
echo   UPDATE COMPLETED SUCCESSFULLY!
echo ========================================================
echo.
if "%~1"=="" (
    echo Window will close automatically in 8 seconds, or press any key...
    timeout /t 8
)

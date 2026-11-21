@echo off
title Stavya Spine Hospital - Compile EXE Launcher
echo ========================================================
echo   STAVYA SPINE HOSPITAL - BUILD STANDALONE EXE LAUNCHER  
echo ========================================================
echo.

cd /d "%~dp0"

set "CSC=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
if not exist "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe" (
    set "CSC=C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe"
)

echo [1/3] Compiling launcher\Program.cs to Stavya_IT_System.exe...
"%CSC%" /target:winexe /out:Stavya_IT_System.exe /r:System.Windows.Forms.dll /r:System.Drawing.dll launcher\Program.cs

if errorlevel 1 (
    echo.
    echo [ERROR] Compilation failed!
    if "%~1"=="" timeout /t 8
    exit /b 1
)

echo.
echo [2/3] Verifying generated executable...
if exist "Stavya_IT_System.exe" (
    echo [SUCCESS] Stavya_IT_System.exe built successfully in project folder!
    echo Location: %~dp0Stavya_IT_System.exe
)

echo.
echo [3/3] Deploying copy to Desktop...
copy /y Stavya_IT_System.exe "%USERPROFILE%\Desktop\Stavya_IT_System.exe" >nul
if exist "%USERPROFILE%\Desktop\Stavya_IT_System.exe" (
    echo [SUCCESS] Copy deployed to your Desktop:
    echo Location: %USERPROFILE%\Desktop\Stavya_IT_System.exe
)

echo.
echo ========================================================
echo   EXE BUILD COMPLETE!
echo   Double-click Stavya_IT_System.exe to run the application.
echo ========================================================
echo.
if "%~1"=="" (
    echo Window will close automatically in 8 seconds, or press any key...
    timeout /t 8
)

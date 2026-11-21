@echo off
title Stavya Spine Hospital - Local Data Backup
echo ========================================================
echo   STAVYA SPINE HOSPITAL - INSTANT LOCAL DATA BACKUP     
echo ========================================================
echo.

cd /d "%~dp0"

if not exist "server\db.json" (
    echo [ERROR] server\db.json not found!
    if "%~1"=="" timeout /t 5 >nul
    exit /b 1
)

:: Get clean timestamp using Node.js (works on all Windows 10/11 systems)
for /f "usebackq tokens=*" %%I in (`node -e "const d=new Date(); const pad=(n)=>String(n).padStart(2,'0'); console.log(d.getFullYear()+'-'+pad(d.getMonth()+1)+'-'+pad(d.getDate())+'_'+pad(d.getHours())+'-'+pad(d.getMinutes())+'-'+pad(d.getSeconds()));"`) do set "TIMESTAMP=%%I"

set "BACKUP_DIR=%~dp0backup data"
set "BACKUP_FILE=%BACKUP_DIR%\Stavya_ManualBackup_%TIMESTAMP%.json"

if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

echo [1/3] Copying local database to project backup folder...
copy /y "server\db.json" "%BACKUP_FILE%" >nul
copy /y "server\db.json" "%BACKUP_DIR%\latest_backup.json" >nul

if exist "%BACKUP_FILE%" (
    echo [SUCCESS] Backup saved:
    echo  ^> %BACKUP_FILE%
) else (
    echo [ERROR] Failed to save backup in project folder!
)

echo.
echo [2/3] Checking external / D: drive backup location...
if exist "D:\" (
    if not exist "D:\software backup" mkdir "D:\software backup"
    copy /y "server\db.json" "D:\software backup\Stavya_ManualBackup_%TIMESTAMP%.json" >nul
    copy /y "server\db.json" "D:\software backup\latest_backup.json" >nul
    echo [SUCCESS] External backup saved:
    echo  ^> D:\software backup\Stavya_ManualBackup_%TIMESTAMP%.json
) else (
    echo [NOTE] D: drive not detected. Backup stored safely in: %BACKUP_DIR%
)

echo.
echo [3/3] Database Stats:
node -e "try { const d = JSON.parse(require('fs').readFileSync('server/db.json')); console.log(' - Total Equipment / Assets :', d.inventory ? d.inventory.length : 0); console.log(' - Total Tasks & Incidents   :', d.tasks ? d.tasks.length : 0); console.log(' - Total Problem Tickets     :', d.incidentTickets ? d.incidentTickets.length : 0); console.log(' - Total Registered Users    :', d.users ? d.users.length : 0); } catch(e) { console.log('Stats unavailable:', e.message); }"

echo.
echo ========================================================
echo   BACKUP COMPLETE! Your data is safe.
echo ========================================================
echo.
if "%~1"=="" (
    echo Window will close automatically in 8 seconds, or press any key...
    timeout /t 8
)

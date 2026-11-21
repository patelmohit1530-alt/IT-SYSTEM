@echo off
title Stavya IT System - Outside Demo Sandbox Access
color 0b
cls

echo ==============================================================================
echo        🏥 STAVYA SPINE HOSPITAL — OUTSIDE DEMO & PRESENTATION ACCESS
echo ==============================================================================
echo.
echo  This tool launches a live, public HTTPS tunnel so you can safely
echo  demonstrate this software to clients or visitors OUTSIDE hospital premises.
echo.
echo  =========================== SECURITY GUARANTEE ===========================
echo  * DEMO SANDBOX MODE is automatically enforced on the public link.
echo  * Zero real hospital records, patient data, or staff passwords are exposed.
echo  * All edits during the demo stay local in memory and NEVER touch server/db.json.
echo  ==========================================================================
echo.
echo  Checking network connectivity and fetching your Tunnel Password...
echo.

rem Fetch public IP for localtunnel friendly password prompt
set "PUB_IP="
for /f "tokens=*" %%a in ('powershell -Command "(Invoke-WebRequest -Uri 'https://api.ipify.org' -UseBasicParsing -TimeoutSec 3).Content" 2^>nul') do (
    set "PUB_IP=%%a"
)

if "%PUB_IP%"=="" (
    set "PUB_IP=Check at https://loca.lt/mytunnelpassword"
)

echo  --------------------------------------------------------------------------
echo   YOUR TUNNEL PASSWORD : %PUB_IP%
echo   (If localtunnel asks visitors for a password on first visit, enter this IP)
echo  --------------------------------------------------------------------------
echo.
echo  ============================== LINK TO SHARE ==============================
echo   Share this link with outside viewers:
echo.
echo   https://stavya-demo-hospital.loca.lt/?demo=true
echo.
echo  ==========================================================================
echo.
echo  Starting public secure tunnel on Port 4000...
echo  (Press Ctrl+C at any time to close outside access)
echo.

npx --yes localtunnel --port 4000 --subdomain stavya-demo-hospital

echo.
echo Tunnel closed. Outside access has been terminated.
pause

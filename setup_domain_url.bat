@echo off
title Setup Custom Domain URL for Stavya IT System
color 0b
echo ======================================================================
echo          🏥 STAVYA IT SYSTEM — CUSTOM DOMAIN URL SETUP
echo ======================================================================
echo.
echo This script will map custom domain URLs:
echo    - http://stavya-it.local:4000
echo    - http://stavya-it:4000
echo.
echo Adding entry to Windows Hosts File (requires Administrator privileges)...
echo.

powershell -Command "Start-Process cmd -ArgumentList '/c echo 127.0.0.1 stavya-it.local >> %SystemRoot%\System32\drivers\etc\hosts & echo 127.0.0.1 stavya-it >> %SystemRoot%\System32\drivers\etc\hosts' -Verb RunAs"

echo.
echo ✅ Done! Custom domain URLs mapped:
echo    👉 http://stavya-it.local:4000
echo    👉 http://stavya-it:4000
echo.
pause

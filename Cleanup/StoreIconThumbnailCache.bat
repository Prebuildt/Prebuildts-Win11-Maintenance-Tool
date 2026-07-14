@echo off
echo =================================================
echo - Store, Icon ^& Thumbnail Cache Reset - (Round 7)
echo =================================================
taskkill /f /im explorer.exe >nul 2>&1
del /f /s /q /a "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1
del /f /s /q /a "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
start "" explorer.exe

start /wait "" wsreset.exe
set "STORE_CACHE_RESULT=Completed Successfully"
echo Done

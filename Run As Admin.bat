@echo off
title Prebuildts Win11 Maintenance Tool

setlocal EnableDelayedExpansion

set "SCRIPTDIR=%~dp0"
set "CLEANUPDIR=%SCRIPTDIR%Cleanup"
set "FINALDIR=%SCRIPTDIR%Final"
set "LOGDIR=%SCRIPTDIR%FinalLogs"
if not exist "!LOGDIR!" mkdir "!LOGDIR!"

set "TS=%DATE%_%TIME%"
set "TS=%TS: =0%"
set "TS=%TS:/=-%"
set "TS=%TS::=-%"
set "TS=%TS:.=-%"
set "TS=%TS:,=-%"

powershell -NoProfile -Command "Write-Host 'Stage 1 - Beginning 3 Round System Integrity Scan & Repair' -ForegroundColor Green"
echo.
call "!CLEANUPDIR!\SFC.bat" 1 SFC_ROUND1_RESULT
call "!CLEANUPDIR!\DISMRestoreHealth.bat"
call "!CLEANUPDIR!\SFC.bat" 3 SFC_ROUND3_RESULT
echo.
powershell -NoProfile -Command "Write-Host '3 Round System Integrity Scan & Repair Completed!' -ForegroundColor Yellow"
echo.
echo.
powershell -NoProfile -Command "Write-Host 'Stage 2 - Starting 7 Round Cleanup Process' -ForegroundColor Green"
echo.
call "!CLEANUPDIR!\ClearTempFiles.bat"
call "!CLEANUPDIR!\FlushDNS.bat"
call "!CLEANUPDIR!\DriveOptimization.bat"
call "!CLEANUPDIR!\DISMComponentCleanup.bat"
call "!CLEANUPDIR!\DriverStoreCleanup.bat"
call "!CLEANUPDIR!\WindowsUpdateReset.bat"
call "!CLEANUPDIR!\StoreIconThumbnailCache.bat"
echo.
powershell -NoProfile -Command "Write-Host 'CRISP And CLEAN. 7 Round Cleanup Process Complete.' -ForegroundColor Yellow"
echo.
echo.
powershell -NoProfile -Command "Write-Host 'Stage 3 - Starting Final Disk Health Check' -ForegroundColor Green"
echo.
call "!CLEANUPDIR!\CheckDiskHealth.bat"

call "!FINALDIR!\Logging.bat"
call "!FINALDIR!\RestartPC.bat"

exit /b 0

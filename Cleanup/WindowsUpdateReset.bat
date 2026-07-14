@echo off
echo ===========================================
echo - Windows Update Component Reset - (Round 6)
echo ===========================================
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop cryptsvc >nul 2>&1

set "WU_RESET_RESULT=Completed Successfully"

if exist "%SystemRoot%\SoftwareDistribution.old" rd /s /q "%SystemRoot%\SoftwareDistribution.old" >nul 2>&1
if exist "%SystemRoot%\SoftwareDistribution" (
    ren "%SystemRoot%\SoftwareDistribution" "SoftwareDistribution.old" 2>nul
    if exist "%SystemRoot%\SoftwareDistribution" set "WU_RESET_RESULT=The SoftwareDistribution folder could not be renamed because it is being used by another process or user."
)

if exist "%SystemRoot%\System32\catroot2.old" rd /s /q "%SystemRoot%\System32\catroot2.old" >nul 2>&1
if exist "%SystemRoot%\System32\catroot2" (
    ren "%SystemRoot%\System32\catroot2" "catroot2.old" 2>nul
    if exist "%SystemRoot%\System32\catroot2" set "WU_RESET_RESULT=The catroot2 folder could not be renamed because it is being used by another process or user."
)

net start cryptsvc >nul 2>&1
net start bits >nul 2>&1
net start wuauserv >nul 2>&1

echo Done

@echo off
powershell -NoProfile -Command "Write-Host 'Please Save Anything You Are Working On. We Need To Restart To Finalize Some Things!' -ForegroundColor Green"
echo.
powershell -NoProfile -Command "Write-Host 'Press Any Key To Restart Your PC...' -ForegroundColor Yellow"
pause >nul
shutdown /r /t 0

@echo off
set "ROUND=%~1"
set "RESULTVAR=%~2"

echo ==========================================
echo (SFC) - System File Check - (Round !ROUND!)
echo ==========================================
set "SFC_LOG=!LOGDIR!\SFC_Round!ROUND!_!TS!.log"
set "SFC_LOG_PATH=!SFC_LOG!"

set "PS1=!TEMP!\SFCTee_!ROUND!_!TS!.ps1"
(
echo sfc /scannow ^| Tee-Object -Variable sfcOutput
echo $sfcOutput ^| Out-File -FilePath "$env:SFC_LOG_PATH" -Encoding utf8
) > "!PS1!"

powershell -NoProfile -ExecutionPolicy Bypass -File "!PS1!"
del "!PS1!" >nul 2>&1

call :CheckSFC "!SFC_LOG!" "!RESULTVAR!"
echo Done
goto :eof

:CheckSFC
setlocal
set "_log=%~1"
set "_result=Unable to determine scan result. Please review the log file manually."
findstr /c:"did not find any integrity violations" "%_log%" >nul 2>&1 && set "_result=Windows Resource Protection did not find any integrity violations."
if "%_result%"=="Unable to determine scan result. Please review the log file manually." (
    findstr /c:"successfully repaired" "%_log%" >nul 2>&1 && set "_result=Windows Resource Protection found corrupt files and successfully repaired them. Details are included in the CBS log file located at %WinDir%\Logs\CBS\CBS.log"
)
if "%_result%"=="Unable to determine scan result. Please review the log file manually." (
    findstr /c:"unable to fix" "%_log%" >nul 2>&1 && set "_result=Windows Resource Protection found corrupt files but was unable to fix some of them. Details are included in the CBS log file located at %WinDir%\Logs\CBS\CBS.log"
)
if "%_result%"=="Unable to determine scan result. Please review the log file manually." (
    findstr /c:"could not perform the requested operation" "%_log%" >nul 2>&1 && set "_result=Windows Resource Protection could not perform the requested operation."
)
endlocal & set "%~2=%_result%"
goto :eof

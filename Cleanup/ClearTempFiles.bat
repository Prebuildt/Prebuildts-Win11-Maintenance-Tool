@echo off
echo ================================
echo - Clearing Temp Files - (Round 1)
echo ================================
call :GetFolderSize "%TEMP%" TEMP_BEFORE
call :GetFolderSize "%SystemRoot%\Temp" WINTEMP_BEFORE

del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%G in ("%TEMP%\*") do rd /s /q "%%G" >nul 2>&1

del /f /s /q "%SystemRoot%\Temp\*" >nul 2>&1
for /d %%G in ("%SystemRoot%\Temp\*") do rd /s /q "%%G" >nul 2>&1

call :GetFolderSize "%TEMP%" TEMP_AFTER
call :GetFolderSize "%SystemRoot%\Temp" WINTEMP_AFTER

set /a TOTAL_CLEANED_BYTES=(TEMP_BEFORE-TEMP_AFTER)+(WINTEMP_BEFORE-WINTEMP_AFTER)
if !TOTAL_CLEANED_BYTES! lss 0 set "TOTAL_CLEANED_BYTES=0"
set /a TOTAL_CLEANED_MB=TOTAL_CLEANED_BYTES/1048576

set "TEMP_CLEAN_RESULT=Completed Successfully"

echo Done
goto :eof

:GetFolderSize
setlocal
set "_folder=%~1"
set "_bytes=0"
if exist "%_folder%" (
    for /f "tokens=3" %%a in ('dir /s /-c "%_folder%" 2^>nul ^| find "File(s)"') do set "_bytes=%%a"
)
set "_bytes=%_bytes:,=%"
endlocal & set "%~2=%_bytes%"
goto :eof

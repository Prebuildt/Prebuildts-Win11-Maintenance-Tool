@echo off
echo =============================================
echo - Windows Update Leftovers Cleanup - (Round 4)
echo =============================================
DISM /Online /Cleanup-Image /StartComponentCleanup
set "DISM_CLEANUP_CODE=%errorlevel%"
if !DISM_CLEANUP_CODE! equ 0 goto DCC_Success

set "DISM_CLEANUP_MSG="
for /f "delims=" %%M in ('net helpmsg !DISM_CLEANUP_CODE! 2^>nul') do if not defined DISM_CLEANUP_MSG set "DISM_CLEANUP_MSG=%%M"
if defined DISM_CLEANUP_MSG goto DCC_KnownError

set "DISM_CLEANUP_RESULT=Operation failed. Exit code !DISM_CLEANUP_CODE!. Refer to Microsoft's DISM error code documentation for details."
goto DCC_Done

:DCC_KnownError
set "DISM_CLEANUP_RESULT=Operation failed. Exit code !DISM_CLEANUP_CODE!: !DISM_CLEANUP_MSG!"
goto DCC_Done

:DCC_Success
set "DISM_CLEANUP_RESULT=Completed Successfully"

:DCC_Done
echo Done

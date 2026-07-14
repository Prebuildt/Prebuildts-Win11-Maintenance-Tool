@echo off
echo =============================================================
echo (DISM) - Deployment Image Servicing and Management - (Round 2)
echo =============================================================
DISM /Online /Cleanup-Image /RestoreHealth
set "DISM_RESTOREHEALTH_CODE=%errorlevel%"
if !DISM_RESTOREHEALTH_CODE! equ 0 goto DRH_Success

set "DISM_RESTOREHEALTH_MSG="
for /f "delims=" %%M in ('net helpmsg !DISM_RESTOREHEALTH_CODE! 2^>nul') do if not defined DISM_RESTOREHEALTH_MSG set "DISM_RESTOREHEALTH_MSG=%%M"
if defined DISM_RESTOREHEALTH_MSG goto DRH_KnownError

set "DISM_RESTOREHEALTH_RESULT=Operation failed. Exit code !DISM_RESTOREHEALTH_CODE!. Refer to Microsoft's DISM error code documentation for details."
goto DRH_Done

:DRH_KnownError
set "DISM_RESTOREHEALTH_RESULT=Operation failed. Exit code !DISM_RESTOREHEALTH_CODE!: !DISM_RESTOREHEALTH_MSG!"
goto DRH_Done

:DRH_Success
set "DISM_RESTOREHEALTH_RESULT=Completed Successfully"

:DRH_Done
echo Done

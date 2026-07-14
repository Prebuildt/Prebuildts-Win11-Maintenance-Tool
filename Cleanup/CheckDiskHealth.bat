@echo off
echo =======================
echo - Checking Disk Health -
echo =======================
chkdsk C: /scan
set "CHKDSK_CODE=%errorlevel%"
if !CHKDSK_CODE! equ 0 (
    set "CHKDSK_RESULT=Completed Successfully. No errors were found."
) else if !CHKDSK_CODE! equ 1 (
    echo Y| chkdsk C: /f >nul 2>&1
    set "CHKDSK_RESULT=Errors were found and fixed. chkdsk /f has been scheduled to complete the repair on the next restart."
) else if !CHKDSK_CODE! equ 2 (
    echo Y| chkdsk C: /f >nul 2>&1
    set "CHKDSK_RESULT=Disk cleanup was performed, or no cleanup was performed because /f was not specified. chkdsk /f has been scheduled to run on the next restart."
) else if !CHKDSK_CODE! equ 3 (
    echo Y| chkdsk C: /f >nul 2>&1
    set "CHKDSK_RESULT=Chkdsk could not check the disk, errors could not be fixed, or errors were not fixed because /f was not specified. chkdsk /f has been scheduled to run on the next restart."
) else (
    set "CHKDSK_RESULT=Chkdsk returned an unrecognized exit code: !CHKDSK_CODE!."
)
echo Done

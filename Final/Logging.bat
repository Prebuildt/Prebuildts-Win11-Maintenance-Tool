@echo off
echo 3 Stage Maintenance Tool Has Completed All Tasks
echo Generating Recap...
echo.
echo.
set "REPORTFILE=!LOGDIR!\CleanupRecap_!TS!.txt"
(
echo ==============================================
echo   Prebuildt's Win11 Maintenance Tool - Recap
echo   Run on: %DATE% %TIME%
echo ==============================================
echo.
echo [Stage 1: System Integrity - SFC / DISM]
echo   SFC Round 1 ^(initial check^):  !SFC_ROUND1_RESULT!
echo   DISM RestoreHealth:           !DISM_RESTOREHEALTH_RESULT!
echo   SFC Round 3 ^(final check^):    !SFC_ROUND3_RESULT!
echo.
echo [Stage 2: Cleanup]
echo   Temp space cleaned:           !TOTAL_CLEANED_MB! MB ^(!TOTAL_CLEANED_BYTES! bytes^)
echo     User Temp before/after:     !TEMP_BEFORE! / !TEMP_AFTER! bytes
echo     Windows Temp before/after:  !WINTEMP_BEFORE! / !WINTEMP_AFTER! bytes
echo   DNS Flush:                    !DNS_RESULT!
echo   Drive Optimization:            !DEFRAG_RESULT!
echo   DISM Component Cleanup:        !DISM_CLEANUP_RESULT!
echo   Driver Store Cleanup:          !PNPCLEAN_RESULT!
echo   Windows Update Component Reset: !WU_RESET_RESULT!
echo   Store/Icon/Thumbnail Cache:     !STORE_CACHE_RESULT!
echo.
echo [Stage 3: Disk Health - CHKDSK]
echo   Exit Code: !CHKDSK_CODE!
echo   Result: !CHKDSK_RESULT!
echo.
echo ================================================================================================
echo   Logs saved in: !LOGDIR!
echo ================================================================================================
) > "!REPORTFILE!"

type "!REPORTFILE!"
echo.
echo Full report saved to: !REPORTFILE!
echo.

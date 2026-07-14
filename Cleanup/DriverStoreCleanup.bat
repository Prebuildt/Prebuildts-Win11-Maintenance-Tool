@echo off
echo =================================
echo - Driver Store Cleanup - (Round 5)
echo =================================
rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
set "PNPCLEAN_RESULT=Completed Successfully"
echo Done

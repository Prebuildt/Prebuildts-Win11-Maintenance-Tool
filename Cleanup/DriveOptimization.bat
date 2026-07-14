@echo off
echo ===============================
echo - Drive Optimization - (Round 3)
echo ===============================
defrag C: /O
set "DEFRAG_CODE=%errorlevel%"
if !DEFRAG_CODE! equ 0 goto DFG_Success

set "DEFRAG_MSG="
for /f "delims=" %%M in ('net helpmsg !DEFRAG_CODE! 2^>nul') do if not defined DEFRAG_MSG set "DEFRAG_MSG=%%M"
if defined DEFRAG_MSG goto DFG_KnownError

set "DEFRAG_RESULT=Operation failed. Exit code !DEFRAG_CODE!."
goto DFG_Done

:DFG_KnownError
set "DEFRAG_RESULT=Operation failed. Exit code !DEFRAG_CODE!: !DEFRAG_MSG!"
goto DFG_Done

:DFG_Success
set "DEFRAG_RESULT=Completed Successfully"

:DFG_Done
echo Done

@echo off
echo ===================================
echo - Flushing The DNS Cache - (Round 2)
echo ===================================
ipconfig /flushdns
set "DNS_CODE=%errorlevel%"
if !DNS_CODE! equ 0 goto DNS_Success

set "DNS_MSG="
for /f "delims=" %%M in ('net helpmsg !DNS_CODE! 2^>nul') do if not defined DNS_MSG set "DNS_MSG=%%M"
if defined DNS_MSG goto DNS_KnownError

set "DNS_RESULT=Operation failed. Exit code !DNS_CODE!."
goto DNS_Done

:DNS_KnownError
set "DNS_RESULT=Operation failed. Exit code !DNS_CODE!: !DNS_MSG!"
goto DNS_Done

:DNS_Success
set "DNS_RESULT=Completed Successfully"

:DNS_Done
echo Done

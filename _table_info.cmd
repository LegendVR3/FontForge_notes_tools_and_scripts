@echo off
chcp 65001 2>nul >nul

set "TTX=%~sdp0fontTools\ttx.cmd"
set "INPUT=%~f1"

call %TTX% -v -l "%INPUT%"

pause
exit /b %EXITCODE%

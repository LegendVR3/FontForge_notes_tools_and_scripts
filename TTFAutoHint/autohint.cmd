@echo off
chcp 65001 2>nul >nul

set "ORIGINAL=%~sdp1%~nx1"
set "HINTED=%~sdp1%~n1_hint.ttf"

@echo on
ttfautohint.exe --ignore-restrictions --verbose --windows-compatibility --hinting-limit=0 "%ORIGINAL%" "%HINTED%"
@echo off

pause
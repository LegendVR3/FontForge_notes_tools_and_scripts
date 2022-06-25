@echo off
chcp 65001 2>nul >nul

set "TTX=%~sdp0fontTools\ttx.cmd"
set "INPUT_FONT=%~f1"
set "INPUT_TTX=%~f2"
set "OUTPUT=%~sdp1%~n1__with_SVG_table_from__%~n2.ttf"

if /i ["%~x1"] EQU [".ttx"] ( 
  set "INPUT_FONT=%~f2"
  set "INPUT_TTX=%~f1"
  set "OUTPUT=%~sdp2%~n2__with_SVG_table_from__%~n1.ttf"
)

call %TTX% -v -o "%OUTPUT%" -m "%INPUT_FONT%" "%INPUT_TTX%"

pause
exit /b %EXITCODE%

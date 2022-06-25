@echo off
chcp 65001 2>nul >nul

::pre-cleanup
set "USER="

set "BASE=%~f1"
set "EXT2=%~f2"
set "OUT=%~dpn1__merged_with__%~n2.ttf"

set /p "USER=%~nx1 as base? [Y]"
if ["%USER%"] EQU [""] ( set "USER=Y" )

if /i ["%USER%"] EQU ["N"] ( 
  set "BASE=%~f2"
  set "EXT2=%~f1"
  set "OUT=%~dpn2__merged_with__%~n1.ttf"
)

echo ==========================
echo ^(1^) «BASE:                %BASE%
echo ^(2^) «Extention to base:   %EXT2%
echo ==========================
echo » » » » » » » » » » » » » %OUT%
echo ==========================
echo.

pause
pause

::-----------------------------------------------------------


set BASE=%BASE:\=/%
set EXT2=%EXT2:\=/%
set OUT=%OUT:\=/%

set "SCRIPT="
set  SCRIPT=%SCRIPT% Open(\"$1\");
set  SCRIPT=%SCRIPT% MergeFonts(\"%EXT2%\");
::set  SCRIPT=%SCRIPT% autoHint();
set  SCRIPT=%SCRIPT% Generate(\"%OUT%\",\"\",4);
echo.
@echo on
call fontforge.bat -lang "ff" -c "%SCRIPT%"
@echo off

pause
exit /b %ErrorLevel%
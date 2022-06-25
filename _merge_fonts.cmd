@echo off
chcp 65001 2>nul >nul

set "FONTFORGE=%~sdp0fontforge.bat"
set "VCXSRVCLOSE=%~sdp0bin\VcxSrv_util.exe -close"


::input pre-cleanup
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
set "SCRIPT="
set  SCRIPT=%SCRIPT% Open("$1");
set  SCRIPT=%SCRIPT% Reencode(\"unicode\");
set  SCRIPT=%SCRIPT% MergeFonts("$2");
set  SCRIPT=%SCRIPT% Reencode(\"unicode\");
set  SCRIPT=%SCRIPT% AutoHint();
set  SCRIPT=%SCRIPT% Generate("$3",\"\",4);
set  SCRIPT=%SCRIPT% Quit(0);
::-----------------------------------------------------------


echo.
@echo on
call "%FONTFORGE%" -lang "ff" -c "%SCRIPT%" "%BASE%" "%EXT2%" "%OUT%"
@echo off
echo.
@echo on
call %VCXSRVCLOSE%
@echo off
echo.

pause
exit /b %ErrorLevel%



::this is a fix for CID fonts only. [https://github.com/fontforge/fontforge/issues/3115]
::set  SCRIPT=%SCRIPT% CIDFlatten();


::fix for SVG from OTF (not to be used by default).
::set  SCRIPT=%SCRIPT% SelectWorthOutputting();
::set  SCRIPT=%SCRIPT% foreach Export(\"%n.svg\"); endloop;
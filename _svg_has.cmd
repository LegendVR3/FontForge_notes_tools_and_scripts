@echo off
chcp 65001 2>nul >nul

set "TTX=%~sdp0fontTools\ttx.cmd"
set "INPUT=%~f1"

::has SVG table?
call %TTX% -l "%INPUT%" 2^>nul | findstr /r /i /c:"SVG" 2>nul >nul

::output to STDOUT
echo %ErrorLevel%

::output to STDERR
::echo %ErrorLevel%  1>&2

::output to exit-code
exit /b %ErrorLevel%


:: has SVG table?
::                0  yes
::                1  no
:: you can get result ("0"/"1") by ErrorLevel or STDOUT


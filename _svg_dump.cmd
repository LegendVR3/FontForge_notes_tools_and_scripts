@echo off
chcp 65001 2>nul >nul

set "EXITCODE=0"

set "TTX=%~sdp0fontTools\ttx.cmd"
set "INPUT=%~f1"
set "OUTPUT=%~sdp1%~n1.ttx"

::has SVG table? (0===yes 1===no)
call %TTX% -l "%INPUT%" 2^>nul | findstr /r /i /c:"SVG" 2>nul >nul
if ["%ErrorLevel%"] EQU ["1"] ( goto NOSVG )

::dump SVG table
call %TTX% -v -t "SVG " -o "%OUTPUT%" "%INPUT%"

goto END

:NOSVG
  echo ERROR: no SVG table.
  set "EXITCODE=1"
  goto END

:END
  pause
  exit /b %EXITCODE%

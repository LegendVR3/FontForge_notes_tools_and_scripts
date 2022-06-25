@echo off
::--------------------------------------------------------------------
::  Exit-Code        Meaning
::    0                success
::    111              generic error
::    222              no python
::    anything else    managed by TTX (fontTools)
::--------------------------------------------------------------------
set "EXITCODE=111"

chcp 65001 2>nul >nul

set "TTX=%~dp0ttx.py"
for /f %%a in ("%TTX%") do ( set "TTX=%%~fsa" )

set "PYTHON="
for /f "tokens=*" %%a in ('where python.exe 2^>nul') do ( set "PYTHON=%%a" )
if ["%PYTHON%"] EQU [""] ( goto NOPYTHON )
for /f %%a in ("%PYTHON%") do ( set "PYTHON=%%~fsa" )

call "%PYTHON%" "%TTX%" %*
set "EXITCODE=%ErrorLevel%"
goto END

:NOPYTHON
  echo ERROR: could not find 'python.exe' anywhere.
  set "EXITCODE=222"
  goto END

:END
  exit /b %EXITCODE%

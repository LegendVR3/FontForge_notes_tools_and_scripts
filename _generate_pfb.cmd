@echo off
chcp 65001 2>nul >nul

:LOOP
::has argument ?
if ["%~1"]==[""] (
  echo done.
  goto END;
)
::argument exist ?
if not exist %~s1 (
  echo not exist
  goto NEXT;
)
::file exist ?
echo exist
if exist %~s1\NUL (
  echo is a directory
  goto NEXT;
)
::OK
echo is a file

::--------------------------------------------------------------------------------

set FILE_INPUT="%~1"
set FILE_BACKUP="%~1_backup"

@echo on
::call fontforge.bat -lang "ff" -c "Open($1); Reencode(\"unicode\"); AutoHint(); Generate($1:r + \".pfb\");" %FILE_INPUT%
call fontforge.bat -lang "ff" -c "Open($1); Generate($1:r + \".pfb\");" %FILE_INPUT%

::--------------------------------------------------------------------------------

echo.

:NEXT
shift
goto LOOP

:END
pause

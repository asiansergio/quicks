@echo off
setlocal enabledelayedexpansion

REM Determine build config (default debug)
if /i "%1"=="release" (
    set "config=release"
    shift
) else (
    set "config=debug"
)

REM Find first .exe in build\<config>\
set "exe="
for %%F in (build\%config%\*.exe) do (
    set "exe=%%F"
    goto :found
)

echo No executable found in build\%config%.
exit /b 1

:found
"%exe%" %*

endlocal


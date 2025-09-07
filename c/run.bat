@echo off
setlocal enabledelayedexpansion

REM Determine build config (default debug)
if /i "%1"=="release" (
    set "config=release"
    shift
) else (
    set "config=debug"
)

"build\%config%\quick.exe" %*
endlocal


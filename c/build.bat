@echo off
setlocal enabledelayedexpansion

REM Choose output directory based on argument
if "%1"=="release" (
    set "outdir=build\release"
    set "flags=/O2 /nologo"
) else (
    set "outdir=build\debug"
    set "flags=/Zi /FS /Od /nologo"
)

if not exist "%outdir%" mkdir "%outdir%"

REM Include paths for headers
set "includes=/I"include" /I"vendor\syl""

set "sources=src\quick.c"
set "output_flags=/Fe%outdir%\quick.exe /Fo%outdir%\ /Fd%outdir%\"

cl !flags! !includes! !output_flags! !sources!


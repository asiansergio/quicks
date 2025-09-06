@echo off
setlocal enabledelayedexpansion

REM Look for the first .c or .cpp file in the current directory
for %%F in (*.c *.cpp) do (
    set "filename=%%~nF"
    set "ext=%%~xF"
    goto :compile
)

echo No .c or .cpp file found in the current directory.
exit /b 1

:compile
REM Choose output directory based on argument
if "%1"=="release" (
    set "outdir=build\release"
    set "flags=/O2 /nologo"
) else (
    set "outdir=build\debug"
    set "flags=/Zi /Od /nologo"
)

if not exist "%outdir%" mkdir "%outdir%"

cl !flags! /Fe"%outdir%\!filename!.exe" /Fo"%outdir%"\ /Fd"%outdir%"\ "!filename!!ext!"


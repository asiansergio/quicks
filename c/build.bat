@echo off
setlocal enabledelayedexpansion

REM Choose output directory based on argument
if "%1"=="release" (
    set "outdir=build\release"
    set "flags=/O2 /nologo"
) else (
    set "outdir=build\debug"
    set "flags=/Zi /Od /nologo"
)

if not exist "%outdir%" mkdir "%outdir%"

REM Try loading vcvars64.bat directly
set "vs_base=%ProgramFiles%\Microsoft Visual Studio\2022"
set "cl_found="

for %%E in (Enterprise Professional Community) do (
    if exist "%vs_base%\%%E\VC\Auxiliary\Build\vcvars64.bat" (
        call "%vs_base%\%%E\VC\Auxiliary\Build\vcvars64.bat"
        where cl >nul 2>&1
        if not errorlevel 1 (
            set "cl_found=1"
            goto :found_cl
        )
    )
)

:found_cl
if not defined cl_found (
    exit /b 1
)

cl !flags! /Fe"%outdir%\quick.exe" /Fo"%outdir%"\ /Fd"%outdir%"\ quick.c


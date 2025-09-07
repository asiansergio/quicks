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

cl !flags! /Fe"%outdir%\quick.exe" /Fo"%outdir%"\ /Fd"%outdir%"\ quick.c


@echo off
setlocal

set "resourcePath=%~dp0resources"
cd /d "%resourcePath%"

Injector-x86.exe steam.dll steam.exe

:waitForCSGO
tasklist /fi "imagename eq csgo.exe" | find /i "csgo.exe" >nul
if errorlevel 1 (
    timeout /t 1 >nul
    goto waitForCSGO
)

timeout /t 10 >nul

start "" "%resourcePath%\injector.exe"

timeout /t 3 >nul

exit
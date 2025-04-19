@echo off
setlocal

set "resourcePath=%~dp0resources"
cd /d "%resourcePath%"

:: Inject into steam.exe
Injector-x86.exe steam.dll steam.exe

:: Wait for csgo.exe to open
:waitForCSGO
tasklist /fi "imagename eq csgo.exe" | find /i "csgo.exe" >nul
if errorlevel 1 (
    timeout /t 1 >nul
    goto waitForCSGO
)

:: Wait 5 seconds after csgo.exe is detected
timeout /t 5 >nul

:: Launch injector.exe
start "" "%resourcePath%\injector.exe"

:: Wait 3 seconds before closing
timeout /t 3 >nul

:: Exit the batch and close the console window
exit
@echo off
setlocal

:loop
powershell -ExecutionPolicy Bypass -File "D:\Programming\Hourly System Locker\LockPrompt.ps1"
if %ERRORLEVEL% EQU 1 (
    echo Putting the system to sleep
    rundll32.exe powrprof.dll,SetSuspendState Sleep
) else (
    echo Sleep command canceled.
)

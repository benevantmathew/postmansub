@echo off
setlocal
@REM ############################################################################## PYTHON VERSION VERY IMPORTANT
set "python_version=39"
@REM ############################################################################## other variables
:: Get the user directory 
set "userdir=%userprofile%"
@REM ############################################################################## Activate local env
cd ..
set "folder=postmansub"
for %%A in ("%folder%") do set "folder=%%~nxA"
set "name=%folder%-py%python_version%-env"
if exist "%userdir%\envs\%name%" (
    echo Enabling venv
) else (
    echo No venv. Run local_setup first.
    pause
    exit /b 1
)
set "path=%userdir%\envs\%name%\Scripts\activate.bat"
start cmd.exe /k %path%
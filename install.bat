@echo ---------------------------------
@echo infoodle Labelserver installation
@echo ---------------------------------
@echo Are you running this with Administrator privileges? 
@echo If not - please quit this and restart.
@echo:
@echo To run as administrator, 
@echo just right click on the install.bat and choose 'Run as administrator'
@echo:
@set /p ok=Continue with the installation? Enter Y if OK? 
@echo:
@if "%ok%" == "Y" goto continue
@if "%ok%" == "y" goto continue
@goto cancelled

:continue
@SET mypath=%~dp0

@if exist "%mypath%configuration.txt" del "%mypath%configuration.txt"
@if not exist "%mypath%configuration.txt" goto continue3

@echo:
@echo ---------------------------------------------------------------
@echo The labelserver has been installed before and may be running.
@echo Please stop the service first by running stop.bat
@echo ---------------------------------------------------------------
@echo:
@goto cancelled



:continue3
@if "%1" NEQ "" GOTO got_ip
@set /p ip=What IP address should I listen on? 
@echo:
@if %ip% == "" GOTO cancelled
@goto check_port
:got_ip
@set ip=%1

:check_port
@if "%2" NEQ "" GOTO got_port
@set /p port=Which Port should I listen on? 
@echo:
@if %port% == "" GOTO cancelled
@goto check_user

:got_port
@set port=%2

:check_user
@set /p logonuser=Which user account should this run on e.g. .\myuser? 
@echo:
@set /p logonpass=What password to use for this account? 
@echo:


:got_all
@echo off
(
@echo %ip%
@echo %port%
) > "%mypath%configuration.txt"

@%mypath%\nssm.exe install Labelserver "%mypath%\labelserver.exe"
@if %errorlevel% == 0 goto continue2
REM error 5 is ok as service may already be there!
@if %errorlevel% == 5 goto continue2
@echo Error %errorlevel%
@echo:
@echo ---------------------------------------------------------------
@echo Please check you ran this script with administrator privileges!
@echo And rerun this script.
@echo ---------------------------------------------------------------
@echo:
@goto cancelled

:continue2
@"%mypath%nssm.exe" set Labelserver ObjectName "%logonuser%" "%logonpass%"
@echo:
@"%mypath%nssm.exe" start Labelserver
@if %errorlevel% == 0 goto continue4
@echo Error %errorlevel%
@echo:
@echo ---------------------------------------------------------------
@echo Please check you ran this script with administrator privileges!
@echo And rerun this script.
@echo ---------------------------------------------------------------
@goto cancelled

:continue4
@echo:
@echo Install completed
@echo:
@goto done

:cancelled
@echo:
@echo Install cancelled
@echo:


:done
@set /p q=Press enter to close
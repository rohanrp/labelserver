@echo ------------------------------------
@echo infoodle Labelserver restart service
@echo ------------------------------------
@echo Are you running this with Administrator privileges? 
@echo If not - please quit this and restart.
@echo:
@echo To run as administrator, 
@echo just right click on the install.bat and choose 'Run as administrator'
@echo:
@set /p ok=Continue with the restart? Enter Y if OK? 
@echo:
@if "%ok%" == "Y" goto continue
@if "%ok%" == "y" goto continue
@goto cancelled

:continue
@SET mypath=%~dp0

@"%mypath%nssm.exe" stop Labelserver
@if %errorlevel% == 0 goto continue2
@echo:
@echo ---------------------------------------------------------------
@echo Please check you ran this script with administrator privileges!
@echo And rerun this script.
@echo ---------------------------------------------------------------
@echo:
@goto cancelled

:continue2
@"%mypath%nssm.exe" start Labelserver

@echo:
@echo Restart completed
@echo:
@goto done

:cancelled
@echo:
@echo Restart cancelled
@echo:


:done
@set /p q=Press enter to close
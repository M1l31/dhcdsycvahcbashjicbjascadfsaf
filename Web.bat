@echo off
:: Limpiar historial y descargas de Google Chrome
echo Limpiando historial y descargas de Google Chrome...
del /f /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\History"
del /f /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies"
del /f /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Web Data"
del /f /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Downloads"

:: Limpiar historial y descargas de Mozilla Firefox
echo Limpiando historial y descargas de Mozilla Firefox...
del /f /q "%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default\places.sqlite"
del /f /q "%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default\cookies.sqlite"
del /f /q "%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default\recovery.jsonlz4"
del /f /q "%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default\downloads.sqlite"

:: Limpiar historial y descargas de Microsoft Edge
echo Limpiando historial y descargas de Microsoft Edge...
del /f /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\History"
del /f /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cookies"
del /f /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Web Data"
del /f /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Downloads"

:: Confirmar que se ha limpiado
echo ============================================
echo Historial y descargas de navegadores limpiados.
echo ============================================
pause

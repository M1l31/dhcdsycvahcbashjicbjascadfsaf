@echo off
:: Eliminar archivos recientes del sistema

:: Eliminar archivos recientes del usuario
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*"

:: Eliminar archivos recientes de Windows
del /f /q "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent\*.*"

:: Eliminar el historial de archivos recientes de Windows
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*"

:: Eliminar archivos temporales del sistema
del /f /q "%TEMP%\*.*"

:: Eliminar archivos temporales de Internet Explorer (si aplica)
del /f /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*"

:: Limpiar la papelera de reciclaje
echo Y | del /f /q %systemdrive%\$Recycle.Bin\*

:: Eliminar registros de eventos de Windows (requiere privilegios elevados)
echo Eliminar registros de eventos...
wevtutil cl Application
wevtutil cl Security
wevtutil cl System

:: Limpiar el historial de la memoria
echo Limpiando memoria...
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*"

:: Limpiar registros de Explorer
echo Limpiando registros de Explorer...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f

:: Limpiar registros de programas recientemente ejecutados
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f

echo Archivos recientes y registros eliminados con éxito.
pause

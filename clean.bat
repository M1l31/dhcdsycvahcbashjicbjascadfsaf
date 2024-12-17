@echo off
:: Eliminar los registros de los servicios especificados

echo Borrando registros de eventos...

:: Limpiar registros de eventos de aplicación, sistema y seguridad
wevtutil cl Application
wevtutil cl System
wevtutil cl Security

:: Limpiar registros específicos de los servicios mencionados
wevtutil cl Microsoft-Windows-DiagTrack-Operational
wevtutil cl Microsoft-Windows-SysMain/Operational
wevtutil cl Microsoft-Windows-PcaSvc/Operational
wevtutil cl Microsoft-Windows-Eventlog/Operational
wevtutil cl Microsoft-Windows-DPS/Operational
wevtutil cl Microsoft-Windows-VmicVSS-Operational
wevtutil cl Microsoft-Windows-VSS/Operational

echo Registros eliminados con éxito.

pause

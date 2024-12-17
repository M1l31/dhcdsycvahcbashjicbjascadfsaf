@echo off
:: Script para habilitar o desabilitar el Prefetch, activar o desativar serviços, tambien limpiar el Journal Trace ( en Windows )

:menu
echo =========================================
echo       Evading SS
echo.      Select Menu 
echo =========================================
echo 1. Habilitar Prefetch
echo 2. Desabilitar Prefetch
echo 3. Activar Servicios
echo 4. Desactivar Servicios
echo 5. Limpiar Journal Trace
echo 6. Salir
echo =========================================
set /p choice="Escoja una opcion (1, 2, 3, 4, 5 o 6): "

if %choice%==1 goto habilitar_prefetch
if %choice%==2 goto desabilitar_prefetch
if %choice%==3 goto ativar_servicos
if %choice%==4 goto desativar_servicos
if %choice%==5 goto limpar_journal_trace
if %choice%==6 goto salir

:habilitar_prefetch
echo Habilitando o Prefetch...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 3 /f
echo Prefetch habilitado com sucesso.
pause
goto menu

:desabilitar_prefetch
echo Desabilitando o Prefetch...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
echo Prefetch desabilitado com sucesso.
pause
goto menu

:ativar_servicos
echo Ativando serviços...
sc config diagtrack start= auto
sc start diagtrack
sc config sysmain start= auto
sc start sysmain
sc config pcasvc start= auto
sc start pcasvc
sc config eventlog start= auto
sc start eventlog
sc config dps start= auto
sc start dps
sc config vmicvss start= auto
sc start vmicvss
sc config VSS start= auto
sc start VSS
sc config Pcasvc start= auto
sc start Pcasvc
echo Serviços ativados com sucesso.
pause
goto menu

:desativar_servicos
echo Desativando serviços...
sc stop diagtrack
sc stop sysmain
sc stop pcasvc
sc stop eventlog
sc stop dps
sc stop vmicvss 
sc stop VSS
sc stop Pcasvc
sc config diagtrack start= disabled
sc config sysmain start= disabled
sc config pcasvc start= disabled
sc config eventlog start= disabled
sc config dps start= disabled
sc config vmicvss start= disabled
sc config VSS start= disabled
sc config Pcasvc start= disabled
echo Serviços desativados com sucesso.
pause
goto menu

:limpar_journal_trace
echo Limpando o Journal Trace...
fsutil usn deletejournal /D C:
echo Journal Trace limpo com sucesso.
pause
goto menu

:salir
exit

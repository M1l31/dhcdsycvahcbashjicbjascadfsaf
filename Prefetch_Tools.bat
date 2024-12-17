@echo off
:: Script para habilitar o desabilitar ( Prefetch en Windows )

:menu
echo =========================================
echo                 EVADING SS
echo.      Prefetch - Habilitar o Desabilitar
echo       Obs: Ejecute como administrador
echo =========================================
echo 1. Habilitar Prefetch
echo 2. Desabilitar Prefetch
echo 3. Salir
echo =========================================
set /p choice="Escoja una opcion (1, 2 o 3): "

if %choice%==1 goto habilitar
if %choice%==2 goto desabilitar
if %choice%==3 goto salir

:habilitar
echo Habilitando o Prefetch...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 3 /f
echo Prefetch habilitado com sucesso.
pause
goto menu

:desabilitar
echo Desabilitando o Prefetch...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
echo Prefetch desabilitado com sucesso.
pause
goto menu

:salir
exit

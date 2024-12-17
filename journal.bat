@echo off
:: Script para limpiar todos los discos - fsutil usn deletejournal /D
echo ============================================
echo      Limpieza de USN Journal en discos
echo ============================================
echo.

:: Detectar todas las unidades disponibles
for /f "tokens=3 delims= " %%D in ('wmic logicaldisk get caption ^| find ":"') do (
    echo Procesando la unidad %%D...
    fsutil usn deletejournal /D %%D
    if %errorlevel% equ 0 (
        echo [Exito] USN Journal eliminado en %%D.
    ) else (
        echo [Error] No se pudo procesar la unidad %%D. Requiere permisos o no es NTFS.
    )
    echo.
)

echo ============================================
echo       Proceso completado.
echo ============================================
pause

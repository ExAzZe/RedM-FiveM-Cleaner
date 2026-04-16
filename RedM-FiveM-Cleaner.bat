@echo off
title FiveM ^& RedM Cache Cleaner
setlocal EnableDelayedExpansion

:: --- CONFIGURATION MEMOIRE ---
set "CONFIG_FILE=%~dp0settings.ini"
set "FIVEM_PATH=%localappdata%\FiveM\FiveM.app"
set "REDM_PATH=%localappdata%\RedM\RedM.app"

if exist "%CONFIG_FILE%" (
    for /f "usebackq tokens=1,2 delims==" %%A in ("%CONFIG_FILE%") do (
        if "%%A"=="FIVEM_PATH" set "FIVEM_PATH=%%B"
        if "%%A"=="REDM_PATH" set "REDM_PATH=%%B"
    )
)

:MainMenu
cls
echo ==========================================
echo        FIVEM ^& REDM CACHE CLEANER
echo ==========================================
echo.
echo 1. Settings (Change game paths)
echo 2. Quick Clean (Standard cache only)
echo 3. Deep Clean (Full wipe: Logs, Crashes, Shaders, Builds)
echo 4. Exit
echo.
set "choice="
set /p choice="Select an option: "

if "%choice%"=="1" goto PathMenu
if "%choice%"=="2" goto QuickClean
if "%choice%"=="3" goto DeepClean
if "%choice%"=="4" exit
goto MainMenu

:PathMenu
cls
echo ==========================================
echo              PATH SETTINGS
echo ==========================================
echo.
echo 1. FiveM Path : !FIVEM_PATH!
echo 2. RedM Path  : !REDM_PATH!
echo.
echo (Press ENTER to return to Main Menu)
echo.
set "pathChoice="
set /p pathChoice="Select game to change path: "

if "%pathChoice%"=="" goto MainMenu

if "%pathChoice%"=="1" (
    echo.
    set "newFivem="
    set /p newFivem="New FiveM Path: "
    if not "!newFivem!"=="" set "FIVEM_PATH=!newFivem!"
    call :SaveConfig
    goto PathMenu
)
if "%pathChoice%"=="2" (
    echo.
    set "newRedm="
    set /p newRedm="New RedM Path: "
    if not "!newRedm!"=="" set "REDM_PATH=!newRedm!"
    call :SaveConfig
    goto PathMenu
)
goto PathMenu

:SaveConfig
echo FIVEM_PATH=!FIVEM_PATH!> "%CONFIG_FILE%"
echo REDM_PATH=!REDM_PATH!>> "%CONFIG_FILE%"
goto :eof

:QuickClean
cls
echo [*] Cleaning standard cache...
if exist "!FIVEM_PATH!\data\cache" rmdir /s /q "!FIVEM_PATH!\data\cache" >nul 2>&1
if exist "!REDM_PATH!\data\cache" rmdir /s /q "!REDM_PATH!\data\cache" >nul 2>&1
echo  - Done!
pause
goto MainMenu

:DeepClean
cls
echo ==========================================
echo               DEEP CLEAN
echo ==========================================
echo Warning: This will wipe all temporary data, logs and builds.
pause

echo.
echo [*] Cleaning standard ^& server caches...
rmdir /s /q "!FIVEM_PATH!\data\cache" >nul 2>&1
rmdir /s /q "!FIVEM_PATH!\data\server-cache" >nul 2>&1
rmdir /s /q "!FIVEM_PATH!\data\server-cache-priv" >nul 2>&1
rmdir /s /q "!REDM_PATH!\data\cache" >nul 2>&1
rmdir /s /q "!REDM_PATH!\data\server-cache" >nul 2>&1
rmdir /s /q "!REDM_PATH!\data\server-cache-priv" >nul 2>&1

echo [*] Cleaning NUI storage (UI Cache)...
rmdir /s /q "!FIVEM_PATH!\data\nui-storage" >nul 2>&1
rmdir /s /q "!REDM_PATH!\data\nui-storage" >nul 2>&1

echo [*] Cleaning logs and crash reports...
rmdir /s /q "!FIVEM_PATH!\logs" >nul 2>&1
mkdir "!FIVEM_PATH!\logs" >nul 2>&1
rmdir /s /q "!FIVEM_PATH!\crashes" >nul 2>&1
mkdir "!FIVEM_PATH!\crashes" >nul 2>&1
rmdir /s /q "!REDM_PATH!\logs" >nul 2>&1
mkdir "!REDM_PATH!\logs" >nul 2>&1
rmdir /s /q "!REDM_PATH!\crashes" >nul 2>&1
mkdir "!REDM_PATH!\crashes" >nul 2>&1

echo [*] Cleaning Windows CrashDumps...
del /s /f /q "%localappdata%\CrashDumps\*.dmp" >nul 2>&1

echo [*] Cleaning DirectX Shader Cache...
del /s /f /q "%localappdata%\D3DSCache\*.*" >nul 2>&1

echo [*] Cleaning Rockstar Social Club Cache...
rmdir /s /q "%localappdata%\Rockstar Games\Social Club\Cache" >nul 2>&1

echo [*] Cleaning game-storage (builds)...
rmdir /s /q "!FIVEM_PATH!\data\game-storage" >nul 2>&1
rmdir /s /q "!REDM_PATH!\data\game-storage" >nul 2>&1

echo.
echo  - Deep Clean Completed!
echo.
pause
goto MainMenu

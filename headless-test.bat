@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: --- Reabre no Windows Terminal se não estiver dentro dele ---
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Testes Headless
color 0E
set "BASE_DIR=%~dp0"
cd /d "%BASE_DIR%"

del /q output.xml log.html report.html 2>nul

echo ===================================================
echo 🚀 Executando testes em MODO HEADLESS (segundo plano)
echo ===================================================
echo.

:: --- Marca o início da execução ---
set "t=%time: =0%"
for /f "tokens=1-3 delims=:,." %%a in ("%t%") do (
    set /a startSec=%%a*3600 + %%b*60 + %%c
)

:: --- Execução dos testes ---
robot --console NONE --output NONE --log NONE --report NONE -v OPTIONS:"add_argument(\"--headless\");" .

:: --- Marca o fim e calcula duração ---
set "t=%time: =0%"
for /f "tokens=1-3 delims=:,." %%a in ("%t%") do (
    set /a endSec=%%a*3600 + %%b*60 + %%c
)


set /a totalSec=endSec-startSec
if !totalSec! lss 0 set /a totalSec+=86400
set /a min=!totalSec!/60
set /a sec=!totalSec!%%60

:: --- Resultado ---
echo.
echo ✅ Testes headless finalizados com sucesso.
echo.
echo ===================================================
echo 🕒 Tempo TOTAL de execução de todos os testes:
echo 🕒 !min!m !sec!s
echo ===================================================
echo.
pause
endlocal

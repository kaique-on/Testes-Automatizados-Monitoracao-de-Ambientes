@echo off
setlocal enabledelayedexpansion

:: ================================================
:: EXECUÇÃO EM PARALELO - TESTES AUTOMATIZADOS
:: ================================================

if not defined WT_SESSION (
    start wt.exe -p "Terminal do Windows" --title "🤖 Pabot - Execução em Paralelo" cmd /c "%~f0"
    exit /b
)

chcp 65001 >nul
title Execução simultânea de testes Robot Framework
color 0F

:: Define o diretório base (onde o script está)
set "BASE_DIR=%~dp0"
cd /d "%BASE_DIR%"

echo ===================================================
echo 🚀 Executando testes EM PARALELO com Pabot 🚀
echo ===================================================
echo.
echo Isso deve levar alguns minutos...

:: ================================================
:: CONFIGURAÇÕES
:: ================================================

set "PROCESSES=4"
set "CONSOLE_LOG=%BASE_DIR%saida_console_pabot.txt"
set "RESULTS_DIR=%BASE_DIR%results"
set "LOGS_DIR=%RESULTS_DIR%\logs_separados"

:: ================================================
:: LIMPEZA DE LOGS ANTIGOS
:: ================================================

if exist "%CONSOLE_LOG%" del "%CONSOLE_LOG%"
if exist "%RESULTS_DIR%\output.xml" del "%RESULTS_DIR%\output.xml"
if exist "%LOGS_DIR%" rd /s /q "%LOGS_DIR%"
if not exist "%RESULTS_DIR%" mkdir "%RESULTS_DIR%"
if not exist "%LOGS_DIR%" mkdir "%LOGS_DIR%"

:: ================================================
:: CAPTURA HORA DE INÍCIO (em segundos)
:: ================================================
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /a "startSec=%%a*3600 + %%b*60 + %%c"
)

:: ================================================
:: EXECUÇÃO DOS TESTES COM PABOT
:: ================================================

pabot --processes %PROCESSES% -v OPTIONS:"add_argument(\"--headless\");" --consolecolors on --outputdir "%RESULTS_DIR%" . > "%CONSOLE_LOG%"

:: ================================================
:: CAPTURA HORA DE FIM E CALCULA DURAÇÃO
:: ================================================
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /a "endSec=%%a*3600 + %%b*60 + %%c"
)

set /a totalSec=endSec-startSec
if !totalSec! lss 0 set /a totalSec+=86400
set /a min=!totalSec!/60
set /a sec=!totalSec!%%60

:: ================================================
:: EXIBE RESULTADOS E LOGS INDIVIDUAIS
:: ================================================
echo.
echo ✅ Testes finalizados! Mostrando logs individuais:
echo ---------------------------------------------------
echo.

if exist "%LOGS_DIR%\*.log" (
    for %%f in ("%LOGS_DIR%\*.log") do (
        echo 📝 Log do Arquivo: %%~nxf
        echo.
        type "%%~f"
        echo.
    )
) else (
    echo ⚠️ Nenhum log individual encontrado em "%LOGS_DIR%". (Verifique logs_utils.robot)
)

:: ================================================
:: MOSTRA O TEMPO TOTAL DE EXECUÇÃO GLOBAL
:: ================================================
echo.
echo ===================================================
echo Tempo TOTAL de execução de todos os testes:
echo 🕒 !min!m !sec!s
echo ===================================================
echo.
echo 🏁 Execução concluída.
echo.
pause
endlocal

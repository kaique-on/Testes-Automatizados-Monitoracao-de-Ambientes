@echo off

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

:: Configurações
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
:: EXECUÇÃO DOS TESTES COM PABOT
:: ================================================

pabot --processes %PROCESSES% ^
      -v OPTIONS:"add_argument(\"--headless\");" ^
      --consolecolors on ^
      --outputdir "%RESULTS_DIR%" . > "%CONSOLE_LOG%"

echo.
echo ✅ Testes finalizados! Mostrando logs individuais:
echo.
echo ---------------------------------------------------

:: ================================================
:: EXIBE OS LOGS INDIVIDUAIS (SE EXISTIREM)
:: ================================================

if exist "%LOGS_DIR%\*.log" (
    for %%f in ("%LOGS_DIR%\*.log") do (
        echo.
        echo 📝 Log do Arquivo: %%~nxf
        echo.
        type "%%~f"
        echo.
        echo ---------------------------------------------------
    )
) else (
    echo ⚠️ Nenhum log individual encontrado em "%LOGS_DIR%". (Verifique logs_utils.robot)
)

echo.
echo 🏁 Execução concluída.
echo.
pause

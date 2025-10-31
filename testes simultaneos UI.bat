@echo off

REM ####################################################################
REM ### 1. LOGICA DE RELANCAMENTO CONDICIONAL NO WINDOWS TERMINAL (WT) ###
REM ####################################################################

:: A variavel WT_SESSION é definida quando o script é executado pelo Windows Terminal.
:: Se não estiver definida, relançamos o script no WT.
if not defined WT_SESSION (
    :: %~f0 é o caminho completo do script atual. O 'cmd /c' executa o script e fecha o terminal.
    :: -p "Terminal do Windows" garante que um perfil com suporte a UTF-8 seja usado.
    start wt.exe -p "Terminal do Windows" --title "🤖 Pabot - Execução em Paralelo" cmd /c "%~f0"
    exit /b
)

REM Continuamos a execução, pois agora estamos dentro do Windows Terminal (com suporte a UTF-8)

REM ####################################################################
REM ### 2. CONFIGURAÇÃO E EXECUÇÃO DOS TESTES ROBOT/PABOT (SEU CÓDIGO) ###
REM ####################################################################

chcp 65001 >nul
title Execução simultânea de testes Robot Framework
color 0F
cd /d "C:\Users\kaique.oliveira\Documents\Codigos\robot"

echo ===================================================
echo 🚀 Executando testes EM PARALELO com Pabot 🚀
echo ===================================================
echo.
echo Isso deve levar alguns minutos...

set PROCESSES=4
set CONSOLE_LOG=saida_console_pabot.txt
set LOGS_DIR=results\logs_separados

:: Limpa logs antigos
if exist %CONSOLE_LOG% del %CONSOLE_LOG%
if exist results\output.xml del results\output.xml
if exist %LOGS_DIR% (
    rd /s /q %LOGS_DIR%
)
if not exist results mkdir results
if not exist %LOGS_DIR% mkdir %LOGS_DIR%

:: Executa todos os testes em paralelo e salva saída de console
pabot --processes %PROCESSES% -v OPTIONS:"add_argument(\"--headless\");" --consolecolors on --outputdir results . > %CONSOLE_LOG%

echo.
echo ✅ Testes finalizados! Mostrando logs individuais:

:: Itera sobre os arquivos de log individuais e os exibe
if exist %LOGS_DIR%\*.log (
    for %%f in (%LOGS_DIR%\*.log) do (
        echo.
        echo 📝 Log do Arquivo: %%~nxf
        echo.
        type "%%f"
        echo.
        echo ---------------------------------------------------
    )
) else (
    echo ⚠️ Nenhum log individual encontrado em %LOGS_DIR%. (Verifique logs_utils.robot)
)


echo 🏁 Execução concluída.
echo.
pause
@echo off
:: =====================================================
:: MONITORAÇÃO DE AMBIENTES AUTOMATIZADOS - MENU PRINCIPAL
:: =====================================================

if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Monitoração de Ambientes Automatizados
color 0F
chcp 65001 >nul

:MENU
cls
echo ==========================================================
echo          MONITORAÇÃO DE AMBIENTES AUTOMATIZADOS
echo ==========================================================
echo.
echo Como você gostaria de executar os testes?
echo.
echo   [1] Executar todos visualmente (UI)
echo   [2] Executar todos em segundo plano (Headless)
echo   [3] Executar todos simultaneamente (Pabot)
echo   [4] Executar teste específico visualmente (UI)
echo   [5] Executar teste específico em segundo plano (Headless)
echo.
set /p opcao=Digite o número da opção desejada: 
echo.

if "%opcao%"=="1" goto :UI
if "%opcao%"=="2" goto :HEADLESS
if "%opcao%"=="3" goto :PABOT
if "%opcao%"=="4" goto :UI_ESPECIFICO
if "%opcao%"=="5" goto :HEADLESS_ESPECIFICO
if "%opcao%"=="0" goto :SAIR

echo Opção inválida. Tente novamente.
pause
goto :MENU


:UI
cls
echo Executando TODOS os testes VISUALMENTE...
echo.
call "C:\Users\kaique.oliveira\Documents\Codigos\robot\ui-test.bat"
pause
goto :MENU


:HEADLESS
cls
echo Executando TODOS os testes em MODO HEADLESS...
echo.
call "C:\Users\kaique.oliveira\Documents\Codigos\robot\headless-test.bat"
pause
goto :MENU


:PABOT
cls
echo Executando TODOS os testes simultaneamente (Pabot Headless)...
echo.
call "C:\Users\kaique.oliveira\Documents\Codigos\robot\testes simultaneos UI.bat"
pause
goto :MENU


:UI_ESPECIFICO
cls
echo Qual teste deseja executar VISUALMENTE?
echo.
echo   [1] Portais e Sistemas Gestores
echo   [2] Autorizadores Funcionalcard
echo   [3] Acesso ao Funcionalplant
echo   [4] Cadastro de Programas
echo   [5] Webview
echo   [0] Voltar
echo.
set /p teste=Digite o número do teste desejado: 
echo.

if "%teste%"=="1" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\02 Portais e Sistemas Gestores\2 Portais e Sistemas Gestores UI.bat"
if "%teste%"=="2" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\03 Autorizadores\3 Autorizadores Funcionalcard UI.bat"
if "%teste%"=="3" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\08 Acesso ao FuncionalPlant\8 Acesso ao Funcionalplant UI.bat"
if "%teste%"=="4" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\10 Cadastro de Programas\10 Cadastro de Programas UI.bat"
if "%teste%"=="5" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\11 Webview\11 Webview UI.bat"
if "%teste%"=="0" goto :MENU

pause
goto :MENU


:HEADLESS_ESPECIFICO
cls
echo Qual teste deseja executar em MODO HEADLESS?
echo.
echo   [1] Portais e Sistemas Gestores
echo   [2] Autorizadores Funcionalcard
echo   [3] Acesso ao Funcionalplant
echo   [4] Cadastro de Programas
echo   [5] Webview
echo   [0] Voltar
echo.
set /p teste=Digite o número do teste desejado: 
echo.

if "%teste%"=="1" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\02 Portais e Sistemas Gestores\2 Portais e Sistemas Gestores Headless.bat"
if "%teste%"=="2" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\03 Autorizadores\3 Autorizadores Funcionalcard Headless.bat"
if "%teste%"=="3" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\08 Acesso ao FuncionalPlant\8 Acesso ao Funcionalplant Headless.bat"
if "%teste%"=="4" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\10 Cadastro de Programas\10 Cadastro de Programas Headless.bat"
if "%teste%"=="5" call "C:\Users\kaique.oliveira\Documents\Codigos\robot\11 Webview\11 Webview Headless.bat"
if "%teste%"=="0" goto :MENU

pause
goto :MENU


:SAIR
echo Encerrando...
timeout /t 1 >nul
exit /b

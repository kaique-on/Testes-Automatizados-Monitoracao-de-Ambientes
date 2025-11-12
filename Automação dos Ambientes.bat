@echo off
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Monitoração de Ambientes Automatizados
color 0F
chcp 65001 >nul

set "BASE_DIR=%~dp0"
set "STRUCTURES_DIR=%BASE_DIR%structures"

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
echo   [3] Executar todos simultaneamente (Headless / Pabot)
echo   [4] Executar teste específico visualmente (UI)
echo   [5] Executar teste específico em segundo plano (Headless)
echo   [0] Sair
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
call "%BASE_DIR%ui-test.bat"
pause
goto :MENU


:HEADLESS
cls
echo Executando TODOS os testes em MODO HEADLESS...
echo.
call "%BASE_DIR%headless-test.bat"
pause
goto :MENU


:PABOT
cls
call "%BASE_DIR%testes simultaneos headless.bat"
pause
goto :MENU


:SAIR
cls
echo Encerrando a monitoração de ambientes...
timeout /t 1 >nul
exit /b


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

if "%teste%"=="1" call "%BASE_DIR%02 Portais e Sistemas Gestores\2 Portais e Sistemas Gestores UI.bat"
if "%teste%"=="2" call "%BASE_DIR%03 Autorizadores\3 Autorizadores Funcionalcard UI.bat"
if "%teste%"=="3" call "%BASE_DIR%08 Acesso ao FuncionalPlant\8 Acesso ao Funcionalplant UI.bat"
if "%teste%"=="4" call "%BASE_DIR%10 Cadastro de Programas\10 Cadastro de Programas UI.bat"
if "%teste%"=="5" call "%BASE_DIR%11 Webview\11 Webview UI.bat"
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

if "%teste%"=="1" call "%BASE_DIR%02 Portais e Sistemas Gestores\2 Portais e Sistemas Gestores headless.bat"
if "%teste%"=="2" call "%BASE_DIR%03 Autorizadores\3 Autorizadores Funcionalcard headless.bat"
if "%teste%"=="3" call "%BASE_DIR%08 Acesso ao FuncionalPlant\8 Acesso ao Funcionalplant headless.bat"
if "%teste%"=="4" call "%BASE_DIR%10 Cadastro de Programas\10 Cadastro de Programas headless.bat"
if "%teste%"=="5" call "%BASE_DIR%11 Webview\11 Webview headless.bat"
if "%teste%"=="0" goto :MENU

pause
goto :MENU

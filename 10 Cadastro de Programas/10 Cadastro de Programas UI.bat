@echo off
chcp 65001 >nul
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

:: Define título e cor
title Testes UI
color 0F

:: Vai para a pasta onde o script está
cd /d "%~dp0"

:: Limpa relatórios antigos (caso existam)
del /q output.xml log.html report.html 2>nul

echo Executando testes COM INTERFACE (UI)...
echo.

:: Executa todos os .robot da pasta atual
robot --console NONE --output NONE --log NONE --report NONE . 

echo.
echo ✅ Testes com interface visível finalizados com sucesso.
pause

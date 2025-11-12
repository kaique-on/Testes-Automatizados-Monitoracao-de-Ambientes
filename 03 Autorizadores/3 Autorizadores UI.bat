@echo off
chcp 65001 >nul
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Testes UI
color 0F

cd /d "%~dp0"

:: Limpa relatórios antigos (caso existam)
del /q output.xml log.html report.html 2>nul

echo Executando testes COM INTERFACE (UI)...
echo.

robot --console NONE --output NONE --log NONE --report NONE . 

echo.
echo ✅ Teste UI finalizado com sucesso.
echo.
pause

@echo off
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

echo Executando testes em MODO HEADLESS (segundo plano)
echo.

robot --console NONE --output NONE --log NONE --report NONE -v OPTIONS:"add_argument(\"--headless\");" .

echo.
echo Testes headless finalizados com sucesso.
pause

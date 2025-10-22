@echo off
:: --- Reabre no Windows Terminal se não estiver dentro dele ---
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Testes Headless
color 0E
cd /d "C:\Users\kaique.oliveira\Documents\Codigos\robot"

del /q output.xml log.html report.html 2>nul

echo Executando testes em MODO HEADLESS
echo.

robot --output NONE --log NONE --report NONE -v OPTIONS:"add_argument(\"--headless\");" .

echo.
echo Testes headless finalizados com sucesso.
pause

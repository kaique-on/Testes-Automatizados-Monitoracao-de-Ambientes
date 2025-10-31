@echo off
chcp 65001 >nul
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Testes Headless
color 0F

cd /d "%~dp0"


del /q output.xml log.html report.html 2>nul

echo ===========================================================
echo Executando testes em modo HEADLESS...
echo Pasta atual: %CD%
echo ===========================================================
echo.

robot --console NONE --output NONE --log NONE --report NONE -v OPTIONS:"add_argument(\"--headless\");" .

:: ===========================================================
echo.
echo Testes headless finalizados com sucesso.
echo ===========================================================
pause

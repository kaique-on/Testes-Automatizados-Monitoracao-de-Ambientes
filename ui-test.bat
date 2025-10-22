@echo off
if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Testes com UI 
color 0A
cd /d "C:\Users\kaique.oliveira\Documents\Codigos\robot"

del /q output.xml log.html report.html 2>nul

echo Executando testes COM INTERFACE (UI)
echo.

robot --output NONE --log NONE --report NONE .

echo.
echo Testes com interface visivel finalizados com sucesso.
pause

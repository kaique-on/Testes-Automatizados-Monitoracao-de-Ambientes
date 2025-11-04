@echo off
chcp 65001 >nul

if not defined WT_SESSION (
    start wt.exe -w 0 -p "Windows PowerShell" cmd /c "%~f0"
    exit /b
)

title Testes com UI 
color 0F

set "BASE_DIR=%~dp0"
cd /d "%BASE_DIR%"

del /q output.xml log.html report.html 2>nul

echo ===================================================
echo 🚀 Executando testes COM INTERFACE (UI)
echo ===================================================
echo.

robot --console NONE --output NONE --log NONE --report NONE .

echo.
echo ✅ Testes com interface visível finalizados com sucesso.
pause

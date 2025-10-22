*** Settings ***
Documentation    03 Autorizadores
Library    SeleniumLibrary    run_on_failure=NOTHING
Resource    ../geral-resource.robot
Resource    resource-3-autorizadores.robot
Resource    ../env/3-env.robot
Library    DateTime
Suite Setup    Marcar Inicio
Suite Teardown    Mostrar Duracao

*** Test Cases ***

Autorizador Geral
    Abrir Navegador
    Go To    ${URL_GERAL}
    Log To Console    .
    TRY
        Login Autorizador Geral
        Log To Console    ✅ GERAL - Login: OK
        TRY
            Programa da Industria - CPF
            Log To Console    ✅ GERAL - Programa de autorização por CPF: OK
        EXCEPT    AS    ${erro}
            Log To Console    ❌ GERAL - Programa de autorização por CPF: FALHOU
            Log To Console    ❗ ERRO: ${erro}\n
        END
        TRY
            Convenio Empresa - Cartao
            Log To Console    ✅ GERAL - Convenio Empresa por Cartão: OK
        EXCEPT    AS    ${erro}
            Log To Console    ❌ GERAL - Convenio Empresa por Cartão: FALHOU
            Log To Console    ❗ ERRO: ${erro}\n
        END
    
    EXCEPT    AS    ${erro}
        Log To Console    ❌ GERAL - Login: FALHOU
        Log To Console    ❗ ERRO: ${erro}\n
    END
    Close Browser
    
Autorizador Raiadrogasil
    Abrir Navegador
    Go To    ${URL_RAIADROGASIL}
    Log To Console    .
    TRY
        Login Autorizador Raiadrogasil
        Log To Console    ✅ RAIADROGASIL - Login: OK
        TRY
            Programa da Industria - CPF
            Log To Console    ✅ RAIADROGASIL - Programa de autorização por CPF: OK
        EXCEPT    AS    ${erro}
            Log To Console    ❌ RAIADROGASIL - Programa de autorização por CPF: FALHOU
            Log To Console    ❗ ERRO: ${erro}\n
        END
        TRY
            Convenio Empresa - Cartao
            Log To Console    ✅ RAIADROGASIL - Convenio Empresa por Cartão: OK
        EXCEPT    AS    ${erro}
            Log To Console    ❌ RAIADROGASIL - Convenio Empresa por Cartão: FALHOU
            Log To Console    ❗ ERRO: ${erro}\n
        END
    
    EXCEPT    AS    ${erro}
        Log To Console    ❌ RAIADROGASIL - Login: FALHOU
        Log To Console    ❗ ERRO: ${erro}\n
    END
    Close Browser
    
Autorizador Panvel
    Abrir Navegador
    Go To    ${URL_PANVEL}
    Log To Console    .
    TRY
        Login Autorizador Panvel
        Log To Console    ✅ PANVEL - Login: OK
        TRY
            Programa da Industria - CPF
            Log To Console    ✅ PANVEL - Programa de autorização por CPF: OK
        EXCEPT    AS    ${erro}
            Log To Console    ❌ PANVEL - Programa de autorização por CPF: FALHOU
            Log To Console    ❗ ERRO: ${erro}\n
        END
        TRY
            Convenio Empresa - Cartao
            Log To Console    ✅ PANVEL - Convenio Empresa por Cartão: OK
        EXCEPT    AS    ${erro}
            Log To Console    ❌ PANVEL - Convenio Empresa por Cartão: FALHOU
            Log To Console    ❗ ERRO: ${erro}\n
        END
    EXCEPT    AS    ${erro}
        Log To Console    ❌ PANVEL - Login: FALHOU
        Log To Console    ❗ ERRO: ${erro}\n
    END
    Close Browser
*** Settings ***
Documentation    03 Autorizadores
Library    SeleniumLibrary    run_on_failure=NOTHING
Resource    ../geral-resource.robot
Resource    resource-3-autorizadores.robot
Resource    ../env/3-env.robot
Resource    ../logs_utils.robot
Library    DateTime
Suite Setup    Marcar Inicio
Suite Teardown    Mostrar Duracao

*** Test Cases ***

Autorizador Geral
    Log To Shared File    Executando teste: 3 - Autorizadores Funcionalcard
    Abrir Navegador
    Set Log Level    NONE
    Go To    ${URL_GERAL}
    Set Log Level    INFO
    
    TRY
        Login Autorizador Geral
        Log To Shared File    ✅ GERAL - Login: OK
        TRY
            Programa da Industria - CPF
            Log To Shared File    ✅ GERAL - Programa de autorização por CPF: OK
        EXCEPT    AS    ${erro}
            Log To Shared File    ❌ GERAL - Programa de autorização por CPF: FALHOU
            Log To Shared File    ❗ ERRO: ${erro}
        END
        TRY
            Convenio Empresa - Cartao
            Log To Shared File    ✅ GERAL - Convenio Empresa por Cartão: OK
        EXCEPT    AS    ${erro}
            Log To Shared File    ❌ GERAL - Convenio Empresa por Cartão: FALHOU
            Log To Shared File    ❗ ERRO: ${erro}
        END
    
    EXCEPT    AS    ${erro}
        Log To Shared File    ❌ GERAL - Login: FALHOU
        Log To Shared File    ❗ ERRO: ${erro}
    END
    Log To Shared File    ${SPACE}
    Close Browser
    
Autorizador Raiadrogasil
    Abrir Navegador
    Set Log Level    NONE
    Go To    ${URL_RAIADROGASIL}
    Set Log Level    INFO
    
    TRY
        Login Autorizador Raiadrogasil
        Log To Shared File    ✅ RAIADROGASIL - Login: OK
        TRY
            Programa da Industria - CPF
            Log To Shared File    ✅ RAIADROGASIL - Programa de autorização por CPF: OK
        EXCEPT    AS    ${erro}
            Log To Shared File    ❌ RAIADROGASIL - Programa de autorização por CPF: FALHOU
            Log To Shared File    ❗ ERRO: ${erro}
        END
        TRY
            Convenio Empresa - Cartao
            Log To Shared File    ✅ RAIADROGASIL - Convenio Empresa por Cartão: OK
        EXCEPT    AS    ${erro}
            Log To Shared File    ❌ RAIADROGASIL - Convenio Empresa por Cartão: FALHOU
            Log To Shared File    ❗ ERRO: ${erro}
        END
    
    EXCEPT    AS    ${erro}
        Log To Shared File    ❌ RAIADROGASIL - Login: FALHOU
        Log To Shared File    ❗ ERRO: ${erro}
    END
    Log To Shared File    ${SPACE}
    Close Browser
    
Autorizador Panvel
    Abrir Navegador
    Set Log Level    NONE
    Go To    ${URL_PANVEL}
    Set Log Level    INFO
    
    TRY
        Login Autorizador Panvel
        Log To Shared File    ✅ PANVEL - Login: OK
        TRY
            Programa da Industria - CPF
            Log To Shared File    ✅ PANVEL - Programa de autorização por CPF: OK
        EXCEPT    AS    ${erro}
            Log To Shared File    ❌ PANVEL - Programa de autorização por CPF: FALHOU
            Log To Shared File    ❗ ERRO: ${erro}
        END
        TRY
            Convenio Empresa - Cartao
            Log To Shared File    ✅ PANVEL - Convenio Empresa por Cartão: OK
        EXCEPT    AS    ${erro}
            Log To Shared File    ❌ PANVEL - Convenio Empresa por Cartão: FALHOU
            Log To Shared File    ❗ ERRO: ${erro}
        END
    EXCEPT    AS    ${erro}
        Log To Shared File    ❌ PANVEL - Login: FALHOU
        Log To Shared File    ❗ ERRO: ${erro}
    END
    Close Browser
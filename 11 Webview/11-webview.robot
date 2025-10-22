*** Settings ***
Documentation    11 webview
Library    SeleniumLibrary    run_on_failure=NOTHING
Resource    resource11webview.robot
Resource    ../geral-resource.robot
Resource    ../env/11-env.robot
Library    DateTime
Suite Setup    Marcar Inicio
Suite Teardown    Mostrar Duracao

*** Test Cases ***
11 Webview
    Acessar JWT Generator
    Inserir código de cartão
    Clicar em Gerar Token
    Copiar token
    Acessar Beneficiario Farmacia com token copiado
    Validar o resultado
    Log To Console    .    
    Log To Console    ✅ Token de acesso validado!
    Close Browser
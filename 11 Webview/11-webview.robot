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
    Log To Shared File    Executando teste: 11 - Webview
    Log To Shared File    Link para criar token: ${URL_CRIAR_TOKEN}
    Log To Shared File    Link para testar token: ${URL_TESTAR_TOKEN}\n
    Acessar JWT Generator
    Inserir código de cartão
    Clicar em Gerar Token
    Copiar token
    Log To Shared File    Token foi gerado
    Acessar Beneficiario Farmacia com token copiado
    Validar o resultado
    Log To Console    ✅ Token de acesso validado!
    Close Browser
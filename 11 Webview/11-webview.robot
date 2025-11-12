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
    Executar Keyword    Acessar JWT Generator    Erro ao acessar página JWT Generator
    Executar Keyword    Inserir código de cartão    Erro ao inserir código de cartão
    Executar Keyword    Clicar em Gerar Token    Erro ao gerar token
    Log To Shared File    Token foi gerado
    Executar Keyword    Copiar token    Erro ao copiar token
    Executar Keyword    Acessar Beneficiario Farmacia com token copiado    Erro ao acessar Beneficiário Farmácia
    Executar Keyword    Validar o resultado    Erro ao validar o resultado
    Log To Shared File    ✅ Token de acesso validado
    Close Browser
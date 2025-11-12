*** Settings ***
Library    SeleniumLibrary    run_on_Log To Shared Fileure=NOTHING
Resource    ../geral-resource.robot
Resource    ../env/11-env.robot
Resource    ../logs_utils.robot

*** Variables ***
${URL_CRIAR_TOKEN}    http://proxyvip.funcional.local:30300/tokens/create
${URL_TESTAR_TOKEN}    https://beneficiario.funcionalhealthtech.com.br/?token=

*** Keywords ***
Acessar JWT Generator
    Executar com verificacao    Open Browser    Erro ao acessar JWT Generator    ${URL_CRIAR_TOKEN}    ${BROWSER}    options=${OPTIONS}    

Inserir código de cartão
    Executar com verificacao    Wait Until Element Is Visible    Campo de código do cartão não encontrado    css=input[name='profileIdentity']    10s
    Set Log Level    NONE
    Executar com verificacao    Input Text    Erro ao inserir código do cartão    css=input[name='profileIdentity']    ${COD_CARTAO}
    Set Log Level    INFO

Clicar em Gerar Token
    Executar com verificacao    Click Button    Erro ao clicar em "Gerar Token"    css=button[class="button is-primary"]
    Log To Shared File    Token foi gerado

Copiar token
    Executar com verificacao    Wait Until Element Is Visible    Token não foi gerado    css=div.jwt-block    10s
    Executar com verificacao    Click Button    Erro ao clicar no botão de copiar token    css=button[class="button is-pulled-right is-rounded is-small is-dark mt-5 mr-5 copy-button"]

    ${token_copiado}=    Execute Javascript    return document.querySelector('.jwt-header').textContent + '.' + document.querySelector('.jwt-payload').textContent + '.' + document.querySelector('.jwt-signature').textContent
    Set Suite Variable    ${token_copiado}

Acessar Beneficiario Farmacia com token copiado
    Executar com verificacao    Go To    Erro ao acessar Beneficiário Farmácia com token    ${URL_TESTAR_TOKEN}${token_copiado}

Validar o resultado
    Executar com verificacao    Wait Until Page Contains    Erro ao validar o resultado    Total de Compra
    Log To Shared File    ✅ Token de acesso validado
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
    ${ok}=    Run Keyword And Return Status    Open Browser    ${URL_CRIAR_TOKEN}    ${BROWSER}    options=${OPTIONS}
    IF    not ${ok}
        Log To Shared File    ❌ Erro ao acessar JWT Generator
    END

Inserir código de cartão
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    css=input[name='profileIdentity']    10s
    IF    not ${ok}
        Log To Shared File    ❌ Campo de código do cartão não encontrado
    END

    Set Log Level    NONE

    ${ok}=    Run Keyword And Return Status    Input Text    css=input[name='profileIdentity']    ${COD_CARTAO}
    IF    not ${ok}
        Log To Shared File    ❌ Erro ao inserir código do cartão
    END

    Set Log Level    INFO

Clicar em Gerar Token
    ${ok}=    Run Keyword And Return Status    Click Button    css=button[class="button is-primary"]
    IF    not ${ok}
        Log To Shared File    ❌ Erro ao clicar em "Gerar Token"
    END

Copiar token
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    css=div.jwt-block    10s
    IF    not ${ok}
        Log To Shared File    ❌ Token não foi gerado
    END

    ${ok}=    Run Keyword And Return Status    Click Button    css=button[class="button is-pulled-right is-rounded is-small is-dark mt-5 mr-5 copy-button"]
    IF    not ${ok}
        Log To Shared File    ❌ Erro ao clicar no botão de copiar token
    END

    ${token_copiado}=    Execute Javascript    return document.querySelector('.jwt-header').textContent + '.' + document.querySelector('.jwt-payload').textContent + '.' + document.querySelector('.jwt-signature').textContent
    Set Suite Variable    ${token_copiado}

Acessar Beneficiario Farmacia com token copiado
    ${ok}=    Run Keyword And Return Status    Go To    ${URL_TESTAR_TOKEN}${token_copiado}
    IF    not ${ok}
        Log To Shared File    ❌ Erro ao acessar Beneficiário Farmácia com token
    END

Validar o resultado
    ${ok}=    Run Keyword And Return Status    Wait Until Page Contains    Total de Compra
    IF    not ${ok}
        Log To Shared File    ❌ Erro ao validar o resultado
    END

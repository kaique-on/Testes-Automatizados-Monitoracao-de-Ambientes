*** Settings ***
Library    SeleniumLibrary
Resource    ../geral-resource.robot
Resource    ../env/8-env.robot
Resource    ../logs_utils.robot

*** Variables ***
${URL}    http://funcionalplant.funcional.local/

*** Keywords ***
Executar com verificacao
    [Arguments]    ${keyword}    ${mensagem_erro}    @{args}
    ${ok}=    Run Keyword And Return Status    ${keyword}    @{args}
    IF    not ${ok}
        Fail    ❌ ${mensagem_erro}
    END

Acessar funcionalplant
    Open Browser    ${URL}    ${URL}    ${BROWSER}    options=${OPTIONS}
    Executar com verificacao    Wait Until Element Is Visible    Campo de login não encontrado na página inicial    id=login    10s
    Log To Shared File    ✅ Funcionalplant carregado com sucesso

Login funcionalplant
    Set Log Level    NONE
    Executar com verificacao    Input Text    Erro ao preencher o campo de login    id=login    ${LOGIN}
    Executar com verificacao    Input Password    Erro ao preencher o campo de senha    id=senha    ${SENHA}
    Set Log Level    INFO
    Executar com verificacao    Click Element    Erro ao clicar no botão de login    xpath=//input[@type='submit' and @value='OK']
    Executar com verificacao    Wait Until Page Contains    Login falhou — mensagem de boas-vindas não encontrada    Bem vindo ao sistema,    10s
    Log To Shared File    ✅ Logado em Funcionalplant com sucesso

*** Test Cases ***
Acesso e Login em funcionalplant
    Log To Shared File    Executando teste: 8 - Acesso ao Funcionalplant
    Log To Shared File    Link: ${URL}\n
    Acessar funcionalplant
    Login funcionalplant
    [Teardown]    Close Browser
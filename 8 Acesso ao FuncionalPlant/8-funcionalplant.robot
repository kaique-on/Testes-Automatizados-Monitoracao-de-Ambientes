*** Settings ***
Library    SeleniumLibrary
Resource    ../geral-resource.robot
Resource    ../env/8-env.robot

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
    Executar com verificacao    Open Browser    Falha ao abrir navegador ou acessar ${URL}    ${URL}    ${BROWSER}
    Executar com verificacao    Wait Until Element Is Visible    Campo de login não encontrado na página inicial    id=login    10s
    Log To Console    ✅ Funcionalplant carregado com sucesso

Login funcionalplant
    Set Log Level    NONE
    Executar com verificacao    Input Text    Erro ao preencher o campo de login    id=login    ${LOGIN}
    Executar com verificacao    Input Password    Erro ao preencher o campo de senha    id=senha    ${SENHA}
    Set Log Level    INFO
    Executar com verificacao    Click Element    Erro ao clicar no botão de login    xpath=//input[@type='submit' and @value='OK']
    Executar com verificacao    Wait Until Page Contains    Login falhou — mensagem de boas-vindas não encontrada    Bem vindo ao sistema,    10s
    Log To Console    ✅ Logado em Funcionalplant com sucesso

*** Test Cases ***
Acesso e Login em funcionalplant
    Log To Console    .
    Acessar funcionalplant
    Login funcionalplant
    [Teardown]    Close Browser
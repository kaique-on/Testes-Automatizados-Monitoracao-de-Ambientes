*** Settings ***
Library    SeleniumLibrary    run_on_failure=NOTHING
Library    DateTime
Resource    ../geral-resource.robot
Library    DateTime
Suite Setup    Marcar Inicio
Suite Teardown    Mostrar Duracao

*** Variables ***
${URL}       https://portaloperacoes.funcionalcorp.net.br/Programa

*** Test Cases ***
Validar Datas de Cadastros Recentes
    Log To Console    Link: ${URL}
    ${ok}=    Run Keyword And Return Status    Open Browser    ${URL}    ${BROWSER}    options=${OPTIONS}
    IF    not ${ok}
        Fail    ❗ Erro ao abrir o navegador ou acessar a URL
    END
    ${ok}=    Run Keyword And Return Status    Wait Until Page Contains Element    xpath=//table/tbody/tr    10s
    IF    not ${ok}
        Fail   ❗ A tabela de cadastros não foi encontrada na página
    END
    ${linhas}=    Get Element Count    xpath=//table/tbody/tr
    ${hoje}=    Get Current Date    result_format=%Y-%m-%d

    FOR    ${index}    IN RANGE    1    ${linhas}+1
        ${programa}=    Get Text    xpath=//table/tbody/tr[${index}]/td[2]
        ${data_texto}=  Get Text    xpath=//table/tbody/tr[${index}]/td[4]
        # Log To Console    Verificando ${programa} → ${data_texto}
        Run Keyword If    '${index}' == '1'    Log To Console    \n
        Run Keyword If    '${data_texto}' == ''    Log To Console    ⚠️ ${programa} não possui data cadastrada
        ...    ELSE    Validar Data Recente    ${programa}    ${data_texto}    ${hoje}
    END

    [Teardown]    Close Browser


*** Keywords ***
Validar Data Recente
    [Arguments]    ${programa}    ${data_texto}    ${hoje}
    ${data_somente}=    Evaluate    '${data_texto}'.split()[0]
    ${data_formatada}=  Convert Date    ${data_somente}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    ${diferenca}=       Evaluate    (datetime.datetime.strptime("${hoje}", "%Y-%m-%d") - datetime.datetime.strptime("${data_formatada}", "%Y-%m-%d")).days    datetime
    Run Keyword If    ${diferenca} > 3    Log To Console    ❌ ${programa} está com data antiga (${data_texto})
    # Run Keyword If    ${diferenca} <= 3    Log To Console    ✅ ${programa} está dentro do prazo (${data_texto})
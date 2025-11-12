*** Settings ***
Resource    logs_utils.robot
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${OPTIONS}    
#    add_argument("--headless");add_argument("--disable-gpu");add_argument("--window-size=1020,720")

*** Keywords ***
Executar com verificacao
    [Arguments]    ${keyword}    ${mensagem_erro}    @{args}
    ${ok}=    Run Keyword And Return Status    ${keyword}    @{args}
    # Caso o keyword seja Input Text, verificar se o valor foi realmente preenchido
    IF    "${keyword}" == "Input Text"
        ${locator}=    Set Variable    ${args[0]}
        ${expected}=    Set Variable    ${args[1]}
        ${tentativas}=    Set Variable    0
        WHILE    ${tentativas} < 3
            ${valor_atual}=    Get Value    ${locator}
            IF    '${valor_atual}' == '${expected}'
                Exit For Loop
            ELSE
                Sleep    1s
                # Log To Console    ↻ Tentando preencher novamente (${tentativas}+1)
                Run Keyword    Input Text    ${locator}    ${expected}
            END
            ${tentativas}=    Evaluate    ${tentativas} + 1
        END
        ${valor_atual}=    Get Value    ${locator}
        Run Keyword Unless    '${valor_atual}' == '${expected}'    Fail    ${mensagem_erro}
    ELSE IF    not ${ok}
        Fail    ${mensagem_erro}
    END

Executar Keyword
    [Arguments]    ${keyword_name}    ${erro_msg}
    TRY
        Run Keyword    ${keyword_name}
    EXCEPT    AS    ${erro}
        Log To Shared File    ❌ ${erro_msg}
        Log To Shared File    ❗ ERRO: ${erro}
    END

Marcar Inicio
    ${agora}=    Get Time    epoch
    Set Suite Variable    ${INICIO}    ${agora}

Mostrar Duracao
    ${fim}=    Get Time    epoch
    ${segundos}=    Evaluate    ${fim} - ${INICIO}
    ${minutos}=    Evaluate    int(${segundos} // 60)
    ${resto}=    Evaluate    round(${segundos} % 60, 1)
    Log To Shared File    \n🕒 Tempo total de execução: ${minutos}m ${resto}s
    Log To Shared File    \n=========================================
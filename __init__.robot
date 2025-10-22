*** Settings ***
Library    DateTime
Suite Setup    Marcar Inicio Global
Suite Teardown    Mostrar Duracao Global

*** Variables ***
${INICIO_GLOBAL}    None

*** Keywords ***
Marcar Inicio Global
    ${agora}=    Get Time    epoch
    Set Suite Variable    ${INICIO_GLOBAL}    ${agora}

Mostrar Duracao Global
    ${fim}=    Get Time    epoch
    ${segundos}=    Evaluate    ${fim} - ${INICIO_GLOBAL}
    ${minutos}=    Evaluate    int(${segundos} // 60)
    ${resto}=    Evaluate    round(${segundos} % 60, 1)
    Log To Console    \nTempo TOTAL de execução de todas as suítes:
    Log To Console    🕒 ${minutos}m ${resto}s \n
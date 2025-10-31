*** Variables ***
${BROWSER}    chrome
${OPTIONS}    
#    add_argument("--headless");add_argument("--disable-gpu");add_argument("--window-size=1020,720")

*** Keywords ***
Marcar Inicio
    ${agora}=    Get Time    epoch
    Set Suite Variable    ${INICIO}    ${agora}

Mostrar Duracao
    ${fim}=    Get Time    epoch
    ${segundos}=    Evaluate    ${fim} - ${INICIO}
    ${minutos}=    Evaluate    int(${segundos} // 60)
    ${resto}=    Evaluate    round(${segundos} % 60, 1)
    Log To Console    \n🕒 Tempo total de execução: ${minutos}m ${resto}s
    Log To Console    \n=================================================\n
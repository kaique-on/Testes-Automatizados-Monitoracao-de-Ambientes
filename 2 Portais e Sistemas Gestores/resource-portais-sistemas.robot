*** Settings ***
Library    SeleniumLibrary    run_on_failure=NOTHING
Resource    ../geral-resource.robot

*** Variables ***
${ACEITAR_COOKIES}    Aceitar todos os cookies
${URL1}    https://funcionalhealthtech.com.br/
${URL2}    https://funcionalacesso.com/Welcome.aspx
${URL3}    http://www.funcionalcorp.com.br/funcionalcard/
${URL4}    https://www.funcionalcorp.com.br/funcionalcard/home/
${URL5}    http://dcintranet/ATC/Chamados/Login.aspx
${URL6}    https://abbott.funcionalmais.com/
${URL7}    http://msdgestor.funcionalmais.com/
${URL8}    http://msddash.funcionalmais.com/
${URL9}    https://zodiac.funcionalmais.com/
${URL10}    https://mundipharma.funcionalmais.com/
${URL11}    https://sanofi.funcionalmais.com/
${URL12}    https://apsen.funcionalmais.com/
${URL13}    https://chiesi.funcionalmais.com/
${URL14}    https://teva.funcionalmais.com/
${URL15}    https://perrigo.funcionalmais.com/
${URL16}    https://nestle.funcionalmais.com/
${URL17}    https://allergan.funcionalmais.com/
${URL18}    https://servier.funcionalmais.com/
${URL19}    https://besins.funcionalmais.com/
${URL20}    https://abbott-diabetes.funcionalmais.com/
${URL21}    https://abbott-nutricional.funcionalmais.com/
${URL22}    https://astellas.funcionalmais.com/
${URL23}    https://knight.funcionalmais.com
${URL24}    https://boehringer.funcionalmais.com/

*** Keywords ***

Abrir Navegador
    Open Browser    about:blank    chrome    options=${OPTIONS}
    Log To Console    .
Validar Pagina - https://funcionalhealthtech.com.br/
    Go To    ${URL1}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    ${ACEITAR_COOKIES}    10s
    Run Keyword If    ${status}    Log To Console    ✅ ${URL1} carregou corretamente
    ...    ELSE    Log To Console    ❌ ${URL1} Erro ao carregar 

Validar Pagina - https://funcionalacesso.com/Welcome.aspx
    Go To    ${URL2}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    ${ACEITAR_COOKIES}    10s
    Run Keyword If    ${status}    Log To Console    ✅ ${URL2} carregou corretamente
    ...    ELSE    Log To Console    ❌ ${URL2} Erro ao carregar 

Validar Pagina - http://www.funcionalcorp.com.br/funcionalcard/
    Go To    ${URL3}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    todos    10s
    Run Keyword If    ${status}    Log To Console    ✅ ${URL3} carregou corretamente
    ...    ELSE    Log To Console    ❌ ${URL3} Erro ao carregar 

Validar Pagina - https://www.funcionalcorp.com.br/funcionalcard/home/
    Go To    ${URL4}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    faça seu login    10s
    Run Keyword If    ${status}    Log To Console    ✅ ${URL4} carregou corretamente
    ...    ELSE    Log To Console    ❌ ${URL4} Erro ao carregar 

Validar Pagina - http://dcintranet/ATC/Chamados/Login.aspx
    Go To    ${URL5}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    Digite os carateres da imagem    10s
    Run Keyword If    ${status}    Log To Console    ✅ ${URL5} carregou corretamente
    ...    ELSE    Log To Console    ❌ ${URL5} Erro ao carregar 


Validar Pagina
    [Arguments]    ${url}
    Go To    ${url}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    ${ACEITAR_COOKIES}    10s
    Run Keyword If    ${status}    Log To Console    ✅ ${url} carregou corretamente
    ...    ELSE    Log To Console    ❌ ${url} Erro ao carregar


Validar Paginas FuncionalMais
    ${urls}=    Create List
    ...    ${URL6}
    ...    ${URL7}
    ...    ${URL8}
    ...    ${URL9}
    ...    ${URL10}
    ...    ${URL11}
    ...    ${URL12}
    ...    ${URL13}
    ...    ${URL14}
    ...    ${URL15}
    ...    ${URL16}
    ...    ${URL17}
    ...    ${URL18}
    ...    ${URL19}
    ...    ${URL20}
    ...    ${URL21}
    ...    ${URL22}
    ...    ${URL23}
    ...    ${URL24}

    FOR    ${url}    IN    @{urls}
        Validar Pagina    ${url}
    END
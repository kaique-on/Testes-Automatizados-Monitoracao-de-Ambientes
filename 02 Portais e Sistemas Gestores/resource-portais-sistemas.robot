*** Settings ***
Library    SeleniumLibrary    run_on_failure=NOTHING
Library    Collections
Resource    ../geral-resource.robot
Resource    ../env/2-env.robot
Resource    ../logs_utils.robot
 
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
 
Validar Pagina - https://funcionalhealthtech.com.br/
    Executar com verificacao    Go To    ❌ Erro ao acessar ${URL1}    ${URL1}
    Executar com verificacao    Wait Until Element Is Visible    ❌ Erro ao validar ${URL1}    css:.funcional-menu-widget    10s
    Log To Shared File    ✅ ${URL1} logou corretamente
 
Validar Pagina - https://funcionalacesso.com/Welcome.aspx
    Executar com verificacao    Go To    ❌ Erro ao acessar ${URL2}    ${URL2}
    Executar com verificacao    Wait Until Page Contains    ❌ Erro ao validar ${URL2}    ${ACEITAR_COOKIES}    10s
    Log To Shared File    ✅ ${URL2} logou corretamente
 
Validar Pagina - http://www.funcionalcorp.com.br/funcionalcard/
    Executar com verificacao    Go To    ❌ Erro ao acessar ${URL3}    ${URL3}
    Executar com verificacao    Wait Until Element Is Visible    ❌ Erro ao validar ${URL3}    css:.funcional-menu-widget    10s
    Log To Shared File    ✅ ${URL3} logou corretamente
 
Validar Pagina - https://www.funcionalcorp.com.br/funcionalcard/home/
    Executar com verificacao    Go To    ❌ Erro ao acessar ${URL4}    ${URL4}
    Executar com verificacao    Wait Until Element Is Visible    ❌ Erro ao validar ${URL4}    css:.funcional-menu-widget    10s
    Log To Shared File    ✅ ${URL4} logou corretamente
 
Validar Pagina - http://dcintranet/ATC/Chamados/Login.aspx
    Executar com verificacao    Go To    ❌ Erro ao acessar ${URL5}    ${URL5}
    Executar com verificacao    Wait Until Page Contains    ❌ Erro ao validar ${URL5}    Digite os carateres da imagem    10s
    Log To Shared File    ✅ ${URL5} logou corretamente
 
Validar Pagina FuncionalMais
    [Arguments]    ${url}
    Executar com verificacao    Execute JavaScript    ❌ Erro ao acessar ${url}    window.location.href = "${url}"
    Sleep    1s
 
    ${aceitar_existe}=    Run Keyword And Return Status    Element Should Be Visible    css=#onetrust-accept-btn-handler    10s
    Run Keyword If    ${aceitar_existe}    Click Element    css=#onetrust-accept-btn-handler
 
    Executar com verificacao    Input Text    ❌ Erro ao inserir login em ${url}    id=txtLogin    ${LOGIN}
    Executar com verificacao    Input Password    ❌ Erro ao inserir senha em ${url}    id=txtSenha    ${SENHA}
    Executar com verificacao    Click Element    ❌ Erro ao clicar em Entrar em ${url}    id=btnLogin
    Sleep    1s
 
    ${modal_existe}=    Run Keyword And Return Status    Element Should Be Visible    css=#decisionModal .btn.btn-success    10s
    Run Keyword If    ${modal_existe}    Execute JavaScript    document.querySelector('#decisionModal .btn.btn-success').click()
 
    Login funcionalmais
    Log To Shared File    ✅ ${url} logou corretamente
 
Login funcionalmais
    ${carregando}=    Run Keyword And Return Status    Element Should Be Visible    css=#loadingModal
    WHILE    ${carregando}
        Sleep    0.5s
        ${carregando}=    Run Keyword And Return Status    Element Should Be Visible    css=#loadingModal
    END
 
    ${cpf_visivel}=    Run Keyword And Return Status    Element Should Be Visible    id=txtUserCPF
    IF    ${cpf_visivel}
        Login funcionalmais2
        No Operation
    ELSE
        Wait Until Element Is Visible    css=#div-menu-sair
        Click Element    css=#div-menu-sair
    END
 
Login funcionalmais2
    Input Text    id=txtUserCPF    49108156867
    Click Element    id=btnEnviar
 
Validar Paginas FuncionalMais
    ${todas_urls}=    Create List
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
 
    FOR    ${url}    IN    @{todas_urls}
        TRY
            Validar Pagina FuncionalMais    ${url}
        EXCEPT
            Log To Shared File    ❌ Erro ao validar ${url}
        END
    END
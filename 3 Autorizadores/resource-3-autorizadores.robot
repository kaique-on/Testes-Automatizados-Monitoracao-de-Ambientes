*** Settings ***
Library    SeleniumLibrary    run_on_failure=NOTHING
Library    DateTime
Resource    ../geral-resource.robot
Resource    resource-3-autorizadores.robot
Resource    ../env/3-env.robot

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL_GERAL}    chrome    options=${OPTIONS}add_argument("--window-size=1020,720")
    Aceitar Cookies
    
Aceitar Cookies
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=onetrust-accept-btn-handler    10s
    IF    not ${ok}
        Fail    Erro ao localizar o botão de cookies
    END
    Set Selenium Speed    0.05 seconds
    ${ok}=    Run Keyword And Return Status    Click Button    id=onetrust-accept-btn-handler
    IF    not ${ok}
        Fail    Falha ao clicar em "Aceitar Cookies"
    END

Executar com verificacao
    [Arguments]    ${keyword}    ${mensagem_erro}    @{args}
    ${ok}=    Run Keyword And Return Status    ${keyword}    @{args}
    IF    not ${ok}
        Fail    ${mensagem_erro}
    END

Login Autorizador Geral
    Executar com verificacao    Wait Until Element Is Visible    Falha ao carregar tela de login (GERAL)    css=input[name='ctl00$bodyHolder$txtUsername']    10s
    Executar com verificacao    Input Text    Falha ao preencher campo de usuário (GERAL)    css=input[name='ctl00$bodyHolder$txtUsername']    ${LOGIN_GERAL}
    Executar com verificacao    Input Text    Falha ao preencher campo de senha (GERAL)    css=input[name='ctl00$bodyHolder$txtSenha']    ${SENHA_GERAL}
    Executar com verificacao    Click Button    Botão de login não foi clicado    id=ctl00_bodyHolder_btnEnviarSenha
    Executar com verificacao    Wait Until Element Is Visible    Não foi redirecionado pra página principal    id=btnCapSearchPharma    10s

Login Autorizador Raiadrogasil
    Executar com verificacao    Wait Until Element Is Visible    Falha ao carregar tela de login (RAIADROGASIL)    css=input[name='ctl00$bodyHolder$txtUsername']    10s
    Executar com verificacao    Input Text    Falha ao preencher campo de usuário (RAIADROGASIL)    css=input[name='ctl00$bodyHolder$txtUsername']    ${LOGIN_RAIADROGASIL}
    Executar com verificacao    Input Text    Falha ao preencher campo de senha (RAIADROGASIL)    css=input[name='ctl00$bodyHolder$txtSenha']    ${LOGIN_RAIADROGASIL}
    Executar com verificacao    Click Button    Botão de login não foi clicado    id=ctl00_bodyHolder_btnEnviarSenha
    Executar com verificacao    Wait Until Element Is Visible    Não foi redirecionado pra página principal    id=btnCapSearchPharma    10s
Login Autorizador Panvel
    Executar com verificacao    Wait Until Element Is Visible    Falha ao carregar tela de login (PANVEL)    css=input[name='ctl00$bodyHolder$txtUsername']    10s
    Executar com verificacao    Input Text    Falha ao preencher campo de usuário (PANVEL)    css=input[name='ctl00$bodyHolder$txtUsername']    ${LOGIN_PANVEL}
    Executar com verificacao    Input Text    Falha ao preencher campo de senha (PANVEL)    css=input[name='ctl00$bodyHolder$txtSenha']    ${SENHA_PANVEL}
    Executar com verificacao    Click Button    Botão de login não foi clicado    id=ctl00_bodyHolder_btnEnviarSenha
    Executar com verificacao    Wait Until Element Is Visible    Não foi redirecionado pra página principal    id=btnCapSearchPharma    10s

Programa da Industria - CPF
    Executar com verificacao    Click Element    Falha ao clicar no botão de busca pharma    id=btnCapSearchPharma
    Executar com verificacao    Input Text    Falha ao preencher CPF    id=cpfValue    ${CPF}
    Executar com verificacao    Click Button    Falha ao clicar em "Buscar"    id=btnSearchPharma
    Executar com verificacao    Wait Until Element Is Visible    Botão "Continuar" não apareceu    id=btnContinuarPharma    10s
    Executar com verificacao    Click Button    Falha ao clicar em "Continuar"    id=btnContinuarPharma

    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=ctl00_bodyHolder_btnOK
    IF    ${is_visible}
        Executar com verificacao    Wait Until Element Is Visible    Botão de confirmação não visível (OK)    id=ctl00_bodyHolder_btnOK    2s
        Executar com verificacao    Click Button    Falha ao clicar em botão OK    id=ctl00_bodyHolder_btnOK
    END

    Sleep    1s

    Executar com verificacao    Input Text    Falha ao preencher EAN    id=txtEan1    ${EAN_BF}
    Executar com verificacao    Click Element    Falha ao clicar no campo de cartão    id=ctl00_bodyHolder_lblcartao

    ${close_existe}=    Run Keyword And Return Status    Wait Until Element Is Visible    css=button.close.col-md-4.col-12    3s
    IF    ${close_existe}
        Executar com verificacao    Click Button    Falha ao clicar no botão de fechar modal    css=button.close.col-md-4.col-12
    END

    ${today_date}=    Get Current Date    result_format=%d/%m/%Y
    Executar com verificacao    Input Text    Falha ao preencher quantidade vendida    id=txtQtdvend1    ${QUANTIDADE}
    Executar com verificacao    Input Text    Falha ao preencher data da receita    id=txtdtReceita1    ${today_date}
    Executar com verificacao    Select From List By Value    Falha ao selecionar UF    id=ddlUF1    SP
    Executar com verificacao    Input Text    Falha ao preencher CRM    id=txtcrm1    ${CRM}
    Executar com verificacao    Click Button    Falha ao confirmar compra    id=ctl00_bodyHolder_btnConfirmarCompra
    Executar com verificacao    Wait Until Element Is Visible    Botão final não apareceu após confirmar    id=ctl00_bodyHolder_Button1    10s
    Executar com verificacao    Click Button    Falha ao clicar no botão final    id=ctl00_bodyHolder_Button1

Convenio Empresa - Cartao
    Executar com verificacao    Click Element    Falha ao clicar no botão "Home"    id=Home
    Executar com verificacao    Wait Until Element Is Visible    Botão "Buscar Benefícios" não apareceu    id=btnCapSearchBenefits
    Executar com verificacao    Click Element    Falha ao clicar no botão "Buscar Benefícios"    id=btnCapSearchBenefits

    ${DIGITOS}=    Evaluate    list('${CARTAO}')
    Executar com verificacao    Click Element    Falha ao clicar no campo de cartão    id=numeroCartao
    Set Selenium Speed    0.01 seconds
    FOR    ${DIGITO}    IN    @{DIGITOS}
        Press Keys    id=numeroCartao    ${DIGITO}
    END

    Executar com verificacao    Click Button    Falha ao clicar no botão "Buscar Benefícios"    id=btnSearchBenefits
    Sleep    1s
    Set Selenium Speed    0.05 seconds

    Executar com verificacao    Execute JavaScript    Falha ao habilitar botão de busca do usuário    document.querySelector('button.btn.btn-primary.button-search-user-normal').removeAttribute('disabled');
    Executar com verificacao    Execute JavaScript    Falha ao clicar no botão de busca do usuário via JavaScript    document.querySelector('button.btn.btn-primary.button-search-user-normal').click();
    Sleep    1s

    ${cpf_input_existe}=    Run Keyword And Return Status    Element Should Be Visible    id=ctl00_bodyHolder_btnOK
    IF    ${cpf_input_existe}
        Executar com verificacao    Wait Until Element Is Visible    Botão OK não visível    id=ctl00_bodyHolder_btnOK    5s
        Executar com verificacao    Click Element    Falha ao clicar no campo CPF    css=input.form-control.cpf.input-search-user-normal
        Executar com verificacao    Input Text    Falha ao preencher CPF    css=input.form-control.cpf.input-search-user-normal    ${CPF}
        Executar com verificacao    Click Button    Falha ao clicar no botão OK    id=ctl00_bodyHolder_btnOK
    END
    Sleep    1s
    ${is_visible2}=    Run Keyword And Return Status    Element Should Be Visible    css=button.close
    IF    ${is_visible2}
        Executar com verificacao    Wait Until Element Is Visible    Botão de fechar não visível    css=button.close    2s
        Executar com verificacao    Click Button    Falha ao clicar no botão de fechar    css=button.close
    END
    Executar com verificacao    Input Text    Falha ao preencher EAN    id=txtEan1    ${EAN_BF}
    Executar com verificacao    Click Element    Falha ao clicar no campo de cartão    id=ctl00_bodyHolder_lblcartao
    ${today_date}=    Get Current Date    result_format=%d/%m/%Y
    Executar com verificacao    Input Text    Falha ao preencher quantidade vendida    id=txtQtdvend1    ${QUANTIDADE}
    Executar com verificacao    Input Text    Falha ao preencher data da receita    id=txtdtReceita1    ${today_date}
    Executar com verificacao    Select From List By Value    Falha ao selecionar UF    id=ddlUF1    SP
    Executar com verificacao    Input Text    Falha ao preencher CRM    id=txtcrm1    ${CRM}
    Executar com verificacao    Click Button    Falha ao confirmar compra    id=ctl00_bodyHolder_btnConfirmarCompra
    Executar com verificacao    Wait Until Element Is Visible    Botão final não apareceu após confirmar compra    id=ctl00_bodyHolder_Button1    10s
    Executar com verificacao    Click Button    Falha ao clicar no botão final    id=ctl00_bodyHolder_Button1


Logoff
    Execute JavaScript    document.querySelector('#signOut').click();
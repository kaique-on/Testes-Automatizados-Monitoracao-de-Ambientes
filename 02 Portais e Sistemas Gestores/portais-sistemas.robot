*** Settings ***
Resource   ../logs_utils.robot
Documentation    02 Portais e Sistemas Gestores
Library    SeleniumLibrary    run_on_failure=NOTHING
Resource    resource-portais-sistemas.robot
Resource    ../geral-resource.robot
Library    DateTime
Suite Setup    Marcar Inicio
Suite Teardown    Mostrar Duracao


*** Test Cases ***
Portais e Sistemas Gestores
    Log To Shared File    Executando teste: 2 - Portais e Sistemas gestores
    Abrir Navegador
    Validar Pagina - https://funcionalhealthtech.com.br/
    Validar Pagina - https://funcionalacesso.com/Welcome.aspx
    Validar Pagina - http://www.funcionalcorp.com.br/funcionalcard/
    # Validar Pagina - https://www.funcionalcorp.com.br/funcionalcard/home/
    Validar Pagina - http://dcintranet/ATC/Chamados/Login.aspx
    # Validar Paginas FuncionalMais
    Close Browser
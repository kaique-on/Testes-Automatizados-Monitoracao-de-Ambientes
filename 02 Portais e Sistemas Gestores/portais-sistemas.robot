*** Settings ***
Resource    ../logs_utils.robot
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
    Open Browser    about:blank    chrome    options=${OPTIONS}
 
    Executar Keyword    Validar Pagina - https://funcionalhealthtech.com.br/    Erro ao validar página institucional
    Executar Keyword    Validar Pagina - https://funcionalacesso.com/Welcome.aspx    Erro ao validar portal Funcional Acesso
    Executar Keyword    Validar Pagina - http://www.funcionalcorp.com.br/funcionalcard/    Erro ao validar Funcional Card
    Executar Keyword    Validar Pagina - https://www.funcionalcorp.com.br/funcionalcard/home/    Erro ao validar portal Funcional Card Home
    Executar Keyword    Validar Pagina - http://dcintranet/ATC/Chamados/Login.aspx    Erro ao validar DC Intranet
 
Paginas FuncionalMais
    Validar Paginas FuncionalMais
    Close Browser
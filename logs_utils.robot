*** Settings ***
Library         OperatingSystem
Library         String
# Adicione Collections se você usar Split String ou Get From List

*** Keywords ***
Get Log File Path  # Mantendo a estrutura para a sua Log To Shared File funcionar
    [Documentation]    Cria um nome de arquivo de log seguro baseado no nome da suite.
    
    ${base_name}=    Set Variable    ${SUITE NAME}
    
    # 1. Substitui todos os espaços por sublinhados.
    ${safe_name}=    Replace String    ${base_name}    ${SPACE}    _
    
    # 2. CRÍTICO: Usa Regexp para remover TODOS os caracteres que NÃO são
    # letras (a-z, A-Z), números (0-9) ou sublinhados (_).
    # Isso resolve o problema de caracteres como '-', ':', '.', '/', etc.
    ${safe_name}=     Replace String Using Regexp    ${safe_name}    [^a-zA-Z0-9_]    ${EMPTY}
    
    # 3. (Opcional) Reduz múltiplos sublinhados para um só.
    ${safe_name}=     Replace String Using Regexp    ${safe_name}    _+    _
    
    # O arquivo será salvo dentro do diretório 'results/logs_separados'
    ${log_path}=    Set Variable    results/logs_separados/${safe_name}.log
    
    RETURN    ${log_path}

Log To Shared File
    [Arguments]    ${message}
    ${log_file}=    Get Log File Path

    Log To Console    ${message}
    
    # Adiciona um timestamp para rastreabilidade (Boa Prática)
    ${timestamp}=    Get Time    custom: %H:%M:%S
    ${full_message}=    Catenate    SEPARATOR=    ${message}
    
    Append To File    ${log_file}    ${full_message}\n
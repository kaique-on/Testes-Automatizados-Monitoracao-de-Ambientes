*** Settings ***
Library         OperatingSystem
Library         String


*** Keywords ***
Get Log File Path  
    
    
    ${base_name}=    Set Variable    ${SUITE NAME}
    
    ${safe_name}=    Replace String    ${base_name}    ${SPACE}    _
    ${safe_name}=     Replace String Using Regexp    ${safe_name}    [^a-zA-Z0-9_]    ${EMPTY}
    ${safe_name}=     Replace String Using Regexp    ${safe_name}    _+    _
    ${log_path}=    Set Variable    results/logs_separados/${safe_name}.log
    
    RETURN    ${log_path}

Log To Shared File
    [Arguments]    ${message}
    ${log_file}=    Get Log File Path

    Log To Console    ${message}
    
    ${timestamp}=    Get Time    custom: %H:%M:%S
    ${full_message}=    Catenate    SEPARATOR=    ${message}
    
    Append To File    ${log_file}    ${full_message}\n



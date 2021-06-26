***Settings***

Library         SeleniumLibrary

***Keywords***

## Login

Acesso a página Login
    Go To        ${base_url}   
    
Submeto minhas credenciais
    [Arguments]         ${email}        ${password}
    
    Login With          ${email}        ${password}

Devo ver a área logada
    Wait Until Page Contains        Aluguéis            5
    Close Browser

Devo ver um toaster com a mensagem
    [Arguments]         ${expect_message}

    Wait Until Element Contains     ${TOASTER_ERROR_P}         ${expect_message}

# Customers

Dado que acesso o formulário de cadastro de clientes
    Go To customers
    Wait Until Element Is Visible   ${CUSTOMERS_FORM}     5
    Click Element                   ${CUSTOMERS_FORM} 

E que eu tenho o seguinte cliente:
    [Arguments]                ${name}    ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf     ${cpf}

    Set Test Variable          ${name}
    Set Test Variable          ${cpf}
    Set Test Variable          ${address}
    Set Test Variable          ${phone_number}

Mas esse cpf já existe no sistema
    Insert Customer             ${name}     ${cpf}      ${address}      ${phone_number}

Quando faço a inclusão desse cliente
    Register New Customers      ${name}     ${cpf}      ${address}      ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCCESS}     ${expect_notice}      5

Então devo ver a notificação de erro:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_ERROR}        ${expect_notice}      5

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
    wait Until Element Contains        ${LABEL_NAME}            Nome é obrigatório         5
    wait Until Element Contains        ${LABEL_CPF}             CPF é obrigatório          5
    wait Until Element Contains        ${LABEL_ADDRES}          Endereço é obrigatório     5
    wait Until Element Contains        ${LABEL_PHONE}           Telefone é obrigatório     5

Então devo ver o texto 
    [Arguments]         ${expect_text}

    Wait Until Page Contains        ${expect_text}

E esse cliente deve ser exibibido na lista
    ${cpf_formatado}=           Format Cpf          ${cpf}
    Go Back
    Wait Until Element Is Visible  ${CUSTOMERS_LIST}       5
    Table Should Contain           ${CUSTOMERS_LIST}       ${cpf_formatado}

## Remover Customer

Dado que tenho um cliente indesejado:
    [Arguments]         ${name}     ${cpf}      ${address}      ${phone_number}
    Remove Customer By Cpf          ${cpf}
    Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}

    Set Test Variable   ${cpf}

E acesso a lista de clientes
    Go To customers

Quando eu removo esse cliente
#   Format Cpf é a KW que representa o método no arquivo db.py
    ${cpf_formatado}=       Format Cpf      ${cpf}
    Set Test Variable       ${cpf_formatado}

    Go To Customer Details  ${cpf_formatado}
    Click Remove Customer

E esse cliente não deve aparecer na lista
    Wait Until Page Does Not Contain       ${cpf_formatado}
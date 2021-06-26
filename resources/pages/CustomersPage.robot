***Settings***
Documentation       Representação a página clientes com seus elementos e ações

***Variables***
${CUSTOMERS_FORM}       css:a[href$=register]
${LABEL_NAME}           css:label[for=name]
${LABEL_CPF}            css:label[for=cpf]
${LABEL_ADDRES}         css:label[for=address]
${LABEL_PHONE}          css:label[for=phone_number]
${CUSTOMERS_LIST}       css:table

***Keywords***
Register New Customers
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Input Text      id:name             ${name}
    Input Text      id:cpf              ${cpf}
    Input Text      id:address          ${address}
    Input Text      id:phone_number     ${phone_number}

    Click Element   xpath://button[text()='CADASTRAR']

Go To Customer Details
    [Arguments]     ${cpf_formatado}

    Wait Until Element Is Visible       xpath://td[text()='${cpf_formatado}']     5
    Click Element                       xpath://td[text()='${cpf_formatado}']

Click Remove Customer
    ${element}=         Set Variable    xpath://button[text()='APAGAR']

    wait Until Element Is Visible       ${element}        5
    Click Element                       ${element}
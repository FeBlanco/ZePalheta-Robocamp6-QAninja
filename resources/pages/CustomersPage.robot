***Settings***
Documentation       Representação a página clientes com seus elementos e ações

***Variables***
${CUSTOMERS_FORM}       css:a[href$=register]

***Keywords***
Register New Customers
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Input Text      id:name             ${name}
    Input Text      id:cpf              ${cpf}
    Input Text      id:address          ${address}
    Input Text      id:phone_number     ${phone_number}

    Click Element   xpath://button[text()='CADASTRAR']
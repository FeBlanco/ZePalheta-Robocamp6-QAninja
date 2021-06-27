***Settings***
Documentation       Camada de serviços do projeto de automação

Library             RequestsLibrary

***Variables***
${base_api_url}     http://zepalheta-api:3333

*** Keywords ***
## Helpers Token

Get Session Token
    ${resp}=        Post Session  admin@zepalheta.com.br        pwd123

    ${token}        Convert To String   Bearer ${resp.json()['token']}

    [return]        ${token}

## POST/sessions
Post Session    
    [Arguments]          ${email}        ${password}
     Create Session      zp-api          ${base_api_url}

    &{headers}=         Create Dictionary        Content-Type=application/json
    &{payload}=         Create Dictionary        email=${email}    password=${password}

    ${resp}=            Post Request            zp-api      /sessions       data=${payload}     headers=${headers}

    [return]            ${resp}

## POST/customers
Post Customer
    [Arguments]       ${payload}

    Create Session      zp-api      ${base_api_url}

    ${token}            Get Session Token  
    &{headers}=         Create Dictionary     Content-Type=application/json     Authorization=${token}

    ${resp}             Post Request          zp-api        /customers      data=${payload}     headers=${headers}

    [return]            ${resp}

## DELETE/ customers
Delete Customers
    [Arguments]     ${cpf}

    ${token}=           Get Session Token  
    &{headers}=         Create Dictionary     Content-Type=application/json     Authorization=${token}

    Delete Request      zp-api                /customers/${cpf}                  headers=${headers}
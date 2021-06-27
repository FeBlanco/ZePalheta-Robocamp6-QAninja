*** Settings ***                                                                                       

Resource        ../../resources/services.robot

***Test Cases***
New Customer
    
    &{payload}=         Create Dictionary     name=Fernando Papito    cpf=000.000.141-41    address=Rua 8   phone_number=11999999999 

    Delete Customers    ${payload['cpf']}
    ${resp}=            Post Customer         ${payload}

    Status Should Be    200                   ${resp}

Name is required

    &{payload}=         Create Dictionary     cpf=000.000.141-41    address=Rua 8   phone_number=11999999999
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "name" is required

Cpf is required

    &{payload}=         Create Dictionary     name=Felipe    address=Rua 8   phone_number=11999999999
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "cpf" is required

Address is required

    &{payload}=         Create Dictionary     name=Felipe       cpf=000.000.141-41   phone_number=11999999999
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "address" is required

Phone Number is required
    
    &{payload}=         Create Dictionary     name=Felipe       cpf=000.000.141-41    address=Rua 8
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "phone_number" is required


##  robot -d ./logs tests\api\customers.robot
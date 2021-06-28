*** Settings ***                                                                                       

Resource        ../../../resources/services.robot
Library         OperatingSystem

***Test Cases***
New Customer
                        
    ${payload}          Get Json              customers/Fernando.json

    Delete Customer     ${payload['cpf']}
    ${resp}=            Post Customer         ${payload}

    Status Should Be    200                   ${resp}

Name is required

    ${payload}          Get Json              customers/no_name.json
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "name" is required

Cpf is required

    ${payload}          Get Json              customers/no_cpf.json
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "cpf" is required

Address is required

    ${payload}          Get Json              customers/no_address.json
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "address" is required

Phone Number is required
    
    ${payload}          Get Json              customers/no_phone_number.json
    ${resp}=            Post Customer         ${payload}

    Status Should Be     400         ${resp}
    Should Be Equal      ${resp.json()['message']}        "phone_number" is required


##  robot -d ./logs tests\api\customers.robot
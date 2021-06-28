*** Settings ***                                                                                       

Resource        ../../../resources/services.robot

***Test Cases***
Delete Customer

    ${origin}=          Get Json        customers/kaido.json
    

    Delete Customer    ${origin['cpf']}
    ${resp}=            Post Customer           ${origin}

    ${resp}=            Delete Customer         ${origin['cpf']}

    Status Should Be    204                     ${resp}

Delete Not Found

    ${resp}            Delete Customer                      698dc19d489c4e4db73e28a713eab07b

    Status Should Be    404                                 ${resp}
    Should Be Equal     ${resp.json()['message']}           Customer not found

    ## robot -d ./logs tests\api\customers\delete_customers.robot
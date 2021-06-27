***Settings***
Documentation           Cadastro de Clientes

Resource        ../../resources/base.robot

Test Setup      Login Sesions
Test Teardown   Finish Session


***Test Cases***
Novo cliente
    [tags]      smoke
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         Bon Jovi        00000001406     Rua dos Bugs, 1000      11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:      Cliente cadastrado com sucesso!
    E esse cliente deve ser exibibido na lista

Cliente duplicado
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...        Will Smith        00000001407     Rua dos Bugs, 2000      11999999991
    Mas esse cpf já existe no sistema   
    Quando faço a inclusão desse cliente    
    Então devo ver a notificação de erro:       Este CPF já existe no sistema!

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...       ${EMPTY}        ${EMPTY}        ${EMPTY}        ${EMPTY}
    Quando faço a inclusão desse cliente
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    ${EMPTY}        45380725082     Rua dos Bugs, 1000      11999999999     Nome é obrigatório

Cpf Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    Aldo        ${EMPTY}        Rua dos Bugs, 000       11999999999     CPF é obrigatório 

Endereço é Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    Felipe      45380825082     ${EMPTY}        11999999999     Endereço é obrigatório

Telefone é Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    Felipe      45380725082     Rua dos Bugs, 1000      ${EMPTY}        Telefone é obrigatório

Telefone incorreto
    [Template]     Validação de Campos
    Totti       45380726487     Rua dos Bugs, 1020      1199999999      Telefone inválido

***Keywords***
Validação de Campos
    [Arguments]     ${nome}         ${cpf}          ${endereco}      ${telefone}        ${saida}

    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         ${nome}         ${cpf}          ${endereco}      ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto          ${saida}


    # robot -d ./logs tests\cadastro_clientes.robot
    # robot -d .\logs\ -i dup tests\
    # robot -d .\logs\ -i required tests\
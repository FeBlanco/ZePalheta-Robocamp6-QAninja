***Settings***
Documentation           Cadastro de Clientes

Resource        ../resources/base.robot

Suite Setup      Login Sesions

Suite Teardown   Finish Session


***Test Cases***
Novo cliente
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...             Bon Jovi        00000001406     Rua dos Bugs, 1000      11999999999
    Então devo ver a notificação:      Cliente cadastrado com sucesso!

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...             ${EMPTY}        ${EMPTY}        ${EMPTY}        ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    ${EMPTY}        45380725082     Rua dos Bugs, 1000    11999999999       Nome é obrigatório

Cpf Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    Felipe          ${EMPTY}        Rua dos Bugs, 1000     11999999999       CPF é obrigatório 

Endereço é Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    Felipe          45380725082     ${EMPTY}               11999999999       Endereço é obrigatório

Telefone é Obrigatório
    [tags]       required
    [Template]      Validação de Campos
    Felipe          45380725082      Rua dos Bugs, 1000    ${EMPTY}          Telefone é obrigatório

Telefone incorreto
    [Template]     Validação de Campos
    Totti          45380726482      Rua dos Bugs, 1020    1199999999          Telefone inválido

***Keywords***
Validação de Campos
    [Arguments]     ${nome}         ${cpf}          ${endereco}      ${telefone}        ${saida}

    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...             ${nome}         ${cpf}          ${endereco}      ${telefone}
    Então devo ver o texto          ${saida}


    # robot -d ./logs tests\cadastro_clientes.robot
    # robot -d .\logs\ -i temp tests\
    # robot -d .\logs\ -i required tests\
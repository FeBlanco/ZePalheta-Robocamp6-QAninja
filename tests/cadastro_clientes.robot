***Settings***
Documentation           Cadastro de Clientes

Resource        ../resources/base.robot

Test Setup      Login Sesions

Test Teardown   Finish Session


***Test Cases***
Novo cliente
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...             Bon Jovi        00000001406     Rua dos Bugs, 1000      11999999999
    Então devo ver a notificação:      Cliente cadastrado com sucesso!

Campos Obrigatórios
    [tags]      temp
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...             ${EMPTY}        ${EMPTY}        ${EMPTY}                ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

    # robot -d ./logs tests\cadastro_clientes.robot
    # robot -d .\logs\ -i temp tests\
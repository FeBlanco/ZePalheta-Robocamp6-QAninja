***Settings***
Documentation           Exclusão de Clientes

Resource        ../../resources/base.robot

Suite Setup      Login Sesions
Suite Teardown   Finish Session

***Test Cases***
Remover Cliente
    Dado que tenho um cliente indesejado:
    ...     Tio Phill       37641258852      Rua dos Bugs, 2000     11999999991
    E acesso a lista de clientes
    Quando eu removo esse cliente
    Então devo ver a notificação:  Cliente removido com sucesso!
    E esse cliente não deve aparecer na lista


    # robot -d .\logs\ tests\exclusao_clientes.robotS
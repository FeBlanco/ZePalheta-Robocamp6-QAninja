***Settings***
Documentation       Login Tentativa

Resource        ../../resources/base.robot

#Executa uma ou mais Keywords somente uma vez antes de todos os casos de testes
Suite Setup      Start Sesion
#Executa uma ou mais Keywords uma única vez apos finalizar todos os casos de testes
Suite Teardown   Finish Session

Test Template   Tentativa de Login

***Keywords***
Tentativa de Login
    [Arguments]         ${input_email}      ${input_senha}      ${output_mensagem}

    Acesso a página Login
    Submeto minhas credenciais              ${input_email}      ${input_senha}
    Devo ver um toaster com a mensagem      ${output_mensagem}

***Test Cases***
Senha Incorreta             admin@zepalheta.com.br   abc123      Ocorreu um erro ao fazer login, cheque as credenciais.

Senha em Branco             admin@zepalheta.com.br  ${EMPTY}     O campo senha é obrigatório!

Email em Branco             ${EMPTY}                pwd123       O campo email é obrigatório!

Email e senha em Branco     ${EMPTY}                ${EMPTY}     Os campos email e senha não foram preenchidos!

Login incorreto             admin&gmail.com         abc123       Ocorreu um erro ao fazer login, cheque as credenciais.

# robot -d ./logs tests\login_tentativa.robot












#Comportamento (Dado, Quando e Então)
#BDD só é BDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

#ATDD (Desenvolvimento guiado por teste de aceitação)
#ATDD só é ATDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

# robot tests\login.robot
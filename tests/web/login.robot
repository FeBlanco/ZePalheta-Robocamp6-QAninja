***Settings***
Documentation       Login

Resource        ../../resources/base.robot

#Executa uma ou mais Keywords apos a execução de todos os steps de cada caso de teste
Test Setup      Start Sesion
#Executa uma ou mais Keywords apos a execução de todos os steps de cada caso de teste
Test Teardown   Finish Session

***Test Cases***
Login do Administrador
    Acesso a página Login
    Submeto minhas credenciais       admin@zepalheta.com.br      pwd123
    Devo ver a área logada
















#Comportamento (Dado, Quando e Então)
#BDD só é BDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

#ATDD (Desenvolvimento guiado por teste de aceitação)
#ATDD só é ATDD se o desenvolvedor ler a especificação e desenvolver orientado a ela

# robot tests\login.robot

# robot -d ./logs tests\
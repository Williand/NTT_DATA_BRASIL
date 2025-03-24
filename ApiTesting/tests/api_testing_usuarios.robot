*** Settings ***
Resource    ../resources/api_testing_usuarios.resource
*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServerRest
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então o usuário deve ser cadastrado corretamente
Cenário 02: Cadastrar um usuário ja existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest   email=${EMAIL_TESTE}    status_code_desejado=201
    E repetir o cadastro do usuário
    Então Verificar se a API não permitiu o cadastro repetido
Cenário 03: Consultar os dados de um novo usuário
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então posso consultar os dados do novo usuário
    E Conferir os dados retornados
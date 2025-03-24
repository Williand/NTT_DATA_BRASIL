*** Settings ***
Resource            ../resources/resources.robot
Resource            ../resources/page_objects/login.robot
Resource            ../resources/page_objects/cadastro_usuario.robot
Resource            ../resources/page_objects/home.robot
# Test Setup          Abrir navegador
# Test Teardown       Fechar navegador

*** Test Case ***
Cenário 01: Cadastrar novo usuário
    Dado que estou na pagina de login
    E clico no botão "Cadastre-se"
    E sou redirecionado para a página de cadastrado
    Quando insiro o nome
    E insiro o email na pagina de cadastrado
    E insiro a senha na pagina de cadastro
    E clico no botão "Cadastrar"
    Então deve aparecer a mensagem de "Cadastro realizado com sucesso"
    E devo ser redirecionado para a pagina home

Cenário 02: Login bem-sucedido com credenciais válidas
    login.Dado que criei um usuário novo
    E estou na pagina de login
    Quando eu insiro o email ja cadastrado
    E insiro a senha na pagina de login
    E clico no botão de login
    Então eu devo ser redirecionado para a página inicial

Cenário 03: Adicionar produto na lista de compras
    home.Dado que criei um usuário novo
    E estou na pagina home
    Quando eu clico em "Adicionar a lista" do primeiro produto da lista
    Então devo ser redirecionado a página minhaListaDeProdutos
    E o produto deve estar listado com sucesso
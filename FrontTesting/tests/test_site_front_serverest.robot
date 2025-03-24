*** Settings ***
Resource            ../resources/resources.robot
# Resource            ../resources/page_objects/login.robot
Resource            ../resources/page_objects/cadastro_usuario.robot
# Test Setup          Abrir navegador
# Test Teardown       Fechar navegador

*** Test Case ***
Cenário 01: Cadastrar novo usuário
    Dado que estou na pagina de login
    E clico no botão "Cadastre-se"
    E sou redirecionado para a página de cadastrado
    Quando insiro o nome
    E insiro o email
    E insiro a senha
    E clico no botão "Cadastrar"
    Então deve aparecer a mensagem de "Cadastro realizado com sucesso"
    E devo ser redirecionado para a pagina home

# Cenário 02: Login bem-sucedido com credenciais válidas
#     Dado que estou na página de login
#     Quando eu insiro o email ja cadastrado
#     E insiro a senha
#     E clico no botão de login
#     Então eu devo ser redirecionado para a página inicial
#     E devo ver uma mensagem "Serverest Store"

# Cenário 03: Adicionar produto na lista de compras
#     Dado que estou na página home "https://front.serverest.dev/home"
#     Quando eu clico em "Adicionar a lista" do primeiro produto da lista
#     Então devo ser redirecionado a página "https://front.serverest.dev/minhaListaDeProdutos"
#     E o produto deve estar listado com sucesso
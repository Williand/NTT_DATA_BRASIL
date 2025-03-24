*** Settings ***
Resource    ../resources.robot
Resource    ../locators/login_page_locators.robot
Resource    ../locators/cadastro_usuario_page_locators.robot
Resource    ../locators/minha_lista_de_produtos_page_locators.robot
Resource    cadastro_usuario.robot
Resource    login.robot
Library     SeleniumLibrary

*** Variables ***
${BROWSER}            chrome

*** Keywords ***
Dado que criei um usuário novo
    Cadastro usuário
E estou na pagina home
    Quando eu insiro o email ja cadastrado
    E insiro a senha na pagina de login
    E clico no botão de login
    Wait Until Location Contains    /home    10s
Quando eu clico em "Adicionar a lista" do primeiro produto da lista
    Wait Until Element Is Visible    ${PRIMEIRO_PRODUTO_NOME}   
    ${PRODUTO}    Get Text    ${PRIMEIRO_PRODUTO_NOME}
    Set Test Variable    ${PRODUTO}
    Click Button    ${BTN_PRIMEIRO_ITEM}
Então devo ser redirecionado a página minhaListaDeProdutos
    Wait Until Location Contains    /minhaListaDeProdutos
E o produto deve estar listado com sucesso
    ${PRODUTO_LISTADO}    Get Text    ${PRODUTO_NO_CARRINHO}
    Should Be Equal    Produto:${PRODUTO}    ${PRODUTO_LISTADO}
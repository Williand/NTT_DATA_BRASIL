*** Settings ***
Resource    ../resources.robot
Resource    ../locators/login_page_locators.robot
Resource    ../locators/cadastro_usuario_page_locators.robot
Library  SeleniumLibrary

*** Variables ***
${BROWSER}            chrome

*** Keywords ***
Dado que estou na pagina de login
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_EMAIL}    timeout=5s
E clico no botão "Cadastre-se"
    Click Element    ${BTN_CADASTRE_SE}
E sou redirecionado para a página de cadastrado
    Wait Until Location Contains    /cadastrarusuarios    5s
Quando insiro o nome
    Input Text    ${INPUT_NOME}    João Silva
E insiro o email
    Gerar email
    Input Text    ${INPUT_EMAIL}    ${EMAIL_TESTE}
E insiro a senha
    Gerar senha
    Input Text    ${INPUT_SENHA}    ${SENHA_TESTE}
E clico no botão "Cadastrar"
    Click Button    ${BTN_CADASTRAR}
Então deve aparecer a mensagem de "Cadastro realizado com sucesso"
    Wait Until Element Is Visible    ${MSG_SUCESSO}    5s
    Element Text Should Be    ${MSG_SUCESSO}    Cadastro realizado com sucesso
E devo ser redirecionado para a pagina home
    Wait Until Location Contains    /home
    Close Browser

    
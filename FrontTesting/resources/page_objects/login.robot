*** Settings ***
Resource    ../resources.robot
Resource    ../locators/login_page_locators.robot
Resource    ../locators/cadastro_usuario_page_locators.robot
Resource    cadastro_usuario.robot
Library  SeleniumLibrary

*** Variables ***
${BROWSER}            chrome

*** Keywords ***
Dado que criei um usuário novo
    Cadastro usuário
E estou na pagina de login
    Wait Until Location Contains    /login
Quando eu insiro o email ja cadastrado
    Input Text    ${INPUT_LOGIN_EMAIL}    ${EMAIL_TESTE}
E insiro a senha na pagina de login
    Input Text    ${INPUT_LOGIN_SENHA}    ${SENHA_TESTE}
E clico no botão de login
    Click Button    ${BTN_ENTRAR}
Então eu devo ser redirecionado para a página inicial
    Wait Until Location Contains    /home
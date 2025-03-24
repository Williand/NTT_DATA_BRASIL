*** Settings ***
Resource    ../resources.robot
Library  SeleniumLibrary


*** Variables ***
${URL}                https://front.serverest.dev/login
${BROWSER}            chrome
${BTN_CADASTRE_SE}    //*[@id="root"]/div/div/form/small/a
${INPUT_NOME}         //*[@id="nome"]
${INPUT_EMAIL}        //input[@data-testid="email"]
${INPUT_SENHA}        //*[@id="password"]
${BTN_CADASTRAR}      xpath=//button[text()='Cadastrar']
${MSG_SUCESSO}        //*[@id="root"]/div/div/form/div[1]/div/a

*** Keywords ***
Dado que estou na pagina de login
    Open Browser    ${URL}    ${BROWSER}
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

    
*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***

*** Keywords ***
Gerar email
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Log    Minha palavra aleatoria: ${palavra_aleatoria}@emailteste.com
    Set Global Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}
Gerar senha
    ${senha_aleatoria}    Generate Random String    length=4    chars=[NUMBERS]
    Log    Minha senha aleatoria: ${senha_aleatoria}
    Set Global Variable    ${SENHA_TESTE}    ${senha_aleatoria}
    Log    ${SENHA_TESTE}

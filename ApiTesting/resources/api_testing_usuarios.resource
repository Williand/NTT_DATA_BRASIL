*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Dado que eu criei um novo usuário
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Log    Minha palavra aleatoria: ${palavra_aleatoria}@emailteste.com
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}

Quando eu cadastrar o usuário na ServerRest
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionar y
    ...    nome=Willian Domingues  
    ...    email=${EMAIL_TESTE} 
    ...    password=1234
    ...    administrador=true
    Log    ${body}

    Criar Sessão na ServeRest

    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    
    Log    ${resposta.json()}
    IF    ${resposta.status_code}==201
        Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]} 
    END
    Set Test Variable    ${RESPOSTA}      ${resposta.json()}
  
Então o usuário deve ser cadastrado corretamente
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}     _id

E repetir o cadastro do usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=400

Então Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Então posso consultar os dados do novo usuário
    ${resposta_consulta}    GET On Session    alias=ServeRest    url=/usuarios/${ID_USUARIO}    expected_status=200
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}

E Conferir os dados retornados
    Log     ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome             Willian Domingues
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email            ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password         1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id              ${ID_USUARIO}

    
    
*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Library     String

*** Variables ***
${url}      https://fakerestapi.azurewebsites.net/

*** Keywords ***
Iniciar uma sessão
    Create Session    FAKEAPI    ${url}    verify=True

Dado em que cadastro o usuário na API
    ${body}    Create Dictionary
    ...    id=0
    ...    userName=MARCOS
    ...    password=SILVA
    Log    ${body}

    ${resposta}    POST On Session    alias=FAKEAPI    url=/Users    json=${body}
    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Dado em que realiza conferência do cadastro
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    userName    MARCOS
    Dictionary Should Not Contain Key    ${RESPOSTA}    _id

Consultar informações do novo usuário
    ${retorno da consulta}    GET On Session    alias=FAKEAPI    url=/Users    params=_id


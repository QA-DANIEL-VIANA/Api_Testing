*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Library     String


*** Variables ***
${url}      https://fakerestapi.azurewebsites.net/


*** Keywords ***
Iniciar uma seção
    Create Session    FAKEAPI    ${url}    verify=True

Dado em que cadastro o usuário na API
    ${body}    Create Dictionary
    ...    id=0
    ...    userName=MARCOS
    ...    password=SILVA
    log    ${body}

    dado em que é criada a seção na API

    ${resposta}    POST On Session    alias=FAKEAPI    url=/Users    json=${body}

    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

dado em que é criada a seção na API
    ${headers}    Create Dictionary    accept=*/*    Content-Type=application/json
    Create Session    alias=FAKEAPI    url=https://fakerestapi.azurewebsites.net/api/v1    headers= ${headers}

Dado em que realiza conferencia do cadastro
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    userName    MARCOS
    Dictionary Should Not Contain Key    ${RESPOSTA}    _id

Consultar informações do novo usuario
    ${retorno da consulta}    GET On Session    alias=FAKEAPI    url=/Users    params=_id

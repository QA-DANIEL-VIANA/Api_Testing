*** Settings ***
Documentation     Testes na APIFAKE
Resource    ../Resource/Fakeapi.resource

*** Test Cases ***
CT01 - Cadastro de Usuário na APIFAKE
    [Tags]    cad_usuário
    Iniciar uma seção
    Dado em que cadastro o usuário na API
    dado em que é criada a seção na API
    Dado em que realiza conferencia do cadastro
    Consultar informações do novo usuario
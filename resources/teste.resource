*** Settings ***
Resource    ../resources/variables.resource
Library     SeleniumLibrary

*** Keywords ***
Abrir o navegador
    Open Browser    about:blank    chrome
    Maximize Browser Window

Fechar o navegador
    Close All Browsers      

Passo 1 - Acessar a página inicial e validar colunas
    Go To    ${urlBase}
    # Espera flexível para as colunas principais
    Wait Until Page Contains Element    xpath=//*[contains(., "To Do")]           15s
    Wait Until Page Contains Element    xpath=//*[contains(., "In Progress")]     15s
    Wait Until Page Contains Element    xpath=//*[contains(., "Done")]            15s

Passo 2 - Clicar em "adicionar tarefa" no To Do
    Wait Until Element Is Visible    xpath=//*[contains(@id,"To DoCreateTask")]    15s
    Wait Until Element Is Enabled    xpath=//*[contains(@id,"To DoCreateTask")]    15s
    Click Element                    xpath=//*[contains(@id,"To DoCreateTask")]

Passo 3 - Adicionar tarefa no backlog
    Wait Until Element Is Visible    xpath=//*[contains(@id,"To DoCreateTask")]/div/form/input    15s
    Wait Until Element Is Enabled    xpath=//*[contains(@id,"To DoCreateTask")]/div/form/input    15s
    Input Text                       xpath=//*[contains(@id,"To DoCreateTask")]/div/form/input    Teste automatizado

Passo 4 - Clicar no botão enviar
    Wait Until Element Is Visible    xpath=//*[contains(@id,"To DoCreateTask")]/div/form/div/button    15s
    Wait Until Element Is Enabled    xpath=//*[contains(@id,"To DoCreateTask")]/div/form/div/button    15s
    Click Button                     xpath=//*[contains(@id,"To DoCreateTask")]/div/form/div/button
    Sleep    2s

Passo 5 - Mover tarefa para Done
    Wait Until Element Is Visible    xpath=//*[contains(text(),"Teste automatizado")]    15s
    Wait Until Element Is Enabled    xpath=//*[contains(text(),"Teste automatizado")]    15s

    # Espera a coluna In Progress estar visível
    Wait Until Element Is Visible    xpath=//*[contains(., "In Progress")]    15s

    # Executa drag and drop
    Drag And Drop    xpath=//*[contains(text(),"Teste automatizado")]    xpath=//*[contains(., "In Progress")]
    Sleep    5s
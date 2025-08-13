*** Settings ***
Resource    ../resources/teste.resource
Test Setup      Abrir o navegador
Library         SeleniumLibrary


*** Test Cases ***
Deve carregar a página inicial com colunas principais e adicionar tarefa
    [Documentation]    Testa se a página inicial carrega com as colunas principais e adiciona uma tarefa no To Do
    Passo 1 - Acessar a página inicial e validar colunas
    Passo 2 - Clicar em "adicionar tarefa" no To Do
    Passo 3 - Adicionar tarefa no backlog
    Passo 4 - Clicar no botão enviar
    Passo 5 - Mover tarefa para In Progress
    
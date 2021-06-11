*** Settings ***
Library   SeleniumLibrary

*** Variable ***
${URL}    http://automationpractice.com/
${BROWSER}    chrome

*** Test Case ***
Cenário de Teste 01: Pesquisar produto existente
  Dado que estou na pasta home do site
  Quando eu pesquisar pelo produto "Blouse"
  Então o produto "Blouse" deve ser listado na página de resultado da busca
  
Caso de Teste 02: Pesquisar produto não existente
  Dado que estou na pasta home do site
  Quando eu pesquisar pelo produto "itemNãoExistente"
  Então a página deve exibir a mensagem de erro "No results were found for your search "itemNãoExistente""

*** Keywords ***

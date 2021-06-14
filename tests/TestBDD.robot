*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

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
Dado que estou na pasta home do site
  Acessar a página inicial do site

Quando eu pesquisar pelo produto "${PRODUCT}"
  Digitar o nome do produto "${PRODUCT}" no campo de pesquisa
  Clicar no botão pesquisar

Então o produto "${PRODUCT}" deve ser listado na página de resultado da busca
  Conferir se o produto "${PRODUCT}" foi listado no site

Então a página deve exibir a mensagem de erro "${ERROR}"
  Conferir mensagem de erro "${ERROR}"





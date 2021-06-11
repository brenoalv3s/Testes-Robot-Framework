*** Settings ***
Library   SeleniumLibrary

*** Variable ***
${URL}        http://automationpractice.com/
${BROWSER}    chrome

*** Keywords ***
#### Setup e Teardown
Abrir o navegador
  Open Browser    about:blank    ${BROWSER}

Fechar o navegador
  Close Browser

#### Passo-a-Passo
Acessar a página inicial do site
  Go To     ${URL}
  Title Should Be   My Store

Digitar o nome do produto "${PRODUCT}" no campo de pesquisa
  Input Text    id=search_query_top    ${PRODUCT}

Clicar no botão pesquisar
  Click Button    name=submit_search

Conferir se o produto "${PRODUCT}" foi listado no site
  Wait Until Element Is Visible     class=page-heading
  Title Should Be     Search - My Store
  Page Should Contain Image     xpath=//*[@src="${URL}img/p/7/7-home_default.jpg"]
  Page Should Contain Link      xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUCT}")]

Conferir mensagem de erro "${ERROR}"
  Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]
  Element Text Should Be           xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]     ${ERROR}
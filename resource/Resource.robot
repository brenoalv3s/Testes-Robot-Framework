*** Settings ***
Library   SeleniumLibrary

*** Variable ***
${URL}        http://automationpractice.com/
${BROWSER}    firefox
${FIRSTNAME}  Breno
${LASTNAME}   Alves      

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

Passar o mouse por cima da categoria "${CATEGORIES}" no menu principal superior de categorias
  Mouse Over      xpath=//*[@id="block_top_menu"]/ul/li[1]/a[@class="sf-with-ul"]

Clicar na sub categoria "${SUB_CATEGORY}"
  Wait Until Element Contains   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a   ${SUB_CATEGORY}
  Click Link    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar no botão "${ADD_CART}" do produto
  Mouse Down    xpath=//*[@id="center_column"]//div[@class="product-container"]
  Click Link    xpath=//*[@id="center_column"]//a[1][@class="button ajax_add_to_cart_button btn btn-default"]

Clicar no botão "${PROCEED}"
  Wait Until Element Contains   xpath=//*[@id="layer_cart"]//a[@class="btn btn-default button button-medium"]     ${PROCEED}
  Click Link    xpath=//*[@id="layer_cart"]//a[@class="btn btn-default button button-medium"]

Clicar no botão de remoção de produtos (delete) no produto do carrinho
  Click Link    id=1_1_0_0
  
Clicar no ícone carrinho de compras no menu superior direito
  Click Link    xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

Coferir se o Carrinho está vazio
  Current Frame Should Contain    Your shopping cart is empty.    class=alert alert-warning

Clicar no botão superior direito “${LOGIN}”
  Click Link    xpath=//*[@id="header"]/div[2]//a[@class="login"]

Inserir um e-mail válido  
  Input Text     id=email_create      brenoalv3ss@test.com

Clicar em "${CREAT_ACCOUNT}" para cadastrar
  Click Button    id=SubmitCreate

Preencher os campos obrigatórios
  Wait Until Element Is Visible     id=customer_firstname
  Input Text       id=customer_firstname    ${FIRSTNAME}
  Input Text       id=customer_lastname     ${LASTNAME}
  Input Password   id=passwd                breno123
  Input Text       id=firstname             ${FIRSTNAME}
  Input Text       id=lastname              ${LASTNAME}
  Input Text       id=address1              Rua 1
  Input Text       id=city                  Recife
  Run Keyword If    '${BROWSER}'=='firefox'     Wait Until Element Is Visible    id=id_state
  Select From List By Index     id=id_state   9
  Input Text       id=postcode              00000
  Select From List By Value    id=id_country  United States
  Input Text       id=phone_mobile          00000000000

Clicar em "${REGISTER}" para finalizar o cadastro
  Click Button    id=submitAccount

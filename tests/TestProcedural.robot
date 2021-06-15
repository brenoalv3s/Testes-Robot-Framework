*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
  Acessar a página inicial do site
  Digitar o nome do produto "Blouse" no campo de pesquisa
  Clicar no botão pesquisar
  Conferir se o produto "Blouse" foi listado no site
  
Caso de Teste 02: Pesquisar produto não existente
  Acessar a página inicial do site
  Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
  Clicar no botão pesquisar
  Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
  Acessar a página inicial do site
  Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
  Clicar na sub categoria "Summer Dresses" 

Caso de Teste 04: Adicionar e Remover Produtos no Carrinho
  Acessar a página inicial do site
  Digitar o nome do produto "t-shirt" no campo de pesquisa
  Clicar no botão pesquisar
  Clicar no botão "Add to cart" do produto
  Clicar no botão "Proceed to checkout"
  Clicar no botão de remoção de produtos (delete) no produto do carrinho

Caso de Teste 05: Botão Carrinho
  Acessar a página inicial do site
  Clicar no ícone carrinho de compras no menu superior direito
  Coferir se o Carrinho está vazio
  

Caso de Teste 06: Adicionar Cliente
  Acessar a página inicial do site
  Clicar no botão superior direito “Sign in”
  Inserir um e-mail válido
  Clicar em "Create an account" para cadastrar
  Preencher os campos obrigatórios
  Clicar em "Register" para finalizar o cadastro

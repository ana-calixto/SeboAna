Descrição da API
O "Sebo da Ana" é o backend de um marketplace de livros desenvolvido como projeto final da disciplina de PDWA5 do IFSP-SPO.
O código foi escrito na linguagem Ruby utilizando o framework Rails.
Para testar:
Clonar o repositório do Github localmente.
No terminal, executar os seguintes comandos:
bundle
rails db:create
rails db:migrate
rails db:seed
rails server

No brownser, abrir http://localhost:3000
Para acessar a API /api/v1 + path da rota que deseja acessar, conforme documentação abaixo.
Já há alguns registros de usuários e transações que podem ser utilizados para teste.
Para testar as funções de administrador:
user[email]: quirino@gmail.com
user[password]: souadmin123
Banco de Dados
O Banco de Dados foi desenhado no SQlite que é o padrão do Rails. Para colocar em produção pode-se migrar facilmente para o Postgres, que já é integrado ao Rails. O Schema do BD tem as seguintes tabelas:
User - os parâmetros são "email" e "password". Há dois tipos de usuário, o usuário comum e o admin. Esse último tem permissões mais avançadas, como por exemplo gerar um relatório com todos os usuários cadastrados na plataforma, inclusive os que já foram deletados (campo: deleted_at).
Como é um modelo de marketplace, todos os usuários podem ser tanto compradores como vendedores.
Para garantir a criptografia das senhas, foi utilizado uma gem do rails chamada Bcrypt.
Para a implementação do soft delet, foi utilizada a gem "paranoid", que cria um atributo no user chamado "deleted_at", que não apaga o registro ao se utilizar o método destroy. Quando um registro é apagado, ele continua no banco mas apenas o campo deleted_at não tem mais valor nul.
Product - Os parâmetros são title, author, price, category_id, available (boolean) e está vinculado a um user_id.
Category - A categoria se refere ao gênero do livro que está sendo vendido. Apenas um administrador pode deletar uma categoria. (soft delete)
Order - O model de order se refere às transações de compra/venda feitas. Lista os produtos comprados, id de vendedor e comprador e id do produto.
Placement (tabela intermediária)

# ROTAS PARA API

* GET /users - listar usuários
* POST /users - criar usuário ( user_name: string, email: string, birthdate: date )
* DEL /users:id - deletar usuário específico
* GET /users/:id - usuário específico

* GET /wallets - todas as wallets
* GET /wallets/:id - wallet específica com seu respectivo extrato

* POST /wallets/:id/withdraw_or_deposit - nova transação (operation: deposit or withdraw, value: float)


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

#   a p i - v i r t u a l - w a l l e t 

# WISHLIST
API feita pra criação de clientes e de suas listas de desejos

**Versão ruby** : ruby '2.6.5'

**Criação do banco de dados**: rake db:create

**Inicialização do banco de dados**: rake db:migrate

**Como rodar os testes**: rspec


## Autenticação

Usado para requisitar o token de um usuário registrado, existe um seed com um usuário já criado 

```json
{
    "username": "admin",
    "password": "password"
}
```

**URL** : `/api/login/`

**Método** : `POST`

**Necessita autenticação** : Não

**Dados necessários**

```json
{
    "username": "[valid username]",
    "password": "[password in plain text]"
}
```

### Success Response

**Código** : `200 OK`

**Conteudo de exemplo**

```json
{
    "token": "93144b288eb1fdccbe46d6fc0f241a51766ecd3d"
}
```

### Resposta de erro

**Condição** : Se a autenticação falhar.

**Código** : `400 BAD REQUEST`

**Conteudo** :

```json
{
    "error": [
        "Invalid username or password"
    ]
}
```


## Criar cliente

**URL** : `/api/clients/`

**Método** : `POST`

**Necessita autenticação** : Sim

**Dados necessários**

```json
{
    "name": "[client name]",
    "email": "[client email]"
}
```

## Atualizar Cliente

**URL** : `/api/clients/{client_id}`

**Método** : `PUT`

**Necessita autenticação** : Sim

**Dados necessários**

```json
{
    "name": "[client name]",
    "email": "[client email]"
}
```

## Visualizar Cliente

**URL** : `/api/clients/{client_id}`

**Método** : `GET`

**Necessita autenticação** : Sim

## Deletar Cliente

**URL** : `/api/clients/{client_id}`

**Método** : `DELETE`

**Necessita autenticação** : Sim

## Adicionar produto a lista de desejos

**URL** : `/api/clients/{client_id}/wishlist_products/{product_id}`

**Método** : `POST`

**Necessita autenticação** : Sim

## Lista de desejos

**URL** : `/api/clients/{client_id}/wishlist`

**Método** : `GET`

**Necessita autenticação** : Sim

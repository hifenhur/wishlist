# WISHLIST
API feita pra criação de clientes e de suas listas de desejos

* Versão ruby
    ruby '2.6.5'
* Criação do banco de dados
    rake db:create
* Inicialização do banco de dados
    rake db:migrate
* Como rodar os testes
    rspec


# Login

Usado para requisitar o token de um usuário registrado

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

## Success Response

**Código** : `200 OK`

**Conteudo de exemplo**

```json
{
    "token": "93144b288eb1fdccbe46d6fc0f241a51766ecd3d"
}
```

## Resposta de erro

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


# Criar cliente

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

# Update Client

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

# Show Client

**URL** : `/api/clients/{client_id}`

**Método** : `GET`

**Necessita autenticação** : Sim

# Delete Client

**URL** : `/api/clients/{client_id}`

**Método** : `DELETE`

**Necessita autenticação** : Sim

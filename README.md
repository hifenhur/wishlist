# WISHLIST
API feita pra criação de clientes e de suas listas de desejos

* Ruby version
    ruby '2.6.5'
* Database creation
    rake db:create
* Database initialization
    rake db:migrate
* How to run the test suite
    rspec


# Login

Usado para requisitar o token de um usuário registrado

**URL** : `/api/login/`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
    "username": "[valid username]",
    "password": "[password in plain text]"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "token": "93144b288eb1fdccbe46d6fc0f241a51766ecd3d"
}
```

## Error Response

**Condition** : Se a autenticação falhar.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "error": [
        "Invalid username or password"
    ]
}
```


# Create Client

**URL** : `/api/clients/`

**Method** : `POST`

**Auth required** : YES

**Data constraints**

```json
{
    "name": "[client name]",
    "email": "[client email]"
}
```

# Update Client

**URL** : `/api/clients/{client_id}`

**Method** : `PUT`

**Auth required** : YES

**Data constraints**

```json
{
    "name": "[client name]",
    "email": "[client email]"
}
```

# Show Client

**URL** : `/api/clients/{client_id}`

**Method** : `GET`

**Auth required** : YES

# Delete Client

**URL** : `/api/clients/{client_id}`

**Method** : `DELETE`

**Auth required** : YES

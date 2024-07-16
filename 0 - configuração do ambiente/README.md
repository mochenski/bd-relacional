# Docker MySQL Container

Aqui vamos criar um container MySQL e obter informações de acesso.

Também será executado um scrip inicial par acriar uma tabela de teste no banco de dados.

## Utilizando MySQL em container docker

Temos duas formas de preparar o ambiente com container
- Docker Desktop
- Docker por linha de comando

### Utilizando Docker Desktop

Se preferir, utilize o [Docker Desktop](https://www.docker.com/products/docker-desktop/) para ter facilidade em organizar as imagens e containers.

Basta baixar a imagem do mysql e configurar as variáveis de ambiente:

- MYSQL_ROOT_PASSWORD root123
- Colocar um script de entrada: ./scripts/initdb.sql /docker-entrypoint-initdb.d/
- Expor a porta 3306

### Utilizando a linha de comando

Para construir a base de dados será necessário que o Docker esteja instalado.

Primeiro, dentro da pasta `devops/`, construa a imagem docker utilizando as configs do Dockerfile com o comando:

`docker build -t mysql-image -f Dockerfile .`

Este dockerfile configura variáveis de ambiente:

- MYSQL_ROOT_PASSWORD root123
- Colocar um script de entrada: ./scripts/initdb.sql /docker-entrypoint-initdb.d/
- Expor a porta 3306

Em seguida crie um container com o serviço do banco de dados exposto na porta 49161:

`docker run -d -p 49161:3306 --name mysqlContainer mysql-image`

Caso necessite parar o container:

`docker stop mysqlContainer`

E para reiniciar:

`docker start mysqlContainer`

## Informações de acesso

Url: localhost:49161

Usuário padrão
  - user: root
  - pass: root123

  Ou pelo usuário criado no script de inicialização `(scripts/initdb.sql)`

  - user: myuser
  - pass: myuser

## Para começar os módulos de estudo

- Crie um banco de dados
- Selecione o banco de dados criado

```
CREATE DATABASE db_study;
USE db_study;
```
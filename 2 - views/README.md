# Views

Nesta seção, abordaremos o conceito de views em bancos de dados relacionais. Views são consultas armazenadas que facilitam a visualização e manipulação de dados complexos. Vamos demonstrar como criar e utilizar views usando os exemplos das tabelas Estudantes e Cursos.

## Criação das Tabelas

Antes de começarmos com as views, vamos lembrar como criar e popular as tabelas Estudantes e Cursos.

Para facilitar, vamos colocar a flag AUTO_INCREMENT na coluna, isso torna a criação dos IDs automática e auto incremental. Caso você ja tenha as tabelas criadas pode utilizar o comando `ALTER TABLE NOMETABELA CHANGE colunaid colunaid INT AUTO_INCREMENT PRIMARY KEY;`.

Caso já tenha as tabelas criardas, pode pular a criação.

### Deletar as Tabelas existentes

```sql
DROP TABLE Estudantes;
DROP TABLE Cursos;
```

### Criação das Tabelas

```sql
CREATE TABLE Cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100)
);

CREATE TABLE Estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);
```

Caso já tenha dados inseridos, pode pular a inserção.

### Inserção de Dados

```sql
INSERT INTO Cursos (curso_id, nome_curso)
VALUES (1, 'Engenharia de Software'),
       (2, 'Ciência da Computação');

INSERT INTO Estudantes (id, nome, idade, curso_id)
VALUES (1, 'João Silva', 22, 1),
       (2, 'Maria Oliveira', 21, 2),
       (3, 'Pedro Santos', 23, 1);
```

## Criação e Utilização de Views

Uma view é uma forma de visualizar os dados resultantes de uma consulta de forma simplificada. Como se fosse apenas mais uma tabela.

### 1. CREATE VIEW
O comando `CREATE VIEW` é usado para criar uma view no banco de dados.

**Exemplo:**

```sql
CREATE VIEW EstudantesCursos AS
SELECT Estudantes.nome, Estudantes.idade, Cursos.nome_curso
FROM Estudantes
JOIN Cursos ON Estudantes.curso_id = Cursos.curso_id;
```

Aqui estamos dizendo que toda a View `EstudantesCursos` é a tabela resultante da query `SELECT Estudantes.nome ...`

### 2. Utilizando a View
Você pode utilizar a view da mesma forma que uma tabela para consultar os dados.

**Exemplo:**

```sql
SELECT * FROM EstudantesCursos;
```

```sql
+----------------+-------+--------------------------+
| nome           | idade | nome_curso               |
+----------------+-------+--------------------------+
| João Silva     |    22 | Engenharia de Software   |
| Pedro Santos   |    23 | Engenharia de Software   |
| Maria Oliveira |    21 | Ciência da Computação    |
+----------------+-------+--------------------------+
```

### 3. Filtrando Dados em uma View
Você pode aplicar filtros a uma view da mesma forma que faria em uma tabela.

**Exemplo:**

```sql
SELECT * FROM EstudantesCursos WHERE idade > 21;
```

```sql
+--------------+-------+------------------------+
| nome         | idade | nome_curso             |
+--------------+-------+------------------------+
| João Silva   |    22 | Engenharia de Software |
| Pedro Santos |    23 | Engenharia de Software |
+--------------+-------+------------------------+
```

### 4. Atualizando uma View
Algumas views são atualizáveis, dependendo da complexidade da consulta subjacente. Vamos tentar atualizar uma view simples.

IMPORTANTE: Isso afeta também a tabela original `Estudantes`.

**Exemplo:**

```sql
UPDATE EstudantesCursos
SET idade = 24
WHERE nome = 'Pedro Santos';
```

### 5. Deletando uma View
Você pode remover uma view do banco de dados usando o comando `DROP VIEW`.

**Exemplo:**

```sql
DROP VIEW EstudantesCursos;
```

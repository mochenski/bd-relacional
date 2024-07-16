Claro! Aqui está a versão ajustada do README com as correções solicitadas:

---

# Tabelas e Queries

Nesta seção, abordaremos as operações básicas de SQL, fundamentais para a manipulação e recuperação de dados em um banco de dados relacional. As operações incluem `CREATE`, `INSERT`, `SELECT`, `WHERE`, `FROM`, `ALTER`, `JOIN`, `UPDATE` e `DELETE`.

## Operações Básicas

### 1. CREATE
O comando `CREATE` é usado para criar novas tabelas no banco de dados.

**Exemplo:**

```sql
CREATE TABLE Estudantes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso VARCHAR(100)
);
```

### 2. INSERT
O comando `INSERT` é usado para adicionar novos registros em uma tabela.

**Exemplo:**

```sql
INSERT INTO Estudantes (id, nome, idade, curso)
VALUES (1, 'João Silva', 22, 'Engenharia de Software');
```

### 3. SELECT
O comando `SELECT` é usado para recuperar dados de uma tabela.

O comando `FROM` é usado para especificar a tabela de onde os dados serão recuperados.

**Exemplo:**

```sql
SELECT * FROM Estudantes;
```

### 4. WHERE
O comando `WHERE` é usado para filtrar registros com base em condições específicas.

**Exemplo:**

```sql
SELECT * FROM Estudantes WHERE idade > 20;
```

### 5. ALTER
Vamos extrair a informação de curso para outra tabela.

**Exemplo:**

```sql
CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY,
    nome_curso VARCHAR(100)
);

INSERT INTO Cursos (curso_id, nome_curso)
VALUES (1, 'Engenharia de Software');

-- Adicionar uma coluna curso_id à tabela Estudantes e definir como chave estrangeira
ALTER TABLE Estudantes
ADD curso_id INT;

-- Atualizar a tabela Estudantes para usar o curso_id da tabela Cursos
UPDATE Estudantes
SET curso_id = 1
WHERE curso = 'Engenharia de Software';

-- Remover a coluna curso da tabela Estudantes
ALTER TABLE Estudantes
DROP COLUMN curso;

-- Adicionar a restrição de chave estrangeira
ALTER TABLE Estudantes
ADD CONSTRAINT fk_curso
FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id);
```

A chave estrangeira fk_curso foi definida para relacionar a tabela Estudantes com a tabela Cursos. Dessa forma um estudante possui apenas a indicação do ID do curso, ao invés do nome completo.

Essa refatoração será revista em outros módulos deste repositório, mas por hora, é importante notar que ela evita que a tabela Estudantes replique várias vezes as informações sobre cursos.

### 6. JOIN
O comando `JOIN` é usado para combinar registros de duas ou mais tabelas com base em uma condição relacionada.

**Exemplo:**

```sql
SELECT Estudantes.nome, Cursos.nome_curso
FROM Estudantes
JOIN Cursos ON Estudantes.curso_id = Cursos.curso_id;
```

### 7. UPDATE
O comando `UPDATE` é usado para modificar registros existentes em uma tabela.

**Exemplo:**

```sql
UPDATE Estudantes
SET idade = 23
WHERE id = 1;
```

### 8. DELETE
O comando `DELETE` é usado para remover registros de uma tabela.

**Exemplo:**

```sql
DELETE FROM Estudantes
WHERE id = 1;
```

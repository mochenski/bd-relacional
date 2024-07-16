# Procedures

Nesta seção, abordaremos procedimentos armazenados (procedures) em bancos de dados relacionais. Procedures são conjuntos de instruções SQL que são armazenados no banco de dados e podem ser chamados e executados repetidamente.

## Exemplo de Tabelas

Antes de criarmos procedimentos, vamos relembrar as tabelas de Estudantes e Cursos utilizadas como exemplo:

### Tabela Estudantes

```sql
CREATE TABLE Estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);
```

### Tabela Cursos

```sql
CREATE TABLE Cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100)
);
```

## Criação e Uso de Procedures

### 1. Criação de Procedure

A seguir, vamos criar um procedimento armazenado que insere um novo estudante na tabela `Estudantes`:

```sql
DELIMITER //

CREATE PROCEDURE InserirEstudante (
    IN p_nome VARCHAR(100),
    IN p_idade INT,
    IN p_curso_id INT
)
BEGIN
    INSERT INTO Estudantes (nome, idade, curso_id)
    VALUES (p_nome, p_idade, p_curso_id);
END //

DELIMITER ;
```

### 2. Chamada do Procedure

Para chamar o procedimento `InserirEstudante` e adicionar um novo estudante:

```sql
CALL InserirEstudante('Maria Silva', 25, 2);
```

### 3. Consulta após Inserção

Após a inserção, você pode consultar a tabela `Estudantes` para verificar se o estudante foi adicionado corretamente:

```sql
SELECT * FROM Estudantes;
```

### 4. Atualização de Procedure

Aqui está um exemplo de procedimento para atualizar a idade de um estudante:

```sql
DELIMITER //

CREATE PROCEDURE AtualizarIdadeEstudante (
    IN p_id INT,
    IN p_nova_idade INT
)
BEGIN
    UPDATE Estudantes
    SET idade = p_nova_idade
    WHERE id = p_id;
END //

DELIMITER ;
```

### 5. Chamada do Procedure de Atualização

Para atualizar a idade de um estudante específico:

```sql
CALL AtualizarIdadeEstudante(1, 26);
```

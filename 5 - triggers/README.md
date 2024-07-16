# Triggers

Nesta seção, discutiremos Triggers em bancos de dados relacionais. Triggers são objetos do banco de dados que são automaticamente acionados em resposta a eventos específicos em uma tabela. Eles são úteis para aplicar ações automatizadas, como validações de dados, auditoria ou manutenção de consistência.

## Exemplo de Tabelas

Antes de criarmos Triggers, vamos relembrar as tabelas de Estudantes e Cursos utilizadas como exemplo:

### Tabela Estudantes e cursos

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

## Criação e Uso de Triggers

### 1. Criação de Trigger

A seguir, vamos criar um trigger que é acionado antes de inserir um novo estudante na tabela `Estudantes`, garantindo que a idade seja maior que 18 anos:

```sql
DELIMITER //

CREATE TRIGGER validar_idade
BEFORE INSERT ON Estudantes
FOR EACH ROW
BEGIN
    IF NEW.idade < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A idade do estudante deve ser maior ou igual a 18 anos';
    END IF;
END //

DELIMITER ;
```

### 2. Inserção de Estudante

Vamos tentar inserir um novo estudante com uma idade válida:

```sql
INSERT INTO Estudantes (nome, idade, curso_id)
VALUES ('João Silva', 20, 1);
```

### 3. Tentativa de Inserção com Idade Inválida

Tentativa de inserir um estudante com idade inválida (menor que 18):

```sql
INSERT INTO Estudantes (nome, idade, curso_id)
VALUES ('Maria Oliveira', 17, 2);
```

Ao tentar inserir Maria Oliveira com idade 17, o trigger `validar_idade` será acionado e impedirá a inserção, retornando um erro.

### 4. Exemplo de Trigger para Auditoria

Aqui está um exemplo de trigger para registrar operações de exclusão na tabela `Estudantes`:

```sql
-- Criação da Tabela Log_Exclusoes
CREATE TABLE Log_Exclusoes (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    tabela VARCHAR(100),
    registro_id INT,
    data_exclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER audit_exclusao_estudante
AFTER DELETE ON Estudantes
FOR EACH ROW
BEGIN
    INSERT INTO Log_Exclusoes (tabela, registro_id, data_exclusao)
    VALUES ('Estudantes', OLD.id, NOW());
END //

DELIMITER ;
```

Este trigger `audit_exclusao_estudante` registra a exclusão de cada estudante na tabela `Log_Exclusoes`, junto com a data da exclusão.

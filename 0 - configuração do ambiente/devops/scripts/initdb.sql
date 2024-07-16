-- SETUP CONFIGURATION

CREATE USER 'myuser'@'172.17.0.1' IDENTIFIED BY 'myuser';
GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'172.17.0.1' WITH GRANT OPTION;

-- CREATE DATABASE

CREATE DATABASE mydatabase;

-- POPULATE DATABSE

USE mydatabase;

CREATE TABLE test(
    TestID int not null AUTO_INCREMENT,
    TestString varchar(100) NOT NULL,
    PRIMARY KEY (TestID)
);

INSERT INTO test(TestString)
VALUES ("FirstTest"), ("SecondTest");


-- Verificar se a tabela existe e descartá-la se já existir
DROP TABLE IF EXISTS UsuarioBackOffice;

-- Criar a tabela UsuarioBackOffice
CREATE TABLE UsuarioBackOffice (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Senha VARCHAR(128) NOT NULL,
    Grupo VARCHAR(50),
    Status BOOLEAN,
    CPF VARCHAR(14) UNIQUE NOT NULL
);

-- Inserir um usuário Admin
INSERT INTO UsuarioBackOffice (Nome, Email, Senha, Grupo, Status, CPF)
VALUES ('admin', 'admin@admin', 'admin', 'Admin Group', TRUE, '123.456.789-00');

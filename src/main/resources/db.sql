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
VALUES ('admin', 'admin@admin', '$2a$10$JdPVJ.lNR.uwv4HPlJeAMuA8h1ZFve93cddOf8coYrnNGjKX/Ujsi', 'Admin Group', TRUE, '123.456.789-00');

-- Verificar se a tabela existe e descartá-la se já existir
DROP TABLE IF EXISTS Produtos;

-- Criação da tabela de produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    NomeProduto VARCHAR(200) NOT NULL,
    StatusProduto boolean NOT NULL,
    Avaliacao DECIMAL(2,1) CHECK (Avaliacao >= 1 AND Avaliacao <= 5),
    DescricaoDetalhada TEXT,
    PrecoProduto DECIMAL(10,2),
    QtdEstoque INT,
	ImagePATH VARCHAR(200)
);
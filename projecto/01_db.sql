USE master;
GO

-- 1) Base de Dados
IF DB_ID(N'Intergalaticos') IS NULL
BEGIN
    CREATE DATABASE Intergalaticos;
END
GO

USE Intergalaticos;
GO

-- 2) Schemas
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'Jogadores')
    EXEC('CREATE SCHEMA Jogadores');
GO
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'Equipas')
    EXEC('CREATE SCHEMA Equipas');
GO

-- 3a) Tabela Jogadores.Jogador
IF OBJECT_ID(N'Jogadores.Jogador', N'U') IS NOT NULL
    DROP TABLE Jogadores.Jogador;
GO
CREATE TABLE Jogadores.Jogador (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    NomeJogador      VARCHAR(50) NOT NULL,
    NumeroCamisola   INT NOT NULL,
    DtNascimento     DATE NULL,
    AlteracaoData    DATETIME2(2) NOT NULL CONSTRAINT DF_Jogador_AlteracaoData DEFAULT GETDATE()
);
GO

-- 3b) Tabela Equipas.Equipa
IF OBJECT_ID(N'Equipas.Equipa', N'U') IS NOT NULL
    DROP TABLE Equipas.Equipa;
GO
CREATE TABLE Equipas.Equipa (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    JogadorId INT NOT NULL,
    Equipa    VARCHAR(50) NOT NULL,
    Cidade    VARCHAR(50) NOT NULL,
    Descricao VARCHAR(50) NOT NULL,
    AlteracaoData DATETIME2(2) NOT NULL CONSTRAINT DF_Equipa_AlteracaoData DEFAULT GETDATE()
);
GO

-- FK Equipas.Equipa -> Jogadores.Jogador
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Equipa_Jogador'
)
BEGIN
    ALTER TABLE Equipas.Equipa DROP CONSTRAINT FK_Equipa_Jogador;
END
GO
ALTER TABLE Equipas.Equipa
ADD CONSTRAINT FK_Equipa_Jogador
FOREIGN KEY (JogadorId) REFERENCES Jogadores.Jogador(Id);
GO

-- 3c) Tabela Equipas.InformacoesAdicionais
IF OBJECT_ID(N'Equipas.InformacoesAdicionais', N'U') IS NOT NULL
    DROP TABLE Equipas.InformacoesAdicionais;
GO
CREATE TABLE Equipas.InformacoesAdicionais (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    JogadorId INT NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    AlteracaoData DATETIME2(2) NOT NULL CONSTRAINT DF_Info_AlteracaoData DEFAULT GETDATE()
);
GO

-- FK Equipas.InformacoesAdicionais -> Jogadores.Jogador
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Informacoes_Jogador'
)
BEGIN
    ALTER TABLE Equipas.InformacoesAdicionais DROP CONSTRAINT FK_Informacoes_Jogador;
END
GO
ALTER TABLE Equipas.InformacoesAdicionais
ADD CONSTRAINT FK_Informacoes_Jogador
FOREIGN KEY (JogadorId) REFERENCES Jogadores.Jogador(Id);
GO

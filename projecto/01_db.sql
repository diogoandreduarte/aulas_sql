USE master;
GO

-- Base de Dados
IF DB_ID(N'Intergalaticos') IS NULL
BEGIN
    CREATE DATABASE Intergalaticos;
END
GO

USE Intergalaticos;
GO

-- Schemas
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'Jogadores')
    EXEC('CREATE SCHEMA Jogadores');
GO
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'Equipas')
    EXEC('CREATE SCHEMA Equipas');
GO

--  Tabela Jogadores.Jogador
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

-- Tabela Equipas.Equipa
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

-- Tabela Equipas.InformacoesAdicionais
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



-- View vw_InformacoesJogador (em schema Equipas)
IF OBJECT_ID(N'Equipas.vw_InformacoesJogador', N'V') IS NOT NULL
    DROP VIEW Equipas.vw_InformacoesJogador;
GO
CREATE VIEW Equipas.vw_InformacoesJogador AS
SELECT
    J.Id            AS JogadorId,
    J.NomeJogador,
    J.NumeroCamisola,
    J.DtNascimento,
    E.Equipa,
    E.Cidade,
    IA.Salario
FROM Jogadores.Jogador AS J
LEFT JOIN Equipas.Equipa AS E
    ON J.Id = E.JogadorId
LEFT JOIN Equipas.InformacoesAdicionais AS IA
    ON J.Id = IA.JogadorId;
GO


-- Stored Procedure SP_inserirJogador (em schema Jogadores)
IF OBJECT_ID(N'Jogadores.SP_inserirJogador', N'P') IS NOT NULL
    DROP PROCEDURE Jogadores.SP_inserirJogador;
GO
CREATE PROCEDURE Jogadores.SP_inserirJogador
    @NomeJogador    VARCHAR(50),        -- alinhar com a tabela
    @NumeroCamisola INT,
    @DtNascimento   DATE,
    @Equipa         VARCHAR(50) = NULL, -- opcionais
    @Cidade         VARCHAR(50) = NULL,
    @Salario        DECIMAL(10,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AlteracaoData DATETIME2(3) = SYSDATETIME();
    DECLARE @NovoJogadorId INT;

    BEGIN TRY
        -- Inserir Jogador
        INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
        VALUES (@NomeJogador, @NumeroCamisola, @DtNascimento, @AlteracaoData);

        SET @NovoJogadorId = SCOPE_IDENTITY();

        -- Inserir Equipa (se vierem ambos os campos)
        IF @Equipa IS NOT NULL AND @Cidade IS NOT NULL
        BEGIN
            INSERT INTO Equipas.Equipa (JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
            VALUES (@NovoJogadorId, @Equipa, @Cidade, '', @AlteracaoData);
        END

        -- Inserir Salário (se vier)
        IF @Salario IS NOT NULL
        BEGIN
            INSERT INTO Equipas.InformacoesAdicionais (JogadorId, Salario, AlteracaoData)
            VALUES (@NovoJogadorId, @Salario, @AlteracaoData);
        END

        -- Resultado
        SELECT *
        FROM Equipas.vw_InformacoesJogador
        WHERE JogadorId = @NovoJogadorId;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER()   AS ErrorNumber,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE()    AS ErrorState,
            ERROR_LINE()     AS ErrorLine,
            ERROR_MESSAGE()  AS ErrorMessage;
    END CATCH
END;
GO

-- Jogadores.Jogador
SET IDENTITY_INSERT Jogadores.Jogador ON;
INSERT INTO Jogadores.Jogador (Id, NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
VALUES
 (1, 'Messi',   10, '1987-06-24', GETDATE())
,(2, 'Ronaldo',  7, '1985-02-05', GETDATE())
,(3, 'Pizzi',   21, '1989-10-06', GETDATE())
,(4, 'Maradona',10, '1960-10-30', GETDATE())
,(5, 'Futre',   12, '1966-02-28', GETDATE());
SET IDENTITY_INSERT Jogadores.Jogador OFF;
GO

-- Equipas.Equipa
SET IDENTITY_INSERT Equipas.Equipa ON;
INSERT INTO Equipas.Equipa (Id, JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
VALUES
 (1, 1, 'Barcelona',       'Barcelona', '',        GETDATE())
,(2, 2, 'Juventus',        'Turim',     'Capitao', GETDATE())
,(3, 3, 'Benfica',         'Lisboa',    'Capitao', GETDATE())
,(4, 4, 'Napoli',          'Napoles',   '',        GETDATE())
,(5, 5, 'Atlético Madrid', 'Madrid',    '',        GETDATE());
SET IDENTITY_INSERT Equipas.Equipa OFF;
GO

-- Equipas.InformacoesAdicionais
SET IDENTITY_INSERT Equipas.InformacoesAdicionais ON;
INSERT INTO Equipas.InformacoesAdicionais (Id, JogadorId, Salario, AlteracaoData)
VALUES
 (1, 1, 1000000, GETDATE())
,(2, 2, 2000000, GETDATE())
,(3, 3, 110000,  GETDATE())
,(4, 4, 230000,  GETDATE())
,(5, 5, 1200000, GETDATE());
SET IDENTITY_INSERT Equipas.InformacoesAdicionais OFF;
GO

-- 5) View vw_InformacoesJogador (em schema Equipas)
IF OBJECT_ID(N'Equipas.vw_InformacoesJogador', N'V') IS NOT NULL
    DROP VIEW Equipas.vw_InformacoesJogador;
GO
CREATE VIEW Equipas.vw_InformacoesJogador AS
SELECT
    J.NomeJogador,
    J.NumeroCamisola,
    J.DtNascimento,
    E.Cidade,
    E.Equipa
FROM Jogadores.Jogador AS J
FULL JOIN Equipas.Equipa AS E
    ON J.Id = E.JogadorId;
GO


-- 6) Stored Procedure SP_inserirJogador (em schema Jogadores)
IF OBJECT_ID(N'Jogadores.SP_inserirJogador', N'P') IS NOT NULL
    DROP PROCEDURE Jogadores.SP_inserirJogador;
GO
CREATE PROCEDURE Jogadores.SP_inserirJogador
    @NomeJogador VARCHAR(20),
    @NumeroCamisola INT,
    @DtNascimento DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AlteracaoData DATETIME2(3) = GETDATE();

    BEGIN TRY
        INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
        VALUES (@NomeJogador, @NumeroCamisola, @DtNascimento, @AlteracaoData);

        -- Mostrar o estado atual da tabela
        SELECT * FROM Jogadores.Jogador ORDER BY Id;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE()    AS ErrorState,
            ERROR_LINE()     AS ErrorLine,
            ERROR_MESSAGE()  AS ErrorMessage;
    END CATCH
END;
GO

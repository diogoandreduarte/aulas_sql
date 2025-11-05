USE Intergalaticos;
GO

-- Jogadores.Jogador
SET IDENTITY_INSERT Jogadores.Jogador ON;

INSERT INTO Jogadores.Jogador (Id, NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
VALUES (1, 'Messi', 10, '1987-06-24', GETDATE());

INSERT INTO Jogadores.Jogador (Id, NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
VALUES (2, 'Ronaldo', 7, '1985-02-05', GETDATE());

INSERT INTO Jogadores.Jogador (Id, NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
VALUES (3, 'Pizzi', 21, '1989-10-06', GETDATE());

INSERT INTO Jogadores.Jogador (Id, NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
VALUES (4, 'Maradona', 10, '1960-10-30', GETDATE());

INSERT INTO Jogadores.Jogador (Id, NomeJogador, NumeroCamisola, DtNascimento, AlteracaoData)
VALUES (5, 'Futre', 12, '1966-02-28', GETDATE());

SET IDENTITY_INSERT Jogadores.Jogador OFF;
GO

-- Equipas.Equipa
SET IDENTITY_INSERT Equipas.Equipa ON;

INSERT INTO Equipas.Equipa (Id, JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
VALUES (1, 1, 'Barcelona', 'Barcelona', '', GETDATE());

INSERT INTO Equipas.Equipa (Id, JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
VALUES (2, 2, 'Juventus', 'Turim', 'Capitao', GETDATE());

INSERT INTO Equipas.Equipa (Id, JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
VALUES (3, 3, 'Benfica', 'Lisboa', 'Capitao', GETDATE());

INSERT INTO Equipas.Equipa (Id, JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
VALUES (4, 4, 'Napoli', 'Napoles', '', GETDATE());

INSERT INTO Equipas.Equipa (Id, JogadorId, Equipa, Cidade, Descricao, AlteracaoData)
VALUES (5, 5, 'Atlético Madrid', 'Madrid', '', GETDATE());

SET IDENTITY_INSERT Equipas.Equipa OFF;
GO

-- Equipas.InformacoesAdicionais
SET IDENTITY_INSERT Equipas.InformacoesAdicionais ON;

INSERT INTO Equipas.InformacoesAdicionais (Id, JogadorId, Salario, AlteracaoData)
VALUES (1, 1, 1000000, GETDATE());

INSERT INTO Equipas.InformacoesAdicionais (Id, JogadorId, Salario, AlteracaoData)
VALUES (2, 2, 2000000, GETDATE());

INSERT INTO Equipas.InformacoesAdicionais (Id, JogadorId, Salario, AlteracaoData)
VALUES (3, 3, 110000, GETDATE());

INSERT INTO Equipas.InformacoesAdicionais (Id, JogadorId, Salario, AlteracaoData)
VALUES (4, 4, 230000, GETDATE());

INSERT INTO Equipas.InformacoesAdicionais (Id, JogadorId, Salario, AlteracaoData)
VALUES (5, 5, 1200000, GETDATE());

SET IDENTITY_INSERT Equipas.InformacoesAdicionais OFF;
GO

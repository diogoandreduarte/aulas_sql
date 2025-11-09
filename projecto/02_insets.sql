USE Intergalaticos;
GO

-- Jogadores.Jogador
SET IDENTITY_INSERT Jogadores.Jogador ON;

INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento)
VALUES ('Messi', 10, '1987-06-24');

INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento)
VALUES ('Ronaldo', 7, '1985-02-05');

INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento)
VALUES ('Pizzi', 21, '1989-10-06');

INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento)
VALUES ('Maradona', 10, '1960-10-30');

INSERT INTO Jogadores.Jogador (NomeJogador, NumeroCamisola, DtNascimento)
VALUES ('Futre', 12, '1966-02-28');

SET IDENTITY_INSERT Jogadores.Jogador OFF;
GO

-- Equipas.Equipa
SET IDENTITY_INSERT Equipas.Equipa ON;

INSERT INTO Equipas.Equipa (JogadorId, Equipa, Cidade, Descricao)
VALUES (1, 'Barcelona', 'Barcelona', '');

INSERT INTO Equipas.Equipa (JogadorId, Equipa, Cidade, Descricao)
VALUES (2, 'Juventus', 'Turim', 'Capitao');

INSERT INTO Equipas.Equipa (JogadorId, Equipa, Cidade, Descricao)
VALUES (3, 'Benfica', 'Lisboa', 'Capitao');

INSERT INTO Equipas.Equipa (JogadorId, Equipa, Cidade, Descricao)
VALUES (4, 'Napoli', 'Napoles', '');

INSERT INTO Equipas.Equipa (JogadorId, Equipa, Cidade, Descricao)
VALUES (5, 'Atlético Madrid', 'Madrid', '');
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

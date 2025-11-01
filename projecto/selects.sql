
/* =========================================================
   Consultas e testes para a BD Intergalaticos
   ========================================================= */

USE Intergalaticos;
GO

-- 1) Ver todos os jogadores
SELECT * FROM Jogadores.Jogador;
GO

-- 2) Ver todas as equipas
SELECT * FROM Equipas.Equipa;
GO

-- 3) Ver informações adicionais (salários)
SELECT * FROM Equipas.InformacoesAdicionais;
GO

-- 4) Ver relação entre jogadores e equipas (via VIEW)
SELECT * FROM Equipas.vw_InformacoesJogador;
GO

-- 5) Consultar jogadores com número de camisola = 10
SELECT * FROM Equipas.vw_InformacoesJogador WHERE NumeroCamisola = 10;
GO

-- 6) Consultar jogadores e seus salários (JOIN direto)
SELECT J.NomeJogador, E.Equipa, IA.Salario
FROM Jogadores.Jogador AS J
INNER JOIN Equipas.Equipa AS E ON J.Id = E.JogadorId
INNER JOIN Equipas.InformacoesAdicionais AS IA ON J.Id = IA.JogadorId;
GO

-- 7) Testar a Stored Procedure com um novo jogador
EXEC Jogadores.SP_inserirJogador
    @NomeJogador = 'Neymar',
    @NumeroCamisola = 11,
    @DtNascimento = '1992-02-05';
GO

-- 8) Confirmar inserção
SELECT * FROM Jogadores.Jogador ORDER BY Id DESC;
GO

-- 9) Verificar o jogador recém-inserido na view (JOIN completo)
SELECT * FROM Equipas.vw_InformacoesJogador WHERE NomeJogador = 'Neymar';
GO

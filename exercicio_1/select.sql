/* ==========================================
   PRINT DE TODAS AS TABELAS
   ========================================== */

USE EscolaDB;
GO

-- ======================
-- 1. ESCOLAS
-- ======================
PRINT '===== ESCOLAS =====';
SELECT * FROM Escola.Escola ORDER BY ID;

-- ======================
-- 2. TURMAS
-- ======================
PRINT '===== TURMAS =====';
SELECT
  T.ID,
  E.Nome AS Escola,
  T.AnoLetivo,
  T.AnoEscolar,
  T.CodigoTurma,
  T.LastModifiedUser,
  T.LastModifiedDate
FROM Escola.Turma T
JOIN Escola.Escola E ON E.ID = T.EscolaID
ORDER BY E.Nome, T.CodigoTurma;

-- ======================
-- 3. DISCIPLINAS
-- ======================
PRINT '===== DISCIPLINAS =====';
SELECT * FROM Disciplinas.Disciplina ORDER BY ID;

-- ======================
-- 4. ALUNOS (os 20 primeiros)
-- ======================
PRINT '===== PRIMEIROS 20 ALUNOS =====';
SELECT TOP 20
  A.ID,
  A.Pnome,
  A.Unome,
  A.DtNasc,
  A.Sexo,
  A.LastModifiedUser,
  A.LastModifiedDate
FROM Alunos.Aluno A
ORDER BY A.ID;

-- ======================
-- 5. MATRÍCULAS (liga Aluno ↔ Turma)
-- ======================
PRINT '===== MATRÍCULAS =====';
SELECT TOP 20
  M.ID,
  A.Pnome + ' ' + A.Unome AS Aluno,
  T.CodigoTurma,
  E.Nome AS Escola,
  M.DataMatricula,
  M.Estado,
  M.LastModifiedUser
FROM Alunos.Matricula M
JOIN Alunos.Aluno A ON A.ID = M.AlunoID
JOIN Escola.Turma T ON T.ID = M.TurmaID
JOIN Escola.Escola E ON E.ID = T.EscolaID
ORDER BY M.ID;

-- ======================
-- 6. NOTAS (as primeiras 20)
-- ======================
PRINT '===== PRIMEIRAS 20 NOTAS =====';
SELECT TOP 20
  N.ID,
  A.Pnome + ' ' + A.Unome AS Aluno,
  T.CodigoTurma,
  D.Sigla AS Disciplina,
  N.Periodo,
  N.Nota,
  N.LastModifiedUser
FROM Avaliacao.Nota N
JOIN Alunos.Matricula M ON M.ID = N.MatriculaID
JOIN Alunos.Aluno A ON A.ID = M.AlunoID
JOIN Escola.Turma T ON T.ID = M.TurmaID
JOIN Disciplinas.Disciplina D ON D.ID = N.DisciplinaID
ORDER BY N.ID;

-- ======================
-- 7. MÉDIAS POR ALUNO E DISCIPLINA
-- ======================
PRINT '===== MÉDIAS POR ALUNO E DISCIPLINA =====';
SELECT TOP 10
   A.Pnome + ' ' + A.Unome AS Aluno,
   T.CodigoTurma,
   D.Nome AS Disciplina,
   ROUND(AVG(N.Nota), 1) AS Media
FROM Avaliacao.Nota N
JOIN Alunos.Matricula M ON M.ID = N.MatriculaID
JOIN Alunos.Aluno A ON A.ID = M.AlunoID
JOIN Escola.Turma T ON T.ID = M.TurmaID
JOIN Disciplinas.Disciplina D ON D.ID = N.DisciplinaID
GROUP BY A.Pnome, A.Unome, T.CodigoTurma, D.Nome
ORDER BY Aluno, Disciplina;

-- ======================
-- 8. TOP 5 ALUNOS (MÉDIA GLOBAL)
-- ======================
PRINT '===== TOP 5 ALUNOS (MÉDIA GLOBAL) =====';
WITH Medias AS (
  SELECT
    A.Pnome + ' ' + A.Unome AS Aluno,
    AVG(N.Nota) AS MediaGlobal
  FROM Avaliacao.Nota N
  JOIN Alunos.Matricula M ON M.ID = N.MatriculaID
  JOIN Alunos.Aluno A ON A.ID = M.AlunoID
  GROUP BY A.Pnome, A.Unome
)
SELECT TOP 5 * FROM Medias ORDER BY MediaGlobal DESC;

-- ======================
-- 9. CONTAGEM DE REGISTOS
-- ======================
PRINT '===== CONTAGEM DE REGISTOS =====';
SELECT 'Escola.Escola'        AS Tabela, COUNT(*) AS Registos FROM Escola.Escola UNION ALL
SELECT 'Escola.Turma',        COUNT(*) FROM Escola.Turma UNION ALL
SELECT 'Alunos.Aluno',        COUNT(*) FROM Alunos.Aluno UNION ALL
SELECT 'Alunos.Matricula',    COUNT(*) FROM Alunos.Matricula UNION ALL
SELECT 'Disciplinas.Disciplina', COUNT(*) FROM Disciplinas.Disciplina UNION ALL
SELECT 'Avaliacao.Nota',      COUNT(*) FROM Avaliacao.Nota;
GO
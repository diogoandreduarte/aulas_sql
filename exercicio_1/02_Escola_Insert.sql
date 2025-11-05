USE EscolaDB;
GO

/* =========================
   DADOS INICIAIS REALISTAS
   ========================= */

-- ===== Escolas =====
INSERT INTO Escola.Escola (Nome, Localidade)
VALUES ('Escola Secundária Central', 'Lisboa');
GO

INSERT INTO Escola.Escola (Nome, Localidade)
VALUES ('Escola Secundária do Norte', 'Porto');
GO

-- ===== Turmas =====
INSERT INTO Escola.Turma (EscolaID, AnoLetivo, AnoEscolar, CodigoTurma)
VALUES (1, '2025/2026', 10, '10A');
GO

INSERT INTO Escola.Turma (EscolaID, AnoLetivo, AnoEscolar, CodigoTurma)
VALUES (1, '2025/2026', 10, '10B');
GO

INSERT INTO Escola.Turma (EscolaID, AnoLetivo, AnoEscolar, CodigoTurma)
VALUES (2, '2025/2026', 11, '11A');
GO

-- ===== Alunos =====
INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('João', 'Silva', '2009-05-10', 'M');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Maria', 'Ferreira', '2009-08-22', 'F');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Tiago', 'Pereira', '2009-03-14', 'M');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Inês', 'Gomes', '2010-01-05', 'F');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Rui', 'Martins', '2008-11-30', 'M');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Carla', 'Rodrigues', '2009-09-18', 'F');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Miguel', 'Sousa', '2009-02-11', 'M');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Beatriz', 'Lopes', '2010-07-02', 'F');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('André', 'Costa', '2008-12-28', 'M');
GO

INSERT INTO Alunos.Aluno (Pnome, Unome, DtNasc, Sexo)
VALUES ('Sofia', 'Nunes', '2009-10-20', 'F');
GO
-- ===== Disciplinas =====
INSERT INTO Disciplinas.Disciplina (Nome, Sigla, CargaHoraria)
VALUES ('Português', 'PT', 4);
GO

INSERT INTO Disciplinas.Disciplina (Nome, Sigla, CargaHoraria)
VALUES ('Matemática', 'MAT', 5);
GO

INSERT INTO Disciplinas.Disciplina (Nome, Sigla, CargaHoraria)
VALUES ('História', 'HIS', 3);
GO

INSERT INTO Disciplinas.Disciplina (Nome, Sigla, CargaHoraria)
VALUES ('Física', 'FIS', 4);
GO

INSERT INTO Disciplinas.Disciplina (Nome, Sigla, CargaHoraria)
VALUES ('Inglês', 'ING', 3);
GO

-- ===== Matrículas =====
-- Distribuímos os 10 alunos pelas 3 turmas (4, 3, 3)

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (1, 1, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (2, 1, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (3, 1, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (4, 1, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (5, 2, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (6, 2, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (7, 2, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (8, 3, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (9, 3, '2025-09-01', 'Ativo');
GO

INSERT INTO Alunos.Matricula (AlunoID, TurmaID, DataMatricula, Estado)
VALUES (10, 3, '2025-09-01', 'Ativo');
GO




/* NOTAS/

INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 1, 1, 14.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 1, 2, 15.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 1, 3, 15.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 1, 1, 12.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 1, 2, 13.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 1, 3, 14.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 1, 1, 13.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 1, 2, 14.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 1, 3, 14.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 1, 1, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 1, 2, 15.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 1, 3, 16.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 1, 1, 11.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 1, 2, 12.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 1, 3, 13.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 1, 1, 13.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 1, 2, 14.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 1, 3, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 1, 1, 12.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 1, 2, 13.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 1, 3, 13.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 1, 1, 14.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 1, 2, 15.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 1, 3, 16.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 1, 1, 13.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 1, 2, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 1, 3, 14.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 1, 1, 12.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 1, 2, 13.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 1, 3, 13.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 2, 1, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 2, 2, 14.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 2, 3, 15.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 2, 1, 11.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 2, 2, 11.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 2, 3, 12.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 2, 1, 12.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 2, 2, 13.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 2, 3, 13.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 2, 1, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 2, 2, 15.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 2, 3, 15.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 2, 1, 10.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 2, 2, 11.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 2, 3, 12.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 2, 1, 14.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 2, 2, 14.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 2, 3, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 2, 1, 13.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 2, 2, 13.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 2, 3, 14.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 2, 1, 15.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 2, 2, 16.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 2, 3, 16.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 2, 1, 12.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 2, 2, 13.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 2, 3, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 2, 1, 11.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 2, 2, 12.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 2, 3, 13.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 3, 1, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 3, 2, 15.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 3, 3, 16.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 3, 1, 12.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 3, 2, 12.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 3, 3, 13.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 3, 1, 14.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 3, 2, 14.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 3, 3, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 3, 1, 13.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 3, 2, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 3, 3, 14.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 3, 1, 12.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 3, 2, 13.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 3, 3, 13.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 3, 1, 14.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 3, 2, 14.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 3, 3, 15.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 3, 1, 11.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 3, 2, 12.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 3, 3, 13.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 3, 1, 15.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 3, 2, 15.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 3, 3, 16.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 3, 1, 14.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 3, 2, 14.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 3, 3, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 3, 1, 13.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 3, 2, 13.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 3, 3, 14.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 4, 1, 14.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 4, 2, 14.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 4, 3, 15.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 4, 1, 10.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 4, 2, 11.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 4, 3, 12.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 4, 1, 13.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 4, 2, 14.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 4, 3, 14.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 4, 1, 15.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 4, 2, 15.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 4, 3, 16.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 4, 1, 11.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 4, 2, 12.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 4, 3, 12.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 4, 1, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 4, 2, 14.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 4, 3, 14.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 4, 1, 12.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 4, 2, 13.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 4, 3, 14.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 4, 1, 15.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 4, 2, 15.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 4, 3, 16.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 4, 1, 14.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 4, 2, 14.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 4, 3, 15.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 4, 1, 13.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 4, 2, 13.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 4, 3, 14.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 5, 1, 16.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 5, 2, 16.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (1, 5, 3, 16.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 5, 1, 13.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 5, 2, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (2, 5, 3, 14.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 5, 1, 14.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 5, 2, 14.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (3, 5, 3, 15.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 5, 1, 15.2, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 5, 2, 15.6, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (4, 5, 3, 16.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 5, 1, 11.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 5, 2, 12.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (5, 5, 3, 13.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 5, 1, 14.7, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 5, 2, 15.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (6, 5, 3, 15.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 5, 1, 13.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 5, 2, 14.3, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (7, 5, 3, 14.8, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 5, 1, 16.1, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 5, 2, 16.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (8, 5, 3, 17.0, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 5, 1, 14.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 5, 2, 14.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (9, 5, 3, 15.4, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 5, 1, 12.9, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 5, 2, 13.5, NULL);
GO
INSERT INTO Avaliacao.Nota (MatriculaID, DisciplinaID, Periodo, Nota, Observacao) VALUES (10, 5, 3, 14.0, NULL);
GO

/* ============
   DATABASE
   ============ */
USE master;
GO
IF DB_ID('EscolaDB') IS NULL
    CREATE DATABASE EscolaDB;
GO

USE EscolaDB;
GO

/* ============
   SCHEMAS
   ============ */
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Escola')      EXEC('CREATE SCHEMA Escola AUTHORIZATION dbo;');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Alunos')      EXEC('CREATE SCHEMA Alunos AUTHORIZATION dbo;');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Disciplinas') EXEC('CREATE SCHEMA Disciplinas AUTHORIZATION dbo;');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Avaliacao')   EXEC('CREATE SCHEMA Avaliacao AUTHORIZATION dbo;');
GO

/* =========================
   DROP TABLES (se existirem)
   ========================= */
IF OBJECT_ID('Avaliacao.Nota','U')      IS NOT NULL DROP TABLE Avaliacao.Nota;
IF OBJECT_ID('Alunos.Matricula','U')    IS NOT NULL DROP TABLE Alunos.Matricula;
IF OBJECT_ID('Disciplinas.Disciplina','U') IS NOT NULL DROP TABLE Disciplinas.Disciplina;
IF OBJECT_ID('Alunos.Aluno','U')        IS NOT NULL DROP TABLE Alunos.Aluno;
IF OBJECT_ID('Escola.Turma','U')        IS NOT NULL DROP TABLE Escola.Turma;
IF OBJECT_ID('Escola.Escola','U')       IS NOT NULL DROP TABLE Escola.Escola;
GO

/* =========================
   TABELAS
   ========================= */

-- Escola
CREATE TABLE Escola.Escola (
    ID               INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Escola PRIMARY KEY CLUSTERED,
    Nome             VARCHAR(100)      NOT NULL,
    Localidade       VARCHAR(60)       NOT NULL,
    LastModifiedUser NVARCHAR(128)     NOT NULL CONSTRAINT DF_Escola_LastModifiedUser DEFAULT (ORIGINAL_LOGIN()),
    LastModifiedDate DATETIME2(3)      NOT NULL CONSTRAINT DF_Escola_LastModifiedDate DEFAULT (SYSUTCDATETIME())
);

-- Turma
CREATE TABLE Escola.Turma (
    ID               INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Turma PRIMARY KEY CLUSTERED,
    EscolaID         INT               NOT NULL,
    AnoLetivo        CHAR(9)           NOT NULL,   -- ex: '2025/2026'
    AnoEscolar       INT               NOT NULL,   -- ex: 10
    CodigoTurma      VARCHAR(10)       NOT NULL,   -- ex: '10A'
    LastModifiedUser NVARCHAR(128)     NOT NULL CONSTRAINT DF_Turma_LastModifiedUser DEFAULT (ORIGINAL_LOGIN()),
    LastModifiedDate DATETIME2(3)      NOT NULL CONSTRAINT DF_Turma_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Turma_EscolaID FOREIGN KEY (EscolaID) REFERENCES Escola.Escola(ID),
    CONSTRAINT UQ_Turma UNIQUE (EscolaID, AnoLetivo, CodigoTurma)
);

-- Aluno
CREATE TABLE Alunos.Aluno (
    ID               INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Aluno PRIMARY KEY CLUSTERED,
    Pnome            VARCHAR(50)       NOT NULL,
    Unome            VARCHAR(50)       NOT NULL,
    DtNasc           DATE              NULL,
    Sexo             CHAR(1)           NULL,
    LastModifiedUser NVARCHAR(128)     NOT NULL CONSTRAINT DF_Aluno_LastModifiedUser DEFAULT (ORIGINAL_LOGIN()),
    LastModifiedDate DATETIME2(3)      NOT NULL CONSTRAINT DF_Aluno_LastModifiedDate DEFAULT (SYSUTCDATETIME())
);

-- Matricula
CREATE TABLE Alunos.Matricula (
    ID               INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Matricula PRIMARY KEY CLUSTERED,
    AlunoID          INT               NOT NULL,
    TurmaID          INT               NOT NULL,
    DataMatricula    DATE              NOT NULL,
    Estado           VARCHAR(20)       NOT NULL DEFAULT ('Ativo'),
    LastModifiedUser NVARCHAR(128)     NOT NULL CONSTRAINT DF_Matricula_LastModifiedUser DEFAULT (ORIGINAL_LOGIN()),
    LastModifiedDate DATETIME2(3)      NOT NULL CONSTRAINT DF_Matricula_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Matricula_AlunoID FOREIGN KEY (AlunoID) REFERENCES Alunos.Aluno(ID),
    CONSTRAINT FK_Matricula_TurmaID FOREIGN KEY (TurmaID) REFERENCES Escola.Turma(ID),
    CONSTRAINT UQ_Matricula UNIQUE (AlunoID, TurmaID)
);

-- Disciplina
CREATE TABLE Disciplinas.Disciplina (
    ID               INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Disciplina PRIMARY KEY CLUSTERED,
    Nome             VARCHAR(100)      NOT NULL,
    Sigla            VARCHAR(10)       NOT NULL,
    CargaHoraria     TINYINT           NULL,
    LastModifiedUser NVARCHAR(128)     NOT NULL CONSTRAINT DF_Disciplina_LastModifiedUser DEFAULT (ORIGINAL_LOGIN()),
    LastModifiedDate DATETIME2(3)      NOT NULL CONSTRAINT DF_Disciplina_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT UQ_Disciplina UNIQUE (Sigla)
);

-- Nota
CREATE TABLE Avaliacao.Nota (
    ID               INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Nota PRIMARY KEY CLUSTERED,
    MatriculaID      INT               NOT NULL,
    DisciplinaID     INT               NOT NULL,
    Periodo          TINYINT           NOT NULL,        -- 1..3
    Nota             DECIMAL(4,1)      NOT NULL,        -- 0.0..20.0
    Observacao       VARCHAR(200)      NULL,
    LastModifiedUser NVARCHAR(128)     NOT NULL CONSTRAINT DF_Nota_LastModifiedUser DEFAULT (ORIGINAL_LOGIN()),
    LastModifiedDate DATETIME2(3)      NOT NULL CONSTRAINT DF_Nota_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Nota_MatriculaID FOREIGN KEY (MatriculaID) REFERENCES Alunos.Matricula(ID),
    CONSTRAINT FK_Nota_DisciplinaID FOREIGN KEY (DisciplinaID) REFERENCES Disciplinas.Disciplina(ID),
    CONSTRAINT CHK_Nota_Periodo CHECK (Periodo IN (1,2,3)),
    CONSTRAINT CHK_Nota_Valor   CHECK (Nota BETWEEN 0 AND 20),
    CONSTRAINT UQ_Nota UNIQUE (MatriculaID, DisciplinaID, Periodo)
);
GO

/* =========================
   CHECK CONSTRAINTS EXTRA
   ========================= */
-- Turma: AnoEscolar entre 1 e 12
ALTER TABLE Escola.Turma
ADD CONSTRAINT CHK_Turma_AnoEscolar CHECK (AnoEscolar BETWEEN 1 AND 12);

-- Turma: AnoLetivo 'YYYY/YYYY' e 2º ano = 1º + 1
ALTER TABLE Escola.Turma
ADD CONSTRAINT CHK_Turma_AnoLetivoFormato
CHECK (
  LEN(AnoLetivo) = 9
  AND SUBSTRING(AnoLetivo,5,1) = '/'
  AND TRY_CONVERT(int, LEFT(AnoLetivo,4)) IS NOT NULL
  AND TRY_CONVERT(int, RIGHT(AnoLetivo,4)) IS NOT NULL
  AND TRY_CONVERT(int, RIGHT(AnoLetivo,4)) = TRY_CONVERT(int, LEFT(AnoLetivo,4)) + 1
);

-- Aluno: Sexo M/F (ou NULL)
ALTER TABLE Alunos.Aluno
ADD CONSTRAINT CHK_Aluno_Sexo CHECK (Sexo IN ('M','F') OR Sexo IS NULL);
GO


/* =========================
   TRIGGERS: audit cols auto
   =========================
   Nota:
   - Usamos AFTER INSERT, UPDATE
   - Atualiza sempre LastModifiedUser/Date nas linhas alteradas
   - RECURSIVE_TRIGGERS por omissão está OFF, por isso não há recursão direta
   ========================= */

-- Escola.Escola
CREATE OR ALTER TRIGGER Escola.trg_Escola_Audit
ON Escola.Escola
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE e
      SET e.LastModifiedUser = ORIGINAL_LOGIN(),
          e.LastModifiedDate = SYSUTCDATETIME()
    FROM Escola.Escola e
    INNER JOIN inserted i ON i.ID = e.ID;
END;
GO

-- Escola.Turma
CREATE OR ALTER TRIGGER Escola.trg_Turma_Audit
ON Escola.Turma
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE t
      SET t.LastModifiedUser = ORIGINAL_LOGIN(),
          t.LastModifiedDate = SYSUTCDATETIME()
    FROM Escola.Turma t
    INNER JOIN inserted i ON i.ID = t.ID;
END;
GO

-- Alunos.Aluno
CREATE OR ALTER TRIGGER Alunos.trg_Aluno_Audit
ON Alunos.Aluno
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
      SET a.LastModifiedUser = ORIGINAL_LOGIN(),
          a.LastModifiedDate = SYSUTCDATETIME()
    FROM Alunos.Aluno a
    INNER JOIN inserted i ON i.ID = a.ID;
END;
GO

-- Alunos.Matricula
CREATE OR ALTER TRIGGER Alunos.trg_Matricula_Audit
ON Alunos.Matricula
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE m
      SET m.LastModifiedUser = ORIGINAL_LOGIN(),
          m.LastModifiedDate = SYSUTCDATETIME()
    FROM Alunos.Matricula m
    INNER JOIN inserted i ON i.ID = m.ID;
END;
GO

-- Disciplinas.Disciplina
CREATE OR ALTER TRIGGER Disciplinas.trg_Disciplina_Audit
ON Disciplinas.Disciplina
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE d
      SET d.LastModifiedUser = ORIGINAL_LOGIN(),
          d.LastModifiedDate = SYSUTCDATETIME()
    FROM Disciplinas.Disciplina d
    INNER JOIN inserted i ON i.ID = d.ID;
END;
GO

-- Avaliacao.Nota
CREATE OR ALTER TRIGGER Avaliacao.trg_Nota_Audit
ON Avaliacao.Nota
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE n
      SET n.LastModifiedUser = ORIGINAL_LOGIN(),
          n.LastModifiedDate = SYSUTCDATETIME()
    FROM Avaliacao.Nota n
    INNER JOIN inserted i ON i.ID = n.ID;
END;
GO
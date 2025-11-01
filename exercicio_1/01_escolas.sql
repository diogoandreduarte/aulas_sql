USE master;
GO
-- Criação da Base de Dados
IF DB_ID('EscolaDB') IS NULL
    CREATE DATABASE EscolaDB;
GO

USE EscolaDB;
GO

-- Schemas
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Escola')      EXEC('CREATE SCHEMA Escola AUTHORIZATION dbo;');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Alunos')      EXEC('CREATE SCHEMA Alunos AUTHORIZATION dbo;');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Disciplinas') EXEC('CREATE SCHEMA Disciplinas AUTHORIZATION dbo;');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='Avaliacao')   EXEC('CREATE SCHEMA Avaliacao AUTHORIZATION dbo;');
GO

/* =========================
   TABELAS
   ========================= */

-- Escola
IF OBJECT_ID('Escola.Escola','U') IS NOT NULL DROP TABLE Escola.Escola;
GO
CREATE TABLE Escola.Escola (
    ID                 INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Escola PRIMARY KEY CLUSTERED,
    Nome               VARCHAR(100)      NOT NULL,
    Localidade         VARCHAR(60)       NOT NULL,
    LastModifiedUser   VARCHAR(50)       NOT NULL,
    LastModifiedDate   DATETIME2(3)      NOT NULL CONSTRAINT DF_Escola_LastModifiedDate DEFAULT (SYSUTCDATETIME())
);

-- Turma
IF OBJECT_ID('Escola.Turma','U') IS NOT NULL DROP TABLE Escola.Turma;
GO
CREATE TABLE Escola.Turma (
    ID                 INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Turma PRIMARY KEY CLUSTERED,
    EscolaID           INT               NOT NULL,
    AnoLetivo          CHAR(9)           NOT NULL,   -- ex: '2025/2026'
    AnoEscolar         INT               NOT NULL,   -- ex: 10
    CodigoTurma        VARCHAR(10)       NOT NULL,   -- ex: '10A'
    LastModifiedUser   VARCHAR(50)       NOT NULL,
    LastModifiedDate   DATETIME2(3)      NOT NULL CONSTRAINT DF_Turma_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Turma_EscolaID FOREIGN KEY (EscolaID) REFERENCES Escola.Escola(ID),
    CONSTRAINT UQ_Turma UNIQUE (EscolaID, AnoLetivo, CodigoTurma)
);

-- Aluno
IF OBJECT_ID('Alunos.Aluno','U') IS NOT NULL DROP TABLE Alunos.Aluno;
GO
CREATE TABLE Alunos.Aluno (
    ID                 INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Aluno PRIMARY KEY CLUSTERED,
    Pnome              VARCHAR(50)       NOT NULL,
    Unome              VARCHAR(50)       NOT NULL,
    DtNasc             DATE              NULL,
    Sexo               CHAR(1)           NULL,
    LastModifiedUser   VARCHAR(50)       NOT NULL,
    LastModifiedDate   DATETIME2(3)      NOT NULL CONSTRAINT DF_Aluno_LastModifiedDate DEFAULT (SYSUTCDATETIME())
);

-- Matricula
IF OBJECT_ID('Alunos.Matricula','U') IS NOT NULL DROP TABLE Alunos.Matricula;
GO
CREATE TABLE Alunos.Matricula (
    ID                 INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Matricula PRIMARY KEY CLUSTERED,
    AlunoID            INT               NOT NULL,
    TurmaID            INT               NOT NULL,
    DataMatricula      DATE              NOT NULL,
    Estado             VARCHAR(20)       NOT NULL DEFAULT ('Ativo'),
    LastModifiedUser   VARCHAR(50)       NOT NULL,
    LastModifiedDate   DATETIME2(3)      NOT NULL CONSTRAINT DF_Matricula_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Matricula_AlunoID FOREIGN KEY (AlunoID) REFERENCES Alunos.Aluno(ID),
    CONSTRAINT FK_Matricula_TurmaID FOREIGN KEY (TurmaID) REFERENCES Escola.Turma(ID),
    CONSTRAINT UQ_Matricula UNIQUE (AlunoID, TurmaID)
);

-- Disciplina
IF OBJECT_ID('Disciplinas.Disciplina','U') IS NOT NULL DROP TABLE Disciplinas.Disciplina;
GO
CREATE TABLE Disciplinas.Disciplina (
    ID                 INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Disciplina PRIMARY KEY CLUSTERED,
    Nome               VARCHAR(100)      NOT NULL,
    Sigla              VARCHAR(10)       NOT NULL,
    CargaHoraria       TINYINT           NULL,
    LastModifiedUser   VARCHAR(50)       NOT NULL,
    LastModifiedDate   DATETIME2(3)      NOT NULL CONSTRAINT DF_Disciplina_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT UQ_Disciplina UNIQUE (Sigla)
);

-- Nota
IF OBJECT_ID('Avaliacao.Nota','U') IS NOT NULL DROP TABLE Avaliacao.Nota;
GO
CREATE TABLE Avaliacao.Nota (
    ID                 INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Nota PRIMARY KEY CLUSTERED,
    MatriculaID        INT               NOT NULL,
    DisciplinaID       INT               NOT NULL,
    Periodo            TINYINT           NOT NULL,        -- 1..3
    Nota               DECIMAL(4,1)      NOT NULL,        -- 0.0..20.0
    Observacao         VARCHAR(200)      NULL,
    LastModifiedUser   VARCHAR(50)       NOT NULL,
    LastModifiedDate   DATETIME2(3)      NOT NULL CONSTRAINT DF_Nota_LastModifiedDate DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Nota_MatriculaID FOREIGN KEY (MatriculaID) REFERENCES Alunos.Matricula(ID),
    CONSTRAINT FK_Nota_DisciplinaID FOREIGN KEY (DisciplinaID) REFERENCES Disciplinas.Disciplina(ID),
    CONSTRAINT CHK_Nota_Periodo CHECK (Periodo IN (1,2,3)),
    CONSTRAINT CHK_Nota_Valor   CHECK (Nota BETWEEN 0 AND 20),
    CONSTRAINT UQ_Nota UNIQUE (MatriculaID, DisciplinaID, Periodo)
);
GO


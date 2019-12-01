use [master]	
CREATE DATABASE [Rei-Do-Almoco];
GO

use [Rei-Do-Almoco]
GO
IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Pretendente] (
    [Id] uniqueidentifier NOT NULL,
    [Nome] nvarchar(100) NOT NULL,
    [Email] nvarchar(100) NOT NULL,
    CONSTRAINT [PK_Pretendente] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Voto] (
    [Id] uniqueidentifier NOT NULL,
    [Data] datetime2 NOT NULL,
    [Quantidade] int NOT NULL,
    [PretendenteId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Voto] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Voto_Pretendente_PretendenteId] FOREIGN KEY ([PretendenteId]) REFERENCES [Pretendente] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Voto_PretendenteId] ON [Voto] ([PretendenteId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20191201125917_Inicitial', N'3.0.1');

GO
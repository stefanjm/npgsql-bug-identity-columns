IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Blogs] (
    [BlogId] int NOT NULL IDENTITY,
    [Url] nvarchar(max) NULL,
    CONSTRAINT [PK_Blogs] PRIMARY KEY ([BlogId])
);

GO

CREATE TABLE [Posts] (
    [PostId] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NULL,
    [Content] nvarchar(max) NULL,
    [BlogId] int NOT NULL,
    CONSTRAINT [PK_Posts] PRIMARY KEY ([PostId]),
    CONSTRAINT [FK_Posts_Blogs_BlogId] FOREIGN KEY ([BlogId]) REFERENCES [Blogs] ([BlogId]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Posts_BlogId] ON [Posts] ([BlogId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20181208175929_Initialize', N'2.1.4-rtm-31024');

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20181208181245_npgsql identity onmodelcreating override', N'2.1.4-rtm-31024');

GO


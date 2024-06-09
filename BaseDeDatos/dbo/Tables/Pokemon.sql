﻿CREATE TABLE [dbo].[Pokemon] (
    [Id]     UNIQUEIDENTIFIER NOT NULL,
    [Numero] INT              NOT NULL,
    [Nivel]  INT              NOT NULL,
    CONSTRAINT [PK_Pokemon] PRIMARY KEY CLUSTERED ([Id] ASC)
);




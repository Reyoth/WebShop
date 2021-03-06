USE [WebShop]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[CLI_Id] [int] IDENTITY(1,1) NOT NULL,
	[CLI_Nom] [varchar](50) NOT NULL,
	[CLI_Prenom] [varchar](50) NULL,
	[CLI_Civilite] [varchar](50) NOT NULL,
	[CLI_Email] [varchar](50) NOT NULL,
	[CLI_Adresse] [varchar](50) NOT NULL,
	[CLI_CodePostal] [varchar](50) NOT NULL,
	[CLI_Ville] [varchar](50) NOT NULL,
	[CLI_Telephone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[CLI_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorie](
	[CAT_Id] [int] IDENTITY(1,1) NOT NULL,
	[CAT_Libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[CAT_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Commande](
	[COM_Id] [int] IDENTITY(1,1) NOT NULL,
	[COM_CLI_Id] [int] NOT NULL,
	[COM_Date] [datetime] NOT NULL,
	[COM_Statut] [varchar](50) NOT NULL,
	[COM_DateLivraison] [datetime] NOT NULL,
	[COM_Nom] [varchar](50) NOT NULL,
	[COM_Prenom] [varchar](50) NULL,
	[COM_Civilite] [varchar](50) NOT NULL,
	[COM_Adresse] [varchar](50) NOT NULL,
	[COM_CodePostal] [varchar](50) NOT NULL,
	[COM_Ville] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Commande] PRIMARY KEY CLUSTERED 
(
	[COM_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SousCategorie]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SousCategorie](
	[SCAT_Id] [int] IDENTITY(1,1) NOT NULL,
	[SCAT_CAT_Id] [int] NOT NULL,
	[SCAT_Libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SousCategorie] PRIMARY KEY CLUSTERED 
(
	[SCAT_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[ART_Id] [int] IDENTITY(1,1) NOT NULL,
	[ART_SCAT_Id] [int] NOT NULL,
	[ART_Libelle] [varchar](50) NOT NULL,
	[ART_Description] [varchar](max) NOT NULL,
	[ART_Prix] [decimal](10, 2) NOT NULL,
	[ART_Stock] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ART_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailCommande]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailCommande](
	[DCOM_Id] [int] IDENTITY(1,1) NOT NULL,
	[DCOM_COM_Id] [int] NOT NULL,
	[DCOM_ART_Id] [int] NOT NULL,
	[DCOM_Quantite] [int] NOT NULL,
	[DCOM_PrixUnitaire] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_DetailCommande] PRIMARY KEY CLUSTERED 
(
	[DCOM_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Article_SousCategorie]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_SousCategorie] FOREIGN KEY([ART_SCAT_Id])
REFERENCES [dbo].[SousCategorie] ([SCAT_Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_SousCategorie]
GO
/****** Object:  ForeignKey [FK_Commande_Client]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_Client] FOREIGN KEY([COM_CLI_Id])
REFERENCES [dbo].[Client] ([CLI_Id])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_Client]
GO
/****** Object:  ForeignKey [FK_DetailCommande_Article]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_DetailCommande_Article] FOREIGN KEY([DCOM_ART_Id])
REFERENCES [dbo].[Article] ([ART_Id])
GO
ALTER TABLE [dbo].[DetailCommande] CHECK CONSTRAINT [FK_DetailCommande_Article]
GO
/****** Object:  ForeignKey [FK_DetailCommande_Commande]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_DetailCommande_Commande] FOREIGN KEY([DCOM_COM_Id])
REFERENCES [dbo].[Commande] ([COM_Id])
GO
ALTER TABLE [dbo].[DetailCommande] CHECK CONSTRAINT [FK_DetailCommande_Commande]
GO
/****** Object:  ForeignKey [FK_SousCategorie_Categorie]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[SousCategorie]  WITH CHECK ADD  CONSTRAINT [FK_SousCategorie_Categorie] FOREIGN KEY([SCAT_CAT_Id])
REFERENCES [dbo].[Categorie] ([CAT_Id])
GO
ALTER TABLE [dbo].[SousCategorie] CHECK CONSTRAINT [FK_SousCategorie_Categorie]
GO

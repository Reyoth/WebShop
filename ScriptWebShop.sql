USE [master]
GO
/****** Object:  Database [WebShop]    Script Date: 23-Jan-17 09:37:04 ******/
CREATE DATABASE [WebShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebShop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WebShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebShop] SET RECOVERY FULL 
GO
ALTER DATABASE [WebShop] SET  MULTI_USER 
GO
ALTER DATABASE [WebShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebShop', N'ON'
GO
ALTER DATABASE [WebShop] SET QUERY_STORE = OFF
GO
USE [WebShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WebShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ART_Id] [int] IDENTITY(1,1) NOT NULL,
	[ART_SCAT_Id] [int] NOT NULL,
	[ART_Libelle] [varchar](50) NOT NULL,
	[ART_Description] [varchar](max) NOT NULL,
	[ART_Prix] [decimal](10, 2) NOT NULL,
	[ART_Stock] [int] NOT NULL,
	[ART_Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ART_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[CAT_Id] [int] IDENTITY(1,1) NOT NULL,
	[CAT_Libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[CAT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[CLI_NetUserId] [nvarchar](128) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[CLI_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Commande]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commande](
	[COM_Id] [int] IDENTITY(1,1) NOT NULL,
	[COM_CLI_Id] [int] NOT NULL,
	[COM_Date] [datetime] NOT NULL,
	[COM_Statut] [varchar](50) NOT NULL,
	[COM_DateLivDesiree] [datetime2](7) NOT NULL,
	[COM_DateLivraison] [datetime2](7) NULL,
	[COM_Nom] [varchar](50) NOT NULL,
	[COM_Prenom] [varchar](50) NULL,
	[COM_Civilite] [varchar](50) NOT NULL,
	[COM_Adresse] [varchar](50) NOT NULL,
	[COM_CodePostal] [varchar](50) NOT NULL,
	[COM_Ville] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Commande] PRIMARY KEY CLUSTERED 
(
	[COM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailCommande]    Script Date: 23-Jan-17 09:37:05 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SousCategorie]    Script Date: 23-Jan-17 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SousCategorie](
	[SCAT_Id] [int] IDENTITY(1,1) NOT NULL,
	[SCAT_CAT_Id] [int] NOT NULL,
	[SCAT_Libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SousCategorie] PRIMARY KEY CLUSTERED 
(
	[SCAT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201701150716585_InitialCreate', N'WebShop.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829ECE3948AD5CBA8B6D60EF22759273826E2E5867DBF3B6A025DA1156A254894A1314FD657DE84FEA5FE850A264F1A68BADD84EB1C0222287DF0C874372381CFACFDFFF187F780A03EB1127A91F91897D343AB42D4CDCC8F3C972626774F1CD3BFBC3FB7FFE637CE1854FD68F25DD09A38396249DD80F94C6A78E93BA0F3844E928F4DD244AA3051DB951E8202F728E0F0FBF738E8E1C0C10366059D6F85346A81FE2FC033EA71171714C33145C471E0E525E0E35B31CD5BA41214E63E4E289FD139ECF1EA2785450DAD659E02390628683856D2142228A28C878FA39C5339A4464398BA10005F7CF3106BA050A52CC653F5D9177EDC6E131EB86B36A5842B9594AA3B027E0D109D78B23375F4BBB76A537D0DC0568983EB35EE7DA9BD8571ECE8B3E4501284066783A0D12463CB1AF2B1667697C83E9A86C382A202F1380FB254ABE8EEA880756E77607951D1D8F0ED9BF036B9A05344BF084E08C262838B0EEB279E0BB3FE0E7FBE82B269393A3F9E2E4DD9BB7C83B79FB2D3E7953EF29F415E8840228BA4BA21827201B5E54FDB72D476CE7C80DAB66B5368556C096604AD8D6357AFA88C9923EC064397E675B97FE13F6CA126E5C9F890F33081AD12483CF9B2C08D03CC055BDD3C893FDDFC0F5F8CDDB41B8DEA0477F990FBDC41F264E02F3EA130EF2DAF4C18F8BE9258CF7174E76994421FB16EDABA8FD328BB2C4659D898C24F72859622A4A377656C6DBC9A419D4F0665DA2EEBF69334955F3D692B20EAD33134A16DB9E0DA5BC2FCBB7B3C59DC5310C5E6E5A4C234D06276E5423A9E581C5EB572673D4D5640874E5EFBC025E84C80F0658023B7001CF63E12721AE7AF97D040687486F99EF509AC20AE0FD0FA50F0DA2C39F03883EC36E968061CE280AE317E776F710117C93857366EFDBE335D8D0DCFF125D229746C90561AD36C6FB18B95FA38C5E10EF1C51FC99BA2520FBBCF7C3EE00838873E6BA384D2FC198B1378DC0B12E01AF083D39EE0DC716A75DBB20D300F9A1DE079196D12F25E9CA0FD15328BE88814CE78F3489FA315AFAA49BA825A959D482A255544ED6575406D64D524E691634276895B3A01ACCC3CB476878172F87DD7F1F6FB3CDDBB416D4D438831512FF17139CC032E6DD214A71425623D065DDD885B3900F1F63FAE27B53CEE947146443B35A6B36E48BC0F0B32187DDFFD9908B09C58FBEC7BC920E079F9218E03BD1EBCF54ED734E926CDBD341E8E6B6996F670D304D97B3348D5C3F9F059A90170F5888F2830F67B5472F8ADEC81110E81818BACFB63C2881BED9B251DD92731C608AAD33B708094E51EA224F552374C8EB2158B9A36A045B454244E1FEA3F0044BC7096B84D821288599EA13AA4E0B9FB87E8C82562D492D3B6E61ACEF150FB9E61CC7983086AD9AE8C25C1FF86002547CA44169D3D0D8A9595CB3211ABC56D398B7B9B0AB7157E2115BB1C916DFD96097DC7F7B11C36CD6D8168CB359255D043006F17661A0FCACD2D500E483CBBE19A8746232182877A9B662A0A2C67660A0A24A5E9D811647D4AEE32F9D57F7CD3CC583F2F6B7F54675EDC036057DEC996916BE27B4A1D00227AA799ECF59257EA29AC319C8C9CF67297775651361E0334CC590CDCADFD5FAA14E33886C444D802B436B01E5D77F0A9032A17A0857C6F21AA5E35E440FD832EED608CBD77E09B666032A76FD1AB44668BE2C958DB3D3E9A3EA59650D8A91773A2CD4703406212F5E62C73B28C514975515D3C517EEE30DD73AC607A341412D9EAB4149656706D752699AED5AD239647D5CB28DB424B94F062D959D195C4BDC46DB95A4710A7AB8051BA948DCC2079A6C65A4A3DA6DAABAB1536446F182B16348A11A5FA338F6C9B29652C54BAC59914F35FD66D63FD9282C301C37D5E41C55D2569C6894A025966A8135487AE927293D4714CD118BF34CBD5021D3EEAD86E5BF6459DF3ED5412CF781929AFD5DB4902EED857D56754478FB4BE85DC8BC993C84AE197B7D738BA5B7A100259AA8FD340AB290989D2B73EBE2EEAEDEBE285111C68E24BFE23C299A525C5C51ED9D06459D10030C50E5B7AC3F48660893AA4BAFB3AE6C93276A46290353751453B06A67836672603A0F94EC17F61FA7568497994F3C19A50EC08B7A62D4F21914B05A5D775431E5A48E29D6744794F24AEA9052550F29EBD9238290F58AB5F00C1AD55374E7A0E68BD4D1D5DAEEC89ACC913AB4A67A0D6C8DCC725D77544D72491D5853DD1D7B9569222FA07BBC63194F2B6B6D59C56176B33DCB80F132ABE1305B5EEDCEBE0E542BEE89C56FE515305EBE9796643CD1AD654945FC62334B326098571CE1A65B5C701AAFE7CD98C2F5B5B0A8375DDF9BF1FAD9EB8B5A85729893492AEED5A14E3ABC8DF941AAFD918C72B22A486CAB54236CE8CF29C5E188118C663F07D3C0C76CF92E09AE11F11738A545CA867D7C78742CBDB5D99F772F4E9A7A81E6206A7AFC228ED916B2AFC8234ADC0794A8B9101BBC0D59812A61E62BE2E1A789FD6BDEEA348F58B0BFF2E203EB2AFD4CFC9F33A8B84F326CFDA6E6760E932BDF7CB0DAD3970DDDB57AF5FF2F45D303EB368119736A1D4ABA5C6784C5F70EBDA4299A6E20CDDAAF205EEF84129E1A6851A509B1FECB82B94F077955504AF9AF103DFDBBAF68DA97031B216A5E070C8537880A4DD9FFEB601933FF3DF8A479E67FBFCEEA5F02AC239AF115804FFA83C96F00BA2F4365CB1D6E359AF3D03696A45CCFAD39D41B2554EE7A6F5252AD379AE86A3A750FB80D52A6D7B08C57966D3CD8EEA849261E0C7B97A6FDE219C4FB9234BC4AE7D86DAEF036D3831BAE82FE5659C17B90C7A6C9CBD97DEEEFB66DCD14C3DDF304CA7E19BE7B666C3C5B6BF779BCDB3636539877CF8DAD57B6EE9ED9DAAEF6CF1D5B5AE72D74E7B9B76A1A91E12E46170B6ECBAD2D02E770C29F4760048547593C89D427733525A2B6305C9198999AB3C864C6CAC451F82A14CD6CFBF5956FF88D9DE534CD6C0DB9974DBCF9FADFC89BD334F3366434EE222B589B53A8CBD46E59C79A129F5E5316B0D09396A4F3369FB5F162FD3525FD0EA21461F618EE885F4F8EEF202A1972EAF4C8E955AF7B61EFACFD7222ECDFA9BF5C41B0DF5124D81576CD8AE68A2CA272F396242A49A408CD35A6C8832DF52CA1FE02B914AA598C397FD39DC7EDD84DC71C7B57E436A37146A1CB389C0742C08B39014DFCF3C46551E6F16D9CFF3CC9105D00317D169BBF25DF677EE055725F6A62420608E65DF0882E1B4BCA22BBCBE70AE926221D81B8FA2AA7E81E87710060E92D99A147BC8E6C607E1FF112B9CFAB08A009A47D2044B58FCF7DB44C5098728C557BF8041BF6C2A7F77F014400EF1D40540000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (1, 1, N'Table en Marbre', N'Jolie table en marbre de 1m sur 2m', CAST(150.00 AS Decimal(10, 2)), 30, N'http://www.ythurbide-antiques.com/photo/pgiArticle/114-2.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (2, 1, N'Table en Bois', N'Jolie table en bois pour le salon', CAST(80.00 AS Decimal(10, 2)), 20, N'http://i2.cdscdn.com/pdt2/8/9/6/1/700x700/tek1142159170896/rw/table-basse-en-bois-teck-ma.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (3, 3, N'Chaise en bois', N'Jolie chaise en bois pour la salle à manger', CAST(30.00 AS Decimal(10, 2)), 40, N'http://i2.cdscdn.com/pdt2/1/2/8/1/700x700/auc3606505734128/rw/chaise-bistrot.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (4, 3, N'Chaise en Cuire', N'Chaise en en cuire brun véritable', CAST(60.00 AS Decimal(10, 2)), 32, N'http://www.tables-et-chaises.fr/69-169-thickbox/chaise-en-cuir-marron-cn104.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (5, 5, N'Lit en bois', N'Petit lit en bois pour une personne', CAST(90.00 AS Decimal(10, 2)), 20, N'http://www.ikea.com/fr/fr/images/products/fjellse-structure-de-lit__0107489_PE257171_S4.JPG')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (6, 5, N'Lit à baldaquin', N'Lit à baldaquin chique et de grande marque', CAST(800.00 AS Decimal(10, 2)), 20, N'http://www.meubles-de-normandie.fr/705-1212-thickbox/lit-a-baldaquin-d-annie.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (7, 6, N'Petite Table de Jardin', N'Petite table de jardin en plastique vert', CAST(40.00 AS Decimal(10, 2)), 58, N'http://i2.cdscdn.com/pdt2/7/5/7/1/700x700/evo3076540143757/rw/grande-table-de-jardin-resine.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (8, 7, N'Râteau', N'Râteau métallique pour ratisser les feuilles', CAST(15.00 AS Decimal(10, 2)), 35, N'http://www.tienda-ejemplo.com/WebRoot/StoreES/Shops/testejemplo/4797/2F68/44F2/65C2/5FF1/D94C/8776/127F/rastrillo.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (9, 10, N'Chaise en plastique', N'Petite chaise en plastique pour le jardin', CAST(20.00 AS Decimal(10, 2)), 10, N'http://www.casanaute.com/components/com_datsogallery/img_originals/chaise-jardin-plastique-1270318616.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (10, 13, N'Marteau en bois', N'Marteau en bois pour charpentier', CAST(10.00 AS Decimal(10, 2)), 62, N'http://m-y-d-s.com/en/hand_tools/wooden_hammer/a.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (11, 14, N'Vis Torx', N'Paquet de 100 Vis torx de qualité de 2cm', CAST(10.00 AS Decimal(10, 2)), 40, N'http://www.outiz.fr/medias/sys_master/keepeek/keepeek/ha7/h22/9147360772126/ACTON-Vis-bois-penture-Torx-Inox-A2-6x30mm-100-pieces-623106x30-00352-01-L.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (12, 17, N'Deus Ex', N'Jeux a succès qu''on ne présente plus', CAST(40.00 AS Decimal(10, 2)), 100, N'http://3.bp.blogspot.com/_mNcyVZsUp3k/TDAhoZVbpUI/AAAAAAAAADU/Rz8rfPuhd3c/s1600/deus_ex.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (13, 17, N'Age of Empire', N'Jeux de stratégie sur pc', CAST(20.00 AS Decimal(10, 2)), 199, N'http://images2.wikia.nocookie.net/__cb20080429205907/ageofempires/es/images/8/8f/Aoei.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (14, 16, N'50 nuances de toute les couleurs', N'Un livre dont personne n''a entendu parler.', CAST(10.00 AS Decimal(10, 2)), 100, N'http://mask-tub-et-brush.m.a.pic.centerblog.net/o/69667ec9.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (15, 16, N'Le seigneur des Anneaux', N'Trilogie à grand succès.', CAST(20.00 AS Decimal(10, 2)), 320, N'http://fr.web.img4.acsta.net/medias/nmedia/18/35/15/55/18364865.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_Image]) VALUES (17, 4, N'Petite commode', N'petite commode en bois', CAST(80.00 AS Decimal(10, 2)), 5, N'http://www.sweetmango.fr/2013-thickbox_default/commode-design-bois-2-tiroirs.jpg')
SET IDENTITY_INSERT [dbo].[Article] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'client')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fac15623-db86-4bcd-8c79-e078194e7509', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'91675ef9-5ab0-40eb-b605-1cce1acf9528', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a7581aae-75ea-45b1-a21b-460c89668619', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd3112c2f-42cb-4598-a985-7142dfeb4e11', N'2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'91675ef9-5ab0-40eb-b605-1cce1acf9528', N'youlou@gmail.com', 0, N'ADJnQtIvxxDyjem8IsFEVLUQZrtYOK9fuYB7clb0d2qx6VsH9eperloY0OXVQsgHVA==', N'5b0ba71b-a3cd-4c86-90b5-a8553eb11ed1', NULL, 0, 0, NULL, 1, 0, N'youlou@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a7581aae-75ea-45b1-a21b-460c89668619', N'aaaa@gmail.com', 0, N'AE+3V7MK93szYVtcV58wmEMrdYlbTGf35sfK+I8H9k7HOf0e5f/LCav9i/wTjF9qfA==', N'98daa460-d625-461b-a067-9a44be9cc34c', NULL, 0, 0, NULL, 1, 0, N'aaaa@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd3112c2f-42cb-4598-a985-7142dfeb4e11', N'yolo@gmail.com', 0, N'ALeXYow+4zPSVUguTRbAbbot7sh7ICyCy8nhbf3dUAu0AUo3e6wYEI+eGuHryuOXxw==', N'7a9170b7-d924-4f46-96c0-49a32aafd0bc', NULL, 0, 0, NULL, 1, 0, N'yolo@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fac15623-db86-4bcd-8c79-e078194e7509', N'yala@gmail.com', 0, N'AG8S3w64+/l8Yty1M7VyxrSJIUJdPjG53k8hufndlnm+R//X2t23g2gKagsXlTcUbQ==', N'bbff74c9-6d85-4c0e-be5c-aa951467df71', NULL, 0, 0, NULL, 1, 0, N'yala@gmail.com')
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (1, N'Mobilier')
INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (2, N'Jardin')
INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (3, N'Outils')
INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (4, N'Loisirs')
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone], [CLI_NetUserId]) VALUES (2, N'jean', N'du bois', N'monsieur', N'yolo@gmail.com', N'rue perdu 56', N'1000', N'bruxelles', N'0123456789', N'd3112c2f-42cb-4598-a985-7142dfeb4e11')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone], [CLI_NetUserId]) VALUES (3, N'Toto', N'Tata', N'Monsieur', N'yala@gmail.com', N'rue perdu 53', N'1000', N'Bruxelles', N'0123456789', N'fac15623-db86-4bcd-8c79-e078194e7509')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone], [CLI_NetUserId]) VALUES (4, N'Titi', N'toutou', N'Monsieur', N'youlou@gmail.com', N'rue aussi perdu 42', N'1000', N'bruxelles', N'0123456789', N'91675ef9-5ab0-40eb-b605-1cce1acf9528')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone], [CLI_NetUserId]) VALUES (5, N'adata', N'zqgds', N'Monsieur', N'aaaa@gmail.com', N'ezzeg', N'1000', N'Bruxelles', N'0123456789', N'a7581aae-75ea-45b1-a21b-460c89668619')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Commande] ON 

INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivDesiree], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (2, 2, CAST(N'2017-01-21T02:09:46.250' AS DateTime), N'Livraison terminée', CAST(N'2017-01-23T00:00:00.0000000' AS DateTime2), NULL, N'jean', N'du bois', N'monsieur', N'rue perdu 56', N'1000', N'bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivDesiree], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (3, 2, CAST(N'2017-01-21T05:19:44.043' AS DateTime), N'Livraison en cours', CAST(N'2017-01-23T00:00:00.0000000' AS DateTime2), NULL, N'jean', N'du bois', N'monsieur', N'rue perdu 56', N'1000', N'bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivDesiree], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (4, 4, CAST(N'2017-01-21T08:08:32.513' AS DateTime), N'Livraison en cours', CAST(N'2017-01-23T00:00:00.0000000' AS DateTime2), NULL, N'toto', N'sais plus', N'Madame', N'rue aussi perdu 42', N'1000', N'bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivDesiree], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (5, 2, CAST(N'2017-01-21T10:15:19.933' AS DateTime), N'En attente', CAST(N'2017-01-23T00:00:00.0000000' AS DateTime2), NULL, N'jean', N'du bois', N'Monsieur', N'rue perdu 56', N'1000', N'bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivDesiree], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (6, 2, CAST(N'2017-01-21T11:08:02.460' AS DateTime), N'En attente', CAST(N'2017-01-12T00:00:00.0000000' AS DateTime2), NULL, N'jean', N'du bois', N'Monsieur', N'rue perdu 56', N'1000', N'bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivDesiree], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (7, 5, CAST(N'2017-01-21T11:10:59.893' AS DateTime), N'En attente', CAST(N'2017-01-23T00:00:00.0000000' AS DateTime2), NULL, N'tata', N'zqgds', N'Monsieur', N'ezzeg', N'1000', N'Bruxelles')
SET IDENTITY_INSERT [dbo].[Commande] OFF
SET IDENTITY_INSERT [dbo].[DetailCommande] ON 

INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (1, 2, 12, 2, CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (2, 3, 14, 2, CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (3, 3, 13, 2, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (4, 4, 14, 2, CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (5, 4, 12, 1, CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (6, 5, 14, 1, CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (7, 6, 9, 2, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (8, 6, 7, 2, CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (9, 7, 13, 1, CAST(20.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetailCommande] OFF
SET IDENTITY_INSERT [dbo].[SousCategorie] ON 

INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (1, 1, N'Table')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (2, 1, N'Armoire')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (3, 1, N'Chaise')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (4, 1, N'Comode')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (5, 1, N'Lit')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (6, 2, N'Table')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (7, 2, N'Outils')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (8, 2, N'Parasol')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (9, 2, N'Hamac')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (10, 2, N'Chaise')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (11, 3, N'Perceuse')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (12, 3, N'Tournevis')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (13, 3, N'Marteau')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (14, 3, N'Vis')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (15, 3, N'Boulons')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (16, 4, N'Livre')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (17, 4, N'Jeux Video')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (18, 4, N'Peinture')
SET IDENTITY_INSERT [dbo].[SousCategorie] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 23-Jan-17 09:37:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 23-Jan-17 09:37:05 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 23-Jan-17 09:37:05 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 23-Jan-17 09:37:05 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 23-Jan-17 09:37:05 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 23-Jan-17 09:37:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Commande] ADD  CONSTRAINT [DF_Commande_COM_DateLivDesiree]  DEFAULT (getdate()) FOR [COM_DateLivDesiree]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_SousCategorie] FOREIGN KEY([ART_SCAT_Id])
REFERENCES [dbo].[SousCategorie] ([SCAT_Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_SousCategorie]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_AspNetUsers] FOREIGN KEY([CLI_NetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_AspNetUsers]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_Client] FOREIGN KEY([COM_CLI_Id])
REFERENCES [dbo].[Client] ([CLI_Id])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_Client]
GO
ALTER TABLE [dbo].[DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_DetailCommande_Article] FOREIGN KEY([DCOM_ART_Id])
REFERENCES [dbo].[Article] ([ART_Id])
GO
ALTER TABLE [dbo].[DetailCommande] CHECK CONSTRAINT [FK_DetailCommande_Article]
GO
ALTER TABLE [dbo].[DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_DetailCommande_Commande] FOREIGN KEY([DCOM_COM_Id])
REFERENCES [dbo].[Commande] ([COM_Id])
GO
ALTER TABLE [dbo].[DetailCommande] CHECK CONSTRAINT [FK_DetailCommande_Commande]
GO
ALTER TABLE [dbo].[SousCategorie]  WITH CHECK ADD  CONSTRAINT [FK_SousCategorie_Categorie] FOREIGN KEY([SCAT_CAT_Id])
REFERENCES [dbo].[Categorie] ([CAT_Id])
GO
ALTER TABLE [dbo].[SousCategorie] CHECK CONSTRAINT [FK_SousCategorie_Categorie]
GO
USE [master]
GO
ALTER DATABASE [WebShop] SET  READ_WRITE 
GO

--USE [Vanzari]
--GO
/****** Object:  Table [dbo].[Agenti]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agenti](
	[MarcaAgent] [int] NOT NULL,
	[CNPAgent] [nvarchar](255) NULL,
	[Nume] [nvarchar](255) NULL,
	[Prenume] [nvarchar](255) NULL,
	[DataAngajarii] [datetime] NULL,
	[SalariuIncadrare] [numeric](5, 0) NULL,
	[ProcentComisionVanzari] [real] NULL,
	[ImaginePersonala] [nvarchar](255) NULL,
	[IdUtilizator] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriiMarfuri]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriiMarfuri](
	[CodCategorie] [int] IDENTITY(1,1) NOT NULL,
	[DenumireCategorie] [nvarchar](255) NULL,
	[DenumireGamaProduse] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clienti]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clienti](
	[IdClient] [bigint] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](200) NULL,
	[Prenume] [nvarchar](200) NULL,
	[Telefon] [varchar](14) NULL,
	[email] [varchar](100) NULL,
	[Adresa] [nvarchar](500) NULL,
	[Localitate] [nvarchar](100) NULL,
	[IdUtilizator] [int] NULL,
 CONSTRAINT [PK_Clienti] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comenzi]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comenzi](
	[IdComanda] [bigint] NOT NULL,
	[NrComanda] [varchar](10) NOT NULL,
	[DataComanda] [datetime] NOT NULL,
	[MarcaAgent] [int] NOT NULL,
	[IdClient] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturi]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturi](
	[CodFactura] [bigint] IDENTITY(1,1) NOT NULL,
	[NrFactura] [decimal](19, 0) NOT NULL,
	[SerieFactura] [nvarchar](20) NOT NULL,
	[DataFactura] [datetime] NOT NULL,
	[Scadenta] [int] NOT NULL,
	[CotaTVA] [decimal](19, 2) NOT NULL,
	[CodFurnizor] [bigint] NULL,
 CONSTRAINT [PK_Facturi] PRIMARY KEY CLUSTERED 
(
	[CodFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturiVanzare]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturiVanzare](
	[IdFacturaVanzare] [bigint] IDENTITY(1,1) NOT NULL,
	[NrFactura] [int] NULL,
	[SerieFactura] [varchar](10) NULL,
	[DataFactura] [datetime] NULL,
	[ProcentTVA] [money] NULL,
	[IdComanda] [bigint] NULL,
 CONSTRAINT [PK_FacturiVanzare] PRIMARY KEY CLUSTERED 
(
	[IdFacturaVanzare] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furnizori]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furnizori](
	[CodFurnizor] [bigint] IDENTITY(1,1) NOT NULL,
	[DenumireFurnizor] [nvarchar](50) NOT NULL,
	[CodFiscal] [nvarchar](14) NOT NULL,
	[AdresaFurnizor] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Furnizori] PRIMARY KEY CLUSTERED 
(
	[CodFurnizor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Magazii]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Magazii](
	[CodMagazie] [bigint] IDENTITY(1,1) NOT NULL,
	[DenumireMagazie] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gestiuni] PRIMARY KEY CLUSTERED 
(
	[CodMagazie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marfuri]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marfuri](
	[IdMarfa] [bigint] IDENTITY(1,1) NOT NULL,
	[CodIntern] [nvarchar](255) NULL,
	[DenumireMarfa] [nvarchar](255) NULL,
	[Cantitate_per_unitate_masura] [nvarchar](255) NULL,
	[Descriere] [nvarchar](255) NULL,
	[TermenValabilitate] [int] NULL,
	[Perisabila] [bit] NOT NULL,
	[CodCategorie] [int] NULL,
	[PretMinVanzare] [money] NULL,
	[PretMaxVanzare] [money] NULL,
	[Imagine] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarfuriVandute]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarfuriVandute](
	[IdMarfaVanduta] [bigint] IDENTITY(1,1) NOT NULL,
	[IdProdusMarfa] [bigint] NOT NULL,
	[IdComanda] [bigint] NOT NULL,
	[Cantitate] [int] NULL,
	[PretVanzare] [money] NULL,
 CONSTRAINT [PK_MarfuriVandute] PRIMARY KEY CLUSTERED 
(
	[IdMarfaVanduta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NIR]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NIR](
	[CodNIR] [bigint] IDENTITY(1,1) NOT NULL,
	[NrNIR] [int] NOT NULL,
	[DataNIR] [datetime] NOT NULL,
	[CodFactura] [bigint] NOT NULL,
	[CodMagazie] [bigint] NOT NULL,
 CONSTRAINT [PK_NIR] PRIMARY KEY CLUSTERED 
(
	[CodNIR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plati]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plati](
	[IdPlata] [int] IDENTITY(1,1) NOT NULL,
	[TipPlata] [nvarchar](255) NULL,
	[DataOraPlata] [datetime] NULL,
	[SumaPlatita] [money] NULL,
	[IdComanda] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduseFacturate]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduseFacturate](
	[IdProdusFacturat] [bigint] IDENTITY(1,1) NOT NULL,
	[CodFactura] [bigint] NOT NULL,
	[CodProdus] [bigint] NOT NULL,
	[CantitateFact] [decimal](19, 2) NOT NULL,
	[PretFact] [money] NOT NULL,
 CONSTRAINT [PK_ProduseFacturate] PRIMARY KEY CLUSTERED 
(
	[IdProdusFacturat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduseFurnizori]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduseFurnizori](
	[CodProdus] [bigint] IDENTITY(1,1) NOT NULL,
	[DenumireProdus] [nvarchar](50) NULL,
	[Cantitate_per_unitate_masura] [nvarchar](150) NOT NULL,
	[PretLista] [money] NOT NULL,
 CONSTRAINT [PK_Produse] PRIMARY KEY CLUSTERED 
(
	[CodProdus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduseMarfuri]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduseMarfuri](
	[IDProdusMarfa] [bigint] IDENTITY(1,1) NOT NULL,
	[CodProdus] [bigint] NULL,
	[IdMarfa] [bigint] NULL,
	[ValoareAdaos] [money] NULL,
	[DataAdaos] [datetime] NULL,
 CONSTRAINT [PK_ProduseMarfuri] PRIMARY KEY CLUSTERED 
(
	[IDProdusMarfa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduseReceptionate]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduseReceptionate](
	[IdProdusReceptionat] [int] IDENTITY(1,1) NOT NULL,
	[CodNIR] [bigint] NOT NULL,
	[CodProdus] [bigint] NOT NULL,
	[CantitateReceptionata] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_ProduseReceptionate] PRIMARY KEY CLUSTERED 
(
	[IdProdusReceptionat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilizatori]    Script Date: 14.05.2020 08:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizatori](
	[IdUtilizator] [int] IDENTITY(1,1) NOT NULL,
	[NumeUtilizator] [nvarchar](255) NULL,
	[Parola] [nvarchar](255) NULL,
	[Blocat] [bit] NOT NULL,
	[DataCrearii] [datetime] NULL
) ON [PRIMARY]
GO
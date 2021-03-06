USE [StarSchema]
GO
/****** Object:  Table [dbo].[Fact_Content]    Script Date: 09.05.2019 21:20:15 ******/
DROP TABLE [dbo].[Fact_Content]
GO
/****** Object:  Table [dbo].[Dim_Restaurant]    Script Date: 09.05.2019 21:20:15 ******/
DROP TABLE [dbo].[Dim_Restaurant]
GO
/****** Object:  Table [dbo].[Dim_Providers]    Script Date: 09.05.2019 21:20:15 ******/
DROP TABLE [dbo].[Dim_Providers]
GO
/****** Object:  Table [dbo].[Dim_Order_Ingredients]    Script Date: 09.05.2019 21:20:15 ******/
DROP TABLE [dbo].[Dim_Order_Ingredients]
GO
/****** Object:  Table [dbo].[Dim_Ingredients]    Script Date: 09.05.2019 21:20:15 ******/
DROP TABLE [dbo].[Dim_Ingredients]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 09.05.2019 21:20:15 ******/
DROP TABLE [dbo].[Dim_Date]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 09.05.2019 21:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date] datetime NOT NULL,
	[Day] int NULL,
	[Week] int NULL,
	[Week_of_the_month] int NULL,
	[Month] int NULL,
	[Month_name] [nvarchar](50) NULL,
	[Year] int NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ingredients]    Script Date: 09.05.2019 21:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ingredients](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[units_measurement] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Order_Ingredients]    Script Date: 09.05.2019 21:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Order_Ingredients](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Ingredients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Providers]    Script Date: 09.05.2019 21:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Providers](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Providers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Restaurant]    Script Date: 09.05.2019 21:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Restaurant](
	[id] [int] NOT NULL,
	[city] [nvarchar](max) NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Content]    Script Date: 09.05.2019 21:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_provider] [int] NULL,
	[id_ingredients] [int] NULL,
	[id_restaurant] [int] NULL,
	[id_order_ingredient] [int] NULL,
	[time] [datetime] NULL,
	[price] [int] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_Fact_Content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

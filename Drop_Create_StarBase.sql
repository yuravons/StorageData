USE [StarSchema]
GO
ALTER TABLE [dbo].[Fact_Content] DROP CONSTRAINT [FK_Fact_Content_Dim_Restaurant]
GO
ALTER TABLE [dbo].[Fact_Content] DROP CONSTRAINT [FK_Fact_Content_Dim_Providers]
GO
ALTER TABLE [dbo].[Fact_Content] DROP CONSTRAINT [FK_Fact_Content_Dim_Order_Ingredients]
GO
ALTER TABLE [dbo].[Fact_Content] DROP CONSTRAINT [FK_Fact_Content_Dim_Ingredients]
GO
ALTER TABLE [dbo].[Fact_Content] DROP CONSTRAINT [FK_Fact_Content_Dim_Date]
GO
/****** Object:  Table [dbo].[Fact_Content]    Script Date: 11.05.2019 13:55:26 ******/
DROP TABLE [dbo].[Fact_Content]
GO
/****** Object:  Table [dbo].[Dim_Restaurant]    Script Date: 11.05.2019 13:55:26 ******/
DROP TABLE [dbo].[Dim_Restaurant]
GO
/****** Object:  Table [dbo].[Dim_Providers]    Script Date: 11.05.2019 13:55:26 ******/
DROP TABLE [dbo].[Dim_Providers]
GO
/****** Object:  Table [dbo].[Dim_Order_Ingredients]    Script Date: 11.05.2019 13:55:26 ******/
DROP TABLE [dbo].[Dim_Order_Ingredients]
GO
/****** Object:  Table [dbo].[Dim_Ingredients]    Script Date: 11.05.2019 13:55:26 ******/
DROP TABLE [dbo].[Dim_Ingredients]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 11.05.2019 13:55:26 ******/
DROP TABLE [dbo].[Dim_Date]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 11.05.2019 13:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date] [datetime] NOT NULL,
	[Day] [int] NULL,
	[Week] [int] NULL,
	[Week_of_the_month] [int] NULL,
	[Month] [int] NULL,
	[Month_name] [nvarchar](50) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ingredients]    Script Date: 11.05.2019 13:55:26 ******/
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
/****** Object:  Table [dbo].[Dim_Order_Ingredients]    Script Date: 11.05.2019 13:55:26 ******/
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
/****** Object:  Table [dbo].[Dim_Providers]    Script Date: 11.05.2019 13:55:26 ******/
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
/****** Object:  Table [dbo].[Dim_Restaurant]    Script Date: 11.05.2019 13:55:26 ******/
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
/****** Object:  Table [dbo].[Fact_Content]    Script Date: 11.05.2019 13:55:26 ******/
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
ALTER TABLE [dbo].[Fact_Content]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Content_Dim_Date] FOREIGN KEY([time])
REFERENCES [dbo].[Dim_Date] ([Date])
GO
ALTER TABLE [dbo].[Fact_Content] CHECK CONSTRAINT [FK_Fact_Content_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Content]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Content_Dim_Ingredients] FOREIGN KEY([id_ingredients])
REFERENCES [dbo].[Dim_Ingredients] ([id])
GO
ALTER TABLE [dbo].[Fact_Content] CHECK CONSTRAINT [FK_Fact_Content_Dim_Ingredients]
GO
ALTER TABLE [dbo].[Fact_Content]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Content_Dim_Order_Ingredients] FOREIGN KEY([id_order_ingredient])
REFERENCES [dbo].[Dim_Order_Ingredients] ([id])
GO
ALTER TABLE [dbo].[Fact_Content] CHECK CONSTRAINT [FK_Fact_Content_Dim_Order_Ingredients]
GO
ALTER TABLE [dbo].[Fact_Content]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Content_Dim_Providers] FOREIGN KEY([id_provider])
REFERENCES [dbo].[Dim_Providers] ([id])
GO
ALTER TABLE [dbo].[Fact_Content] CHECK CONSTRAINT [FK_Fact_Content_Dim_Providers]
GO
ALTER TABLE [dbo].[Fact_Content]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Content_Dim_Restaurant] FOREIGN KEY([id_restaurant])
REFERENCES [dbo].[Dim_Restaurant] ([id])
GO
ALTER TABLE [dbo].[Fact_Content] CHECK CONSTRAINT [FK_Fact_Content_Dim_Restaurant]
GO

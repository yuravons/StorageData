USE [StagingBase]
GO
/****** Object:  Table [dbo].[units_of_measurement]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[units_of_measurement]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[statuses]
GO
/****** Object:  Table [dbo].[restaurants]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[restaurants]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[providers]
GO
/****** Object:  Table [dbo].[order_ingredients]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[order_ingredients]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[ingredients]
GO
/****** Object:  Table [dbo].[content_order_ingredients]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[content_order_ingredients]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 09.05.2019 21:17:06 ******/
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [int] NULL,
	[city] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_order_ingredients]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_order_ingredients](
	[id] [int] NULL,
	[count] [int] NULL,
	[price] [int] NULL,
	[order_ingredients_id] [int] NULL,
	[ingredient_id] [int] NULL,
	[unit_of_measurement_id] [int] NULL,
	[restaurant_id] [int] NULL,
	[time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[id] [int] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_ingredients]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_ingredients](
	[id] [int] NULL,
	[order_time] [datetime] NULL,
	[execute_time] [datetime] NULL,
	[provider_id] [int] NULL,
	[status_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[providers](
	[id] [int] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurants]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurants](
	[id] [int] NULL,
	[city_id] [int] NULL,
	[street] [nvarchar](max) NULL,
	[phone] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statuses](
	[id] [int] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[units_of_measurement]    Script Date: 09.05.2019 21:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[units_of_measurement](
	[id] [int] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO

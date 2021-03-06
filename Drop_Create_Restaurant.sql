USE [Restaurant]
GO
ALTER TABLE [dbo].[storage_ingredient] DROP CONSTRAINT [FK__storage_i__unit___59FA5E80]
GO
ALTER TABLE [dbo].[storage_ingredient] DROP CONSTRAINT [FK__storage_i__ingre__5AEE82B9]
GO
ALTER TABLE [dbo].[shipment] DROP CONSTRAINT [FK_storage_ingredients]
GO
ALTER TABLE [dbo].[shipment] DROP CONSTRAINT [FK_contents]
GO
ALTER TABLE [dbo].[restaurants] DROP CONSTRAINT [FK__restauran__city___5FB337D6]
GO
ALTER TABLE [dbo].[recipes] DROP CONSTRAINT [FK_menus]
GO
ALTER TABLE [dbo].[recipes] DROP CONSTRAINT [FK_ingredient]
GO
ALTER TABLE [dbo].[recipes] DROP CONSTRAINT [FK__recipes__unit_of__5629CD9C]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__waiter_i__412EB0B6]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__table_id__403A8C7D]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__status_i__3F466844]
GO
ALTER TABLE [dbo].[order_ingredients] DROP CONSTRAINT [FK__order_ing__statu__4BAC3F29]
GO
ALTER TABLE [dbo].[order_ingredients] DROP CONSTRAINT [FK__order_ing__provi__4AB81AF0]
GO
ALTER TABLE [dbo].[menu] DROP CONSTRAINT [FK__menu__type_dish___45F365D3]
GO
ALTER TABLE [dbo].[cooking] DROP CONSTRAINT [FK__cooking__status___693CA210]
GO
ALTER TABLE [dbo].[cooking] DROP CONSTRAINT [FK__cooking__check_i__68487DD7]
GO
ALTER TABLE [dbo].[content_order_ingredients] DROP CONSTRAINT [FK_order_ingredients]
GO
ALTER TABLE [dbo].[content_order_ingredients] DROP CONSTRAINT [FK_ingredients]
GO
ALTER TABLE [dbo].[content_order_ingredients] DROP CONSTRAINT [FK__content_o__unit___6477ECF3]
GO
ALTER TABLE [dbo].[content_order_ingredients] DROP CONSTRAINT [FK__content_o__resta__656C112C]
GO
ALTER TABLE [dbo].[checks] DROP CONSTRAINT [FK_orders]
GO
ALTER TABLE [dbo].[checks] DROP CONSTRAINT [FK_menu]
GO
/****** Object:  Table [dbo].[waiters]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[waiters]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[units_of_measurement]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[units_of_measurement]
GO
/****** Object:  Table [dbo].[type_dish]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[type_dish]
GO
/****** Object:  Table [dbo].[storage_ingredient]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[storage_ingredient]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[statuses]
GO
/****** Object:  Table [dbo].[shipment]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[shipment]
GO
/****** Object:  Table [dbo].[restaurants]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[restaurants]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[recipes]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[providers]
GO
/****** Object:  Table [dbo].[platens]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[platens]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[orders]
GO
/****** Object:  Table [dbo].[order_ingredients]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[order_ingredients]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[menu]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[ingredients]
GO
/****** Object:  Table [dbo].[cooking]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[cooking]
GO
/****** Object:  Table [dbo].[content_order_ingredients]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[content_order_ingredients]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[checks]    Script Date: 09.05.2019 21:39:40 ******/
DROP TABLE [dbo].[checks]
GO
/****** Object:  Table [dbo].[checks]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[menu_id] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_order_ingredients]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_order_ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[price] [int] NOT NULL,
	[order_ingredients_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[unit_of_measurement_id] [int] NULL,
	[restaurant_id] [int] NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cooking]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cooking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[receive_time] [datetime] NOT NULL,
	[execute_time] [datetime] NOT NULL,
	[check_id] [int] NULL,
	[status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_of_measurement_id] [int] NOT NULL,
	[type_dish_id] [int] NULL,
	[dish_name] [nvarchar](50) NOT NULL,
	[size] [int] NOT NULL,
	[price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_ingredients]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_time] [datetime] NOT NULL,
	[execute_time] [datetime] NOT NULL,
	[provider_id] [int] NULL,
	[status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time] [date] NOT NULL,
	[status_id] [int] NULL,
	[table_id] [int] NULL,
	[waiter_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platens]    Script Date: 09.05.2019 21:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[people_amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[providers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[count] [int] NOT NULL,
	[unit_of_measurement_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurants]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NULL,
	[street] [nvarchar](max) NULL,
	[phone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipment]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_content] [int] NOT NULL,
	[id_storage_ingredient] [int] NOT NULL,
	[time] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_ingredient]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_ingredient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[unit_of_measurement_id] [int] NULL,
	[ingredient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_dish]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_dish](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[units_of_measurement]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[units_of_measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[waiters]    Script Date: 09.05.2019 21:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[waiters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checks]  WITH CHECK ADD  CONSTRAINT [FK_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[menu] ([id])
GO
ALTER TABLE [dbo].[checks] CHECK CONSTRAINT [FK_menu]
GO
ALTER TABLE [dbo].[checks]  WITH CHECK ADD  CONSTRAINT [FK_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[checks] CHECK CONSTRAINT [FK_orders]
GO
ALTER TABLE [dbo].[content_order_ingredients]  WITH CHECK ADD FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[restaurants] ([id])
GO
ALTER TABLE [dbo].[content_order_ingredients]  WITH CHECK ADD FOREIGN KEY([unit_of_measurement_id])
REFERENCES [dbo].[units_of_measurement] ([id])
GO
ALTER TABLE [dbo].[content_order_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_ingredients] FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([id])
GO
ALTER TABLE [dbo].[content_order_ingredients] CHECK CONSTRAINT [FK_ingredients]
GO
ALTER TABLE [dbo].[content_order_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_order_ingredients] FOREIGN KEY([order_ingredients_id])
REFERENCES [dbo].[order_ingredients] ([id])
GO
ALTER TABLE [dbo].[content_order_ingredients] CHECK CONSTRAINT [FK_order_ingredients]
GO
ALTER TABLE [dbo].[cooking]  WITH CHECK ADD FOREIGN KEY([check_id])
REFERENCES [dbo].[checks] ([id])
GO
ALTER TABLE [dbo].[cooking]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[statuses] ([id])
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD FOREIGN KEY([type_dish_id])
REFERENCES [dbo].[type_dish] ([id])
GO
ALTER TABLE [dbo].[order_ingredients]  WITH CHECK ADD FOREIGN KEY([provider_id])
REFERENCES [dbo].[providers] ([id])
GO
ALTER TABLE [dbo].[order_ingredients]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[statuses] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[statuses] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[platens] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([waiter_id])
REFERENCES [dbo].[waiters] ([id])
GO
ALTER TABLE [dbo].[recipes]  WITH CHECK ADD FOREIGN KEY([unit_of_measurement_id])
REFERENCES [dbo].[units_of_measurement] ([id])
GO
ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FK_ingredient] FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([id])
GO
ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [FK_ingredient]
GO
ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FK_menus] FOREIGN KEY([menu_id])
REFERENCES [dbo].[menu] ([id])
GO
ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [FK_menus]
GO
ALTER TABLE [dbo].[restaurants]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([id])
GO
ALTER TABLE [dbo].[shipment]  WITH CHECK ADD  CONSTRAINT [FK_contents] FOREIGN KEY([id_content])
REFERENCES [dbo].[content_order_ingredients] ([id])
GO
ALTER TABLE [dbo].[shipment] CHECK CONSTRAINT [FK_contents]
GO
ALTER TABLE [dbo].[shipment]  WITH CHECK ADD  CONSTRAINT [FK_storage_ingredients] FOREIGN KEY([id_storage_ingredient])
REFERENCES [dbo].[storage_ingredient] ([id])
GO
ALTER TABLE [dbo].[shipment] CHECK CONSTRAINT [FK_storage_ingredients]
GO
ALTER TABLE [dbo].[storage_ingredient]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([id])
GO
ALTER TABLE [dbo].[storage_ingredient]  WITH CHECK ADD FOREIGN KEY([unit_of_measurement_id])
REFERENCES [dbo].[units_of_measurement] ([id])
GO

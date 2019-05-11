--офіціант
CREATE TABLE dbo.waiters(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[name][nvarchar](50) NOT NULL
)

--постачальники
CREATE TABLE dbo.providers(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[name][nvarchar](50) NOT NULL
)

--столики
CREATE TABLE dbo.platens(
    [id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[number][int] NOT NULL,
	[people_amount][int] NOT NULL,
)

--статус
CREATE TABLE dbo.statuses(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[name][nvarchar](50) NOT NULL
)

--замовлення
CREATE TABLE dbo.orders(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[time][date] NOT NULL, 
	[status_id] [int] FOREIGN KEY REFERENCES statuses(id),
	[table_id] [int] FOREIGN KEY REFERENCES platens(id),
	[waiter_id] [int] FOREIGN KEY REFERENCES waiters(id),
)

--Тип страви
CREATE TABLE dbo.type_dish(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[type][nvarchar](50) NOT NULL
)

--меню
CREATE TABLE dbo.menu(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[unit_of_measurement_id][int] NOT NULL,
	[type_dish_id][int] FOREIGN KEY REFERENCES type_dish(id), 
	[dish_name][nvarchar](50) NOT NULL,
	[size][int] NOT NULL,
	[price][int] NOT NULL
)

--інгредієнт
CREATE TABLE dbo.ingredients(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[name][nvarchar](50) NOT NULL,
)

--замовлення інгредієнтів
CREATE TABLE dbo.order_ingredients(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[order_time][datetime] NOT NULL,
	[execute_time][datetime] NOT NULL,
	[provider_id][int] FOREIGN KEY REFERENCES providers(id),
	[status_id][int] FOREIGN KEY REFERENCES statuses(id)
)

--чек
CREATE TABLE dbo.checks(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[order_id][int] NOT NULL,
	[menu_id][int] NOT NULL,
	[count][int] NOT NULL,
    CONSTRAINT FK_orders FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT FK_menu FOREIGN KEY (menu_id) REFERENCES menu(id),
)

--одиниці виміру
CREATE TABLE dbo.units_of_measurement(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[name][nvarchar](50) NOT NULL,
)

--рецепт
CREATE TABLE dbo.recipes(
    [id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[menu_id][int] NOT NULL,
	[ingredient_id][int] NOT NULL,
	[count][int] NOT NULL,
    CONSTRAINT FK_menus FOREIGN KEY (menu_id) REFERENCES menu(id),
    CONSTRAINT FK_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    [unit_of_measurement_id][int] FOREIGN KEY REFERENCES units_of_measurement(id)
)

--склад інгредієнтів
CREATE TABLE dbo.storage_ingredient(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[count][int] NOT NULL,
	[unit_of_measurement_id][int] FOREIGN KEY REFERENCES units_of_measurement(id),
	[ingredient_id][int] UNIQUE FOREIGN KEY REFERENCES ingredients(id)
)

CREATE TABLE dbo.cities (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	city NVARCHAR(max) NULL
)

CREATE TABLE dbo.restaurants (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	city_id INT NULL FOREIGN KEY REFERENCES dbo.cities(id),
	street NVARCHAR(max) NULL,
	phone INT NULL
)

--вміст замовлення інгредієнтів
CREATE TABLE dbo.content_order_ingredients(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[count][int] NOT NULL,
	[price][int] NOT NULL,
	[order_ingredients_id][int] NOT NULL,
	[ingredient_id][int] NOT NULL,
    CONSTRAINT FK_order_ingredients FOREIGN KEY (order_ingredients_id) REFERENCES order_ingredients(id),
    CONSTRAINT FK_ingredients FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
	[unit_of_measurement_id][int] FOREIGN KEY REFERENCES units_of_measurement(id),
	[restaurant_id][INT] NULL FOREIGN KEY REFERENCES dbo.restaurants(id),
	[time][datetime]NULL
)

--приготування страв
CREATE TABLE dbo.cooking(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[receive_time][datetime] NOT NULL,
	[execute_time][datetime] NOT NULL,
	[check_id][int] FOREIGN KEY REFERENCES checks(id),
	[status_id][int] FOREIGN KEY REFERENCES statuses(id)
)


--відвантаження
CREATE TABLE dbo.shipment(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[id_content][int] NOT NULL,
	[id_storage_ingredient][int] NOT NULL,
	[time][date] NOT NULL,
    CONSTRAINT FK_storage_ingredients FOREIGN KEY (id_storage_ingredient) REFERENCES storage_ingredient(id),
    CONSTRAINT FK_contents FOREIGN KEY (id_content) REFERENCES content_order_ingredients(id),
)

--користувачі
CREATE TABLE dbo.users(
	[id][int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[login][nvarchar](50) NOT NULL,
	[password][nvarchar](50) NOT NULL
)

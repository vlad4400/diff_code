-- SOURCE DATABASE -----------------------------------------------
DROP DATABASE IF EXISTS `shop`;
CREATE SCHEMA `shop` DEFAULT CHARACTER SET utf8;

USE `shop`;

CREATE TABLE `catalogs` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`)
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO `shop`.`catalogs` (`name`) VALUES ('sdaf1');
INSERT INTO `shop`.`catalogs` (`name`) VALUES (DEFAULT);
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('asdf3');
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('asdf3');
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('asdf3');
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('asdf3');
INSERT INTO `shop`.`catalogs` (`name`) VALUES (DEFAULT);
INSERT INTO `shop`.`catalogs` (`name`) VALUES (DEFAULT);
INSERT INTO `shop`.`catalogs` (`name`) VALUES (DEFAULT);
INSERT INTO `shop`.`catalogs` (`name`) VALUES (DEFAULT);
INSERT INTO `shop`.`catalogs` (`name`) VALUES (DEFAULT);
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('asdf3');
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('sdaf4');
INSERT INTO `shop`.`catalogs` (`name`) VALUES ('sdaf5');

UPDATE `catalogs`
SET  `name` = 'empty'
WHERE `name` IS NULL;

CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
) COMMENT = 'Покупатели';

CREATE TABLE products (
  id INT UNSIGNED NOT NULL,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Товарные позиции';

CREATE TABLE orders (
  id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Заказы';

CREATE TABLE orders_products (
  id INT UNSIGNED NOT NULL,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

CREATE TABLE discounts (
  id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  finished_at DATETIME NULL,
  started_at DATETIME NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Скидки';

CREATE TABLE storehouses (
  id INT UNSIGNED NOT NULL,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

CREATE TABLE storehouses_products (
  id INT UNSIGNED AUTO_INCREMENT,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
) COMMENT = 'Запасы на складе';

INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2000-02-01');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-03-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-03-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-03-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-02-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2000-02-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2000-02-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf5', '2000-02-05');

UPDATE `shop`.`users`
SET created_at = NULL, updated_at = NULL;


-- TASK 1 --------------------------------------------------------
SELECT * FROM `shop`.`users`; -- origin table

UPDATE `shop`.`users`
SET created_at = NOW(), updated_at = NOW();

SELECT * FROM `shop`.`users`; -- after change


-- TASK 2 --------------------------------------------------------

-- changed source database
ALTER TABLE `shop`.`users`
MODIFY `created_at` VARCHAR(255),
MODIFY `updated_at` VARCHAR(255);

DELETE FROM `shop`.`users`;

INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-03-05', '20.10.2017 8:10', '20.10.2017 8:10');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-05-05', '20.01.2017 9:14', '21.12.2017 8:10');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-10-05', '21.12.2017 8:10', '20.10.2017 8:10');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-02-05', '20.10.2017 18:45', '11.10.2017 8:20');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-05-05', '30.05.2017 12:10', '20.10.2017 8:10');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-08-05', '11.10.2017 8:20', '20.10.2017 8:10');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-02-05', '08.11.2017 5:50', '20.10.2017 13:00');
INSERT INTO `shop`.`users` (`name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('sdaf4', '2000-02-05', '20.10.2017 13:00', '30.05.2017 12:10');

-- queries
SELECT * FROM `shop`.`users`; -- origin table

UPDATE `shop`.`users`
SET created_at = STR_TO_DATE(`created_at`, '%d.%m.%Y %H:%i'),
updated_at = STR_TO_DATE(`updated_at`, '%d.%m.%Y %H:%i');

SELECT * FROM `shop`.`users`; -- after change


-- TASK 3 --------------------------------------------------------

-- changed source database
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('1', '4', '5');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('3', '1', '1');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('2', '2', '0');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('1', '4', '2');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('4', '3', '0');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('2', '4', '2');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('1', '2', '9');


-- queries
SELECT * FROM `shop`.`storehouses_products`; -- origin table

SELECT * FROM `shop`.`storehouses_products`
ORDER BY CASE 
  WHEN `value` = 0 THEN ~0 ELSE `value`
END;


-- TASK 4 --------------------------------------------------------

-- changed source database
ALTER TABLE `shop`.`users`
ADD `moon` VARCHAR(9) AS (LOWER(DATE_FORMAT(`birthday_at`, '%M')));

-- queries
SELECT * FROM `shop`.`users`; -- origin table

SELECT * FROM `shop`.`users`
WHERE `moon` = 'may' OR `moon` = 'august';


-- TASK 5 --------------------------------------------------------

-- queries
SELECT * FROM `shop`.`catalogs`
WHERE id IN (5, 1, 2); -- origin table

SELECT * FROM `shop`.`catalogs`
WHERE `id` IN (5, 1, 2)
ORDER BY CASE 
  WHEN `id` = 5 THEN 1
  WHEN `id` = 1 THEN 2
  WHEN `id` = 2 THEN 3
END;

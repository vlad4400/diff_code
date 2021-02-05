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

INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-01-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '1990-02-01');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '1995-05-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2003-03-03');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2002-03-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '1975-02-02');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-05-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2015-12-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2002-02-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2010-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-05-02');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2001-02-03');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf5', '1993-02-05');

SELECT 'SOURCE TABLE';
SELECT *
FROM `shop`.`users`;


-- TASK 1 --------------------------------------------------------
SELECT 'TASK 1';

SELECT *, TIMESTAMPDIFF(YEAR, CONCAT(YEAR(CURDATE()), SUBSTRING(`birthday_at`, 5)), CURDATE()) AS 'have years'
FROM `shop`.`users`;


-- TASK 2 --------------------------------------------------------
SELECT 'TASK 2';

SELECT DAYOFWEEK(`birthday_at`) AS day, COUNT(`birthday_at`)
FROM `shop`.`users`
GROUP BY day;

-- TASK 3 --------------------------------------------------------
SELECT 'TASK 3';

CREATE TABLE `shop`.`values` (
    `value` INT
);

INSERT INTO `shop`.`values` (`value`) VALUES (1);
INSERT INTO `shop`.`values` (`value`) VALUES (2);
INSERT INTO `shop`.`values` (`value`) VALUES (3);
INSERT INTO `shop`.`values` (`value`) VALUES (4);
INSERT INTO `shop`.`values` (`value`) VALUES (5);

-- SELECT `value`, MUL(`value`)
-- FROM `shop`.`values`
-- GROUP BY `value`
-- WITH ROLLUP;

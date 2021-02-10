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
  `description` TEXT COMMENT 'Описание',
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
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2002-08-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-02-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '1975-08-02');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2000-05-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2015-12-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2002-02-06');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf1', '2010-08-05');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('asdf3', '2000-05-02');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf4', '2001-02-03');
INSERT INTO `shop`.`users` (`name`, `birthday_at`) VALUES ('sdaf5', '1993-02-05');

ALTER TABLE `shop`.`users`
ADD `moon` VARCHAR(9) AS (LOWER(DATE_FORMAT(`birthday_at`, '%M')));

INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('1', '4', '5');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('3', '1', '1');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('2', '2', '0');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('1', '4', '2');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('4', '3', '0');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('2', '4', '2');
INSERT INTO `shop`.`storehouses_products` (`storehouse_id`, `product_id`, `value`) VALUES ('1', '2', '9');

INSERT INTO `users` (`name`) VALUES ('Jack Johnson');
INSERT INTO `users` (`name`) VALUES ('Peter Nowalk');
INSERT INTO `users` (`name`) VALUES ('Alan Rickman');
INSERT INTO `users` (`name`) VALUES ('jennifer allison');

INSERT INTO `shop`.`orders` (`id`, `user_id`) VALUES ('1', '2');
INSERT INTO `shop`.`orders` (`id`, `user_id`) VALUES ('2', '11');
INSERT INTO `shop`.`orders` (`id`, `user_id`) VALUES ('3', '2');
INSERT INTO `shop`.`orders` (`id`, `user_id`) VALUES ('4', '6');

INSERT INTO `shop`.`products` (`id`, `name`, `description`, `price`, `catalog_id`) VALUES ('1', 'Футболка', 'Прикольная штука', '139', '3');
INSERT INTO `shop`.`products` (`id`, `name`, `description`, `price`, `catalog_id`) VALUES ('2', 'Майка', 'Прикольная штука', '15', '12');
INSERT INTO `shop`.`products` (`id`, `name`, `description`, `price`, `catalog_id`) VALUES ('3', 'Штаны', 'Прикольная штука', '245', '6');
INSERT INTO `shop`.`products` (`id`, `name`, `description`, `price`, `catalog_id`) VALUES ('4', 'Носки', 'Прикольная штука', '19', '4');

CREATE TABLE `shop`.`logs` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `table_name` VARCHAR(15),
  `name` VARCHAR(25),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`)
) ENGINE=Archive;


-- TASK 1 --------------------------------------------------------
SELECT 'TASK 1';

DROP TRIGGER IF EXISTS `shop`.`before_insert_users`//
CREATE TRIGGER `shop`.`before_insert_users` 
BEFORE INSERT ON `shop`.`users`
FOR EACH ROW
BEGIN
  INSERT INTO `shop`.`logs` (`table_name`, `name`) 
  VALUES ('users', NEW.name);
END//

DROP TRIGGER IF EXISTS `shop`.`before_insert_catalogs`//
CREATE TRIGGER `shop`.`before_insert_catalogs` 
BEFORE INSERT ON `shop`.`catalogs`
FOR EACH ROW
BEGIN
  INSERT INTO `shop`.`logs` (`table_name`, `name`) 
  VALUES ('catalogs', NEW.name);
END//

DROP TRIGGER IF EXISTS `shop`.`before_insert_products`//
CREATE TRIGGER `shop`.`before_insert_products` 
BEFORE INSERT ON `shop`.`products`
FOR EACH ROW
BEGIN
  INSERT INTO `shop`.`logs` (`table_name`, `name`) 
  VALUES ('products', NEW.name);
END//

INSERT INTO `shop`.`users` (`name`, `birthday_at`) 
VALUES ('asdf3', '2003-03-03');

INSERT INTO `shop`.`catalogs` (`name`) VALUES ('asdf3');

INSERT INTO `shop`.`products` (`id`, `name`, `description`) 
VALUES ('5', 'Носки2', 'Прикольная штука');

-- TASK 2 --------------------------------------------------------
SELECT 'TASK 2';


CREATE PROCEDURE create_new_users(IN n INT)
BEGIN
  WHILE n > 0 DO
    SET n = n - 1;
    INSERT INTO `shop`.`users` (`name`, `birthday_at`) 
    VALUES ('miln', '2002-02-20');
  END WHILE;
END//

SELECT COUNT(*) FROM users;
CALL create_new_users(100);
SELECT COUNT(*) FROM users;


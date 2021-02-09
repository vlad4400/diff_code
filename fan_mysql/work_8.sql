-- SOURCE DATABASE -----------------------------------------------
DROP DATABASE IF EXISTS `shop`;
CREATE SCHEMA `shop` DEFAULT CHARACTER SET utf8;

CREATE TABLE `shop`.`products` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) COMMENT 'Название',
  `description` TEXT COMMENT 'Описание',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Товарные позиции';

INSERT INTO `shop`.`products` (`id`, `name`, `description`) VALUES ('1', 'Футболка', 'Прикольная штука');
INSERT INTO `shop`.`products` (`id`, `name`, `description`) VALUES ('2', 'Майка', 'Прикольная штука');
INSERT INTO `shop`.`products` (`id`, `name`, `description`) VALUES ('3', 'Штаны', 'Прикольная штука');
INSERT INTO `shop`.`products` (`id`, `name`, `description`) VALUES ('4', 'Носки', 'Прикольная штука');

-- TASK 1 --------------------------------------------------------
SELECT 'TASK 1';

DROP FUNCTION IF EXISTS `shop`.`hello`//
CREATE FUNCTION `shop`.`hello` ()
RETURNS TEXT DETERMINISTIC
BEGIN
  SET @hour := HOUR(NOW());
  IF (@hour < 6) THEN
    SET @mess := 'Goodnight';
  ELSEIF (@hour < 12) THEN
    SET @mess := 'Good morning';
  ELSEIF (@hour < 18) THEN
    SET @mess := 'Good day';
  ELSEIF (@hour < 24) THEN
    SET @mess := 'Good evening';
  END IF;
  RETURN (SELECT @mess);
END//

SELECT `shop`.`hello`()//

-- TASK 2 --------------------------------------------------------
SELECT 'TASK 2';

DROP TRIGGER IF EXISTS `shop`.`before_insert_products`//
CREATE TRIGGER `shop`.`before_insert_products` 
BEFORE INSERT ON `shop`.`products`
FOR EACH ROW
BEGIN
  IF ((ISNULL(NEW.name)) AND (ISNULL(NEW.description))) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled';
  END IF;
END//

INSERT INTO `shop`.`products` (`id`, `name`, `description`) VALUES ('5', 'Носки2', 'Прикольная штука');
-- for test trigger
-- INSERT INTO `shop`.`products` (`id`) VALUES ('6');

-- TASK 3 --------------------------------------------------------
SELECT 'TASK 3';

DROP FUNCTION IF EXISTS `shop`.`FIBONACCI`//
CREATE FUNCTION `shop`.`FIBONACCI` (i INT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE n_m2, n_m1 INT DEFAULT 1;
  DECLARE n INT DEFAULT n_m2 + n_m1;

  IF (i > 0) THEN
    cycle: WHILE i >= 2 DO
      SET i := i - 1;
      SET n_m2 := n_m1;
      SET n_m1 := n;
      SET n := n_m2 + n_m1;
    END WHILE cycle;
  ELSE
    SET n_m2 := 0;
  END IF;

  RETURN n_m2;
END//

SELECT `shop`.`FIBONACCI` (10);

DROP TABLE IF EXISTS `sample`.`cat`;
CREATE TABLE `sample`.`cat` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

-- for test
-- INSERT INTO `sample`.`cat` 
--   SELECT * FROM `shop`.`catalogs`;

INSERT INTO `sample`.`cat` (`name`)
  SELECT `name` FROM `shop`.`catalogs`;

SELECT * FROM `shop`.`catalogs`;
SELECT * FROM `sample`.`cat`;
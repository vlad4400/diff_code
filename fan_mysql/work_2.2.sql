DROP DATABASE IF EXISTS `db_media`;
CREATE SCHEMA `db_media` DEFAULT CHARACTER SET utf8;

USE `db_media`;

CREATE TABLE `repository` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `id_user` INT UNSIGNED NOT NULL,
  `src` VARCHAR(128) NOT NULL,
  `src_type` TINYINT UNSIGNED NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE `users` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT 'Имя пользователя',
  PRIMARY KEY (`id`)) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE `src_types` (
  `id_src_type` TINYINT UNSIGNED AUTO_INCREMENT,
  `src_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_src_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE `src-keyword` (
  `id_src` INT UNSIGNED NOT NULL,
  `id_keyword` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_src`, `id_keyword`));

CREATE TABLE `keywords` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
UNIQUE INDEX `keyword_UNIQUE` (`keyword` ASC) VISIBLE);

ALTER TABLE `repository` 
ADD INDEX `fk_id_user_idx` (`id_user` ASC) VISIBLE;

ALTER TABLE `repository` 
ADD CONSTRAINT `fk_id_user`
  FOREIGN KEY (`id_user`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `repository` 
ADD INDEX `fk_src_type_idx` (`src_type` ASC) VISIBLE;

ALTER TABLE `repository` 
ADD CONSTRAINT `fk_src_type`
  FOREIGN KEY (`src_type`)
  REFERENCES `src_types` (`id_src_type`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `src-keyword` 
ADD INDEX `fk_id_keyword_idx` (`id_keyword` ASC) VISIBLE;

ALTER TABLE `src-keyword` 
ADD CONSTRAINT `fk_id_repository`
  FOREIGN KEY (`id_src`)
  REFERENCES `repository` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_id_keyword`
  FOREIGN KEY (`id_keyword`)
  REFERENCES `keywords` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `users` (`name`) VALUES ('Jack Johnson');
INSERT INTO `users` (`name`) VALUES ('Peter Nowalk');
INSERT INTO `users` (`name`) VALUES ('Alan Rickman');
INSERT INTO `users` (`name`) VALUES ('jennifer allison');

INSERT INTO `src_types` (`src_type`) VALUES ('img');
INSERT INTO `src_types` (`src_type`) VALUES ('audio');
INSERT INTO `src_types` (`src_type`) VALUES ('video');

INSERT INTO `keywords` (`keyword`) VALUES ('moon');
INSERT INTO `keywords` (`keyword`) VALUES ('river');
INSERT INTO `keywords` (`keyword`) VALUES ('woods');
INSERT INTO `keywords` (`keyword`) VALUES ('people');
INSERT INTO `keywords` (`keyword`) VALUES ('white');
INSERT INTO `keywords` (`keyword`) VALUES ('alive');
INSERT INTO `keywords` (`keyword`) VALUES ('night');
INSERT INTO `keywords` (`keyword`) VALUES ('way');
INSERT INTO `keywords` (`keyword`) VALUES ('dog');
INSERT INTO `keywords` (`keyword`) VALUES ('star');
INSERT INTO `keywords` (`keyword`) VALUES ('actor');
INSERT INTO `keywords` (`keyword`) VALUES ('horror');
INSERT INTO `keywords` (`keyword`) VALUES ('shadow');
INSERT INTO `keywords` (`keyword`) VALUES ('heart');

INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (2, './img/filename1.img', 1, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (1, './video/filename2.mp4', 3, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (4, './img/filename3.img', 1, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (1, './img/filename4.img', 1, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (3, './img/filename5.img', 1, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (1, './audio/filename6.mp3', 2, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (3, './audio/filename7.mp3', 2, 'Lorem  ip sun ala reon.');
INSERT INTO `repository` (`id_user`, `src`, `src_type`, `description`) 
  VALUES (4, './img/filename8.img', 1, 'Lorem  ip sun ala reon.');

INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (4, 2);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (1, 4);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (4, 4);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (2, 5);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (4, 3);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (3, 5);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (7, 2);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (1, 6);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (4, 5);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (5, 3);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (6, 5);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (2, 6);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (2, 2);
INSERT INTO `src-keyword` (`id_src`, `id_keyword`) VALUES (2, 1);

SELECT * FROM `repository`;
SELECT * FROM `users`;
SELECT * FROM `src_types`;
SELECT * FROM `src-keyword`;
SELECT * FROM `keywords`;
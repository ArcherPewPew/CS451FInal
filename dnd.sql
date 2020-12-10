-- MySQL Script generated by MySQL Workbench
-- Thu Dec 10 02:42:00 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dnd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dnd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dnd` DEFAULT CHARACTER SET utf8 ;
USE `dnd` ;

-- -----------------------------------------------------
-- Table `dnd`.`gamemaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`gamemaster` (
  `idgamemaster` INT(11) NOT NULL,
  `gmname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgamemaster`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`sourcebooks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`sourcebooks` (
  `idsourcebooks` INT(11) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `difficulty` INT(11) NOT NULL COMMENT 'difficulty is 1-10',
  PRIMARY KEY (`idsourcebooks`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`weekdays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`weekdays` (
  `idweekdays` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idweekdays`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`campaign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`campaign` (
  `idcampaign` INT(11) NOT NULL,
  `gamemaster_idgamemaster` INT(11) NOT NULL,
  `sourcebooks_idsourcebooks` INT(11) NOT NULL,
  `weekdays_idweekdays` INT(11) NOT NULL,
  PRIMARY KEY (`idcampaign`, `gamemaster_idgamemaster`),
  INDEX `fk_campaign_sourcebooks_idx` (`sourcebooks_idsourcebooks` ASC) ,
  INDEX `fk_campaign_weekdays1_idx` (`weekdays_idweekdays` ASC) ,
  INDEX `fk_campaign_gamemaster1_idx` (`gamemaster_idgamemaster` ASC) ,
  CONSTRAINT `fk_campaign_gamemaster1`
    FOREIGN KEY (`gamemaster_idgamemaster`)
    REFERENCES `dnd`.`gamemaster` (`idgamemaster`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campaign_sourcebooks`
    FOREIGN KEY (`sourcebooks_idsourcebooks`)
    REFERENCES `dnd`.`sourcebooks` (`idsourcebooks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campaign_weekdays1`
    FOREIGN KEY (`weekdays_idweekdays`)
    REFERENCES `dnd`.`weekdays` (`idweekdays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`player` (
  `idplayer` INT(11) NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idplayer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`class` (
  `idclass` INT NOT NULL,
  `cname` VARCHAR(45) NOT NULL,
  `hit value` INT NOT NULL,
  `health value` INT NOT NULL,
  `armor value` INT NOT NULL,
  PRIMARY KEY (`idclass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnd`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`character` (
  `idcharacter` INT(11) NOT NULL,
  `player_idplayer` INT(11) NOT NULL,
  `cname` VARCHAR(45) NOT NULL,
  `power value` INT(11) NOT NULL,
  `class_idclass` INT NOT NULL,
  PRIMARY KEY (`idcharacter`, `player_idplayer`),
  INDEX `fk_character_player1_idx` (`player_idplayer` ASC) ,
  INDEX `fk_character_class1_idx` (`class_idclass` ASC) ,
  CONSTRAINT `fk_character_player1`
    FOREIGN KEY (`player_idplayer`)
    REFERENCES `dnd`.`player` (`idplayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_class1`
    FOREIGN KEY (`class_idclass`)
    REFERENCES `dnd`.`class` (`idclass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`campaign_has_character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`campaign_has_character` (
  `campaign_idcampaign` INT(11) NOT NULL,
  `campaign_gamemaster_idgamemaster` INT(11) NOT NULL,
  `character_idcharacter` INT(11) NOT NULL,
  `character_player_idplayer` INT(11) NOT NULL,
  PRIMARY KEY (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`),
  INDEX `fk_campaign_has_character_character1_idx` (`character_idcharacter` ASC, `character_player_idplayer` ASC) ,
  INDEX `fk_campaign_has_character_campaign1_idx` (`campaign_idcampaign` ASC, `campaign_gamemaster_idgamemaster` ASC) ,
  CONSTRAINT `fk_campaign_has_character_campaign1`
    FOREIGN KEY (`campaign_idcampaign` , `campaign_gamemaster_idgamemaster`)
    REFERENCES `dnd`.`campaign` (`idcampaign` , `gamemaster_idgamemaster`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campaign_has_character_character1`
    FOREIGN KEY (`character_idcharacter` , `character_player_idplayer`)
    REFERENCES `dnd`.`character` (`idcharacter` , `player_idplayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnd`.`spell`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`spell` (
  `idspell` INT NOT NULL,
  `spname` VARCHAR(45) NOT NULL,
  `element` VARCHAR(45) NOT NULL,
  `effect` VARCHAR(45) NOT NULL,
  `effect value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idspell`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnd`.`class_has_spell`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dnd`.`class_has_spell` (
  `class_idclass` INT NOT NULL,
  `spell_idspell` INT NOT NULL,
  PRIMARY KEY (`class_idclass`, `spell_idspell`),
  INDEX `fk_class_has_spell_spell1_idx` (`spell_idspell` ASC) ,
  INDEX `fk_class_has_spell_class1_idx` (`class_idclass` ASC) ,
  CONSTRAINT `fk_class_has_spell_class1`
    FOREIGN KEY (`class_idclass`)
    REFERENCES `dnd`.`class` (`idclass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_spell_spell1`
    FOREIGN KEY (`spell_idspell`)
    REFERENCES `dnd`.`spell` (`idspell`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dnd`.`gamemaster`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`gamemaster` (`idgamemaster`, `gmname`) VALUES (1, 'tom');
INSERT INTO `dnd`.`gamemaster` (`idgamemaster`, `gmname`) VALUES (2, 'mary');
INSERT INTO `dnd`.`gamemaster` (`idgamemaster`, `gmname`) VALUES (3, 'dave');
INSERT INTO `dnd`.`gamemaster` (`idgamemaster`, `gmname`) VALUES (4, 'kelly');
INSERT INTO `dnd`.`gamemaster` (`idgamemaster`, `gmname`) VALUES (666, 'lucifer');
INSERT INTO `dnd`.`gamemaster` (`idgamemaster`, `gmname`) VALUES (5, 'stacy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`sourcebooks`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`sourcebooks` (`idsourcebooks`, `title`, `difficulty`) VALUES (1, 'towers of terror ', 4);
INSERT INTO `dnd`.`sourcebooks` (`idsourcebooks`, `title`, `difficulty`) VALUES (2, 'womplegorden', 1);
INSERT INTO `dnd`.`sourcebooks` (`idsourcebooks`, `title`, `difficulty`) VALUES (3, 'raven queen\'s gold', 8);
INSERT INTO `dnd`.`sourcebooks` (`idsourcebooks`, `title`, `difficulty`) VALUES (4, 'cleric in the tower', 12);
INSERT INTO `dnd`.`sourcebooks` (`idsourcebooks`, `title`, `difficulty`) VALUES (5, 'spamalot', 20);
INSERT INTO `dnd`.`sourcebooks` (`idsourcebooks`, `title`, `difficulty`) VALUES (6, 'apocalypse now', 666);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`weekdays`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (1, 'monday');
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (2, 'tuesday');
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (3, 'wednesday');
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (4, 'thursday');
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (5, 'friday');
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (6, 'saturday');
INSERT INTO `dnd`.`weekdays` (`idweekdays`, `name`) VALUES (7, 'sunday');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`campaign`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`campaign` (`idcampaign`, `gamemaster_idgamemaster`, `sourcebooks_idsourcebooks`, `weekdays_idweekdays`) VALUES (1, 4, 1, 1);
INSERT INTO `dnd`.`campaign` (`idcampaign`, `gamemaster_idgamemaster`, `sourcebooks_idsourcebooks`, `weekdays_idweekdays`) VALUES (2, 3, 2, 2);
INSERT INTO `dnd`.`campaign` (`idcampaign`, `gamemaster_idgamemaster`, `sourcebooks_idsourcebooks`, `weekdays_idweekdays`) VALUES (3, 5, 3, 5);
INSERT INTO `dnd`.`campaign` (`idcampaign`, `gamemaster_idgamemaster`, `sourcebooks_idsourcebooks`, `weekdays_idweekdays`) VALUES (4, 1, 4, 5);
INSERT INTO `dnd`.`campaign` (`idcampaign`, `gamemaster_idgamemaster`, `sourcebooks_idsourcebooks`, `weekdays_idweekdays`) VALUES (5, 2, 5, 6);
INSERT INTO `dnd`.`campaign` (`idcampaign`, `gamemaster_idgamemaster`, `sourcebooks_idsourcebooks`, `weekdays_idweekdays`) VALUES (6, 666, 6, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`player`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (1, 'Winifred Walton');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (2, 'Gregg Gonzalez');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (3, 'Carlos Barnes');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (4, 'Mabel Rodgers');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (5, 'Forrest Steele');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (6, 'Peggy Norman');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (7, 'Kellie Graham');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (8, 'Angela Kennedy');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (9, 'Robin Alvarado');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (10, 'Casey Hammond');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (11, 'Byron West');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (12, 'Roger Miles');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (13, 'Alfred Hudson');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (14, 'Earl Phelps');
INSERT INTO `dnd`.`player` (`idplayer`, `pname`) VALUES (666, 'lucifer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`class`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (1, 'warrior', 15, 20, 15);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (2, 'rogue', 18, 15, 17);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (3, 'mage', 30, 10, 10);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (4, 'cleric', 5, 30, 15);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (5, 'barbarian', 20, 20, 10);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (6, 'spellblade', 25, 10, 15);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (7, 'warlock', 25, 15, 10);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (8, 'enchanter', 15, 20, 15);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (9, 'monk', 20, 15, 15);
INSERT INTO `dnd`.`class` (`idclass`, `cname`, `hit value`, `health value`, `armor value`) VALUES (10, 'hero', 20, 20, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`character`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (1, 14, 'Waknia', 1, 3);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (2, 13, 'Uxeyr', 1, 1);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (3, 12, 'Yhius', 1, 5);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (4, 11, 'Lavmos', 1, 3);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (5, 10, 'Hyddall', 2, 7);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (6, 9, 'Culmus', 2, 6);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (7, 8, 'Seteus', 2, 9);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (8, 7, 'Wedarr', 2, 2);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (9, 6, 'Idur', 3, 1);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (10, 5, 'Amione', 3, 8);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (11, 4, 'Qhetix', 3, 4);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (12, 3, 'Eara', 3, 1);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (13, 2, 'Ridona', 4, 2);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (14, 1, 'Muyja', 4, 3);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (70, 1, 'Gryheia', 4, 8);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (71, 2, 'Irtia', 5, 5);
INSERT INTO `dnd`.`character` (`idcharacter`, `player_idplayer`, `cname`, `power value`, `class_idclass`) VALUES (666, 666, 'satan', 9001, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`campaign_has_character`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (1, 4, 5, 10);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (1, 4, 6, 9);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (1, 4, 7, 8);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (1, 4, 8, 7);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (2, 3, 1, 14);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (2, 3, 2, 13);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (2, 3, 3, 12);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (2, 3, 4, 11);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (3, 5, 10, 5);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (3, 5, 11, 4);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (3, 5, 12, 3);
INSERT INTO `dnd`.`campaign_has_character` (`campaign_idcampaign`, `campaign_gamemaster_idgamemaster`, `character_idcharacter`, `character_player_idplayer`) VALUES (3, 5, 13, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`spell`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (1, 'Slap', 'Physical', 'a good slap', '1');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (2, 'Tackle', 'Physical', 'go for the hips', '3');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (3, 'Headbutt', 'Physical', 'just like zidane', '4');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (4, 'Stab', 'Physical', 'a standard stabbin', '5');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (5, 'Pocket Sand', 'Physical', 'KIIYAAAH. Blinds enemy.', '0');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (6, 'Singe', 'Fire', 'a gentle singe', '3');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (7, 'Sorch', 'Fire', 'a real scorcher', '5');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (8, 'Backdraft', 'Fire ', 'a flamethrower', '8');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (9, 'Volcano', 'Fire', 'fires of creation', '10');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (10, 'Splash', 'Water', 'might as well spit on them', '1');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (11, 'Douse', 'Water', 'a cold splash', '3');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (12, 'Torrent', 'Water', 'a violent downpour', '5');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (13, 'Heal', 'Water', 'healing waters', '5');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (14, 'Puff', 'Air', 'a gentle gust of wind', '2');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (15, 'Haste', 'Air', 'increases speed', '4');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (16, 'Rasengan', 'Air', 'a ball of wind', '6');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (17, 'Gale Force', 'Air', 'hurriance force', '10');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (18, 'Throw Rock', 'Earth ', 'big rock!', '5');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (19, 'Earthquake', 'Earth ', 'earthquake!', '10');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (20, 'Hellfire', 'Infernal', 'flames of hell', '25');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (21, 'Harvest', 'Infernal', 'cull the weak', '50');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (22, 'Soulfire', 'Divine', 'inner strength unleashed', '50');
INSERT INTO `dnd`.`spell` (`idspell`, `spname`, `element`, `effect`, `effect value`) VALUES (23, 'Divine Fury', 'Divine', 'wrath of the gods', '100');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dnd`.`class_has_spell`
-- -----------------------------------------------------
START TRANSACTION;
USE `dnd`;
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (1, 3);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (1, 4);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (2, 4);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (2, 5);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 6);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 7);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 8);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 9);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 18);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 19);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (4, 3);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (4, 13);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (4, 22);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (5, 2);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (5, 5);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (3, 1);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (5, 3);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (6, 4);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (6, 8);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (7, 6);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (7, 7);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (7, 8);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (7, 9);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (7, 20);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (7, 21);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (8, 11);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (8, 12);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (8, 13);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (8, 15);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (8, 17);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (8, 23);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (9, 5);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (9, 3);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (9, 2);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (9, 16);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (10, 4);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (10, 9);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (10, 13);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (10, 17);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (10, 22);
INSERT INTO `dnd`.`class_has_spell` (`class_idclass`, `spell_idspell`) VALUES (10, 23);

COMMIT;

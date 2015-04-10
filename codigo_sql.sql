# representaciones
referente a la creación del sistema de REP
-- -----------------------------------------------------
-- schema representacionesDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `representacionesDB` ;
USE `representacionesDB` ;

-- -----------------------------------------------------
-- tabla users
-- -----------------------------------------------------
CREATE TABLE `users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `nick_name` CHAR NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla contact
-- -----------------------------------------------------
CREATE TABLE `contact` (
  `id_contacto` INT NOT NULL,
  `tel_1` INT NOT NULL,
  `tel_2` INT NULL,
  `e_mail` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NULL,
  `pag_web` VARCHAR(45) NULL,
  PRIMARY KEY (`id_contacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla agent
-- -----------------------------------------------------
CREATE TABLE `agent` (
  `id_agent` INT NOT NULL,
  `first_name` CHAR NOT NULL,
  `last_name` CHAR NOT NULL,
  `users_id` INT NOT NULL,
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`id_agent`),
  INDEX `fk_agent_users1_idx` (`users_id` ASC),
  INDEX `fk_agent_contact1_idx` (`contact_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla representation
-- -----------------------------------------------------
CREATE TABLE `representation` (
  `id_representation` INT NOT NULL,
  `representation` CHAR NOT NULL,
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`id_representation`),
  INDEX `fk_representation_contact1_idx` (`contact_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla zip
-- -----------------------------------------------------
CREATE TABLE `zip` (
  `id_zip` INT NOT NULL,
  `town` CHAR NOT NULL,
  `type_town_ship` CHAR NOT NULL,
  `town_ship` CHAR NOT NULL,
  PRIMARY KEY (`id_zip`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla address
-- -----------------------------------------------------
CREATE TABLE `address` (
  `id_address` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `number` INT NULL,
  `headquarters` VARCHAR(45) NULL,
  PRIMARY KEY (`id_address`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla events
-- -----------------------------------------------------
CREATE TABLE `events` (
  `id_event` INT NOT NULL,
  `event_type` CHAR NOT NULL,
  `event_name` CHAR NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `topics` LONGTEXT NULL,
  `start_time` DATE NULL,
  `end_time` DATE NULL,
  `results` LONGTEXT NULL,
  `pending` LONGTEXT NULL,
  `difficulty` LONGTEXT NULL,
  `description` LONGTEXT NULL,
  `representation_id` INT NOT NULL,
  `zip_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id_event`),
  INDEX `fk_events_representation1_idx` (`representation_id` ASC),
  INDEX `fk_events_zip1_idx` (`zip_id` ASC),
  INDEX `fk_events_address1_idx` (`address_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla enterprise
-- -----------------------------------------------------
CREATE TABLE `enterprise` (
  `id_enterprise` INT NOT NULL,
  `enterprise` VARCHAR(45) NULL,
  `giro` CHAR NULL,
  `r_social` CHAR NULL,
  `contact_id` INT NOT NULL,
  `zip_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id_enterprise`),
  INDEX `fk_enterprise_contact1_idx` (`contact_id` ASC),
  INDEX `fk_enterprise_zip1_idx` (`zip_id` ASC),
  INDEX `fk_enterprise_address1_idx` (`address_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla attended
-- -----------------------------------------------------
CREATE TABLE `attended` (
  `id_attended` INT NOT NULL,
  `first_name` CHAR NOT NULL,
  `last_name` CHAR NOT NULL,
  `years` INT NOT NULL,
  `sex` CHAR NOT NULL,
  `job` CHAR NOT NULL,
  `giro` CHAR NOT NULL,
  `sector` CHAR NOT NULL,
  `f_atencion` DATE NOT NULL,
  `contact_id` INT NOT NULL,
  `enterprise_id` INT NOT NULL,
  `zip_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id_attended`),
  INDEX `fk_attended_contact1_idx` (`contact_id` ASC),
  INDEX `fk_attended_enterprise1_idx` (`enterprise_id` ASC),
  INDEX `fk_attended_zip1_idx` (`zip_id` ASC),
  INDEX `fk_attended_address1_idx` (`address_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla beneficiaries
-- -----------------------------------------------------
CREATE TABLE `beneficiaries` (
  `events_id` INT NOT NULL,
  `enterprise_id` INT NOT NULL,
  `cuantity` INT NOT NULL,
  PRIMARY KEY (`events_id`, `enterprise_id`),
  INDEX `fk_events_has_enterprise_enterprise1_idx` (`enterprise_id` ASC),
  INDEX `fk_events_has_enterprise_events1_idx` (`events_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla attention
-- -----------------------------------------------------
CREATE TABLE `attention` (
  `representation_id` INT NOT NULL,
  `attended_id` INT NOT NULL,
  `type` CHAR NOT NULL,
  `subject` CHAR NOT NULL,
  `status` CHAR NULL,
  `pass_on` CHAR NOT NULL,
  `program_manager` CHAR NOT NULL,
  PRIMARY KEY (`representation_id`, `attended_id`),
  INDEX `fk_representation_has_attended_attended1_idx` (`attended_id` ASC),
  INDEX `fk_representation_has_attended_representation1_idx` (`representation_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- tabla office
-- -----------------------------------------------------
CREATE TABLE `office` (
  `representation_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  `zip_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`representation_id`, `agent_id`),
  INDEX `fk_representation_has_agent_agent1_idx` (`agent_id` ASC),
  INDEX `fk_representation_has_agent_representation1_idx` (`representation_id` ASC),
  INDEX `fk_office_zip1_idx` (`zip_id` ASC),
  INDEX `fk_office_address1_idx` (`address_id` ASC))
ENGINE = InnoDB;

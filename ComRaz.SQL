


CREATE TABLE `Driver`
(
  `pk_driver` Int NOT NULL,
  `fio_driver` Varchar(300),
  `nomber_driver` Varchar(300),
  `tel_number_driver` Varchar(300)
)
;

ALTER TABLE `Driver` ADD  PRIMARY KEY (`pk_driver`)
;

-- Table instruction

CREATE TABLE `instruction`
(
  `pk_instruction` Int NOT NULL,
  `desc` Varchar(500)
)
;

ALTER TABLE `instruction` ADD  PRIMARY KEY (`pk_instruction`)
;

-- Table instruction_car



-- Table Car

CREATE TABLE `Car`
(
  `pk_car` Int NOT NULL,
  `mark_car` Varchar(300),
  `regist_number` Varchar(300),
  `delivery_bag` Int,
  `delivery_bulk` Int,
  `tonnage` Decimal(38,0),
  `Costfistzone` Decimal(38,0),
  `Costsecondzone` Decimal(38,0),
  `Costthirdzone` Decimal(38,0),
  `Costdopkm` Decimal(38,0),
  `pk_driver` Int
)
;

CREATE INDEX `IX_Relationship2` ON `Car` (`pk_driver`)
;

ALTER TABLE `Car` ADD  PRIMARY KEY (`pk_car`)
;

-- Table Material

CREATE TABLE `Material`
(
  `pk_material` Int NOT NULL,
  `name` Varchar(300)
)
;

ALTER TABLE `Material` ADD  PRIMARY KEY (`pk_material`)
;

-- Table provider_material



-- Table Provider

CREATE TABLE `Provider`
(
  `pk_provider` Int NOT NULL,
  `name_firm` Varchar(300),
  `adress_firm` Varchar(300),
  `tel_number_firm` Varchar(300)
)
;

ALTER TABLE `Provider` ADD  PRIMARY KEY (`pk_provider`)
;

-- Table order_car



-- Table Measure

CREATE TABLE `Measure`
(
  `pk_measure` Int NOT NULL,
  `Nazv` Varchar(300)
)
;

ALTER TABLE `Measure` ADD  PRIMARY KEY (`pk_measure`)
;

-- Table Order

CREATE TABLE `Order`
(
  `pk_order` Int NOT NULL,
  `nomer` Int,
  `volume` Int,
  `date_time` Datetime,
  `adress` Varchar(300),
  `contact` Varchar(300),
  `number_contact` Varchar(300),
  `comment` Varchar(500),
  `Numberzone` Int DEFAULT 1,
  `Exstendway` Decimal(38,0),
  `worker` Int,
  `cost_order` Int,
  `pk_status` Int,
  `pk_material` Int,
  `pk_measure` Int
)
;

CREATE INDEX `IX_Relationship11` ON `Order` (`pk_status`)
;

CREATE INDEX `IX_Relationship13` ON `Order` (`pk_material`)
;

CREATE INDEX `IX_Relationship17` ON `Order` (`pk_measure`)
;

ALTER TABLE `Order` ADD  PRIMARY KEY (`pk_order`)
;

-- Table order_status

CREATE TABLE `order_status`
(
  `pk_status` Int NOT NULL,
  `name_status` Varchar(300)
)
;

ALTER TABLE `order_status` ADD  PRIMARY KEY (`pk_status`)
;

-- Table Instuction_zone

CREATE TABLE `Instuction_zone`
(
  `pk_instruction` Decimal(38,0) NOT NULL,
  `pk_order` Decimal(38,0) NOT NULL
)
;

ALTER TABLE `Instuction_zone` ADD  PRIMARY KEY (`pk_instruction`,`pk_order`)
;

-- Table provider_material

CREATE TABLE `provider_material`
(
  `pk_provider` Int NOT NULL,
  `pk_material` Int NOT NULL,
  `cost_bag` Int,
  `cost_tonna` Int
)
;

ALTER TABLE `provider_material` ADD  PRIMARY KEY (`pk_provider`,`pk_material`)
;

-- Table order_car

CREATE TABLE `order_car`
(
  `pk_car` Int NOT NULL,
  `pk_order` Int NOT NULL,
  `count_trip` Int
)
;

ALTER TABLE `order_car` ADD  PRIMARY KEY (`pk_car`,`pk_order`)
;

-- Table instruction_car

CREATE TABLE `instruction_car`
(
  `pk_car` Int NOT NULL,
  `pk_instruction` Int NOT NULL
)
;

ALTER TABLE `instruction_car` ADD  PRIMARY KEY (`pk_car`,`pk_instruction`)
;

-- Table order_instruction

CREATE TABLE `order_instruction`
(
  `pk_instruction` Int NOT NULL,
  `pk_order` Int NOT NULL
)
;

ALTER TABLE `order_instruction` ADD  PRIMARY KEY (`pk_instruction`,`pk_order`)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `Car` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`pk_driver`) REFERENCES `Driver` (`pk_driver`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`pk_measure`) REFERENCES `Measure` (`pk_measure`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `provider_material` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`pk_provider`) REFERENCES `Provider` (`pk_provider`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `provider_material` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`pk_material`) REFERENCES `Material` (`pk_material`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `order_car` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`pk_car`) REFERENCES `Car` (`pk_car`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `order_car` ADD CONSTRAINT `Relationship6` FOREIGN KEY (`pk_order`) REFERENCES `Order` (`pk_order`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`pk_material`) REFERENCES `Material` (`pk_material`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `instruction_car` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`pk_car`) REFERENCES `Car` (`pk_car`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `instruction_car` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`pk_instruction`) REFERENCES `instruction` (`pk_instruction`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`pk_status`) REFERENCES `order_status` (`pk_status`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `order_instruction` ADD CONSTRAINT `Relationship11` FOREIGN KEY (`pk_instruction`) REFERENCES `instruction` (`pk_instruction`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `order_instruction` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`pk_order`) REFERENCES `Order` (`pk_order`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


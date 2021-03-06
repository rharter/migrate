/**
 * Mobile Marshall Schema script
 * 
 * Autogenerated by migrate on Tue Mar 06 20:10:49 -0600 2012
 *
 * Copyright 2012 Serious Apps.
 */

DROP TABLE IF EXISTS `MM_Schema_Change`;

CREATE TABLE `MM_Schema_Change` (
	`schema_change_id` bigint(20) NOT NULL,
	`schema_change_description` varchar(254) NOT NULL,
	`schema_change_timechanged` timestamp NOT NULL,
	PRIMARY KEY (`schema_change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP PROCEDURE IF EXISTS Migration_0001_InitialCreation;

DELIMITER //

CREATE PROCEDURE Migration_0001_InitialCreation()

	BEGIN

	IF 0 = (SELECT COUNT(1)
			FROM MM_Schema_Change
			WHERE schema_change_description = '0001_InitialCreation')
	THEN
	
		CREATE TABLE Users (
	'id' bigint(20) PRIMARY KEY AUTO_INCREMENT,
	'username' varchar(50) NOT NULL,
	'password' varchar(50) NOT NULL
);
		
		INSERT INTO MM_Schema_Change (schema_change_description, schema_change_timechanged)
VALUES ('0001_InitialCreation', NOW());

	
	END IF;
END //

DELIMITER ;

CALL Migration_0001_InitialCreation();

DROP PROCEDURE Migration_0001_InitialCreation;


DROP PROCEDURE IF EXISTS Migration_0002_AddTable;

DELIMITER //

CREATE PROCEDURE Migration_0002_AddTable()

	BEGIN

	IF 0 = (SELECT COUNT(1)
			FROM MM_Schema_Change
			WHERE schema_change_description = '0002_AddTable')
	THEN
	
		CREATE TABLE Groups (
	'id' bigint(20) AUTO_INCREMENT PRIMARY KEY,
	'name' varchar(50) NOT NULL
);;
		
		INSERT INTO MM_Schema_Change (schema_change_description, schema_change_timechanged)
VALUES ('0002_AddTable', NOW());

	
	END IF;
END //

DELIMITER ;

CALL Migration_0002_AddTable();

DROP PROCEDURE Migration_0002_AddTable;


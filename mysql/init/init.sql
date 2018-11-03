USE store;

CREATE TABLE `configurations` (
	`this` int(11) NOT NULL,
	`function` varchar(25) DEFAULT NULL,
	PRIMARY KEY(`this`)
);

CREATE TABLE `next_keys` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`this` int(11) NOT NULL,
	`next` int(11) NOT NULL,
	PRIMARY KEY(`id`)
);

INSERT INTO `configurations` (`this`,`function`) VALUES(1,"not"),(2,"buffer");

INSERT INTO `next_keys` (`this`,`next`) VALUES(0,1),(0,2),(1,0),(2,0); 
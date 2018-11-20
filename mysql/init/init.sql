USE store;

CREATE TABLE `configurations` (
	`this` int(11) NOT NULL,
	`function` varchar(25) DEFAULT NULL,
	`status` varchar(25) DEFAULT NULL,
	PRIMARY KEY(`this`)
);

CREATE TABLE `next_keys` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`this` int(11) NOT NULL,
	`next` int(11) NOT NULL,
	PRIMARY KEY(`id`)
);

INSERT INTO `configurations` (`this`,`function`,`status`) VALUES (0,"brain","up");

INSERT INTO `configurations` (`this`,`function`) VALUES(1,"buffer"),(2,"buffer"),(3,"buffer"),(4,"not"),(5,"buffer"),(6,"not"),(7,"buffer"),(8,"buffer"),(9,"buffer"),(10,"buffer"),(11,"buffer"),(12,"buffer"),(13,"buffer"),(14,"buffer"),(15,"and"),(16,"and"),(17,"or"),(18,"buffer");

INSERT INTO `next_keys` (`this`,`next`) VALUES(0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(3,11),(4,8),(4,12),(5,9),(5,13),(6,10),(6,14),(7,15),(8,15),(9,15),(10,15),(11,16),(12,16),(13,16),(14,16),(15,17),(16,17),(17,18),(18,0); 
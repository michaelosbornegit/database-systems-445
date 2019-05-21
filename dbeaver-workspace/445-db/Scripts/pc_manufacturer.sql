-- create schema
Create Database ClassicExample_1;

USE ClassicExample_1;

CREATE TABLE Product (
	Maker      Char(1) 	       NULL,
	Model       Integer 	     NOT NULL,
	Type         Char (10)        NULL,
	PRIMARY KEY (Model)
	);

CREATE TABLE PC  (
	Model       Integer 	    NOT NULL, 
	speed       Decimal (3,2)   NULL,
	Ram         Integer			NULL,
	Hd			Integer			NULL,
	Price       Integer			NULL,
	PRIMARY KEY (Model)
	);

CREATE TABLE Laptop  (
	Model       Integer 	    NOT NULL, 
	speed       Decimal (3,2)   NULL,
	Ram         Integer			NULL,
	Hd			Integer			NULL,
	Screen		Decimal (3,1)	NULL,
	Price       Integer			NULL,
	PRIMARY KEY (Model)
	);

CREATE TABLE Printer  (
	Model       Integer 	    NOT NULL, 
	Color		Bit			NULL,
	Typ        Char (16)		NULL,
	Price       Integer			NULL,
	PRIMARY KEY (Model)
	);

-- INSERT VALUES
USE ClassicExample_1;

/* Inserting values for Product table */
Insert into Product values ('A', '1001', 'pc');
Insert into Product values ('A', '1002', 'pc');
Insert into Product values ('A', '1003', 'pc');
Insert into Product values ('A', '2004', 'laptop');
Insert into Product values ('A', '2005', 'laptop');
Insert into Product values ('A', '2006', 'laptop');
Insert into Product values ('B', '1004', 'pc');
Insert into Product values ('B', '1005', 'pc');
Insert into Product values ('B', '1006', 'pc');
Insert into Product values ('B', '2007', 'laptop');
Insert into Product values ('C', '1007', 'pc');
Insert into Product values ('D', '1008', 'pc');
Insert into Product values ('D', '1009', 'pc');
Insert into Product values ('D', '1010', 'pc');
Insert into Product values ('D', '3004', 'printer');
Insert into Product values ('D', '3005', 'printer');
Insert into Product values ('E', '1011', 'pc');
Insert into Product values ('E', '1012', 'pc');
Insert into Product values ('E', '1013', 'pc');
Insert into Product values ('E', '2001', 'laptop');
Insert into Product values ('E', '2002', 'laptop');
Insert into Product values ('E', '2003', 'laptop');
Insert into Product values ('E', '3001', 'printer');
Insert into Product values ('E', '3002', 'printer');
Insert into Product values ('E', '3003', 'printer');
Insert into Product values ('F', '2008', 'laptop');
Insert into Product values ('F', '2009', 'laptop');
Insert into Product values ('G', '2010', 'laptop');
Insert into Product values ('H', '3006', 'printer');
Insert into Product values ('H', '3007', 'printer');

/* Inserting values for PC table */

insert into  PC values ('1001', '2.66', '1024', '250', '2114');
insert into  PC values ('1002', '2.10', '512', '250', '995');
insert into  PC values ('1003', '1.42', '512', '80', '478');
insert into  PC values ('1004', '2.80', '1024', '250', '649');
insert into  PC values ('1005', '3.20', '512', '250', '630');
insert into  PC values ('1006', '3.20', '1024', '320', '1049');
insert into  PC values ('1007', '2.20', '1024', '200', '510');
insert into  PC values ('1008', '2.20', '2048', '250', '770');
insert into  PC values ('1009', '2.00', '1024', '250', '650');
insert into  PC values ('1010', '2.80', '2048', '300', '770');
insert into  PC values ('1011', '1.86', '2048', '160', '959');
insert into  PC values ('1012', '2.80', '1024', '160', '649');
insert into  PC values ('1013', '3.06', '512', '80', '529');


/* Inserting values for Laptop table */

insert into Laptop values ('2001', '2.00', '2048', '240', '20.1', '3673' );
insert into Laptop values ('2002', '1.73', '1024', '80', '17.0', '949' );
insert into Laptop values ('2003', '1.80', '512', '60', '15.4', '549' );
insert into Laptop values ('2004', '2.00', '512', '60', '13.3', '1150' );
insert into Laptop values ('2005', '2.16', '1024', '120', '17.0', '2500' );
insert into Laptop values ('2006', '2.00', '2048', '80', '15.4', '1700' );
insert into Laptop values ('2007', '1.83', '1024', '120', '13.3', '1429' );
insert into Laptop values ('2008', '1.60', '1024', '100', '15.4', '900' );
insert into Laptop values ('2009', '1.60', '512', '80', '14.1', '680' );
insert into Laptop values ('2010', '2.00', '2048', '160', '15.4', '2300' );

/* Inserting values for printer table */

insert into Printer values ('3001', 1, 'ink-jet', '99');
insert into Printer values ('3002', 0, 'laser', '239');
insert into Printer values ('3003', 1, 'laser', '899');
insert into Printer values ('3004', 1, 'ink-jet', '120');
insert into Printer values ('3005', 0, 'laser', '120');
insert into Printer values ('3006', 1, 'ink-jet', '100');
insert into Printer values ('3007', 1, 'laser', '200');

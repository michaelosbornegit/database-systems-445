CREATE DATABASE osborne_michael_db;
USE osborne_michael_db;

CREATE TABLE TRACK (
	TrackID CHAR(36) NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Shape VARCHAR(20) NULL,
	Distance DECIMAL(5,3) NULL,
	FrontStretch INTEGER NULL,
	Backstretch INTEGER NULL,
	State VARCHAR(20) NULL,
	Surface VARCHAR(20) NULL,
	TrackType VARCHAR(20) NULL,
	Owner VARCHAR(40) NULL,
	CONSTRAINT TRACK_PK PRIMARY KEY (TrackID)
	);
	
CREATE TABLE RACE (
	RaceID CHAR(36) NOT NULL,
	TrackID CHAR(36) NOT NULL,
	Name VARCHAR(40) NOT NULL,
	`Date` DATE NULL,
	ElapsedTime INTEGER NULL,
	Laps INTEGER NULL,
	Comments VARCHAR(1000) NULL,
	LeadChanges INTEGER NULL,
	AverageSpeed DECIMAL(7,3) NULL,
	VictoryMargin DECIMAL(10,3) NULL,
	CONSTRAINT TRACK_PK PRIMARY KEY (RaceID),
	CONSTRAINT TRACK_Relationship FOREIGN KEY (TrackID)
		REFERENCES TRACK (TrackID)
	);

CREATE TABLE CAR (
	CarID CHAR(36) NOT NULL,
	`Number` INTEGER NOT NULL,
	CONSTRAINT CAR_PK PRIMARY KEY (CarID)
	);

CREATE TABLE DRIVER (
	DriverID CHAR(36) NOT NULL,
	Height INTEGER NOT NULL,
	RookieYear INTEGER NULL,
	Gender VARCHAR(10) NULL,
	FirstName VARCHAR(30) NULL,
	LastName VARCHAR(30) NULL,
	CONSTRAINT DRIVER_PK PRIMARY KEY (DriverID)
	);

CREATE TABLE DRIVER_CAR_RELATIONSHIP (
	DriverID CHAR(36) NOT NULL,
	CarID CHAR(36) NOT NULL,
	CONSTRAINT DRIVER_CAR_RELATIONSHIP_PK PRIMARY KEY (DriverID, CarID),
	CONSTRAINT DRIVER_Relationship FOREIGN KEY (DriverID)
		REFERENCES DRIVER (DriverID),
	CONSTRAINT CAR_Relationship FOREIGN KEY (CarID)
		REFERENCES CAR (CarID)
	);


CREATE TABLE MANUFACTURER (
	ManufacturerID CHAR(36) NOT NULL,
	Name VARCHAR(40) NOT NULL,
	CONSTRAINT MANUFACTURER_PK PRIMARY KEY (ManufacturerID)
	);

CREATE TABLE MANUFACTURER_CAR_RELATIONSHIP (
	ManufacturerID CHAR(36) NOT NULL,
	CarID CHAR(36) NOT NULL,
	CONSTRAINT MANUFACTURER_CAR_RELATIONSHIP_PK PRIMARY KEY (ManufacturerID, CarID),
	CONSTRAINT MANUFACTURER_Relationship FOREIGN KEY (ManufacturerID)
		REFERENCES MANUFACTURER (ManufacturerID),
	CONSTRAINT CAR_Relationship4 FOREIGN KEY (CarID)
		REFERENCES CAR (CarID)
	);

CREATE TABLE TEAM (
	TeamID CHAR(36) NOT NULL,
	Name VARCHAR(40) NOT NULL,
	CONSTRAINT TEAM_PK PRIMARY KEY (TeamID)
	);

CREATE TABLE TEAM_CAR_RELATIONSHIP (
	TeamID CHAR(36) NOT NULL,
	CarID CHAR(36) NOT NULL,
	CONSTRAINT TEAM_CAR_RELATIONSHIP_PK PRIMARY KEY (TeamID, CarID),
	CONSTRAINT TEAM_Relationship1 FOREIGN KEY (TeamID)
		REFERENCES TEAM (TeamID),
	CONSTRAINT CAR_Relationship1 FOREIGN KEY (CarID)
		REFERENCES CAR (CarID)
	);

CREATE TABLE CAR_OWNER (
	OwnerID CHAR(36) NOT NULL,
	Name VARCHAR(40) NOT NULL,
	CONSTRAINT CAR_OWNER_PK PRIMARY KEY (OwnerID)
	);

CREATE TABLE CAR_OWNER_CAR_RELATIONSHIP (
	OwnerID CHAR(36) NOT NULL,
	CarID CHAR(36) NOT NULL,
	CONSTRAINT CAR_OWNER_CAR_RELATIONSHIP_PK PRIMARY KEY (OwnerID, CarID),
	CONSTRAINT CAR_OWNER_Relationship FOREIGN KEY (OwnerID)
		REFERENCES CAR_OWNER (OwnerID),
	CONSTRAINT CAR_Relationship2 FOREIGN KEY (CarID)
		REFERENCES CAR (CarID)
	);

CREATE TABLE `RESULT` (
	CarID CHAR(36) NOT NULL,
	RaceID CHAR(36) NOT NULL,
	StartPosition INTEGER NULL,
	FinishPosition INTEGER NULL,
	FinishStatus VARCHAR(20) NULL,
	BestLapSpeed DECIMAL(7,3) NULL,
	BestLapTime DECIMAL(7,3) NULL,
	Points INTEGER NULL,
	LapsCompleted INTEGER NULL,
	CONSTRAINT RESULT_PK PRIMARY KEY (RaceID, CarID),
	CONSTRAINT RACE_Relationship FOREIGN KEY (RaceID)
		REFERENCES RACE (RaceID),
	CONSTRAINT CAR_Relationship3 FOREIGN KEY (CarID)
		REFERENCES CAR (CarID)
	);


-- populate the tables
INSERT INTO DRIVER VALUES ("85c06960-3610-4eff-9ef2-18641b84c952", 73, 2004, "M", "Kyle", "Busch");
INSERT INTO DRIVER VALUES ("4d95ef3a-46cc-43c2-b340-c92cea2ed7f8", 71, 2004, "M", "Martin", "Truex");
INSERT INTO DRIVER VALUES ("9d18716c-fd73-48d4-b3da-44228c767b84", 70, 2001, "M", "Kevin", "Harvick");
INSERT INTO DRIVER VALUES ("a756eefd-801d-4214-ab1b-0b595c21c37d", 66, 2013, "M", "Kyle", "Larson");
INSERT INTO DRIVER VALUES ("0ce4113d-34c8-4272-b658-3b929238dbd3", 70, 2010, "M", "Brad", "Keselowski");

INSERT INTO CAR VALUES ("17765fdf-5d63-4795-80ae-9149c91729c4", 18);
INSERT INTO CAR VALUES ("1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f", 19);
INSERT INTO CAR VALUES ("6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7", 4);
INSERT INTO CAR VALUES ("1dbd3173-2412-48e7-bf44-cca9a72fc127", 42);
INSERT INTO CAR VALUES ("3d0cf0c8-f933-48ac-a935-71f1d18d4bd5", 2);

INSERT INTO DRIVER_CAR_RELATIONSHIP VALUES ("85c06960-3610-4eff-9ef2-18641b84c952", "17765fdf-5d63-4795-80ae-9149c91729c4");
INSERT INTO DRIVER_CAR_RELATIONSHIP VALUES ("4d95ef3a-46cc-43c2-b340-c92cea2ed7f8", "1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f");
INSERT INTO DRIVER_CAR_RELATIONSHIP VALUES ("9d18716c-fd73-48d4-b3da-44228c767b84", "6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7");
INSERT INTO DRIVER_CAR_RELATIONSHIP VALUES ("a756eefd-801d-4214-ab1b-0b595c21c37d", "1dbd3173-2412-48e7-bf44-cca9a72fc127");
INSERT INTO DRIVER_CAR_RELATIONSHIP VALUES ("0ce4113d-34c8-4272-b658-3b929238dbd3", "3d0cf0c8-f933-48ac-a935-71f1d18d4bd5");

INSERT INTO CAR_OWNER VALUES ("e7846c1b-f64e-4312-8ee3-13c8a0001a8b", "Joe Gibbs");
INSERT INTO CAR_OWNER VALUES ("d84c771d-594c-4cfb-af6f-4bdd39abae75", "Coy Gibbs");
INSERT INTO CAR_OWNER VALUES ("f605ad11-b0a3-423b-a1f0-220cfa224968", "Tony Stewart");
INSERT INTO CAR_OWNER VALUES ("beaaedde-491d-4a5e-a449-36f7d6383588", "Chip Ganassi");
INSERT INTO CAR_OWNER VALUES ("3a02ed9a-855e-446a-b71b-876861b84f60", "Roger Penske");

INSERT INTO CAR_OWNER_CAR_RELATIONSHIP VALUES ("e7846c1b-f64e-4312-8ee3-13c8a0001a8b", "17765fdf-5d63-4795-80ae-9149c91729c4");
INSERT INTO CAR_OWNER_CAR_RELATIONSHIP VALUES ("d84c771d-594c-4cfb-af6f-4bdd39abae75", "1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f");
INSERT INTO CAR_OWNER_CAR_RELATIONSHIP VALUES ("f605ad11-b0a3-423b-a1f0-220cfa224968", "6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7");
INSERT INTO CAR_OWNER_CAR_RELATIONSHIP VALUES ("beaaedde-491d-4a5e-a449-36f7d6383588", "1dbd3173-2412-48e7-bf44-cca9a72fc127");
INSERT INTO CAR_OWNER_CAR_RELATIONSHIP VALUES ("3a02ed9a-855e-446a-b71b-876861b84f60", "3d0cf0c8-f933-48ac-a935-71f1d18d4bd5");

INSERT INTO MANUFACTURER VALUES ("73364deb-a012-4625-b759-db6a236797e3", "Toyota");
INSERT INTO MANUFACTURER VALUES ("12844047-ab59-43ca-ab6c-c10d54931715", "Ford");
INSERT INTO MANUFACTURER VALUES ("dbf04b7a-c4a2-4cff-9dd0-cf1977fc446e", "Chevrolet");

INSERT INTO MANUFACTURER_CAR_RELATIONSHIP VALUES ("73364deb-a012-4625-b759-db6a236797e3", "17765fdf-5d63-4795-80ae-9149c91729c4");
INSERT INTO MANUFACTURER_CAR_RELATIONSHIP VALUES ("73364deb-a012-4625-b759-db6a236797e3", "1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f");
INSERT INTO MANUFACTURER_CAR_RELATIONSHIP VALUES ("12844047-ab59-43ca-ab6c-c10d54931715", "6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7");
INSERT INTO MANUFACTURER_CAR_RELATIONSHIP VALUES ("dbf04b7a-c4a2-4cff-9dd0-cf1977fc446e", "1dbd3173-2412-48e7-bf44-cca9a72fc127");
INSERT INTO MANUFACTURER_CAR_RELATIONSHIP VALUES ("12844047-ab59-43ca-ab6c-c10d54931715", "3d0cf0c8-f933-48ac-a935-71f1d18d4bd5");

INSERT INTO TEAM VALUES ("b30dee06-c437-4e76-8b9c-8b850d52ce21", "Joe Gibbs Racing");
INSERT INTO TEAM VALUES ("876a07ff-ff53-4f23-9528-6d9795270244", "Stewart Haas Racing");
INSERT INTO TEAM VALUES ("e9897fd1-8187-4930-814d-5d05cd43d198", "Chip Ganassi Racing");
INSERT INTO TEAM VALUES ("e337709c-9fb6-4275-ad89-d9c100e71a1d", "Team Penske");

INSERT INTO TEAM_CAR_RELATIONSHIP VALUES ("b30dee06-c437-4e76-8b9c-8b850d52ce21", "17765fdf-5d63-4795-80ae-9149c91729c4");
INSERT INTO TEAM_CAR_RELATIONSHIP VALUES ("b30dee06-c437-4e76-8b9c-8b850d52ce21", "1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f");
INSERT INTO TEAM_CAR_RELATIONSHIP VALUES ("876a07ff-ff53-4f23-9528-6d9795270244", "6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7");
INSERT INTO TEAM_CAR_RELATIONSHIP VALUES ("e9897fd1-8187-4930-814d-5d05cd43d198", "1dbd3173-2412-48e7-bf44-cca9a72fc127");
INSERT INTO TEAM_CAR_RELATIONSHIP VALUES ("e337709c-9fb6-4275-ad89-d9c100e71a1d", "3d0cf0c8-f933-48ac-a935-71f1d18d4bd5");

INSERT INTO TRACK VALUES ("6ff97f68-2e9d-4fe6-8cd8-2969e1d3570b",
	"Daytona International Speedway", 
	"Tri-Oval",
	2.5,
	3800,
	3000,
	"Florida",
	"Paved",
	"Superspeedway",
	"International Speedway Corp.");

INSERT INTO TRACK VALUES ("75494065-bf21-4039-8d99-b8e438c8b4a4",
	"Atlanta Motor Speedway", 
	"Quad-Oval",
	1.54,
	2332,
	1800,
	"Georgia",
	"Paved",
	"Superspeedway",
	"Speedway Motorsports Inc.");

INSERT INTO TRACK VALUES ("9580816f-e17c-4167-8402-ba16725bcb19",
	"Las Vegas Motor Speedway", 
	"D-Shaped Oval",
	1.5,
	2275,
	1572,
	"Nevada",
	"Paved",
	"Superspeedway",
	"Speedway Motorsports Inc.");

INSERT INTO TRACK VALUES ("5dc82850-ba60-4bd6-8ce3-4e07e8094a83",
	"ISM Raceway", 
	"Tri-Oval",
	1.0,
	1179,
	1551,
	"Arizona",
	"Paved",
	"Superspeedway",
	"International Speedway Corp.");

INSERT INTO TRACK VALUES ("b2bd268a-6ee6-4c6b-a7c6-ac5b1b7b6b0e",
	"Auto Club Speedway", 
	"D-Shaped Oval",
	2.0,
	3100,
	2500,
	"California",
	"Paved",
	"Superspeedway",
	"International Speedway Corp.");

-- CREATE TABLE `RESULT` (
-- 	CarID CHAR(36) NOT NULL,
-- 	RaceID CHAR(36) NOT NULL,
-- 	StartPosition INTEGER NULL,
-- 	FinishPosition INTEGER NULL,
-- 	FinishStatus VARCHAR(20) NULL,
-- 	BestLapSpeed DECIMAL(7,3) NULL,
-- 	BestLapTime DECIMAL(7,3) NULL,
-- 	Points INTEGER NULL,
-- 	LapsCompleted INTEGER NULL,
-- 	CONSTRAINT RESULT_PK PRIMARY KEY (RaceID, CarID),
-- 	CONSTRAINT RACE_Relationship FOREIGN KEY (RaceID)
-- 		REFERENCES RACE (RaceID),
-- 	CONSTRAINT CAR_Relationship3 FOREIGN KEY (CarID)
-- 		REFERENCES CAR (CarID)
-- 	);


-- CREATE TABLE RACE (
-- 	RaceID CHAR(36) NOT NULL,
-- 	TrackID CHAR(36) NOT NULL,
-- 	Name VARCHAR(40) NOT NULL,
-- 	StartDateTime DATETIME NULL,
-- 	ElapsedTime INTEGER NULL,
-- 	Laps INTEGER NULL,
-- 	Comments VARCHAR(200) NULL,
-- 	LeadChanges INTEGER NULL,
-- 	AverageSpeed DECIMAL(7,3) NULL,
-- 	VictoryMargin DECIMAL(10,3) NULL,
-- 	CONSTRAINT TRACK_PK PRIMARY KEY (RaceID),
-- 	CONSTRAINT TRACK_Relationship FOREIGN KEY (TrackID)
-- 		REFERENCES TRACK (TrackID)
-- 	);



INSERT INTO RACE VALUES ("916b9625-c28a-4f59-9980-18ce696542bb",
	"6ff97f68-2e9d-4fe6-8cd8-2969e1d3570b",
	"DAYTONA 500",
	"2019-02-17",
	225,
	200,
	"Denny Hamlin won the 61st running Daytona 500 at Daytona International Speedway, his 32nd victory in the Monster Energy NASCAR Cup Series. Prior to the start of the race, the following car(s) dropped to the rear of the field under penalty for the reasons indicated: Nos. 27, 42 (transmission), 40 (rear gear).",
	15,
	137.44,
	0.138
);

INSERT INTO `RESULT` VALUES ("17765fdf-5d63-4795-80ae-9149c91729c4",
	"916b9625-c28a-4f59-9980-18ce696542bb",
	31,
	2,
	"running",
	200.83,
	44.814,
	45,
	207
);

INSERT INTO `RESULT` VALUES ("1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f",
	"916b9625-c28a-4f59-9980-18ce696542bb",
	15,
	20,
	"running",
	204.83,
	44.314,
	27,
	207
);

INSERT INTO `RESULT` VALUES ("6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7",
	"916b9625-c28a-4f59-9980-18ce696542bb",
	1,
	4,
	"running",
	199.43,
	42.494,
	83,
	207
);

INSERT INTO `RESULT` VALUES ("1dbd3173-2412-48e7-bf44-cca9a72fc127",
	"916b9625-c28a-4f59-9980-18ce696542bb",
	23,
	16,
	"running",
	197.43,
	47.494,
	27,
	207
);

INSERT INTO `RESULT` VALUES ("3d0cf0c8-f933-48ac-a935-71f1d18d4bd5",
	"916b9625-c28a-4f59-9980-18ce696542bb",
	24,
	37,
	"running",
	194.43,
	48.452,
	10,
	207
);

-- atlanta

INSERT INTO RACE VALUES ("891fd372-69aa-4d88-9e5a-0447edfde637",
	"75494065-bf21-4039-8d99-b8e438c8b4a4",
	"Folds of Honor QuikTrip 500",
	"2019-02-24",
	210,
	325,
	NULL,
	26,
	142.626,
	0.218
);

INSERT INTO `RESULT` VALUES ("17765fdf-5d63-4795-80ae-9149c91729c4",
	"891fd372-69aa-4d88-9e5a-0447edfde637",
	6,
	6,
	"running",
	176.235,
	31.458,
	33,
	325
);

INSERT INTO `RESULT` VALUES ("1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f",
	"891fd372-69aa-4d88-9e5a-0447edfde637",
	5,
	10,
	"running",
	180.251,
	30.452,
	20,
	325
);

INSERT INTO `RESULT` VALUES ("6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7",
	"891fd372-69aa-4d88-9e5a-0447edfde637",
	13,
	3,
	"running",
	177.333,
	32.487,
	42,
	325
);

INSERT INTO `RESULT` VALUES ("1dbd3173-2412-48e7-bf44-cca9a72fc127",
	"891fd372-69aa-4d88-9e5a-0447edfde637",
	20,
	25,
	"running",
	173.346,
	36.230,
	15,
	325
);

INSERT INTO `RESULT` VALUES ("3d0cf0c8-f933-48ac-a935-71f1d18d4bd5",
	"891fd372-69aa-4d88-9e5a-0447edfde637",
	30,
	35,
	"running",
	173.422,
	38.763,
	10,
	325
);

-- INSERT INTO CAR VALUES ("17765fdf-5d63-4795-80ae-9149c91729c4", 18);
-- INSERT INTO CAR VALUES ("1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f", 19);
-- INSERT INTO CAR VALUES ("6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7", 4);
-- INSERT INTO CAR VALUES ("1dbd3173-2412-48e7-bf44-cca9a72fc127", 42);
-- INSERT INTO CAR VALUES ("3d0cf0c8-f933-48ac-a935-71f1d18d4bd5", 2);

INSERT INTO RACE VALUES ("1125371c-bd36-4cf0-a491-9f63afb38bb2",
	"9580816f-e17c-4167-8402-ba16725bcb19",
	"Pennzoil 400 presented by Jiffy Lube",
	"2019-03-03",
	155,
	267,
	NULL,
	19,
	154.849,
	0.236
);

INSERT INTO `RESULT` VALUES ("17765fdf-5d63-4795-80ae-9149c91729c4",
	"1125371c-bd36-4cf0-a491-9f63afb38bb2",
	3,
	3,
	"running",
	176.927,
	30.521,
	43,
	267
);

INSERT INTO `RESULT` VALUES ("1e8fcd69-e12e-4fb4-8dff-8b7ec56f3e3f",
	"1125371c-bd36-4cf0-a491-9f63afb38bb2",
	7,
	1,
	"running",
	177.243,
	29.990,
	50,
	267
);

INSERT INTO `RESULT` VALUES ("6713b606-f0b9-4b23-bcf3-9f2e4e9a91a7",
	"1125371c-bd36-4cf0-a491-9f63afb38bb2",
	12,
	8,
	"running",
	176.345,
	32.830,
	31,
	267
);

INSERT INTO `RESULT` VALUES ("1dbd3173-2412-48e7-bf44-cca9a72fc127",
	"1125371c-bd36-4cf0-a491-9f63afb38bb2",
	22,
	30,
	"running",
	175.998,
	33.131,
	20,
	267
);

INSERT INTO `RESULT` VALUES ("3d0cf0c8-f933-48ac-a935-71f1d18d4bd5",
	"1125371c-bd36-4cf0-a491-9f63afb38bb2",
	9,
	10,
	"running",
	177.998,
	32.602,
	31,
	267
);


	

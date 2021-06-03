

DROP DATABASE IF EXISTS CAP;
CREATE DATABASE IF NOT EXISTS CAP;
USE CAP;

-- -----------------------------------------------------
-- Creation of tables for database CAP
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADMIN_USER (
  AdminID 		INT 		NOT NULL 	AUTO_INCREMENT,
  FirstName 	CHAR(25) 	NOT NULL,
  LastName 		CHAR(25) 	NOT NULL,
  Phone 		CHAR(12) 	NOT NULL,
  Email 		CHAR(35) 	NOT NULL,
  CONSTRAINT	ADMIN_PK   PRIMARY KEY (AdminID));

CREATE TABLE IF NOT EXISTS USER (
  UserID 				INT 		NOT NULL 	AUTO_INCREMENT,
  IdentificationID 		CHAR(25) 	NOT NULL,
  FirstName 			CHAR(25) 	NOT NULL,
  LastName 				CHAR(25) 	NOT NULL,
  Age 					INT 		NOT NULL,
  Phone 				CHAR(12) 	NOT NULL,
  Address 				CHAR(45) 	NOT NULL,
  FamilyMembersCount 	INT 		NOT NULL,
  Email 				CHAR(25) 	NOT NULL,
  AdoptedBefore 		CHAR(1) 	NOT NULL,
  CONSTRAINT 			USER_PK		PRIMARY KEY (UserID,IdentificationID),
  CONSTRAINT		    USER_AK		UNIQUE(IdentificationID),
  CONSTRAINT 		    USER_CK		CHECK ( Age > 16));

CREATE TABLE IF NOT EXISTS SHELTER_DETAILS (
  ShelterID 			INT 		NOT NULL 	AUTO_INCREMENT,
  ShelterName 			CHAR(25) 	NOT NULL,
  ShelterPhone 			CHAR(12) 	NOT NULL,
  ShelterEmail 			CHAR(25) 	NOT NULL,
  AvailibilityCount 	INT 		NOT NULL,
  Rating 				CHAR(10) 	NULL,
  CONSTRAINT 			SHELTER_PK 	PRIMARY KEY (ShelterID));

CREATE TABLE IF NOT EXISTS ANIMAL_DETAILS (
  AnimalID 		INT 		NOT NULL 	AUTO_INCREMENT,
  Type 			CHAR(12) 	NOT NULL,
  Breed 		CHAR(25) 	NOT NULL,
  HowOld 		CHAR(25) 	NULL		DEFAULT 'Unknown',
  Gender 		CHAR(8) 	NOT NULL,
  Spayed 		CHAR(8) 	NULL 		DEFAULT 'Unknown',
  Personality 	CHAR(45) 	NOT NULL,
  AdminID 		INT 		NOT NULL,
  UserID 		INT 		NULL,
  ShelterID 	INT 		NULL,
  CONSTRAINT    ANIMAL_PK			PRIMARY KEY (AnimalID),
  CONSTRAINT 	ANIMAL_ADMIN_FK		FOREIGN KEY (AdminID)
									REFERENCES ADMIN_USER (AdminID),
  CONSTRAINT 	ANIMAL_USER_FK 		FOREIGN KEY (UserID)
									REFERENCES USER (UserID),
  CONSTRAINT    ANIMAL_SHELTER_FK   FOREIGN KEY (ShelterID)
									REFERENCES SHELTER_DETAILS (ShelterID));

CREATE TABLE IF NOT EXISTS VET_DETAILS (
  Vetlicense 		INT 			NOT NULL,
  VetName 			CHAR(25) 		NULL,
  VetClinic 		CHAR(35) 		NULL,
  VetFees 			DECIMAL(18,2) 	NULL,
  CONSTRAINT 		VET_PK 			PRIMARY KEY (Vetlicense));

CREATE TABLE IF NOT EXISTS MEDICAL_RECORD (
  MedicalID 		INT 			NOT NULL	 AUTO_INCREMENT,
  TreatmentDesc 	CHAR(45)	    NOT	NULL,
  TreatmentPrice 	DECIMAL(18,2) 	NOT NULL,
  TreatmentDate 	DATE 			NOT NULL,
  Vetlicense 		INT 			NULL,
  AnimalID 			INT 			NOT NULL,
  CONSTRAINT 		MEDICAL_PK 			PRIMARY KEY (MedicalID),
  CONSTRAINT 		MEDICAL_ANIMAL_FK	FOREIGN KEY (AnimalID)
										REFERENCES ANIMAL_DETAILS (AnimalID)
										ON DELETE CASCADE
										ON UPDATE CASCADE,
  CONSTRAINT 		MEDICAL_VET_FK		FOREIGN KEY (Vetlicense)
										REFERENCES VET_DETAILS (Vetlicense));
                                        
CREATE TABLE IF NOT EXISTS OTHER_FACILITIES (
  FacilityID 		INT 			NOT NULL 	AUTO_INCREMENT,
  FacilityDesc 		CHAR(25) 		NOT NULL,
  FacilityProvider 	CHAR(25) 		NOT NULL,
  Expenses 			DECIMAL(18,2) 	NOT NULL,
  Address 			CHAR(45) 		NULL,
  AnimalID 			INT 		    NULL,
  CONSTRAINT 		FACILITY_PK			PRIMARY KEY (FacilityID),
  CONSTRAINT 		FACILITY_ANIMAL_FK	FOREIGN KEY (AnimalID)
										REFERENCES ANIMAL_DETAILS (AnimalID));

CREATE TABLE IF NOT EXISTS REQUEST (
  RequestID 		INT 		NOT NULL	AUTO_INCREMENT,
  RequestorName 	CHAR(25) 	NOT NULL,
  RequestDesc 		CHAR(45) 	NOT NULL,
  CreatedBy 		CHAR(8) 	NOT NULL,
  AnimalDesc 		CHAR(45) 	NOT NULL,
  RequestStatus 	CHAR(25) 	NOT NULL,
  UserID 			INT 		NULL,
  AdminID 			INT 		NOT NULL,
  AnimalID 			INT 		NOT NULL,
  ShelterID 		INT 		NULL,
  CONSTRAINT        REQUEST_PK		   	PRIMARY KEY (RequestID),
  CONSTRAINT 		REQUEST_USER_FK    	FOREIGN KEY (UserID)
										REFERENCES USER (UserID),
  CONSTRAINT 		REQUEST_ADMIN_FK   	FOREIGN KEY (AdminID)
										REFERENCES ADMIN_USER (AdminID),
  CONSTRAINT        REQUEST_ANIMAL_FK  	FOREIGN KEY (AnimalID)
										REFERENCES ANIMAL_DETAILS (AnimalID),
  CONSTRAINT 		REQUEST_SHELTER_FK	FOREIGN KEY (ShelterID)
										REFERENCES SHELTER_DETAILS (ShelterID));

CREATE TABLE IF NOT EXISTS HISTORY (
  HistoryID			INT				NOT NULL	AUTO_INCREMENT,
  RequestDate 		DATE			NOT NULL,
  AdoptionDate 		DATE 			NULL,
  Status 			CHAR(12) 		NOT NULL,
  Comments 			CHAR(100) 	NOT NULL,
  RequestID 		INT 			NOT NULL,
  CONSTRAINT 		HISTORY_PK			PRIMARY KEY (HISTORYID),
  CONSTRAINT        HISTORY_REQUEST_FK  FOREIGN KEY (RequestID)
										REFERENCES REQUEST (RequestID));

-- -----------------------------------------------------
-- Inserting data in the tables
-- -----------------------------------------------------

-- Table ADMIN_USER -----------------------------------
INSERT INTO ADMIN_USER (AdminID,FirstName,LastName,Phone,Email)
VALUES
(001,'Archana','Shinde',99185777,'***@gmail.com');

INSERT INTO ADMIN_USER (FirstName,LastName,Phone,Email)
VALUES
('***','**',99185756,'***@yahoo.com');

INSERT INTO ADMIN_USER (FirstName,LastName,Phone,Email)
VALUES
('***','***',99185734,'****@gmail.com');

INSERT INTO ADMIN_USER (FirstName,LastName,Phone,Email)
VALUES
('****','****',99666777,'****@gmail.com');

INSERT INTO ADMIN_USER (FirstName,LastName,Phone,Email)
VALUES
('****','Gundewar',99187877,'***@gmail.com');


-- Table USER ----------------------------------
INSERT INTO USER(UserID,IdentificationID,FirstName,LastName,Age,Phone,Address,FamilyMembersCount,Email,AdoptedBefore)
VALUES(01,'AAA112233','***','***',31,91568623,'Malad Mumbai',5,'***@gmail.com','N');

INSERT INTO USER(UserID,IdentificationID,FirstName,LastName,Age,Phone,Address,FamilyMembersCount,Email,AdoptedBefore)
VALUES(02,'BBB112233','**','****',25,91568624,'Andheri Mumbai',5,'***@gmail.com','Y');

INSERT INTO USER(UserID,IdentificationID,FirstName,LastName,Age,Phone,Address,FamilyMembersCount,Email,AdoptedBefore)
VALUES(03,'CCC112233','****','****',32,91568625,'Andheri Mumbai',5,'***@gmail.com','N');

INSERT INTO USER(UserID,IdentificationID,FirstName,LastName,Age,Phone,Address,FamilyMembersCount,Email,AdoptedBefore)
VALUES(04,'EEE112233','****','***',28,91568626,'Chadivali Mumbai',5,'***@gmail.com','N');

INSERT INTO USER(UserID,IdentificationID,FirstName,LastName,Age,Phone,Address,FamilyMembersCount,Email,AdoptedBefore)
VALUES(05,'DDD112233','****','****',35,91568627,'Goregoan Mumbai',5,'***@gmail.com','Y');


-- Table SHELTER_DETAILS ----------------------------------
INSERT INTO SHELTER_DETAILS(ShelterID,ShelterName,ShelterPhone,ShelterEmail,AvailibilityCount,Rating)
VALUES(121,'Save Our Stray',9198989,'saveourstray@gmail.com',10,'Good');

INSERT INTO SHELTER_DETAILS(ShelterID,ShelterName,ShelterPhone,ShelterEmail,AvailibilityCount,Rating)
VALUES(122,'YODA',9198978,'yoda@gmail.com',2,'Very Good');

INSERT INTO SHELTER_DETAILS(ShelterID,ShelterName,ShelterPhone,ShelterEmail,AvailibilityCount,Rating)
VALUES(123,'Animal Matters',91989568,'animalmatters@gmail.com',5,'Excellent');

INSERT INTO SHELTER_DETAILS(ShelterID,ShelterName,ShelterPhone,ShelterEmail,AvailibilityCount,Rating)
VALUES(124,'World For All',91989568,'worldforall@gmail.com',0,'Decent');

INSERT INTO SHELTER_DETAILS(ShelterID,ShelterName,ShelterPhone,ShelterEmail,AvailibilityCount,Rating)
VALUES('125','Dogies Dog World',9198547,'Dogiesdogworld@gmail.com',8,'Very Good');

INSERT INTO SHELTER_DETAILS(ShelterID,ShelterName,ShelterPhone,ShelterEmail,AvailibilityCount,Rating)
VALUES('126','Cat Cafe Studio',91987895,'catcafestudio@gmail.com',15,'Good');


-- Table ANIMAL_DETAILS ----------------------------------
INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID)
VALUES(151,'Dog','Indian Spitz','Adult','Female','Yes','Friendly',1);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Personality,AdminID,UserID)
VALUES(152,'Cat','Spotted','Young','Female','Loves to Cuddle',2,1);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID,ShelterID)
VALUES(153,'Cat','Siamese','Adult','Male','No','Good with strangers',3,121);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Personality,AdminID,UserID)
VALUES(154,'Dog','Comboi','Puppy','Male','Playful',1,3);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID,ShelterID)
VALUES(155,'Dog','Greyhound','Adult','Male','No','Good Boy',1,125);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID,UserID)
VALUES(156,'Dog','Kanni','Old','Female','Yes','Friendly',5,2);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID,ShelterID)
VALUES(157,'cat','Mumbai Cat','Kitten','Female','No','Very Friendly',4,126);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Personality,AdminID)
VALUES(158,'Dog','Pandikona','Adult','Male','Loves children',5);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID,UserID)
VALUES(159,'Dog','Comboi','Puppy','Female','No','Friendly',2,4);

INSERT INTO ANIMAL_DETAILS (AnimalID,Type,Breed,HowOld,Gender,Spayed,Personality,AdminID,ShelterID)
VALUES(160,'Dog','Pandikona','Young','Female','Yes','Cuddly',3,122);


-- Table VET_DETAILS ----------------------------------
 INSERT INTO VET_DETAILS(Vetlicense,VetName,VetClinic,VetFees)
  VALUES(1111,'Dr.Ashish','Malad West',500);

 INSERT INTO VET_DETAILS(Vetlicense,VetName,VetClinic,VetFees)
  VALUES(1211,'Dr.Maisha','Malad East',200.5);
  
INSERT INTO VET_DETAILS(Vetlicense,VetName,VetClinic,VetFees)
  VALUES(1311,'Dr.Bhavya','Andheri West',800);

 INSERT INTO VET_DETAILS(Vetlicense,VetName,VetClinic,VetFees)
  VALUES(1411,'Dr.Sunny','Andheri West',900);
  
 INSERT INTO VET_DETAILS(Vetlicense,VetName,VetClinic,VetFees)
  VALUES(1511,'Dr.Piyush','Bandra West',1500);
  

-- Table MEDICAL_RECORD ----------------------------------
INSERT INTO MEDICAL_RECORD (MedicalID,TreatmentDesc,TreatmentPrice,TreatmentDate,AnimalID,Vetlicense)
VALUES (111,'Vaccination',1257.56,'2019/01/01',151,1111);

INSERT INTO MEDICAL_RECORD (MedicalID,TreatmentDesc,TreatmentPrice,TreatmentDate,AnimalID,Vetlicense)
VALUES (112,'Vaccination',400,'2018/01/01',153,1211);

INSERT INTO MEDICAL_RECORD (MedicalID,TreatmentDesc,TreatmentPrice,TreatmentDate,AnimalID,Vetlicense)
VALUES (113,'Fever',150,'2019/08/01',157,1311);

INSERT INTO MEDICAL_RECORD (MedicalID,TreatmentDesc,TreatmentPrice,TreatmentDate,AnimalID,Vetlicense)
VALUES (114,'Surgery',1000,'2017/01/01',159,1111);

INSERT INTO MEDICAL_RECORD (MedicalID,TreatmentDesc,TreatmentPrice,TreatmentDate,AnimalID,Vetlicense)
VALUES (115,'Vaccination',900,'2019/03/01',155,1411);
  
  
-- Table OTHER_FACILITIES ----------------------------------
INSERT INTO OTHER_FACILITIES (FacilityID,FacilityDesc,FacilityProvider,Expenses,Address,AnimalID)
VALUES (91,'Food-Pedigree Dog 1Kg','Local Pet store',100,'Malwani',151);

INSERT INTO OTHER_FACILITIES (FacilityID,FacilityDesc,FacilityProvider,Expenses,Address,AnimalID)
VALUES (92,'Food-Treats','Local Pet store',350,'Malwani',151);

INSERT INTO OTHER_FACILITIES (FacilityID,FacilityDesc,FacilityProvider,Expenses,Address,AnimalID)
VALUES (93,'Leash','Furry Pet Market',70,'Bandra',158);

INSERT INTO OTHER_FACILITIES (FacilityID,FacilityDesc,FacilityProvider,Expenses)
VALUES (94,'Food-Pedigree Cat 1Kg','Cat Studio',75);

INSERT INTO OTHER_FACILITIES (FacilityID,FacilityDesc,FacilityProvider,Expenses,Address)
VALUES (95,'Basic Grooming','World for all NGO',0,'Dadar');


-- Table REQUEST ----------------------------------
INSERT INTO REQUEST (RequestID,RequestorName,RequestDesc,CreatedBy,AnimalDesc,RequestStatus,AdminID,AnimalID,ShelterID)
VALUES(1,'***','Search for Shelter','Admin','Black Adult male greyhound','Closed',1,155,125);

INSERT INTO REQUEST (RequestID,RequestorName,RequestDesc,CreatedBy,AnimalDesc,RequestStatus,UserID,AdminID,AnimalID)
VALUES(2,'***','Request for adoption','User','young spotted cat','Open',1,2,152);

INSERT INTO REQUEST (RequestID,RequestorName,RequestDesc,CreatedBy,AnimalDesc,RequestStatus,AdminID,AnimalID)
VALUES(3,'****','Search for Shelter','Admin','Adult Male dog','Closed',5,158);

INSERT INTO REQUEST (RequestID,RequestorName,RequestDesc,CreatedBy,AnimalDesc,RequestStatus,AdminID,AnimalID,ShelterID)
VALUES(4,'***','vacant place in shelter','shelter','Mumbai Kitten','Closed',4,157,126);

INSERT INTO REQUEST (RequestID,RequestorName,RequestDesc,CreatedBy,AnimalDesc,RequestStatus,UserID,AdminID,AnimalID)
VALUES(5,'***','request for adoption','user','Male Comboi Puppy','Closed',3,1,155);


-- Table HISTORY ----------------------------------
INSERT INTO HISTORY (HistoryID,RequestDate,Status,Comments,RequestID)
VALUES (1,'2019/02/10','Approved','Shelter accepted the request: AdminID=1,AnimalID=155,ShelterID=125',1);

INSERT INTO HISTORY (HistoryID,RequestDate,Status,Comments,RequestID)
VALUES (2,'2019/10/11','Pending','Waiting for background verification of user: UserID=1,AdminID=2,AnimalID=152',2);

INSERT INTO HISTORY (HistoryID,RequestDate,Status,Comments,RequestID)
VALUES (3,'2017/02/09','Rejected','Shelter only accept spayed dogs: AdminID=5,AnimalID=158,ShelterID=123',3);

INSERT INTO HISTORY (HistoryID,RequestDate,Status,Comments,RequestID)
VALUES (4,'2018/12/12','Approved','Shelter verified and kitten delivered: AdminID=4,AnimalID=157,ShelterID=126',4);

INSERT INTO HISTORY (HistoryID,RequestDate,AdoptionDate,Status,Comments,RequestID)
VALUES (5,'2019/03/10','2019/04/03','Approved','succesful background verification: UserID=3,AdminID=1,AnimalID=155',5);




USE wec353_1;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Game_Participation, FIFA_Games, Team_Members, Teams,
                     Payments, Member_Hobby, FamilyRelationship,
                     Family_Location_History, Member_Location_History,
                     Personnel_Assignment, Hobbies, FamilyMembers,
                     ClubMembers, Personnel, Locations;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Locations
(
    LocationID  INT AUTO_INCREMENT,
    Name        VARCHAR(100) NOT NULL,
    Type        ENUM('Head','Branch') NOT NULL,
    Address     VARCHAR(150),
    City        VARCHAR(50),
    Province    VARCHAR(50),
    PostalCode  VARCHAR(10),
    Phone       VARCHAR(20),
    WebAddress  VARCHAR(100),
    Capacity    INT,
    ManagerID   INT,                
    PRIMARY KEY (LocationID),
    UNIQUE (ManagerID)               
);


CREATE TABLE Personnel
(
    PersonnelID INT AUTO_INCREMENT,
    FirstName   VARCHAR(50),
    LastName    VARCHAR(50),
    DOB         DATE,
    SSN         VARCHAR(20) NOT NULL UNIQUE,   -- SSN cannot be null, no duplicates
    MedicareNo  VARCHAR(20) UNIQUE,            -- no two personnel share a Medicare number
    Phone       VARCHAR(20),
    Email       VARCHAR(100),
    Address     VARCHAR(150),
    City        VARCHAR(50),
    Province    VARCHAR(50),
    PostalCode  VARCHAR(10),
    Role        ENUM('Administrator','Captain','Coach','Assistant Coach','Other'),
    Mandate     ENUM('Volunteer','Salaried'),

    PRIMARY KEY (PersonnelID)
);

ALTER TABLE Locations
    ADD CONSTRAINT fk_location_manager
    FOREIGN KEY (ManagerID) REFERENCES Personnel(PersonnelID);

CREATE TABLE ClubMembers
(
    MemberID         INT AUTO_INCREMENT,      
    FirstName        VARCHAR(50),
    LastName         VARCHAR(50),
    DOB              DATE NOT NULL,
    Height           FLOAT,
    Weight           FLOAT,
    SSN              VARCHAR(20) UNIQUE,
    MedicareNo       VARCHAR(20) UNIQUE,
    Phone            VARCHAR(20),
    Address          VARCHAR(150),
    City             VARCHAR(50),
    Province         VARCHAR(50),
    PostalCode       VARCHAR(10),
    RegistrationDate DATE NOT NULL,
    MemberType       ENUM('Major','Minor') NOT NULL,

    PRIMARY KEY (MemberID),

    -- a new member must be at least 4 years old at registration
    CHECK (RegistrationDate >= DATE_ADD(DOB, INTERVAL 4 YEAR))
);

CREATE TABLE FamilyMembers
(
    FamilyID   INT AUTO_INCREMENT,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    DOB        DATE,
    SSN        VARCHAR(20) UNIQUE,
    MedicareNo VARCHAR(20) UNIQUE,
    Phone      VARCHAR(20),
    Email      VARCHAR(100),
    Address    VARCHAR(150),
    City       VARCHAR(50),
    Province   VARCHAR(50),
    PostalCode VARCHAR(10),

    PRIMARY KEY (FamilyID)
);


CREATE TABLE Hobbies
(
    HobbyID   INT AUTO_INCREMENT,
    HobbyName VARCHAR(50) NOT NULL UNIQUE,

    PRIMARY KEY (HobbyID)
);

CREATE TABLE Personnel_Assignment
(
    PersonnelID INT,
    LocationID  INT,
    StartDate   DATE,
    EndDate     DATE,                -- NULL==still active at the location

    PRIMARY KEY (PersonnelID, LocationID, StartDate),

    FOREIGN KEY (PersonnelID) REFERENCES Personnel(PersonnelID),
    FOREIGN KEY (LocationID)  REFERENCES Locations(LocationID)
);


CREATE TABLE Member_Location_History
(
    MemberID   INT,
    LocationID INT,
    StartDate  DATE,
    EndDate    DATE,                 -- NULL means current location

    PRIMARY KEY (MemberID, LocationID, StartDate),

    FOREIGN KEY (MemberID)   REFERENCES ClubMembers(MemberID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);


CREATE TABLE Family_Location_History
(
    FamilyID   INT,
    LocationID INT,
    StartDate  DATE,
    EndDate    DATE,                 -- NULL means current location

    PRIMARY KEY (FamilyID, LocationID, StartDate),

    FOREIGN KEY (FamilyID)   REFERENCES FamilyMembers(FamilyID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);


CREATE TABLE FamilyRelationship
(
    FamilyID         INT,
    MemberID         INT,
    StartDate        DATE,
    EndDate          DATE,           -- NULL means current association
    RelationshipType ENUM('Father','Mother','Grandfather','Grandmother',
                          'Tutor','Partner','Friend','Other'),

    PRIMARY KEY (FamilyID, MemberID, StartDate),

    FOREIGN KEY (FamilyID) REFERENCES FamilyMembers(FamilyID),
    FOREIGN KEY (MemberID) REFERENCES ClubMembers(MemberID)
);


CREATE TABLE Member_Hobby
(
    MemberID INT,
    HobbyID  INT,

    PRIMARY KEY (MemberID, HobbyID),

    FOREIGN KEY (MemberID) REFERENCES ClubMembers(MemberID),
    FOREIGN KEY (HobbyID)  REFERENCES Hobbies(HobbyID)
);


CREATE TABLE Payments
(
    PaymentID         INT AUTO_INCREMENT,
    MemberID          INT NOT NULL,
    PaymentDate       DATE,
    Amount            DECIMAL(10,2) NOT NULL,
    Method            ENUM('Cash','Debit','Credit Card'),
    MembershipYear    INT NOT NULL,
    InstallmentNumber TINYINT NOT NULL DEFAULT 1,

    PRIMARY KEY (PaymentID),

    FOREIGN KEY (MemberID) REFERENCES ClubMembers(MemberID),

    -- payments in at most 4 installments per membership year
    CHECK (InstallmentNumber BETWEEN 1 AND 4),
    UNIQUE (MemberID, MembershipYear, InstallmentNumber)
);


CREATE TABLE Teams
(
    TeamID     INT AUTO_INCREMENT,
    TeamName   VARCHAR(100),
    Gender     ENUM('Boys','Girls'),
    LocationID INT,

    PRIMARY KEY (TeamID),

    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);


CREATE TABLE Team_Members
(
    TeamID    INT,
    MemberID  INT,
    StartDate DATE,
    EndDate   DATE,

    PRIMARY KEY (TeamID, MemberID),

    FOREIGN KEY (TeamID)   REFERENCES Teams(TeamID),
    FOREIGN KEY (MemberID) REFERENCES ClubMembers(MemberID)
);


CREATE TABLE FIFA_Games
(
    GameID       INT AUTO_INCREMENT,
    GameDate     DATE,
    LocationID   INT,                
    OpponentTeam VARCHAR(100),
    Score        VARCHAR(20),        

    PRIMARY KEY (GameID),

    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);


CREATE TABLE Game_Participation
(
    MemberID INT,
    GameID   INT,
    TeamID   INT,                   

    PRIMARY KEY (MemberID, GameID),  

    FOREIGN KEY (MemberID) REFERENCES ClubMembers(MemberID),
    FOREIGN KEY (GameID)   REFERENCES FIFA_Games(GameID),
    FOREIGN KEY (TeamID)   REFERENCES Teams(TeamID)
);

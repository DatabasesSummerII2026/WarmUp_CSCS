
-- Run AFTER create_database.sql. Order matters.
-- Designed so every required query (i-viii) returns >= 2 tuples
-- and both 'Active' and 'Inactive' statuses appear.

USE wec353_1;

-- 1. Locations (ManagerID set after Personnel is populated)

INSERT INTO Locations (Name, Type, Address, City, Province, PostalCode, Phone, WebAddress, Capacity) VALUES
('Montreal Head Office',  'Head',   '123 Main Street',    'Montreal',      'Quebec',  'H1A1A1', '5141111111', 'www.cscs-montreal.ca',   500),
('Laval Branch',          'Branch', '456 Laval Street',   'Laval',         'Quebec',  'H2B2B2', '4502222222', 'www.cscs-laval.ca',      300),
('Longueuil Branch',      'Branch', '789 Longueuil Ave',  'Longueuil',     'Quebec',  'J3C3C3', '4503333333', 'www.cscs-longueuil.ca',  250),
('Toronto Branch',        'Branch', '10 Toronto Road',    'Toronto',       'Ontario', 'M4A4A4', '4164444444', 'www.cscs-toronto.ca',    400),
('Ottawa Branch',         'Branch', '20 Ottawa Road',     'Ottawa',        'Ontario', 'K1A5A5', '6135555555', 'www.cscs-ottawa.ca',     350),
('Quebec City Branch',    'Branch', '30 Quebec Road',     'Quebec City',   'Quebec',  'G1A6A6', '4186666666', 'www.cscs-quebec.ca',     200),
('Sherbrooke Branch',     'Branch', '40 Sherbrooke Road', 'Sherbrooke',    'Quebec',  'J1A7A7', '8197777777', 'www.cscs-sherbrooke.ca', 180),
('Gatineau Branch',       'Branch', '50 Gatineau Road',   'Gatineau',      'Quebec',  'J8X8X8', '8198888888', 'www.cscs-gatineau.ca',   220),
('Brossard Branch',       'Branch', '60 Brossard Road',   'Brossard',      'Quebec',  'J4Z9Z9', '4509999999', 'www.cscs-brossard.ca',   200),
('Drummondville Branch',  'Branch', '70 Drummond Street', 'Drummondville', 'Quebec',  'J2B0B0', '8190000000', 'www.cscs-drummond.ca',   150);


-- 2. Personnel

INSERT INTO Personnel (FirstName, LastName, DOB, SSN, MedicareNo, Phone, Email, Address, City, Province, PostalCode, Role, Mandate) VALUES
('John',    'Smith',    '1980-01-10', '111111111', 'M111111', '5141111111', 'john@cscs.ca',    '1 Street',  'Montreal',      'Quebec',  'H1A1A1', 'Administrator',   'Salaried'),
('David',   'Brown',    '1985-02-15', '222222222', 'M222222', '5142222222', 'david@cscs.ca',   '2 Street',  'Laval',         'Quebec',  'H2B2B2', 'Administrator',   'Salaried'),
('Michael', 'Lee',      '1990-03-20', '333333333', 'M333333', '5143333333', 'michael@cscs.ca', '3 Street',  'Longueuil',     'Quebec',  'J3C3C3', 'Administrator',   'Volunteer'),
('Robert',  'Wilson',   '1988-04-25', '444444444', 'M444444', '4164444444', 'robert@cscs.ca',  '4 Street',  'Toronto',       'Ontario', 'M4A4A4', 'Administrator',   'Salaried'),
('James',   'Taylor',   '1992-05-30', '555555555', 'M555555', '6135555555', 'james@cscs.ca',   '5 Street',  'Ottawa',        'Ontario', 'K1A5A5', 'Administrator',   'Volunteer'),
('William', 'Anderson', '1987-06-05', '666666666', 'M666666', '4186666666', 'william@cscs.ca', '6 Street',  'Quebec City',   'Quebec',  'G1A6A6', 'Administrator',   'Salaried'),
('Daniel',  'Thomas',   '1991-07-10', '777777777', 'M777777', '8197777777', 'daniel@cscs.ca',  '7 Street',  'Sherbrooke',    'Quebec',  'J1A7A7', 'Administrator',   'Volunteer'),
('Chris',   'Jackson',  '1993-08-15', '888888888', 'M888888', '8198888888', 'chris@cscs.ca',   '8 Street',  'Gatineau',      'Quebec',  'J8X8X8', 'Administrator',   'Volunteer'),
('Kevin',   'White',    '1986-09-20', '999999999', 'M999999', '4509999999', 'kevin@cscs.ca',   '9 Street',  'Brossard',      'Quebec',  'J4Z9Z9', 'Administrator',   'Salaried'),
('Mark',    'Harris',   '1989-10-25', '101010101', 'M101010', '8190000000', 'mark@cscs.ca',    '10 Street', 'Drummondville', 'Quebec',  'J2B0B0', 'Administrator',   'Volunteer'),
('Sarah',   'Miller',   '1994-11-11', '121212121', 'M121212', '5146666666', 'sarah@cscs.ca',   '11 Street', 'Montreal',      'Quebec',  'H1B1B1', 'Coach',           'Salaried'),
('Laura',   'Davis',    '1995-12-12', '131313131', 'M131313', '5147777777', 'laura@cscs.ca',   '12 Street', 'Laval',         'Quebec',  'H2C2C2', 'Assistant Coach', 'Volunteer');

-- Each location's manager (general manager at the Head location = club president)
UPDATE Locations SET ManagerID = 1  WHERE LocationID = 1;
UPDATE Locations SET ManagerID = 2  WHERE LocationID = 2;
UPDATE Locations SET ManagerID = 3  WHERE LocationID = 3;
UPDATE Locations SET ManagerID = 4  WHERE LocationID = 4;
UPDATE Locations SET ManagerID = 5  WHERE LocationID = 5;
UPDATE Locations SET ManagerID = 6  WHERE LocationID = 6;
UPDATE Locations SET ManagerID = 7  WHERE LocationID = 7;
UPDATE Locations SET ManagerID = 8  WHERE LocationID = 8;
UPDATE Locations SET ManagerID = 9  WHERE LocationID = 9;
UPDATE Locations SET ManagerID = 10 WHERE LocationID = 10;


-- 3. ClubMembers
--    Majors: 1, 3, 5, 7, 9, 11   Minors: 2, 4, 6, 8, 10
--    Members 1 and 3 are ALSO family members (same SSN) -> query vi

INSERT INTO ClubMembers (FirstName, LastName, DOB, Height, Weight, SSN, MedicareNo, Phone, Address, City, Province, PostalCode, RegistrationDate, MemberType) VALUES
('Alex',     'Martin',   '2000-01-01', 180, 75, 'MSSN001', 'MED001', '5140000001', '1 Main St',  'Montreal',      'Quebec',  'H1A1A1', '2023-01-15', 'Major'),
('Lucas',    'Brown',    '2012-02-02', 150, 45, 'MSSN002', 'MED002', '5140000002', '2 Main St',  'Laval',         'Quebec',  'H2B2B2', '2023-02-01', 'Minor'),
('Emma',     'Wilson',   '2002-03-03', 165, 55, 'MSSN003', 'MED003', '5140000003', '3 Main St',  'Longueuil',     'Quebec',  'J3C3C3', '2023-01-20', 'Major'),
('Noah',     'Taylor',   '2013-04-04', 145, 40, 'MSSN004', 'MED004', '5140000004', '4 Main St',  'Toronto',       'Ontario', 'M4A4A4', '2023-03-01', 'Minor'),
('Olivia',   'Anderson', '1999-05-05', 175, 65, 'MSSN005', 'MED005', '5140000005', '5 Main St',  'Ottawa',        'Ontario', 'K1A5A5', '2023-01-10', 'Major'),
('Ethan',    'Thomas',   '2014-06-06', 140, 38, 'MSSN006', 'MED006', '5140000006', '6 Main St',  'Quebec City',   'Quebec',  'G1A6A6', '2023-04-01', 'Minor'),
('Sophia',   'Jackson',  '2001-07-07', 168, 58, 'MSSN007', 'MED007', '5140000007', '7 Main St',  'Sherbrooke',    'Quebec',  'J1A7A7', '2023-02-15', 'Major'),
('Mason',    'White',    '2015-08-08', 130, 35, 'MSSN008', 'MED008', '5140000008', '8 Main St',  'Gatineau',      'Quebec',  'J8X8X8', '2023-05-01', 'Minor'),
('Ava',      'Harris',   '1998-09-09', 178, 70, 'MSSN009', 'MED009', '5140000009', '9 Main St',  'Brossard',      'Quebec',  'J4Z9Z9', '2023-01-25', 'Major'),
('Liam',     'Clark',    '2016-10-10', 125, 32, 'MSSN010', 'MED010', '5140000010', '10 Main St', 'Drummondville', 'Quebec',  'J2B0B0', '2023-06-01', 'Minor'),
('Isabella', 'Lewis',    '1997-11-11', 170, 60, 'MSSN011', 'MED011', '5140000011', '11 Main St', 'Montreal',      'Quebec',  'H1C1C1', '2024-01-05', 'Major');


-- 4. FamilyMembers
--    Rows 11 and 12 are club members 1 (Alex) and 3 (Emma): same SSN/MedicareNo

INSERT INTO FamilyMembers (FirstName, LastName, DOB, SSN, MedicareNo, Phone, Email, Address, City, Province, PostalCode) VALUES
('Peter',   'Martin',   '1970-01-01', 'FSSN001', 'FMED001', '5141110001', 'peter@test.com',   '1 Family St',  'Montreal',      'Quebec',  'H1A1A1'),
('Mary',    'Brown',    '1975-02-02', 'FSSN002', 'FMED002', '5141110002', 'mary@test.com',    '2 Family St',  'Laval',         'Quebec',  'H2B2B2'),
('John',    'Wilson',   '1972-03-03', 'FSSN003', 'FMED003', '5141110003', 'john@test.com',    '3 Family St',  'Longueuil',     'Quebec',  'J3C3C3'),
('Anna',    'Taylor',   '1978-04-04', 'FSSN004', 'FMED004', '5141110004', 'anna@test.com',    '4 Family St',  'Toronto',       'Ontario', 'M4A4A4'),
('David',   'Anderson', '1970-05-05', 'FSSN005', 'FMED005', '5141110005', 'david@test.com',   '5 Family St',  'Ottawa',        'Ontario', 'K1A5A5'),
('Linda',   'Thomas',   '1976-06-06', 'FSSN006', 'FMED006', '5141110006', 'linda@test.com',   '6 Family St',  'Quebec City',   'Quebec',  'G1A6A6'),
('Robert',  'Jackson',  '1974-07-07', 'FSSN007', 'FMED007', '5141110007', 'robert@test.com',  '7 Family St',  'Sherbrooke',    'Quebec',  'J1A7A7'),
('Susan',   'White',    '1979-08-08', 'FSSN008', 'FMED008', '5141110008', 'susan@test.com',   '8 Family St',  'Gatineau',      'Quebec',  'J8X8X8'),
('Michael', 'Harris',   '1971-09-09', 'FSSN009', 'FMED009', '5141110009', 'michael@test.com', '9 Family St',  'Brossard',      'Quebec',  'J4Z9Z9'),
('Karen',   'Clark',    '1980-10-10', 'FSSN010', 'FMED010', '5141110010', 'karen@test.com',   '10 Family St', 'Drummondville', 'Quebec',  'J2B0B0'),
('Alex',    'Martin',   '2000-01-01', 'MSSN001', 'MED001',  '5140000001', 'alex@test.com',    '1 Main St',    'Montreal',      'Quebec',  'H1A1A1'),
('Emma',    'Wilson',   '2002-03-03', 'MSSN003', 'MED003',  '5140000003', 'emma@test.com',    '3 Main St',    'Longueuil',     'Quebec',  'J3C3C3');


-- 5. Hobbies

INSERT INTO Hobbies (HobbyName) VALUES
('Soccer'), ('Swimming'), ('Tennis'), ('Golf'), ('Hockey'),
('Volleyball'), ('Ping Pong'), ('Basketball'), ('Running'), ('Cycling');

=
-- 6. Personnel_Assignment (EndDate NULL = still active there)
--    Personnel 2 has a past assignment to show work history.

INSERT INTO Personnel_Assignment (PersonnelID, LocationID, StartDate, EndDate) VALUES
(1,  1,  '2024-01-01', NULL),
(2,  1,  '2023-01-01', '2023-12-31'),
(2,  2,  '2024-01-01', NULL),
(3,  3,  '2024-01-01', NULL),
(4,  4,  '2024-01-01', NULL),
(5,  5,  '2024-01-01', NULL),
(6,  6,  '2024-01-01', NULL),
(7,  7,  '2024-01-01', NULL),
(8,  8,  '2024-01-01', NULL),
(9,  9,  '2024-01-01', NULL),
(10, 10, '2024-01-01', NULL),
(11, 1,  '2024-06-01', NULL),
(12, 2,  '2024-06-01', NULL);


-- 7. Member_Location_History (EndDate NULL = current location)
--    Member 1 moved from Laval to Montreal to show member movement.

INSERT INTO Member_Location_History (MemberID, LocationID, StartDate, EndDate) VALUES
(1,  2,  '2023-01-15', '2023-12-31'),
(1,  1,  '2024-01-01', NULL),
(2,  2,  '2023-02-01', NULL),
(3,  3,  '2023-01-20', NULL),
(4,  4,  '2023-03-01', NULL),
(5,  5,  '2023-01-10', NULL),
(6,  6,  '2023-04-01', NULL),
(7,  7,  '2023-02-15', NULL),
(8,  8,  '2023-05-01', NULL),
(9,  9,  '2023-01-25', NULL),
(10, 10, '2023-06-01', NULL),
(11, 1,  '2024-01-05', NULL);


-- 8. Family_Location_History

INSERT INTO Family_Location_History (FamilyID, LocationID, StartDate, EndDate) VALUES
(1,  1,  '2023-01-01', NULL),
(2,  2,  '2023-01-01', NULL),
(3,  3,  '2023-01-01', NULL),
(4,  4,  '2023-01-01', NULL),
(5,  5,  '2023-01-01', NULL),
(6,  6,  '2023-01-01', NULL),
(7,  7,  '2023-01-01', NULL),
(8,  8,  '2023-01-01', NULL),
(9,  9,  '2023-01-01', NULL),
(10, 10, '2023-01-01', NULL),
(11, 1,  '2023-01-15', NULL),
(12, 3,  '2023-01-20', NULL);


-- 9. FamilyRelationship
--    Minors 2 and 4 changed family member over time (history kept).
--    Family 11 = club member 1 (Alex); family 12 = club member 3 (Emma) -> query vi

INSERT INTO FamilyRelationship (FamilyID, MemberID, StartDate, EndDate, RelationshipType) VALUES
(1,  2,  '2023-02-01', '2024-12-31', 'Father'),
(11, 2,  '2025-01-01', NULL,         'Father'),
(2,  4,  '2023-03-01', '2024-12-31', 'Mother'),
(12, 4,  '2025-01-01', NULL,         'Tutor'),
(3,  6,  '2023-04-01', NULL,         'Father'),
(4,  8,  '2023-05-01', NULL,         'Mother'),
(5,  10, '2023-06-01', NULL,         'Tutor'),
(6,  2,  '2023-02-01', '2023-12-31', 'Friend'),
(7,  4,  '2023-03-01', '2023-12-31', 'Grandmother'),
(8,  6,  '2023-04-01', '2023-12-31', 'Grandfather');


-- 10. Member_Hobby (members 1, 3, 5 each have 4 hobbies -> query iii)

INSERT INTO Member_Hobby (MemberID, HobbyID) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(3, 1), (3, 2), (3, 6), (3, 7),
(5, 3), (5, 4), (5, 5), (5, 8),
(2, 1), (2, 5),
(4, 1),
(6, 5),
(7, 8),
(8, 9),
(9, 10),
(10, 1),
(11, 2);


-- 11. Payments
--    Fee: Major 200$/yr, Minor 100$/yr, max 4 installments per year.
--    Yearly total above the fee = donation.
--    Previous year (2025) unpaid/partial -> member is Inactive:
--      member 7 paid only 100/200 in 2025 -> Inactive
--      member 9 paid nothing in 2025      -> Inactive

INSERT INTO Payments (MemberID, PaymentDate, Amount, Method, MembershipYear, InstallmentNumber) VALUES
(1,  '2022-12-15', 100.00, 'Credit Card', 2023, 1),
(1,  '2023-03-15', 100.00, 'Credit Card', 2023, 2),
(1,  '2023-12-20', 250.00, 'Debit',       2024, 1),   -- 50$ donation
(1,  '2024-12-28', 200.00, 'Credit Card', 2025, 1),
(2,  '2023-12-10', 150.00, 'Cash',        2024, 1),   -- minor: 50$ donation
(2,  '2024-12-15', 100.00, 'Cash',        2025, 1),
(3,  '2022-12-20', 300.00, 'Credit Card', 2023, 1),   -- 100$ donation
(3,  '2023-12-15', 200.00, 'Debit',       2024, 1),
(3,  '2024-11-30', 100.00, 'Debit',       2025, 1),
(3,  '2025-02-15', 100.00, 'Debit',       2025, 2),
(4,  '2024-12-10', 100.00, 'Credit Card', 2025, 1),
(5,  '2024-12-05', 220.00, 'Cash',        2025, 1),   -- 20$ donation
(6,  '2024-12-12', 100.00, 'Debit',       2025, 1),
(7,  '2024-12-18', 100.00, 'Cash',        2025, 1),   -- partial: Inactive
(8,  '2024-12-22', 100.00, 'Credit Card', 2025, 1),
(9,  '2023-12-30', 200.00, 'Debit',       2024, 1),   -- nothing for 2025: Inactive
(10, '2024-12-26', 100.00, 'Cash',        2025, 1),
(11, '2024-12-30', 200.00, 'Credit Card', 2025, 1);


-- 12. Teams

INSERT INTO Teams (TeamName, Gender, LocationID) VALUES
('Montreal Lions',    'Boys',  1),
('Laval Eagles',      'Girls', 2),
('Longueuil Tigers',  'Boys',  3),
('Toronto Wolves',    'Girls', 4),
('Ottawa Falcons',    'Boys',  5),
('Quebec Stars',      'Girls', 6),
('Sherbrooke United', 'Boys',  7),
('Gatineau Panthers', 'Girls', 8),
('Brossard Dragons',  'Boys',  9),
('Drummond Warriors', 'Girls', 10);


-- 13. Team_Members

INSERT INTO Team_Members (TeamID, MemberID, StartDate, EndDate) VALUES
(1,  1,  '2024-01-01', NULL),
(2,  2,  '2024-01-01', NULL),
(3,  3,  '2024-01-01', NULL),
(4,  4,  '2024-01-01', NULL),
(5,  5,  '2024-01-01', NULL),
(6,  6,  '2024-01-01', NULL),
(7,  7,  '2024-01-01', NULL),
(8,  8,  '2024-01-01', NULL),
(9,  9,  '2024-01-01', NULL),
(10, 10, '2024-01-01', NULL),
(1,  11, '2024-02-01', NULL);


-- 14. FIFA_Games

INSERT INTO FIFA_Games (GameDate, LocationID, OpponentTeam, Score) VALUES
('2024-03-01', 1,  'Toronto FC',    '3-1'),
('2024-04-01', 2,  'Ottawa FC',     '2-2'),
('2024-05-01', 3,  'Quebec FC',     '1-0'),
('2024-06-01', 4,  'Laval FC',      '4-2'),
('2024-07-01', 5,  'Montreal FC',   '0-1'),
('2025-03-01', 6,  'Sherbrooke FC', '2-0'),
('2025-04-01', 7,  'Gatineau FC',   '3-3'),
('2025-05-01', 8,  'Brossard FC',   '1-2'),
('2025-06-01', 9,  'Drummond FC',   '5-1'),
('2025-07-01', 10, 'Toronto FC',    '2-1');

-- 15. Game_Participation
--    Members 1 (5 games) and 3 (4 games) -> query viii (>= 4 games)
--    Majors 9 and 11 never played        -> query iv
INSERT INTO Game_Participation (MemberID, GameID, TeamID) VALUES
(1, 1,  1),
(1, 2,  1),
(1, 3,  1),
(1, 4,  1),
(1, 5,  1),
(3, 1,  3),
(3, 2,  3),
(3, 3,  3),
(3, 4,  3),
(5, 6,  5),
(5, 7,  5),
(7, 6,  7),
(2, 8,  2),
(2, 9,  2),
(4, 10, 4);

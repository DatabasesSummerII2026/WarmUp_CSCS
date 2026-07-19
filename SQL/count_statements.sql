-- COUNT(*) for every relation in the CSCS database
USE wec353_1;

SELECT COUNT(*) AS Locations_Count               FROM Locations;
SELECT COUNT(*) AS Personnel_Count               FROM Personnel;
SELECT COUNT(*) AS ClubMembers_Count             FROM ClubMembers;
SELECT COUNT(*) AS FamilyMembers_Count           FROM FamilyMembers;
SELECT COUNT(*) AS Hobbies_Count                 FROM Hobbies;
SELECT COUNT(*) AS Personnel_Assignment_Count    FROM Personnel_Assignment;
SELECT COUNT(*) AS Member_Location_History_Count FROM Member_Location_History;
SELECT COUNT(*) AS Family_Location_History_Count FROM Family_Location_History;
SELECT COUNT(*) AS FamilyRelationship_Count      FROM FamilyRelationship;
SELECT COUNT(*) AS Member_Hobby_Count            FROM Member_Hobby;
SELECT COUNT(*) AS Payments_Count                FROM Payments;
SELECT COUNT(*) AS Teams_Count                   FROM Teams;
SELECT COUNT(*) AS Team_Members_Count            FROM Team_Members;
SELECT COUNT(*) AS FIFA_Games_Count              FROM FIFA_Games;
SELECT COUNT(*) AS Game_Participation_Count      FROM Game_Participation;

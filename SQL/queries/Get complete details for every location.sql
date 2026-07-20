-- Query i: complete details for every location
USE wec353_1;

SELECT
    L.Name AS Location_Name,
    L.Address,
    L.City,
    L.Province,
    L.PostalCode,
    L.Phone,
    L.WebAddress,
    L.Type,
    L.Capacity,

    CONCAT(M.FirstName, ' ', M.LastName) AS General_Manager,

    (SELECT COUNT(*)
     FROM Personnel_Assignment PA
     WHERE PA.LocationID = L.LocationID
       AND PA.EndDate IS NULL) AS Number_of_Personnel,

    (SELECT COUNT(*)
     FROM Member_Location_History MLH
     WHERE MLH.LocationID = L.LocationID
       AND MLH.EndDate IS NULL) AS Number_of_Members,

    (SELECT COUNT(DISTINCT GP.MemberID)
     FROM Game_Participation GP
     JOIN Member_Location_History MLH2 ON GP.MemberID = MLH2.MemberID
     WHERE MLH2.LocationID = L.LocationID
       AND MLH2.EndDate IS NULL) AS FIFA_Players

FROM Locations L
LEFT JOIN Personnel M ON L.ManagerID = M.PersonnelID

ORDER BY Number_of_Members ASC;

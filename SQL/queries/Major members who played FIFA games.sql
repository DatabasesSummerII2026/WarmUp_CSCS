-- Query ii: major members who played in at least one FIFA game
USE wec353_1;

SELECT
    L.Name AS Location_Name,
    CM.MemberID,
    CM.FirstName,
    CM.LastName,
    TIMESTAMPDIFF(YEAR, CM.DOB, CURDATE()) AS Age,
    CM.City,
    CM.Province,

    CASE
        WHEN (SELECT COALESCE(SUM(P.Amount), 0)
              FROM Payments P
              WHERE P.MemberID = CM.MemberID
                AND P.MembershipYear = YEAR(CURDATE()) - 1)
             >= (CASE WHEN CM.MemberType = 'Major' THEN 200 ELSE 100 END)
        THEN 'Active'
        ELSE 'Inactive'
    END AS Status,

    COUNT(GP.GameID) AS FIFA_Game_Number

FROM ClubMembers CM
JOIN Member_Location_History MLH
     ON CM.MemberID = MLH.MemberID AND MLH.EndDate IS NULL
JOIN Locations L
     ON MLH.LocationID = L.LocationID
JOIN Game_Participation GP
     ON CM.MemberID = GP.MemberID

WHERE CM.MemberType = 'Major'

GROUP BY CM.MemberID, L.Name

ORDER BY FIFA_Game_Number ASC;

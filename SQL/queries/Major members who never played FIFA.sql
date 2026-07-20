-- Query iv: major members who never played in any FIFA game
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
    END AS Status

FROM ClubMembers CM
JOIN Member_Location_History MLH
     ON CM.MemberID = MLH.MemberID AND MLH.EndDate IS NULL
JOIN Locations L
     ON MLH.LocationID = L.LocationID

WHERE CM.MemberType = 'Major'
  AND CM.MemberID NOT IN (SELECT MemberID FROM Game_Participation)

ORDER BY Location_Name ASC, Age ASC;

-- Query iii: club members with at least four different hobbies
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

    COUNT(DISTINCT MH.HobbyID) AS Hobby_Number

FROM ClubMembers CM
JOIN Member_Location_History MLH
     ON CM.MemberID = MLH.MemberID AND MLH.EndDate IS NULL
JOIN Locations L
     ON MLH.LocationID = L.LocationID
JOIN Member_Hobby MH
     ON CM.MemberID = MH.MemberID

GROUP BY CM.MemberID, L.Name

HAVING COUNT(DISTINCT MH.HobbyID) >= 4

ORDER BY Age DESC, Location_Name ASC;

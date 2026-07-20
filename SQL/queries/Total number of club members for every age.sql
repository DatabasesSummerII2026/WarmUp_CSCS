-- Query v: total number of club members for every age, all locations
USE wec353_1;

SELECT
    TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age,
    COUNT(*) AS Number_of_Members
FROM ClubMembers
GROUP BY Age
ORDER BY Age DESC;

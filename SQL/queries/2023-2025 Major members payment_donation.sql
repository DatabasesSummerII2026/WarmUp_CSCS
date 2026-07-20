-- Query vii: sum of membership fees and donations from major members, 2023-2025
-- The yearly fee for a major member is 200$; anything paid above that within a membership year counts as a donation.
USE wec353_1;

SELECT
    SUM(LEAST(T.TotalPaid, 200))        AS Total_Membership_Fees,
    SUM(GREATEST(T.TotalPaid - 200, 0)) AS Total_Donations
FROM (
    SELECT P.MemberID, P.MembershipYear, SUM(P.Amount) AS TotalPaid
    FROM Payments P
    JOIN ClubMembers CM ON P.MemberID = CM.MemberID
    WHERE CM.MemberType = 'Major'
      AND P.MembershipYear BETWEEN 2023 AND 2025
    GROUP BY P.MemberID, P.MembershipYear
) AS T;

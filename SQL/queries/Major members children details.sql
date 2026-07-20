-- Query vi: for every major club member who is also a family member,
-- details of all club members associated with him/her
USE wec353_1;

SELECT
    FM.FirstName AS Major_Member_FirstName,
    FM.LastName  AS Major_Member_LastName,

    Child.MemberID AS Associated_Membership_No,
    Child.FirstName,
    Child.LastName,
    Child.DOB,
    Child.SSN,
    Child.MedicareNo,
    Child.Phone,
    Child.Address,
    Child.City,
    Child.Province,
    Child.PostalCode,

    FR.RelationshipType,

    CASE
        WHEN (SELECT COALESCE(SUM(P.Amount), 0)
              FROM Payments P
              WHERE P.MemberID = Child.MemberID
                AND P.MembershipYear = YEAR(CURDATE()) - 1)
             >= (CASE WHEN Child.MemberType = 'Major' THEN 200 ELSE 100 END)
        THEN 'Active'
        ELSE 'Inactive'
    END AS Status

FROM FamilyMembers FM
JOIN ClubMembers Parent
     ON FM.SSN = Parent.SSN          -- the family member is also a club member
JOIN FamilyRelationship FR
     ON FM.FamilyID = FR.FamilyID
JOIN ClubMembers Child
     ON FR.MemberID = Child.MemberID

WHERE Parent.MemberType = 'Major';

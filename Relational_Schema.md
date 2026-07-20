# Country Soccer Club System (CSCS)

# Relational Schema Design

## COMP353 - Databases
## Summer 2026

---
**CSCS Relational Schema**

1\. **Locations**(<ins>locationID</ins>, name, type, address, city, province, postalCode, phone, webAddress, capacity, managerID)

**Constraints:**

• Foreign key: managerID references Personnel(personnelID)

• Unique: managerID (a personnel member manages at most one location)

• type ∈ {Head, Branch}



2\. **Personnel**(<ins>personnelID</ins>, firstName, lastName, DOB, SSN, MedicareNo, phone, email, address, city, province, postalCode, role, mandate)

**Constraints:**

• Unique: SSN (NOT NULL), MedicareNo

• role ∈ {Administrator, Captain, Coach, Assistant Coach, Other}

• mandate ∈ {Volunteer, Salaried}



3\. **ClubMembers**(<ins>memberID</ins>, firstName, lastName, DOB, height, weight, SSN, MedicareNo, phone, address, city, province, postalCode, registrationDate, memberType)

**Constraints:**

• memberID is globally unique and auto-incremented (the club membership number)

• Unique: SSN, MedicareNo

• memberType ∈ {Major, Minor}

• CHECK: registrationDate ≥ DOB + 4 years (a member must be at least 4 years old at registration)



4\. **FamilyMembers**(<ins>familyID</ins>, firstName, lastName, DOB, SSN, MedicareNo, phone, email, address, city, province, postalCode)

**Constraints:**

• Unique: SSN, MedicareNo



5\. **Hobbies**(<ins>hobbyID</ins>, hobbyName)

**Constraints:**

• Unique: hobbyName (NOT NULL)



6\. **Personnel_Assignment**(<ins>personnelID</ins>, <ins>locationID</ins>, <ins>startDate</ins>, endDate)

**Constraints:**

• Foreign key: personnelID references Personnel(personnelID)

• Foreign key: locationID references Locations(locationID)

• endDate = NULL means the personnel member is still active at the location



7\. **Member_Location_History**(<ins>memberID</ins>, <ins>locationID</ins>, <ins>startDate</ins>, endDate)

**Constraints:**

• Foreign key: memberID references ClubMembers(memberID)

• Foreign key: locationID references Locations(locationID)

• endDate = NULL means the member is currently associated with the location



8\. **Family_Location_History**(<ins>familyID</ins>, <ins>locationID</ins>, <ins>startDate</ins>, endDate)

**Constraints:**

• Foreign key: familyID references FamilyMembers(familyID)

• Foreign key: locationID references Locations(locationID)

• endDate = NULL means the family member is currently associated with the location



9\. **FamilyRelationship**(<ins>familyID</ins>, <ins>memberID</ins>, <ins>startDate</ins>, endDate, relationshipType)

**Constraints:**

• Foreign key: familyID references FamilyMembers(familyID)

• Foreign key: memberID references ClubMembers(memberID)

• relationshipType ∈ {Father, Mother, Grandfather, Grandmother, Tutor, Partner, Friend, Other}

• endDate = NULL means the association is current (a minor member can be associated with different family members at different times)



10\. **Member_Hobby**(<ins>memberID</ins>, <ins>hobbyID</ins>)

**Constraints:**

• Foreign key: memberID references ClubMembers(memberID)

• Foreign key: hobbyID references Hobbies(hobbyID)



11\. **Payments**(<ins>paymentID</ins>, memberID, paymentDate, amount, method, membershipYear, installmentNumber)

**Constraints:**

• Foreign key: memberID references ClubMembers(memberID)

• method ∈ {Cash, Debit, Credit Card}

• CHECK: installmentNumber between 1 and 4 (payments in at most 4 installments per year)

• Unique: (memberID, membershipYear, installmentNumber)

• Annual fee: 100$ for a minor member, 200$ for a major member; any amount paid above the fee within a membership year is a donation. A member whose previous-year fee was not fully paid is inactive.



12\. **Teams**(<ins>teamID</ins>, teamName, gender, locationID)

**Constraints:**

• Foreign key: locationID references Locations(locationID)

• gender ∈ {Boys, Girls}



13\. **Team_Members**(<ins>teamID</ins>, <ins>memberID</ins>, startDate, endDate)

**Constraints:**

• Foreign key: teamID references Teams(teamID)

• Foreign key: memberID references ClubMembers(memberID)



14\. **FIFA_Games**(<ins>gameID</ins>, gameDate, locationID, opponentTeam, score)

**Constraints:**

• Foreign key: locationID references Locations(locationID) (where the game was played)



15\. **Game_Participation**(<ins>memberID</ins>, <ins>gameID</ins>, teamID)

**Constraints:**

• Foreign key: memberID references ClubMembers(memberID)

• Foreign key: gameID references FIFA_Games(gameID)

• Foreign key: teamID references Teams(teamID) (the club team the member played with)

• Primary key (memberID, gameID): a member appears at most once per game

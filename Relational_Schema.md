# Country Soccer Club System (CSCS)

# Relational Schema Design

## COMP353 - Databases
## Summer 2026


---
**CSCS Relational Schema**

1\. **Locations**(<ins>locationID</ins>, name, type, address, city, province, postalCode, phoneNumber, webAddress, capacity, managerPersonnelID)

**Constraints:**

• Foreign key: managerPersonnelID references Personnel(personnelID)

• Unique: managerPersonnelID


2\. **Personnel**(<ins>personnelID</ins>, firstName, lastName, dateOfBirth, SSN, MedicareNo, telephone, address, city, province, postalCode, email, role, mandate)

**Constraints:**

• Unique: SSN (not Null),MedicareNo


3\. **WorksAt**(<ins>personnelID</ins>, <ins>locationID</ins>, <ins>startDate</ins>, endDate)

**Constraints:**

• Foreign key: personnelID references Personnel(personnelID)

• Foreign key: locationID references Locations(locationID)


4\. **FamilyMembers**(<ins>familyMemberID</ins>, firstName, lastName, dateOfBirth, SSN, MedicareNo, telephone, address, city, province, postalCode, email)

**Constraints:**

• Unique: SSN, MedicareNo


5\. **FamilyAssignment**(<ins>familyMemberID</ins>, <ins>locationID</ins>, <ins>startDate</ins>, endDate)

**Constraints:**

• Foreign key: familyMemberID references FamilyMembers(familyMemberID)

• Foreign key: locationID references Locations(locationID)


6\. **ClubMembers**(<ins>membershipNo</ins>, firstName, lastName, dateOfBirth, height, weight, SSN, MedicareNo, telephone, address, city, province, postalCode, registrationDate)

**Constraints:**

• Unique: SSN, MedicareNo

• membershipNo is globally unique and auto-incremented


7\. **MajorMembers**(<ins>membershipNo</ins>)

**Constraints:**

• Foreign key: membershipNo references ClubMembers(membershipNo)


8\. **MinorMembers**(<ins>membershipNo</ins>)

**Constraints:**

• Foreign key: membershipNo references ClubMembers(membershipNo)


9\. **MemberAssignment**(<ins>membershipNo</ins>, locationID, startDate, endDate)

**Constraints:**

• Foreign key: membershipNo references ClubMembers(membershipNo)

• Foreign key: locationID references Locations(locationID)


10\. **ResponsibleFor**(<ins>familyMemberID</ins>, <ins>minorMembershipNo</ins>, <ins>startDate</ins>, endDate, relationshipType)

**Constraints:**

• Foreign key: familyMemberID references FamilyMembers(familyMemberID)

• Foreign key: minorMembershipNo references MinorMembers(membershipNo)


11\. **Hobbies**(<ins>hobbyID</ins>, hobbyName)

**Constraints:**

• Unique: hobbyName


12\. **HasHobby**(<ins>membershipNo</ins>, <ins>hobbyID</ins>)

**Constraints:**

• Foreign key: membershipNo references ClubMembers(membershipNo)

• Foreign key: hobbyID references Hobbies(hobbyID)


13\. **Payments**(<ins>paymentID</ins>, membershipNo, amount, paymentDate, paymentMethod, membershipYear, installmentNumber)

**Constraints:**

• Foreign key: membershipNo references ClubMembers(membershipNo)

• Unique: installmentNumber


14\. **FIFA_Games**(<ins>gameID</ins>, gameLocation, clubScore, opponentScore, gameDate, opponentTeam)


15\. **Teams**(<ins>teamID</ins>, teamName, genderCategory, locationID)

**Constraints:**

• Foreign key: locationID references Locations(locationID)


16\. **ParticipatesIn**(<ins>membershipNo</ins>, <ins>gameID</ins>, <ins>teamID</ins>)

**Constraints:**

• Foreign key: membershipNo references ClubMembers(membershipNo)

• Foreign key: gameID references FIFA_Games(gameID)

• Foreign key: teamID references Teams(teamID)

• Unique: (membershipNo, gameID)

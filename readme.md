# Country Soccer Club System (CSCS)

![Database](https://img.shields.io/badge/Database-MySQL%208.0-blue)
![Course](https://img.shields.io/badge/Course-COMP353-orange)
![University](https://img.shields.io/badge/University-Concordia%20University-red)

# COMP 353 – Databases  
## Summer 2026 Warm-up Project

### Team Members

| Name | Student ID | 
| :--- | :--- | 
| Aaida Hossain | 40281796 | 
| Chunru Qiu | 40283505 | 
| Jingyuan zhang | 40257596 | 
| Yuqian Cai | 40187954  | 
---

# 1. Project Description

The **Country Soccer Club System (CSCS)** is a relational database system developed for managing the operations of a nonprofit soccer club.

The system stores and manages information related to:

- Club locations
- Personnel and employment history
- Club members
- Family members and guardians
- Member hobbies
- Teams
- Membership payments
- FIFA game participation


The database was designed using the Entity-Relationship (E/R) model, transformed into a relational schema, and implemented using MySQL 8.0.

This project demonstrates important database concepts including:

- ER modeling
- Relational schema design
- Primary keys
- Foreign keys
- Data integrity constraints
- SQL queries
- Database implementation


---

# 2. Project Objectives

The objectives of this project are:

- Design a complete database model for a soccer club.
- Convert the ER model into relational tables.
- Implement the database using MySQL.
- Maintain consistency using database constraints.
- Insert realistic sample data.
- Develop SQL queries to answer business requirements.


---

# 3. Technologies Used


| Technology | Purpose |
|---|---|
| MySQL 8.0 | Database implementation |
| MySQL Workbench | SQL execution and testing |
| Visual Studio Code | SQL and documentation editing |
| Draw.io | ER diagram generation |
| Markdown | Documentation |


---

# 4. Repository Structure


The repository contains the following files:


## ER Diagram


The database conceptual design was created using Draw.io.

The ER diagram represents:

- Entities
- Attributes
- Primary keys
- Foreign keys
- Relationship constraints


![CSCS ER Diagram](ER_Diagram/ER-diagrm.png)


Location:

- Conceptual ER Diagram.drawio
- Conceptual ER Diagram.png


The Draw.io file is the source file used to generate the ER diagram image.


## Relational Schema

Location:

- Relational_Schema.md


This document describes the mapping from the ER model to relational tables.


## SQL Implementation

Location:

- SQL/


The SQL folder contains database creation scripts, table definitions, data insertion scripts, and queries.


Main database tables:

- Locations.sql
- Personnel.sql
- ClubMembers.sql
- FamilyMembers.sql
- FamilyRelationship.sql
- Family_Location_History.sql
- Member_Location_History.sql
- Personnel_Assignment.sql
- Hobbies.sql
- Member_Hobby.sql
- Payments.sql
- Teams.sql
- Team_Members.sql
- FIFA_Games.sql
- Game_Participation.sql


SQL queries are located in:

- SQL/queries/


---

# 5. Database Schema Overview


## Locations

The Locations relation stores information about the soccer club headquarters and branches.

Attributes:

- LocationID
- Name
- Type
- Address
- City
- Province
- PostalCode
- Phone
- WebAddress
- Capacity


---

## Personnel

The Personnel relation stores employees and volunteers.

Supported roles include:

- Administrator
- Captain
- Coach
- Assistant Coach
- Other


Attributes:

- PersonnelID
- Name
- Date of birth
- SSN
- Medicare number
- Contact information
- Role
- Mandate


---

## Personnel Assignment

This relation stores the historical working locations of personnel.

A personnel member can work at different branches during different periods.


Attributes:

- AssignmentID
- PersonnelID
- LocationID
- StartDate
- EndDate


---

## Club Members

Stores registered soccer members.

The system supports:

### Major Members

Members aged 18 or above.

### Minor Members

Members aged between 4 and 17.


Attributes:

- MemberID
- First name
- Last name
- Date of birth
- Height
- Weight
- Contact information
- Member type


---

## Family Members

Stores parents, guardians, and related contacts.

Attributes:

- FamilyID
- Personal information
- Contact information


---

## Family Relationship

Maintains relationships between family members and club members.


Relationship types:

- Father
- Mother
- Grandfather
- Grandmother
- Tutor
- Partner
- Friend
- Other


---

## Hobbies

Stores hobbies associated with members.

A member may have multiple hobbies.


---

## Payments

Stores membership payment records.

Attributes:

- PaymentID
- Payment date
- Amount
- Payment method
- Membership year
- MemberID


Payment methods:

- Cash
- Debit
- Credit Card


---

## Teams

Stores boys and girls soccer teams.

Each team belongs to a specific location.


---

## FIFA Games

Stores FIFA game information:

- GameID
- Date
- Location
- Opponent
- Score


---

## Game Participation

This relation connects:

Member

with

Team

and

FIFA Game


It records player participation history.


---

# 6. Database Setup


## Step 1: Create Database


Open MySQL Workbench.


Execute:

CREATE DATABASE CSCS;

USE CSCS;


or run:


SQL/create_database.sql


---

## Step 2: Create Tables


Execute all SQL files inside:


SQL/


Each SQL file creates one database relation.


---

## Step 3: Insert Data


Insert data after creating all tables.


Recommended order:


1. Locations

2. Personnel

3. ClubMembers

4. FamilyMembers

5. Hobbies

6. Personnel_Assignment

7. Member_Location_History

8. Family_Location_History

9. FamilyRelationship

10. Teams

11. Team_Members

12. Member_Hobby

13. Payments

14. FIFA_Games

15. Game_Participation


---

# 7. SQL Queries


The project contains eight required SQL queries.


Location:

SQL/queries/


The implemented queries include:


## Query 1

Get complete details for every location.

Includes:

- Location information
- Personnel information
- Number of members
- FIFA participation statistics


## Query 2

Retrieve major members who played FIFA games.


Includes:

- Member information
- Age
- Location
- Number of games played


## Query 3

Retrieve members with at least four hobbies.


## Query 4

Retrieve major members who never played FIFA games.


## Query 5

Calculate total number of club members for every age.


## Query 6

Retrieve major members who are also family members and display children information.


## Query 7

Calculate membership payments and donations between 2023 and 2025.


## Query 8

Retrieve members who participated in at least four FIFA games.


---

# 8. Data Integrity


The database implements:


## Primary Keys

Every table contains a unique identifier.

Examples:

- LocationID
- PersonnelID
- MemberID
- TeamID
- GameID


## Foreign Keys

Foreign keys maintain relationships between tables.

Examples:

- Payments references ClubMembers
- Teams references Locations
- Game_Participation references FIFA_Games


## Unique Constraints

Implemented for:

- SSN
- Medicare Number


## Historical Data Management

The database maintains:

- Personnel working history
- Member location history
- Family relationship history


---

# 9. Testing


The database was tested using MySQL Workbench.


Example:


SELECT COUNT(*) FROM ClubMembers;


Each table was verified to contain valid sample data.


All eight required SQL queries were executed successfully.


---

# 10. Contributors


COMP353 Database Project Group

Concordia University

Summer 2026


---

# 11. Conclusion


The Country Soccer Club System provides a complete relational database solution for managing a nonprofit soccer organization.

The project demonstrates:

- ER modeling
- Relational schema conversion
- MySQL database implementation
- Data integrity management
- SQL query development


The final system satisfies the requirements of the COMP353 Database course project.

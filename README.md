# SQLproject-AnimalShelter
MySQL animal shelter website project with ER diagram and Normalization steps

The inspiration of this project is to develop a web-based animal care site for people to be more aware of stray animals waiting to be adopted or to be taken care of in Mumbai city, India. The website is accessible for shelter, users, and administrators where all can register themselves into the system to view the list of animals waiting to be taken care of along with each animal’s records such as their age, gender, and their description. The administrators are the main authority of the system and they are responsible for adding, editing, updating, and deleting information if necessary. This website project aims in bringing all animal lovers under one roof and provide the best possible solution to take care of the stray in our community.

This project was executed using Mysql. It consists of the following components.

1. The Entity Relationship Diagram:
The rationale behind this ER diagram can be explained with the help of eight entities and their relationship with each other as follows:
  •	ADMIN_USER entity is the admin who creates profiles of strays, verifies adoption requests, searches for availability in shelter homes, and also for affordable animal support. It has one-to-many relationships with ANIMAL_DETAILS and REQUEST entities.
  •	USER entity is a normal user, who will raise a request to adopt a stray. It has zero to many relationships with ANIMAL_DETAILS and a one-to-many relationship with the REQUEST entity.
  •	SHELTER_DETAILS entity is a user, who will verify or create a request to shelter a stray. It has a zero-to-many relationship with ANIMAL_DETAILS and a one-to-many relationship with the REQUEST entity.
  •	ANIMAL_DETAILS entity is the stray animal that needs to be taken care of. It has one to one relationship with ADMIN_USER, a one-to-many relationship with REQUEST, zero to one relationship with both USER and SHELTER_DETAILS, and zero-to-many relationships with MEDICAL_RECORD and OTHER_FACILITES.
  •	MEDICAL_RECORD entity consists of treatment details of our stray. It has one to one relationship with ANIMAL_DETAILS.
  •	OTHER_FACILITIES entity stores information about affordable facilities like food, grooming, etc. for stray. It has zero to one relationship with ANIMAL_DETAILS.
  •	REQUEST entity will store all the request details created by Admin_user, User, and Shelters. It has a one-to-one relationship with ADMIN_USER, ANIMAL_DETAILS, and HISTORY. It also has zero to one relationship with USER and SHELTER_DETAILS.
  •	HISTORY entity stores the history of all requests, it archives old requests as well. It has one to one relationship with the REQUEST entity.

More details from ER diagram like the columns, data types, constraints, and other remarks (auto increment, default values, purpose) for every entity is captured in the table_structure.docx

2. Normalization:
In the document normalization.doc, we will see if our eight entities are in BCNF normalization form and will apply the step-by-step approach of normalization to achieve a coherently organized relational database system.
The aim of doing the BCNF normalization process on all eight entities was to eliminate redundant data and ensure data dependencies make sense. Both of these are worthy goals, as they reduce the amount of space a database consumes and ensure that data is logically stored

3. DDL SQL queries:
SQL_DDL consists of SQL queries to create all the tables along with sample insert queries.

4. Scenario Based SQL queries:
SQL_Queries consists of some sample scenario-based queries which help to understand the functioning of our database.
It consists of six scenarios:
•	Scenario 1: A normal user would like to see a list of Animals who are not yet adopted and their contact details. This will help the user get a basic idea about all available animals and how to contact them.
•	Scenario 2: Admin User wants to see a list of approved and rejected requests and the reason behind them. This will help the admins to improve the quality of service by working on the reasons.
•	Scenario 3: Admin User wants to see the facility details for the cheapest food option. This will help admins who take care of strays by themselves to see where they can get the cheapest food. 
•	Scenario 4: To display the list of animals who got vaccinated in the last year. This is useful for admin users to see which animals need vaccination, whom to contact, and what would be the cost. As well this is useful for other users including shelters to see which animals are vaccinated and can be adopted or given shelter.  
•	Scenario 5: To display the list of requests created by normal users and shelters only. Also, list the requestor's contact details. This will help admin users to keep track of how many requests are coming from users and shelters and to allocate proper time to cater to them.
•	Scenario 6: Admin user wants to see a list of all animals who are not adopted and who are not in shelter and details of people taking care of these animals in their community. Also, list all the expenses that occurred for these animals. This will help admin users to better plan on how to take care of strays on their own and how much it will cost.

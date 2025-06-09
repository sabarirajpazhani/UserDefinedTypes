--Part 1: User-Defined Data Type (UDDT) – Practice Questions 
/* Q1: Create a table named Customers with the following columns:
CustomerID (INT, Primary Key)

CustomerName (VARCHAR)

CustomerEmail (use EmailType)

CustomerPhone (use PhoneType)*/

--creating the user defined data type for Email and Phone 
create type PhoneType from varchar(20) not null;
create type EmailType from varchar(90) not null;

create table Customers(
	CustomerID int Primary key,
	CustomerName varchar(80),
	CustomerEmail EmailType,
	CustomerPhone PhoneType
);


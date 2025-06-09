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

/*Q2: Insert 3 records into Customers table using UDDTs*/
insert into Customers values
(1, 'Arun', 'Arun@gmail.com', '9987876767'),
(2, 'Bala', 'Bala@gmail.com', '7767667898'),
(3, 'Charan','Charan@gmail.com','9987876767');

select * from Customers;

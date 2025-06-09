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

/*Q3: Create another table called Orders where:
OrderID (INT, PK)
OrderDate (DATE)
CustomerID (FK to Customers)
DeliveryPhone (use PhoneType)*/
create table Orders(
	OrderID int primary key,
	OderDate date,
	CustomerID int, 
	DeliveryPhone PhoneType
	foreign key (CustomerID) references Customers(CustomerID)
);

/*Q4: Update the phone number of a customer using PhoneType.*/
update Customers
set CustomerPhone = '9876326745'
where CustomerID = 1;


/*Q5: Drop the table and drop the user-defined types (after all tasks complete).*/
drop table Customers;
drop table Orders;

drop type EmailType;
drop type PhoneType;

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


--PART 2: User-Defined Table Type (UDTT)
/*Q1: Create Products Table*/
create table Product(
	ProductID int identity(1,1) primary key,
	ProductName varchar(80),
	ProductPrice int
);

/*Write a stored procedure InsertProducts that accepts ProductTableType as input and inserts data into Products.*/
--Creating the ProductTableType
create Type ProductTableType as table(
	ProductID int identity(1,1) primary key,
	ProductName varchar(80),
	ProductPrice int
);

--creating the stored Procedure
create procedure InsertProducts
	@Product ProductTableType readonly
as
begin
	insert into Product(ProductName, ProductPrice)
	select ProductName, ProductPrice  from @Product
end

/*Q3: Declare a variable of type ProductTableType, add 3 records, and execute InsertProducts.*/
declare @NewProduct ProductTableType

insert into @NewProduct values 
('KeyBoard', 2500),
('Mouse', 800),
('EarPods', 1500);

exec InsertProducts @Product = @NewProduct;

Select * from Product;

/*4. View the inserted data from the Products table.*/
select * from Product;

/*Create another procedure to bulk delete products by accepting a ProductTableType that only contains product names to delete.*/
create procedure ProductTableDelete
	@ToDelete ProductTableType readonly
as
begin
	delete from Product
	where ProductName in (select ProductName from @ToDelete)
end

declare @Delete ProductTableType
insert into @Delete (ProductName)
values('KeyBoard')

exec ProductTableDelete @ToDelete = @Delete;

select * from Product;

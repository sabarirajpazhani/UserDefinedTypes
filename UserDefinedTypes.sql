--Creating Database for User Defined Types
create database UserDefinedTypes;

--User Database
Use UserDefinedTypes;

--create Database for Phone number and EmailID 
create type PhoneType from varchar(20) not null; --For Phone Number
create type EmailType from varchar(90) not null; --for Email

-- To check the exisiting Data types
select * from sys.types where is_user_defined = 1;

--creating the table 
create table Students(
	StudentID int identity(1,1) primary key,
	StudentName varchar(80),
	StudentEmail EmailType,
	StudentPhone PhoneType,
	TeacherID int,
	foreign key (TeacherID) references Teachers(TeacherID)
);

insert into Students values 
('Arun','Arun@gmail.com','9876545237',101),
('Balaji','Balaji@gmail.com', '7687654123',102),
('Charan','Charan@gmail.com','9089761098',101);

create Table Teachers(
	TeacherID int identity(101,1) primary key,
	TeacherName varchar(80),
	TeacherEmail EmailType,
	TeacherPhone PhoneType
);

drop table Students;

insert into Teachers values
('Santhosh','Santhosh@gmail.com','89872673180'),
('Ganesh','Ganesh@gmail.com','7865432190');

select * from Students;
select * from Teachers;




---Define a table type for multiple student records
create type	StudentTableType as table(
	StudentName varchar(80),
	StudentEmail EmailType,
	StudentPhone PhoneType
);

--How to use User-Defined Table Type in a Stored Procedure?
create procedure spInsertStudents
	@Students StudentTableType readonly
as
begin
	insert into Students (StudentName, StudentEmail, StudentPhone)
	select StudentName, StudentEmail, StudentPhone from @Students
end

--How to call this procedure from T-SQL?
declare @NewStudents StudentTableType;

insert into @NewStudents (StudentName, StudentEmail, StudentPhone)
values
('Arun', 'Arun@gmail.com', '9876545237'),
('Balaji', 'Balaji@gmail.com', '7687654123');

exec spInsertStudents @Students = @NewStudents;

select * from Students;

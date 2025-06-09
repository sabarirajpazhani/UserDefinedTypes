--Creating Database for User Defined Types
create database UserDefinedTypes;

--User Database
Use UserDefinedTypes;

--create Database for Phone number and EmailID 
create type PhoneType from varchar(20) not null; --For Phone Number
create type EmailType from varchar(90) not null; --for Email

-- To check the exisiting Data types
select * from sys.types where is_user_defined = 1;

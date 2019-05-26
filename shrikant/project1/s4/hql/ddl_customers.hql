create database if not exists project1_stg_s4 location '/user/project1_stg_s4.db';

use project1_stg_s4;

create external table customers(custno string ,
 firstname string, lastname string,gender string, 
age string,profession string,contactNo string,
emailId string,
city string, state string,
isActive string,createdDate string, UpdatedDate string)
row format delimited
fields terminated by '|'
location '/user/project1_stg_s4.db/customers';

create database if not exists project1_stg_s5 location '/user/project1_stg_s5.db';
use project1_stg_s5;

create external table products(productno string, productName string, Description string, isActive string,createdDate string, UpdatedDate string)
row format delimited
fields terminated by '|'
location '/user/project1_stg_s5.db/products';

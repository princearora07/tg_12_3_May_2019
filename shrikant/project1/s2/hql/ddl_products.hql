create database if not exists project1_stg_s2 location '/user/project1_stg_s2.db';
use project1_stg_s2;

create external table products(productno string, productName string, Description string, isActive string,createdDate string, UpdatedDate string)
row format delimited
fields terminated by '|'
location '/user/project1_stg_s2.db/products';

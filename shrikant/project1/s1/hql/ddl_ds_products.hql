create database if not exists project1_ds_s1 location '/user/project1_ds_s1.db';

use project1_ds_s1;

create external table products(productno string, productName string, Description string, isActive string,createdDate string, UpdatedDate string)
partitioned by (load_date string)
stored as orc 
location '/user/project1_ds_s1.db/products';

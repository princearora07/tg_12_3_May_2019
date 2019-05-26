create database if not exists project1_ds_s1 location '/user/project1_ds_s1.db';

use project1_ds_s1;

create external table transactions(txnno string, txndate string,
custno string, amount string,productno string, spendby string)
partitioned by (load_date string)
stored as orc 
location '/user/project1_ds_s1.db/transactions';

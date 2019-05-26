create database if not exists project1_stg_s4 location '/user/project1_stg_s4.db';
use project1_stg_s4;
create external table transactions(txnno string, txndate string,
custno string, amount string,productno string, spendby string)
row format delimited
fields terminated by '|'
location '/user/project1_stg_s4.db/transactions';

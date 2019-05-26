set hive.exec.dynamic.partition.mode=nonstrict;

insert into project1_ds_s1.customers partition (load_date)
select *,current_date() as load_date from project1_stg_s1.customers;

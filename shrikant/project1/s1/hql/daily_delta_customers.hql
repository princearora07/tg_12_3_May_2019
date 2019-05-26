set hive.exec.dynamic.partition.mode=nonstrict;

insert into  project1_ds_s1.customers partition (load_date)
select u.custno , u.firstname,u.lastname ,u.gender , u.age ,u.profession ,u.contactNo ,
u.emailId ,u.city , u.state ,u.isActive ,u.createdDate , u.UpdatedDate, date_add(current_date(),1) as load_date
from
(select *, row_number() over (partition by t.custno order by t.UpdatedDate desc) as row_num  from (
select custno ,firstname , lastname ,gender , age ,profession ,contactNo ,emailId ,city , state ,isActive ,createdDate , UpdatedDate  from project1_stg_s1.customers
union all
select custno ,firstname , lastname ,gender , age ,profession ,contactNo ,emailId ,city , state ,isActive ,createdDate , UpdatedDate  from project1_ds_s1.customers where load_date = "${hivevar:latest_partition_date}")t)u
where u.row_num = 1
distribute by load_date;

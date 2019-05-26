#!/bin/bash 

export runtime=`date -u +"%Y%m%d%H%M%S"`
export log_file=/home/cloudera/project1/s1/logs/daily_delta_customers'_'$runtime.log

exec &> ${log_file}
export SPARK_HOME=/usr/lib/spark/lib
max_part=`(hive -e "select max(load_date) from project1_ds_s1.customers;")` 
echo " max value is : "$max_part
hive -hivevar latest_partition_date=$max_part -f /home/cloudera/project1/s1/hql/daily_delta_customers.hql

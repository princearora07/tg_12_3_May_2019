#!/bin/bash

export runtime=`date -u +"%Y%m%d%H%M%S"`
export log_file=/home/cloudera/project1/s1/logs/hdfs_data_load'_'$runtime.log

exec &> ${log_file}

hadoop fs -put /home/cloudera/project1/s1/srcfiles/working/cust* /user/project1_stg_s1.db/customers
flag=$?
if [ $flag != 0 ]
then
echo "Failed to load files in customer table"
else
echo "Files loaded in customers table successfully"
fi

hadoop fs -put /home/cloudera/project1/s1/srcfiles/working/product* /user/project1_stg_s1.db/products
flag=$?
if [ $flag != 0 ]
then
echo "Failed to load files in products table"
else
echo  "Files loaded in products table successfully"
fi
hadoop fs -put /home/cloudera/project1/s1/srcfiles/working/trans* /user/project1_stg_s1.db/transactions
flag=$?
if [ $flag != 0 ]
then
echo "Failed to load files in transactions table"
else
echo  "Files loaded in transactions table successfully"
fi

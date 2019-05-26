#!/bin/bash

export runtime=`date -u +"%Y%m%d%H%M%S"`
export log_file=/home/cloudera/project1/s1/logs/daily_stg_truncate'_'$runtime.log
exec &> ${log_file}

hadoop fs -rm /user/project1_stg_s1.db/customers/*
hadoop fs -rm /user/project1_stg_s1.db/products/*
hadoop fs -rm /user/project1_stg_s1.db/transactions/*

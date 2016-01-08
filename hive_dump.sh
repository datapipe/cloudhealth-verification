#!/bin/bash

MONTH="2015-11"
OUTFILE="/tmp/ch_dump_$MONTH.tsv"

export HADOOP_CLIENT_OPTS="-Xmx2g"
hive -hiveconf mapreduce.map.memory.mb=16384 -hiveconf mapreduce.reduce.memory.mb=16384 --database aws_usage_development -e "select * from hourly_usage where usage_month = '$MONTH' and payer_account_id = '181239768896' and linked_account in ('130774264494','205799058367','287450309598','348896246029','413803963801','471800947257','475322041426','504627477299','508606536310','605367210150','717862337845','730817142111','786809668623','847782638323')" 1> $OUTFILE
gzip $OUTFILE
scp "$OUTFILE.gz" root@216.109.132.44:~/

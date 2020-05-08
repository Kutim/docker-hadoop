#! /bin/bash



echo "name node bootstrapStandby."
# dockerize -wait tcp://journalnode1:8485 -wait tcp://journalnode2:8485 -wait tcp://journalnode3:8485 hdfs namenode -bootstrapStandby -nonInteractive
dockerize -wait tcp://journalnode1:8485 hdfs namenode -bootstrapStandby -nonInteractive

# 启动 namenode 服务
hdfs --daemon stop namenode
echo "starting namenode servie..."
hdfs --daemon start namenode
echo "starting namenode servie done."

hdfs --daemon stop zkfc
echo "starting zkfc servie..."
# dockerize -wait tcp://namenode1:9870 -wait tcp://namenode2:9870 -wait tcp://namenode3:9870  hdfs zkfc
dockerize -wait tcp://namenode1:9870  -wait tcp://namenode2:9870 hdfs zkfc
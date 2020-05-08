#! /bin/bash


echo "name node bootstrapStandby."
dockerize -wait tcp://journalnode1:8485 -wait tcp://journalnode2:8485 -wait tcp://journalnode3:8485 hdfs namenode -bootstrapStandby

# 启动 namenode 服务
echo "starting namenode servie..."
hdfs --daemon start namenode
echo "starting namenode servie done."


echo "starting zkfc servie..."
dockerize -wait tcp://namenode1:9870 -wait tcp://namenode2:9870 -wait tcp://namenode3:9870  hdfs zkfc
echo "starting zkfc servie done."
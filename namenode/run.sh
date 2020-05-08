#! /bin/bash
dockerize -wait tcp://journalnode1:8485 -wait tcp://journalnode2:8485 -wait tcp://journalnode3:8485 hdfs namenode -format -force

hdfs --daemon start namenode

dockerize -wait tcp://namenode1:9870 -wait tcp://namenode2:9870 -wait tcp://namenode2:9870  hdfs zkfc -formatZK 

dockerize -wait tcp://namenode1:9870 -wait tcp://namenode2:9870 -wait tcp://namenode2:9870  hdfs zkfc
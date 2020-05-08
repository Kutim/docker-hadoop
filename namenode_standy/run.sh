#! /bin/bash

hdfs --daemon start namenode

dockerize -wait tcp://namenode1:9870 -wait tcp://namenode2:9870 -wait tcp://namenode2:9870  hdfs zkfc
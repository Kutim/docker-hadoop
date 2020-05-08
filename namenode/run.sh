#! /bin/bash


# 根据 namedir 下是否为空判断是否需要格式化
namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
count=`ls $namedir | wc -l`

if [ $count -eq 0 ]
then
    hdfs zkfc -formatZK
    echo "name node format."
    dockerize -wait tcp://journalnode1:8485 -wait tcp://journalnode2:8485 -wait tcp://journalnode3:8485 hdfs namenode -format -nonInteractive
else
    hdfs --daemon stop namenode
    echo "name node bootstrapStandby."
    dockerize -wait tcp://journalnode1:8485 -wait tcp://journalnode2:8485 -wait tcp://journalnode3:8485 hdfs namenode -bootstrapStandby -nonInteractive
fi

# 启动 namenode 服务
hdfs --daemon stop namenode
echo "starting namenode servie..."
hdfs --daemon start namenode
echo "starting namenode servie done."


hdfs --daemon stop zkfc
echo "starting zkfc servie..."
dockerize -wait tcp://namenode1:9870 -wait tcp://namenode2:9870 -wait tcp://namenode3:9870  hdfs  zkfc

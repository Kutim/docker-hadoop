FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD --interval=30 nc -zv 127.0.0.1 8485 | grep open | wc -l || exit 1

ENV HDFS_CONF_dfs_journalnode_edits_dir=/hadoop/dfs/edits
RUN mkdir -p /hadoop/dfs/edits
VOLUME /hadoop/dfs/edits

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8485

CMD ["/usr/bin/supervisord"]

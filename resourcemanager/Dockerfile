FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD --interval=1m curl -f http://localhost:8088/ || exit 1

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 8088

CMD ["/usr/bin/supervisord"]

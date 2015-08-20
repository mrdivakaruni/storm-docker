FROM mrdivakaruni/base
MAINTAINER "Bala Divakaruni" <bala.divakaruni@here.com>

RUN yum update -y && yum install -y unzip
RUN yum install -y wget
RUN yum install -y tar

RUN wget -q -O - http://mirror.vorboss.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
RUN mv /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg

ENV JAVA_HOME /usr/java64/current
ENV ZK_HOME /opt/zookeeper-3.4.6
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh
EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper-3.4.6
VOLUME ["/opt/zookeeper-3.4.6/conf", "/opt/zookeeper-3.4.6/data"]

WORKDIR /usr/bin

RUN ["chown", "-R", "daemon", "."]

# Make sure myApp is excutable
RUN ["chmod", "+x", "start-zk.sh"]

CMD /usr/sbin/sshd && start-zk.sh
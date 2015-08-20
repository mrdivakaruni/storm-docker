FROM centos:6
MAINTAINER "Bala Divakaruni" <bala.divakaruni@here.com>

RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y net-tools python-setuptools hostname inotify-tools yum-utils && \
  yum clean all && \

  easy_install supervisor
RUN yum install -y unzip openssh-server wget tar apache2

ENV JAVA_VER 1.8.0_45
ENV JAVA_DWL_VER 8u45
ENV JAVA_DWL_BVER b14

ENV JAVA_HOME /usr/java64/current
ENV JDK_HOME ${JAVA_HOME}
ENV PATH ${JAVA_HOME}/bin:${PATH}

ENV TZUPDATER 2015a

# Add supervisord conf, bootstrap.sh files
ADD container-files /

VOLUME ["/data"]

RUN mkdir /usr/java64 ; cd /usr/java64/ ; \
     wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_DWL_VER}-${JAVA_DWL_BVER}/jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && \
     cd /usr/java64/ && tar -xzf jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && rm jdk-${JAVA_DWL_VER}-linux-x64.tar.gz && \
     cd /usr/java64/ && ln -s jdk${JAVA_VER} current && \
     chown -R root:root /usr/java64 && \
     chmod -R a+rwX /usr/java64

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/tzupdater/2.0.0/tzupdater-2_0_0-${TZUPDATER}.zip && \
    unzip tzupdater-2_0_0-${TZUPDATER}.zip && mv tzupdater-2.0.0-${TZUPDATER}/tzupdater.jar /

RUN ${JAVA_HOME}/bin/java -jar /tzupdater.jar -t -v || ${JAVA_HOME}/bin/java -jar /tzupdater.jar -u -v && rm -rf /tzupdater-2_0_0-${TZUPDATER}.zip tzupdater-2.0.0-${TZUPDATER} /tzupdater.jar

#generate ssh key
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd
RUN mkdir -p /root/.ssh && chown root.root /root && chmod 700 /root/.ssh

#change root password
RUN echo 'root:password' | chpasswd


EXPOSE 22

ENTRYPOINT ["/config/bootstrap.sh"]

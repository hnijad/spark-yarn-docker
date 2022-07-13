FROM ubuntu:latest

#install java and ssh 
RUN apt update && apt install openjdk-8-jdk -y 
RUN apt install openssh-server sudo -y

WORKDIR /root

#install hadopp
COPY hadoop-3.3.3.tar.gz hadoop-3.3.3.tar.gz
RUN tar -xzf hadoop-3.3.3.tar.gz && mv hadoop-3.3.3 hadoop && rm hadoop-3.3.3.tar.gz

#config hadoop
COPY hadoop-config/hadoop-env.sh hadoop-env.sh
RUN cat hadoop-env.sh >> hadoop/etc/hadoop/hadoop-env.sh && rm hadoop-env.sh


COPY hadoop-config/.bashrc .bashrc
COPY hadoop-config/start-hadoop.sh start-hadoop.sh
COPY hadoop-config/core-site.xml hadoop/etc/hadoop/core-site.xml
COPY hadoop-config/hdfs-site.xml hadoop/etc/hadoop/hdfs-site.xml
COPY hadoop-config/mapred-site.xml hadoop/etc/hadoop/mapred-site.xml
COPY hadoop-config/workers hadoop/etc/hadoop/workers
COPY hadoop-config/yarn-site.xml  hadoop/etc/hadoop/yarn-site.xml
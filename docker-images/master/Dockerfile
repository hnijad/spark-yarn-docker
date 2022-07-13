FROM hadoop-base-image:1.0

WORKDIR /root

COPY spark-3.3.0-bin-hadoop3.tgz spark-3.3.0-bin-hadoop3.tgz
RUN tar -xzf spark-3.3.0-bin-hadoop3.tgz && mv spark-3.3.0-bin-hadoop3 spark && rm spark-3.3.0-bin-hadoop3.tgz

COPY spark-config/.bashrc .bashrc-spark
RUN cat .bashrc-spark >> .bashrc && rm .bashrc-spark

COPY spark-config/spark-default.conf /root/spark/conf/spark-default.conf
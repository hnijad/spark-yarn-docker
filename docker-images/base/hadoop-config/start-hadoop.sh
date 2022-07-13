#!/usr/bin/env bash

hdfs namenode -format
start-dfs.sh
hdfs dfs -mkdir -p /user/root
hdfs dfs -mkdir books
hdfs dfs -mkdir spark-logs
wget -O alice.txt https://www.gutenberg.org/files/11/11-0.txt
wget -O holmes.txt https://www.gutenberg.org/files/1661/1661-0.txt
wget -O frankenstein.txt https://www.gutenberg.org/files/84/84-0.txt

hdfs dfs -put alice.txt holmes.txt frankenstein.txt books

start-yarn.sh

spark/sbin/start-history-server.sh


# yarn jar hadoop-mapreduce-examples-3.3.3.jar wordcount "books/*" output
# yarn jar hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.3.jar wordcount "books/*" output
# spark-submit --master yarn --deploy-mode cluster --class org.apache.spark.examples.SparkPi spark/examples/jars/spark-examples_2.12-3.3.0.jar 10

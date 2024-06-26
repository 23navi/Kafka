
# Create your client.config file

security.protocol=SASL_SSL
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="<your username>" password="<your password>";
sasl.mechanism=PLAIN

# Start running commands
kafka-topics 

kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092

kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092 --create --topic first_topic

kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092 --create --topic second_topic --partitions 5

# this will create a topic with an RF of 3 (behaviour of using Conduktor Platform - all topics have the same RF of 3)
kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092 --create --topic third_topic --replication-factor 2

# list topics
kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092 --list

# describe topics
kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092 --topic first_topic --describe

# delete topics
kafka-topics --command-config client.config --bootstrap-server pkc-l7pr2.ap-south-1.aws.confluent.cloud:9092 --topic second_topic --delete



############################
#####     LOCALHOST    #####
############################

kafka-topics 

kafka-topics --bootstrap-server localhost:9092 --list 

kafka-topics --bootstrap-server localhost:9092 --topic first_topic --create

kafka-topics --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3

kafka-topics --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3 --replication-factor 2

# Create a topic (working)
kafka-topics --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3 --replication-factor 1

# List topics
kafka-topics --bootstrap-server localhost:9092 --list 

# Describe a topic
kafka-topics --bootstrap-server localhost:9092 --topic first_topic --describe

# Delete a topic 
kafka-topics --bootstrap-server localhost:9092 --topic first_topic --delete
# (only works if delete.topic.enable=true)

#start zookeeper
cd kafka/

sh bin/zookeeper-server-start.sh config/zookeeper.properties

#start Kafka 
sh bin/kafka-server-start.sh config/server.properties
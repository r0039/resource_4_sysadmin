## Kafka
Older version of Kafka ( pre 0.9 ) stores offset in Zookeeper only, while the newer version stores offser in an internal Kafka topic which was called *__consumer_offsers*.

It all depends on which consumer you're using. You should choose the right consumer based on your Kafka version.    
For version 0.8 brokers use the HighLevelConsumer. The offsets for your groups are stored in zookeeper.  
For brokers 0.9 and higher you should use the new ConsumerGroup. The offsets are stored with kafka brokers.  

Keep in mind that HighLevelConsumer will still work with versions past 0.8 but they have been deprecated in 0.10.1 and support will probably go away soon. The ConsumerGroup has rolling migration options to help move from HighLevelConsumer if you were committed to using it.  

#### Kafka show consumer list
```bash
~$ /usr/local/kafka/bin/kafka-consumer-groups.sh --list --bootstrap-server localhost:9092
pm-kafka-consumer
data_ingestion-group
application_log-group
```

#### Kafka describes group 
```bash
~$ /usr/local/kafka/bin/kafka-consumer-groups.sh --describe --group pm-kafka-consumer --bootstrap-server localhost:9092

TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID                                     HOST            CLIENT-ID
infra-metrics   0          4681605         4682178         573             ruby-kafka-b6255bb2-3455-4863-98c1-c1e658c7e2c2 /10.10.10.7   ruby-kafka
infra-metrics   2          4678186         4678800         614             ruby-kafka-7677d7d3-eb53-46ad-9f2b-b766da8608d8 /10.10.20.8   ruby-kafka
infra-metrics   3          4678294         4678954         660             ruby-kafka-443c3f1c-ca9a-4309-888b-712f867125a8 /10.10.10.8   ruby-kafka
infra-metrics   1          4680387         4681013         626             ruby-kafka-3e3b3138-f9f6-427c-826f-6d84930e123b /10.10.20.7   ruby-kafka
infra           2          22528381        29837279        7308898         -                                               -               -
infra           3          29827541        29827541        0               -                                               -               -
infra           0          29836237        29836237        0               -                                               -               -
infra           1          20734566        29834780        9100214         -                                               -               -
```

#### Kafka shows topic
```bash
~$ /usr/local/kafka/bin/kafka-topics.sh --list --zookeeper 10.10.10.19:2181,10.10.10.20:2181,10.10.20.19:2181,10.10.20.20:2181
__consumer_offsets
application_log
data_ingestion
infr
infra
infra-logs
infra-metrics
perf_external
testTopic
```

#### Kafka describes topic
```bash
~$ /usr/local/kafka/bin/kafka-topics.sh --describe --zookeeper 10.10.10.19:2181,10.10.10.20:2181,10.10.20.19:2181,10.10.20.20:2181 --topic infra-logs
Topic:infra-logs	PartitionCount:4	ReplicationFactor:2	Configs:
	Topic: infra-logs	Partition: 0	Leader: 1	Replicas: 1,3	Isr: 1,3
	Topic: infra-logs	Partition: 1	Leader: 2	Replicas: 2,0	Isr: 2,0
	Topic: infra-logs	Partition: 2	Leader: 3	Replicas: 3,1	Isr: 3,1
	Topic: infra-logs	Partition: 3	Leader: 0	Replicas: 0,2	Isr: 0,2
```

#### Kafka creates topic
```bash
~$ /usr/local/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 2 --partitions 4 --topic infra-logs
```

#### Kafka deletes topic
```bash
~$ /usr/local/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic infra_logs
```

### Kafka see the data in the topic 
```bash
~$ /usr/local/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic infra-metrics
{"fields":{"uptime_format":"28 days,  2:44"},"name":"system","tags":{"host":"SLIONA002"},"timestamp":1576572780}

{"fields":{"uptime":2429063},"name":"system","tags":{"host":"SLIONA002"},"timestamp":1576572780}
```

## Referencing
[Kafka: The Definitive Guide by Todd Palino, Gwen Shapira, Neha Narkhede](https://www.oreilly.com/library/view/kafka-the-definitive/9781491936153/ch04.html)  
[Offets store in Zookeeper or Kafka](https://stackoverflow.com/questions/41137281/offsets-stored-in-zookeeper-or-kafka)    
[Kafka consumer list](https://stackoverflow.com/questions/32697999/kafka-consumer-list)  
[Kafka quickstart](https://kafka.apache.org/quickstart)  
[Kafka Cheat Sheet](https://gist.github.com/sahilsk/d2a6ec384f5f2333e3fef40a581a97e1)
[Part 1: Apache Kafka for beginners - What is Apache Kafka?](https://www.cloudkarafka.com/blog/2016-11-30-part1-kafka-for-beginners-what-is-apache-kafka.html)

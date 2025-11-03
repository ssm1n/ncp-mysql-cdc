### 프로젝트 개요
Apache Kafka 기반 NCP MySQL CDC 파이프라인 구축 프로젝트입니다.

### 파이프라인 구성
본 프로젝트의 파이프라인 구성은 다음과 같습니다.

```
Source MySQL (Cloud DB for MySQL) 
 → Debezium MySQL Source (snapshot: initial → CDC)
 → Apache Kafka (schema-registry)
 → Kafka Connect JDBC Sink 
 → Target MySQL (Cloud DB for MySQL)
```

### 기술 스택 
- Database
  - NCP Cloud DB for MySQL (Source/Target)
- Messaging
  - Apache Kafka 4.1.0 (Kraft Mode)
  - Kafka Connect 7.5.3
  - Schema Registry 7.7.0
  - Debezium MySQL Source Connector
  - Confluent JDBC Sink Connector
- Monitoring
  - UI for Apache Kafka
  - Prometheus
  - Grafana
  - JMX Exporter / Kafka Exporter

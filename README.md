# Database Streaming PoC

Run services:

> docker compose up -d

View:

- Database using [Adminer](http://localhost:10000/?pgsql=database&username=admin)
- Kafka using [kafka-ui](http://localhost:10001/)

## Resources

### Debezium

- [Debezium - Getting Started](https://debezium.io/documentation/reference/stable/tutorial.html)
- [Debezium - Architecture](https://debezium.io/documentation/reference/stable/architecture.html)
- [Debezium UI image](https://hub.docker.com/r/debezium/debezium-ui )

### Kafka Connect

- [Running Kafka Connect](https://kafka.apache.org/documentation/#connect_running)
- [Kafka Connect image](https://hub.docker.com/r/debezium/connect)

### Apache Flink

- [Apache Flink - Hands-On Training](https://nightlies.apache.org/flink/flink-docs-release-1.20/docs/learn-flink/overview/)

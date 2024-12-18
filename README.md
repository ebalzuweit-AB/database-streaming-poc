# Database Streaming PoC

Run services:

> docker compose up -d

View:

- Database using [Adminer](http://localhost:10000/?pgsql=database&username=admin)
- Kafka using [kafka-ui](http://localhost:10001/)
- Debezium using [debezium-ui](http://localhost:10002/)

## Commands

### Kafka Connect

Get status:

> curl -H "Accept:application/json" localhost:8083/

List connectors:

> curl -H "Accept:application/json" localhost:8083/connectors/

## Resources

### Debezium

- [Debezium - Getting Started](https://debezium.io/documentation/reference/stable/tutorial.html)
- [Debezium - Architecture](https://debezium.io/documentation/reference/stable/architecture.html)
- [Streaming data to a downstream database](https://debezium.io/blog/2017/09/25/streaming-to-another-database/)
- [Debezium UI demo](https://github.com/debezium/debezium-examples/tree/main/ui-demo)

### Kafka Connect

- [Running Kafka Connect](https://kafka.apache.org/documentation/#connect_running)
- [Kafka Connect image](https://hub.docker.com/r/debezium/connect)

### Apache Flink

- [Apache Flink - Hands-On Training](https://nightlies.apache.org/flink/flink-docs-release-1.20/docs/learn-flink/overview/)

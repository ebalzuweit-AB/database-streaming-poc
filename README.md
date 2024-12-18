# Database Streaming PoC

This repo demonstrates using Debezium to stream changes from a source database to a sink, via Kafka messages.

## Usage

Run services:

> docker compose up -d

Stop services:

> docker compose down

> [!NOTE]
> To reset the databases and Kafka you'll need to remove the respective volumes, as they are persisted to your filesystem.

View services:

- Database using Adminer
	- [Source database](http://localhost:10000/?pgsql=source-database&username=admin&db=db)
	- [Sink database](http://localhost:10000/?pgsql=sink-database&username=admin&db=db)
- Kafka using [kafka-ui](http://localhost:10001/)
- Debezium using [debezium-ui](http://localhost:10002/)

### Kafka Connect

Get status:

> curl -H "Accept:application/json" localhost:8083/

List connectors:

> curl -H "Accept:application/json" localhost:8083/connectors/

Get connector status:

> curl -H "Accept:application/json" localhost:8083/connectors/{CONNECTOR_NAME}

Delete a connector:

> curl -H "Accept:application/json" -X DELETE localhost:8083/connectors/{CONNECTOR_NAME}

### Debezium

Setup your Debezium connector like so:

``` json
{
  "topic.prefix": "source-database",
  "database.hostname": "database",
  "database.user": "admin",
  "database.password": "*****",
  "database.dbname": "db",
  "plugin.name": "pgoutput"
}
```

## Resources

### Debezium

- [Debezium - Getting Started](https://debezium.io/documentation/reference/stable/tutorial.html)
- [Debezium - Architecture](https://debezium.io/documentation/reference/stable/architecture.html)
- [Debezium - JDBC Sink Connector](https://debezium.io/documentation/reference/stable/connectors/jdbc.html)
- [Streaming data to a downstream database](https://debezium.io/blog/2017/09/25/streaming-to-another-database/)
- [Debezium UI demo](https://github.com/debezium/debezium-examples/tree/main/ui-demo)

### Kafka Connect

- [Running Kafka Connect](https://kafka.apache.org/documentation/#connect_running)
- [Kafka Connect image](https://hub.docker.com/r/debezium/connect)

### Apache Flink

- [Apache Flink - Hands-On Training](https://nightlies.apache.org/flink/flink-docs-release-1.20/docs/learn-flink/overview/)

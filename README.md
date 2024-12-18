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
- Debezium using [debezium-ui][debezium-ui]

### Kafka Connect

Kafka Connect uses a REST API for interactions, see example requests in [kafka-connect-requests.http](./kafka-connect-requests.http).

> [!TIP]
> In VS Code, you can use the [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extension to execute the requests.

#### Debezium

Execute the following HTTP requests to create the source & sink Kafka connectors:
- Create Debezium source connector
- Create Debezium sink connector

If successful, you should see the following response for "List Kafka Connect connectors":
``` json
[
  "sink-connector",
  "source-connector"
]
```

After creation, you should see both connectors in [debezium-ui][debezium-ui].

Enable DEBUG logs for the sink:

> curl -X PUT -H "Content-Type: application/json" http://localhost:8083/admin/loggers/io.debezium.connector.jdbc.JdbcSinkConnector -d '{"level": "DEBUG"}'

(TODO: This fails when run from the .http file)

## Resources

### Kafka Connect

- [Kafka Connect documentation](https://kafka.apache.org/documentation.html#connect)

### Debezium

- [Debezium - Getting Started](https://debezium.io/documentation/reference/stable/tutorial.html)
- [Debezium - JDBC Sink Connector](https://debezium.io/documentation/reference/stable/connectors/jdbc.html)
- [Debezium - Event flattening](https://debezium.io/documentation/reference/stable/transformations/event-flattening.html)
- [Debezium UI demo](https://github.com/debezium/debezium-examples/tree/main/ui-demo)

<!-- Links -->
[debezium-ui]:http://localhost:10002/
# Database Streaming PoC

This repo demonstrates using Kafka Connect and Debezium to stream changes from a source database to a sink.

## Features

### Create new records

New records will be created in the sink database.

### Update existing records

Updated records will be synched to the sink database.

### Delete existing records

Deleted records will be deleted in the sink database.

### Table evolution

Table changes in the source database will be reflected in the sink database.

### Schema evolution

New tables in the source database will be tracked by the source connector.
	A new sink connector will be required to sync the new table.

### Snapshotting

The source connector will take a snapshot of the source database on creation.

### Connector downtime

Source and sink connectors will gracefully recover from downtime.

## Usage

Run services:

> docker compose up -d

Stop services:

> docker compose down -v

View services:

- Databases using Adminer
	- [Source database](http://localhost:10000/?pgsql=source-database&username=admin&db=db&ns=streaming_poc)
	- [Sink database](http://localhost:10000/?pgsql=sink-database&username=admin&db=db&ns=streaming_poc)
- Kafka using [kafka-ui](http://localhost:10001/)
- Debezium using [debezium-ui][debezium-ui]

### Kafka Connect

Kafka Connect uses a REST API for interactions, see example requests in [kafka-connect-requests.http](./kafka-connect-requests.http).

> [!TIP]
> In VS Code, you can use the [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extension to execute the requests.

#### Debezium

Execute HTTP requests to create the source & sink Kafka connectors:
- Create Debezium source connector
- Create Debezium sink connector - {TABLE_NAME}

If successful, you should see the connectors listed in the following places:
- The response for "List Kafka Connect connectors" request
- In [debezium-ui][debezium-ui].

##### Debugging connector issues

Enable DEBUG logs for the sink:

> curl -X PUT -H "Content-Type: application/json" http://localhost:8083/admin/loggers/io.debezium.connector.jdbc.JdbcSinkConnector -d '{"level": "DEBUG"}'

(TODO: This fails when run from the .http file)

## Resources

### Kafka Connect

- [Kafka Connect documentation](https://kafka.apache.org/documentation.html#connect)
- [Kafka Connect transforms](https://kafka.apache.org/documentation/#connect_transforms)

### Debezium

- [Debezium - Getting Started](https://debezium.io/documentation/reference/stable/tutorial.html)
- [Debezium - Source Connector - PostgreSQL](https://debezium.io/documentation/reference/stable/connectors/postgresql.html)
	- [PostgreSQL Connector Properties](https://debezium.io/documentation/reference/stable/connectors/postgresql.html#postgresql-connector-properties)
- [Debezium - JDBC Sink Connector](https://debezium.io/documentation/reference/stable/connectors/jdbc.html)
- [Red Hat - Debezium JDBC Sink Connector](https://docs.redhat.com/en/documentation/red_hat_integration/2023.q4/html/debezium_user_guide/debezium-connector-for-jdbc)
- [Debezium - Event flattening](https://debezium.io/documentation/reference/stable/transformations/event-flattening.html)

<!-- Links -->
[debezium-ui]:http://localhost:10002/
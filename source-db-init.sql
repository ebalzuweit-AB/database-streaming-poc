-- Setup database
CREATE SCHEMA streaming_poc;
CREATE TABLE streaming_poc.test(
	id int primary key
);

-- Required for Debezium
ALTER SYSTEM SET wal_level = logical;
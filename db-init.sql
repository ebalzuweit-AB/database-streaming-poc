-- Setup database
CREATE SCHEMA source_data;
CREATE TABLE source_data.test(
	id int primary key
);

-- Required for Debezium
ALTER SYSTEM SET wal_level = logical;
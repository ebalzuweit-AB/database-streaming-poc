-- Setup database
CREATE SCHEMA streaming_poc;

CREATE TABLE streaming_poc.users (
	id serial primary key,
	name varchar(100) not null,
	created_at timestamptz default current_timestamp
);

CREATE TABLE streaming_poc.orders (
	id serial primary key,
	user_id int not null,
	created_at timestamptz default current_timestamp,
	updated_at timestamptz default current_timestamp
);

CREATE TABLE streaming_poc.order_items (
	id serial primary key,
	order_id int not null,
	product varchar(100) not null,
	quantity int not null
);

-- Required for Debezium
ALTER SYSTEM SET wal_level = logical;
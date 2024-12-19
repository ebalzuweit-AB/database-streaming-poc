-- Insert records for testing
INSERT INTO streaming_poc.users (name) VALUES ('John Smith'), ('Jane Doe');

INSERT INTO streaming_poc.orders (user_id) VALUES (1), (2), (1);

INSERT INTO streaming_poc.order_items (order_id, product, quantity) VALUES
(1, 'Product A', 5), (1, 'Product B', 3), (1, 'Product D', 1),
(2, 'Product A', 10),
(3, 'Product U', 1);
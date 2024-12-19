-- Create Product C
INSERT INTO streaming_poc.order_items (order_id, product, quantity) VALUES
(2, 'Product C', 2);

-- Update Product U
UPDATE streaming_poc.order_items
SET quantity = 99
WHERE order_id = 3 AND product = 'Product U';

-- Delete Product D
DELETE FROM streaming_poc.order_items
WHERE order_id = 1 AND product = 'Product D';

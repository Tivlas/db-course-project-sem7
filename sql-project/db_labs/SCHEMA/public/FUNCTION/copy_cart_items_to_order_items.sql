CREATE OR REPLACE FUNCTION public.copy_cart_items_to_order_items() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE cur_cart_id INT;

BEGIN
SELECT cart_id INTO cur_cart_id
FROM cart
WHERE client_id = NEW.client_id;

INSERT INTO order_item (
    order_id,
    product_id,
    product_quantity,
    product_price
  )
SELECT NEW.order_id,
  product_id,
  product_quantity,
  product_price
FROM cart_item
WHERE cart_id = cur_cart_id;

DELETE FROM cart_item
WHERE cart_id = cur_cart_id;

UPDATE cart
SET price = 0
WHERE client_id = NEW.client_id;

RETURN NULL;

END;

$$;

ALTER FUNCTION public.copy_cart_items_to_order_items() OWNER TO postgres;

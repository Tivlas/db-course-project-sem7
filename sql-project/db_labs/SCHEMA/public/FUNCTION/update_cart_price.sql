CREATE OR REPLACE FUNCTION public.update_cart_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE total_discount_percent numeric;

BEGIN PERFORM update_product_quantity(OLD, NEW, TG_OP);

IF TG_OP = 'DELETE' THEN
UPDATE cart
SET price = price - OLD.product_price * OLD.product_quantity
WHERE cart_id = OLD.cart_id;

ELSIF TG_OP = 'INSERT' THEN
SELECT COALESCE(SUM(d.percent), 0) INTO total_discount_percent
FROM discount d
  JOIN product_discount pd ON pd.discount_id = d.discount_id
WHERE pd.product_id = NEW.product_id
  AND d.is_active = TRUE;

total_discount_percent := total_discount_percent % 50;

NEW.product_price := NEW.product_price * (1 - total_discount_percent / 100);

UPDATE cart_item
SET product_price = NEW.product_price
WHERE cart_item_id = NEW.cart_item_id;

UPDATE cart
SET price = price + NEW.product_price * NEW.product_quantity
WHERE cart_id = NEW.cart_id;

ELSIF TG_OP = 'UPDATE' THEN
UPDATE cart
SET price = price + (NEW.product_quantity - OLD.product_quantity) * NEW.product_price
WHERE cart_id = NEW.cart_id;

END IF;

RETURN NULL;

END;

$$;

ALTER FUNCTION public.update_cart_price() OWNER TO postgres;

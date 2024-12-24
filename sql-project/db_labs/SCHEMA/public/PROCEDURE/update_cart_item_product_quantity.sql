CREATE OR REPLACE PROCEDURE public.update_cart_item_product_quantity(p_cart_item_id integer, p_product_quantity integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE cart_item
SET product_quantity = p_product_quantity
WHERE cart_item_id = p_cart_item_id;

END;

$$;

ALTER PROCEDURE public.update_cart_item_product_quantity(p_cart_item_id integer, p_product_quantity integer) OWNER TO postgres;

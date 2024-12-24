CREATE OR REPLACE PROCEDURE public.delete_cart_item_by_id(p_cart_item_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM cart_item
WHERE cart_item_id = p_cart_item_id;

END;

$$;

ALTER PROCEDURE public.delete_cart_item_by_id(p_cart_item_id integer) OWNER TO postgres;

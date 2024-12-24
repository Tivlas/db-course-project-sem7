CREATE OR REPLACE PROCEDURE public.delete_product_by_id(p_product_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM product
WHERE product_id = p_product_id;

END;

$$;

ALTER PROCEDURE public.delete_product_by_id(p_product_id integer) OWNER TO postgres;

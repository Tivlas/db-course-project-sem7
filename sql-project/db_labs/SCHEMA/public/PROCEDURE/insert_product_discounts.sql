CREATE OR REPLACE PROCEDURE public.insert_product_discounts(p_discount_id integer, p_product_ids integer[])
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..array_length(p_product_ids, 1)
    LOOP
        INSERT INTO product_discount (product_id, discount_id)
        VALUES (p_product_ids[i], p_discount_id);
    END LOOP;
END;
$$;

ALTER PROCEDURE public.insert_product_discounts(p_discount_id integer, p_product_ids integer[]) OWNER TO postgres;

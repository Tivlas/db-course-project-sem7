CREATE OR REPLACE PROCEDURE public.delete_category_by_id(category_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM product_category
WHERE product_category_id = category_id;

END;

$$;

ALTER PROCEDURE public.delete_category_by_id(category_id integer) OWNER TO postgres;

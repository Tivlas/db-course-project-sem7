CREATE OR REPLACE PROCEDURE public.update_category(id integer, new_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE product_category
SET name = new_name
WHERE product_category_id = id;

END;

$$;

ALTER PROCEDURE public.update_category(id integer, new_name character varying) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.delete_discount_by_id(p_discount_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM discount
WHERE discount_id = p_discount_id;

END;

$$;

ALTER PROCEDURE public.delete_discount_by_id(p_discount_id integer) OWNER TO postgres;

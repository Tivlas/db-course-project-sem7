CREATE OR REPLACE PROCEDURE public.update_discount(p_discount_id integer, p_description character varying, p_name character varying, p_percent integer, p_is_active boolean)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE discount
SET description = p_description,
    name = p_name,
    percent = p_percent,
    is_active = p_is_active
WHERE discount_id = p_discount_id;

END;

$$;

ALTER PROCEDURE public.update_discount(p_discount_id integer, p_description character varying, p_name character varying, p_percent integer, p_is_active boolean) OWNER TO postgres;

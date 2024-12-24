CREATE OR REPLACE FUNCTION public.insert_discount(p_description character varying, p_name character varying, p_percent integer, p_is_active boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE r_discount_id INT;

BEGIN
INSERT INTO discount (description, name, percent, is_active)
VALUES (p_description, p_name, p_percent, p_is_active)
RETURNING discount_id INTO r_discount_id;

RETURN r_discount_id;

END;

$$;

ALTER FUNCTION public.insert_discount(p_description character varying, p_name character varying, p_percent integer, p_is_active boolean) OWNER TO postgres;

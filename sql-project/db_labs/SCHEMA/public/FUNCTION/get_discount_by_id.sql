CREATE OR REPLACE FUNCTION public.get_discount_by_id(p_discount_id integer) RETURNS TABLE(discount_id integer, description character varying, name character varying, percent integer, is_active boolean)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT d.discount_id,
    d.description,
    d.name,
    d.percent,
    d.is_active
FROM discount d
WHERE d.discount_id = p_discount_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_discount_by_id(p_discount_id integer) OWNER TO postgres;

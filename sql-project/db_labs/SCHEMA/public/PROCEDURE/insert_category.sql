CREATE OR REPLACE PROCEDURE public.insert_category(p_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO product_category (name)
    VALUES (p_name);
END;
$$;

ALTER PROCEDURE public.insert_category(p_name character varying) OWNER TO postgres;

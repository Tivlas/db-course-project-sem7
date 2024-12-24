CREATE OR REPLACE FUNCTION public.get_product_with_category_by_id(p_product_id integer) RETURNS TABLE(product_id integer, product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text, category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT p.product_id,
    p.product_category_id,
    p.price,
    p.name,
    p.production_date,
    p.quantity,
    p.brand,
    p.description,
    pc.name AS category_name
FROM product p
    INNER JOIN product_category pc ON pc.product_category_id = p.product_category_id
WHERE p.product_id = p_product_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_product_with_category_by_id(p_product_id integer) OWNER TO postgres;

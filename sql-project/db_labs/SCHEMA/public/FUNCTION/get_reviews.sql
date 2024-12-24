CREATE OR REPLACE FUNCTION public.get_reviews() RETURNS TABLE(review_id integer, product_id integer, client_id integer, content text, rating integer, date timestamp without time zone, client_first_name character varying, client_last_name character varying, client_phone character, client_email character varying, product_name character varying, product_price numeric, product_category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT r.review_id,
    r.product_id,
    r.client_id,
    r.content,
    r.rating,
    r.date,
    c.first_name AS client_first_name,
    c.last_name AS client_last_name,
    c.phone AS client_phone,
    c.email AS client_email,
    p.name AS product_name,
    p.price AS product_price,
    pc.name AS product_category_name
FROM review r
    INNER JOIN client c ON r.client_id = c.client_id
    INNER JOIN product p ON r.product_id = p.product_id
    INNER JOIN product_category pc ON p.product_category_id = pc.product_category_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_reviews() OWNER TO postgres;

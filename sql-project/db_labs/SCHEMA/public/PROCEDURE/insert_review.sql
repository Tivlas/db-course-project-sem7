CREATE OR REPLACE PROCEDURE public.insert_review(p_product_id integer, p_client_id integer, p_content text, p_rating integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO review (product_id, client_id, content, rating)
VALUES (p_product_id, p_client_id, p_content, p_rating);

END;

$$;

ALTER PROCEDURE public.insert_review(p_product_id integer, p_client_id integer, p_content text, p_rating integer) OWNER TO postgres;

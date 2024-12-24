CREATE OR REPLACE PROCEDURE public.insert_order(p_client_id integer, p_price numeric)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO "order" ("client_id", "price")
VALUES (p_client_id, p_price);

END;

$$;

ALTER PROCEDURE public.insert_order(p_client_id integer, p_price numeric) OWNER TO postgres;

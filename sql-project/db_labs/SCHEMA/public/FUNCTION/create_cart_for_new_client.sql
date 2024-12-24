CREATE OR REPLACE FUNCTION public.create_cart_for_new_client() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO cart (client_id, price)
VALUES (NEW.client_id, 0.0);

RETURN NULL;

END;

$$;

ALTER FUNCTION public.create_cart_for_new_client() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.update_product_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN IF TG_OP = 'INSERT' THEN
UPDATE product
SET quantity = quantity - NEW.product_quantity
WHERE product_id = NEW.product_id;

ELSIF TG_OP = 'DELETE' THEN
UPDATE product
SET quantity = quantity + OLD.product_quantity
WHERE product_id = OLD.product_id;

END IF;

RETURN NULL;

END;

$$;

ALTER FUNCTION public.update_product_quantity() OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.update_product_quantity(old anyelement, new anyelement, tg_op text) RETURNS void
    LANGUAGE plpgsql
    AS $$ BEGIN IF TG_OP = 'INSERT' THEN
UPDATE product
SET quantity = quantity - NEW.product_quantity
WHERE product_id = NEW.product_id;

ELSIF TG_OP = 'DELETE' THEN
UPDATE product
SET quantity = quantity + OLD.product_quantity
WHERE product_id = OLD.product_id;

ELSIF TG_OP = 'UPDATE' THEN
UPDATE product
SET quantity = quantity - (NEW.product_quantity - OLD.product_quantity)
WHERE product_id = OLD.product_id;

END IF;

RETURN;

END;

$$;

ALTER FUNCTION public.update_product_quantity(old anyelement, new anyelement, tg_op text) OWNER TO postgres;

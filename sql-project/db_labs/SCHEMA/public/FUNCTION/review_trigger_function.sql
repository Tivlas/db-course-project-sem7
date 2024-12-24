CREATE OR REPLACE FUNCTION public.review_trigger_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN IF (TG_OP = 'INSERT') THEN
INSERT INTO review_log (
        operation,
        review_id,
        product_id,
        client_id,
        content,
        rating,
        "date"
    )
VALUES (
        'INSERT',
        NEW.review_id,
        NEW.product_id,
        NEW.client_id,
        NEW.content,
        NEW.rating,
        NEW.date
    );

ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO review_log (
        operation,
        review_id,
        product_id,
        client_id,
        content,
        rating,
        "date"
    )
VALUES (
        'UPDATE',
        NEW.review_id,
        NEW.product_id,
        NEW.client_id,
        NEW.content,
        NEW.rating,
        NEW.date
    );

ELSIF (TG_OP = 'DELETE') THEN
INSERT INTO review_log (
        operation,
        review_id,
        product_id,
        client_id,
        content,
        rating,
        "date"
    )
VALUES (
        'DELETE',
        OLD.review_id,
        OLD.product_id,
        OLD.client_id,
        OLD.content,
        OLD.rating,
        OLD.date
    );

END IF;

RETURN NEW;

END;

$$;

ALTER FUNCTION public.review_trigger_function() OWNER TO postgres;

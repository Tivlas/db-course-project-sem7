CREATE OR REPLACE PROCEDURE public.delete_review(p_review_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM review
WHERE review_id = p_review_id;

END;

$$;

ALTER PROCEDURE public.delete_review(p_review_id integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.update_review(p_review_id integer, p_content text, p_rating integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE review
SET content = p_content,
    rating = p_rating
WHERE review_id = p_review_id;

END;

$$;

ALTER PROCEDURE public.update_review(p_review_id integer, p_content text, p_rating integer) OWNER TO postgres;

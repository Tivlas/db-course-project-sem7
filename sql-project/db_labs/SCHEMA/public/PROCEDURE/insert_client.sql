CREATE OR REPLACE PROCEDURE public.insert_client(p_first_name character varying, p_last_name character varying, p_phone character, p_password character varying, p_email character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO "client" (
        "first_name",
        "last_name",
        "phone",
        "password",
        "email"
    )
VALUES (
        p_first_name,
        p_last_name,
        p_phone,
        p_password,
        p_email
    );

END;

$$;

ALTER PROCEDURE public.insert_client(p_first_name character varying, p_last_name character varying, p_phone character, p_password character varying, p_email character varying) OWNER TO postgres;

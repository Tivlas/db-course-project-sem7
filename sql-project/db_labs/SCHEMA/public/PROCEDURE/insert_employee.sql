CREATE OR REPLACE PROCEDURE public.insert_employee(p_employee_role_id integer, p_first_name character varying, p_last_name character varying, p_salary numeric, p_phone character, p_position character varying, p_password character varying, p_email character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "employee" (
        "employee_role_id",
        "first_name",
        "last_name",
        "salary",
        "phone",
        "position",
        "password",
        "email"
    )
    VALUES (
        p_employee_role_id,
        p_first_name,
        p_last_name,
        p_salary,
        p_phone,
        p_position,
        p_password,
        p_email
    );
END;
$$;

ALTER PROCEDURE public.insert_employee(p_employee_role_id integer, p_first_name character varying, p_last_name character varying, p_salary numeric, p_phone character, p_position character varying, p_password character varying, p_email character varying) OWNER TO postgres;

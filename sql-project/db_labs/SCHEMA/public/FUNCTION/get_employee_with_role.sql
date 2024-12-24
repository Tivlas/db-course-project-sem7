CREATE OR REPLACE FUNCTION public.get_employee_with_role(p_email text, p_password text) RETURNS TABLE(employee_id integer, employee_role_id integer, first_name character varying, last_name character varying, salary numeric, phone character, "position" character varying, password character varying, email character varying, name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT e.employee_id,
    e.employee_role_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.phone,
    e.position,
    e.password,
    e.email,
    r.name
FROM employee AS e
    INNER JOIN employee_role AS r ON e.employee_role_id = r.employee_role_id
WHERE e.email = p_email
    AND e.password = p_password;

END;

$$;

ALTER FUNCTION public.get_employee_with_role(p_email text, p_password text) OWNER TO postgres;

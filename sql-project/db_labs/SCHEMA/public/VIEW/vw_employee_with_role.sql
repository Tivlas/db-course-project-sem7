CREATE VIEW public.vw_employee_with_role AS
	SELECT e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.phone,
    e."position",
    e.password,
    e.email,
    r.name
   FROM (public.employee e
     JOIN public.employee_role r ON ((e.employee_role_id = r.employee_role_id)));

ALTER VIEW public.vw_employee_with_role OWNER TO postgres;

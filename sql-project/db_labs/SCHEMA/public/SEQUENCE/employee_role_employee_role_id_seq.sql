CREATE SEQUENCE public.employee_role_employee_role_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.employee_role_employee_role_id_seq OWNER TO postgres;

ALTER SEQUENCE public.employee_role_employee_role_id_seq
	OWNED BY public.employee_role.employee_role_id;

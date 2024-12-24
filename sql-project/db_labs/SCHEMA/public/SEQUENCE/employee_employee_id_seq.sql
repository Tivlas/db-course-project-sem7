CREATE SEQUENCE public.employee_employee_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.employee_employee_id_seq OWNER TO postgres;

ALTER SEQUENCE public.employee_employee_id_seq
	OWNED BY public.employee.employee_id;

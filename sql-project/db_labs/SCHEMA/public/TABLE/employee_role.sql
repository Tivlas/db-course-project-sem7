CREATE TABLE public.employee_role (
	employee_role_id integer DEFAULT nextval('public.employee_role_employee_role_id_seq'::regclass) NOT NULL,
	name character varying(30) NOT NULL
);

ALTER TABLE public.employee_role OWNER TO postgres;

--------------------------------------------------------------------------------

ALTER TABLE public.employee_role
	ADD CONSTRAINT employee_role_pkey PRIMARY KEY (employee_role_id);

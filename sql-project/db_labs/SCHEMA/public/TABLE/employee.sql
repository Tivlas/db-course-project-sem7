CREATE TABLE public.employee (
	employee_id integer DEFAULT nextval('public.employee_employee_id_seq'::regclass) NOT NULL,
	employee_role_id integer NOT NULL,
	first_name character varying(30) NOT NULL,
	last_name character varying(30) NOT NULL,
	salary numeric(7,2) NOT NULL,
	phone character(13) NOT NULL,
	"position" character varying(30) NOT NULL,
	password character varying(20) NOT NULL,
	email character varying(30) NOT NULL
);

ALTER TABLE public.employee OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_employee_email ON public.employee USING btree (email);

--------------------------------------------------------------------------------

CREATE INDEX idx_employee_employee_role_id ON public.employee USING btree (employee_role_id);

--------------------------------------------------------------------------------

ALTER TABLE public.employee
	ADD CONSTRAINT employee_employee_role_id_fkey FOREIGN KEY (employee_role_id) REFERENCES public.employee_role(employee_role_id) ON DELETE RESTRICT;

--------------------------------------------------------------------------------

ALTER TABLE public.employee
	ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);

--------------------------------------------------------------------------------

ALTER TABLE public.employee
	ADD CONSTRAINT positive_salary CHECK ((salary > (0)::numeric));

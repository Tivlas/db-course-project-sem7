CREATE TABLE public.client (
	client_id integer DEFAULT nextval('public.client_client_id_seq'::regclass) NOT NULL,
	first_name character varying(30) NOT NULL,
	last_name character varying(30) NOT NULL,
	phone character(13) NOT NULL,
	password character varying(20) NOT NULL,
	email character varying(30) NOT NULL
);

ALTER TABLE public.client OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_client_email ON public.client USING btree (email);

--------------------------------------------------------------------------------

CREATE TRIGGER insert_cart_for_new_client
	AFTER INSERT ON public.client
	FOR EACH ROW
	EXECUTE PROCEDURE public.create_cart_for_new_client();

--------------------------------------------------------------------------------

ALTER TABLE public.client
	ADD CONSTRAINT client_email_key UNIQUE (email);

--------------------------------------------------------------------------------

ALTER TABLE public.client
	ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);

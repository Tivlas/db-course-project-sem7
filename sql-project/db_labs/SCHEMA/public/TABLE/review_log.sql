CREATE TABLE public.review_log (
	log_id integer DEFAULT nextval('public.review_log_log_id_seq'::regclass) NOT NULL,
	operation text NOT NULL,
	review_id integer NOT NULL,
	product_id integer NOT NULL,
	client_id integer NOT NULL,
	content text NOT NULL,
	rating integer NOT NULL,
	date timestamp without time zone NOT NULL,
	modified_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.review_log OWNER TO postgres;

--------------------------------------------------------------------------------

ALTER TABLE public.review_log
	ADD CONSTRAINT review_log_pkey PRIMARY KEY (log_id);

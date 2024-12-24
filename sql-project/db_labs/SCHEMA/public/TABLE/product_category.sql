CREATE TABLE public.product_category (
	product_category_id integer DEFAULT nextval('public.product_category_product_category_id_seq'::regclass) NOT NULL,
	name character varying(30) NOT NULL
);

ALTER TABLE public.product_category OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_product_category_name ON public.product_category USING btree (name);

--------------------------------------------------------------------------------

ALTER TABLE public.product_category
	ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_category_id);

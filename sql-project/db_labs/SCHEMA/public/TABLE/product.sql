CREATE TABLE public.product (
	product_id integer DEFAULT nextval('public.product_product_id_seq'::regclass) NOT NULL,
	product_category_id integer NOT NULL,
	price numeric(7,2) NOT NULL,
	name character varying(30) NOT NULL,
	production_date date NOT NULL,
	quantity integer NOT NULL,
	brand character varying(30) NOT NULL,
	description text NOT NULL
);

ALTER TABLE public.product OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_product_brand ON public.product USING btree (brand);

--------------------------------------------------------------------------------

CREATE INDEX idx_product_name ON public.product USING btree (name);

--------------------------------------------------------------------------------

CREATE INDEX idx_product_product_category_id ON public.product USING btree (product_category_id);

--------------------------------------------------------------------------------

ALTER TABLE public.product
	ADD CONSTRAINT non_negative_quantity CHECK ((quantity >= 0));

--------------------------------------------------------------------------------

ALTER TABLE public.product
	ADD CONSTRAINT positive_price CHECK ((price > (0)::numeric));

--------------------------------------------------------------------------------

ALTER TABLE public.product
	ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);

--------------------------------------------------------------------------------

ALTER TABLE public.product
	ADD CONSTRAINT product_product_category_id_fkey FOREIGN KEY (product_category_id) REFERENCES public.product_category(product_category_id) ON DELETE RESTRICT;

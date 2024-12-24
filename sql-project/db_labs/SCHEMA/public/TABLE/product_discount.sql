CREATE TABLE public.product_discount (
	product_id integer NOT NULL,
	discount_id integer NOT NULL
);

ALTER TABLE public.product_discount OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_product_discount_discount_id ON public.product_discount USING btree (discount_id);

--------------------------------------------------------------------------------

CREATE INDEX idx_product_discount_product_id ON public.product_discount USING btree (product_id);

--------------------------------------------------------------------------------

ALTER TABLE public.product_discount
	ADD CONSTRAINT product_discount_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discount(discount_id) ON DELETE CASCADE;

--------------------------------------------------------------------------------

ALTER TABLE public.product_discount
	ADD CONSTRAINT product_discount_pkey PRIMARY KEY (product_id, discount_id);

--------------------------------------------------------------------------------

ALTER TABLE public.product_discount
	ADD CONSTRAINT product_discount_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;

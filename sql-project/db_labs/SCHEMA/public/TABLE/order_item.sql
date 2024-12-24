CREATE TABLE public.order_item (
	order_item_id integer DEFAULT nextval('public.order_item_order_item_id_seq'::regclass) NOT NULL,
	order_id integer NOT NULL,
	product_id integer NOT NULL,
	product_quantity integer NOT NULL,
	product_price numeric(7,2) NOT NULL
);

ALTER TABLE public.order_item OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_order_item_order_id ON public.order_item USING btree (order_id);

--------------------------------------------------------------------------------

CREATE INDEX idx_order_item_product_id ON public.order_item USING btree (product_id);

--------------------------------------------------------------------------------

ALTER TABLE public.order_item
	ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;

--------------------------------------------------------------------------------

ALTER TABLE public.order_item
	ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_item_id);

--------------------------------------------------------------------------------

ALTER TABLE public.order_item
	ADD CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE RESTRICT;

--------------------------------------------------------------------------------

ALTER TABLE public.order_item
	ADD CONSTRAINT positive_product_price CHECK ((product_price > (0)::numeric));

--------------------------------------------------------------------------------

ALTER TABLE public.order_item
	ADD CONSTRAINT positive_product_quantity CHECK ((product_quantity > 0));

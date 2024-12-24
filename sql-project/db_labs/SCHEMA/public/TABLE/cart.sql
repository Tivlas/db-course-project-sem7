CREATE TABLE public.cart (
	cart_id integer DEFAULT nextval('public.cart_cart_id_seq'::regclass) NOT NULL,
	client_id integer NOT NULL,
	price numeric(7,2) NOT NULL
);

ALTER TABLE public.cart OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_cart_client_id ON public.cart USING btree (client_id);

--------------------------------------------------------------------------------

ALTER TABLE public.cart
	ADD CONSTRAINT cart_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;

--------------------------------------------------------------------------------

ALTER TABLE public.cart
	ADD CONSTRAINT cart_client_id_key UNIQUE (client_id);

--------------------------------------------------------------------------------

ALTER TABLE public.cart
	ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);

--------------------------------------------------------------------------------

ALTER TABLE public.cart
	ADD CONSTRAINT non_negative_price CHECK ((price >= (0)::numeric));

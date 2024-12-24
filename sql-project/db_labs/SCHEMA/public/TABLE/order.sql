CREATE TABLE public."order" (
	order_id integer DEFAULT nextval('public.order_order_id_seq'::regclass) NOT NULL,
	client_id integer NOT NULL,
	date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	price numeric(7,2) NOT NULL
);

ALTER TABLE public."order" OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_order_client_id ON public."order" USING btree (client_id);

--------------------------------------------------------------------------------

CREATE INDEX idx_order_date ON public."order" USING btree (date);

--------------------------------------------------------------------------------

CREATE TRIGGER copy_cart_items_to_order_items_trigger
	AFTER INSERT ON public."order"
	FOR EACH ROW
	EXECUTE PROCEDURE public.copy_cart_items_to_order_items();

--------------------------------------------------------------------------------

ALTER TABLE public."order"
	ADD CONSTRAINT order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;

--------------------------------------------------------------------------------

ALTER TABLE public."order"
	ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);

--------------------------------------------------------------------------------

ALTER TABLE public."order"
	ADD CONSTRAINT positive_price CHECK ((price > (0)::numeric));

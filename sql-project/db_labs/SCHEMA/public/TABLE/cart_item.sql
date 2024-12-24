CREATE TABLE public.cart_item (
	cart_item_id integer DEFAULT nextval('public.cart_item_cart_item_id_seq'::regclass) NOT NULL,
	cart_id integer NOT NULL,
	product_id integer NOT NULL,
	product_quantity integer NOT NULL,
	product_price numeric(7,2) NOT NULL
);

ALTER TABLE public.cart_item OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_cart_item_cart_id ON public.cart_item USING btree (cart_id);

--------------------------------------------------------------------------------

CREATE INDEX idx_cart_item_product_id ON public.cart_item USING btree (product_id);

--------------------------------------------------------------------------------

CREATE TRIGGER after_delete_cart_item_trigger
	AFTER DELETE ON public.cart_item
	FOR EACH ROW
	EXECUTE PROCEDURE public.update_cart_price();

--------------------------------------------------------------------------------

CREATE TRIGGER after_insert_cart_item_trigger
	AFTER INSERT ON public.cart_item
	FOR EACH ROW
	EXECUTE PROCEDURE public.update_cart_price();

--------------------------------------------------------------------------------

CREATE TRIGGER after_update_cart_item_trigger
	AFTER UPDATE ON public.cart_item
	FOR EACH ROW
	EXECUTE PROCEDURE public.update_cart_price();

--------------------------------------------------------------------------------

ALTER TABLE public.cart_item
	ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id) ON DELETE CASCADE;

--------------------------------------------------------------------------------

ALTER TABLE public.cart_item
	ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cart_item_id);

--------------------------------------------------------------------------------

ALTER TABLE public.cart_item
	ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE RESTRICT;

--------------------------------------------------------------------------------

ALTER TABLE public.cart_item
	ADD CONSTRAINT positive_product_price CHECK ((product_price > (0)::numeric));

--------------------------------------------------------------------------------

ALTER TABLE public.cart_item
	ADD CONSTRAINT positive_product_quantity CHECK ((product_quantity > 0));

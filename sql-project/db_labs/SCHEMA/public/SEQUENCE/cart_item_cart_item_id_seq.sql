CREATE SEQUENCE public.cart_item_cart_item_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.cart_item_cart_item_id_seq OWNER TO postgres;

ALTER SEQUENCE public.cart_item_cart_item_id_seq
	OWNED BY public.cart_item.cart_item_id;

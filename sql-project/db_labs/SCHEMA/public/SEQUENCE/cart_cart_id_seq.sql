CREATE SEQUENCE public.cart_cart_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.cart_cart_id_seq OWNER TO postgres;

ALTER SEQUENCE public.cart_cart_id_seq
	OWNED BY public.cart.cart_id;

CREATE SEQUENCE public.product_product_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.product_product_id_seq OWNER TO postgres;

ALTER SEQUENCE public.product_product_id_seq
	OWNED BY public.product.product_id;

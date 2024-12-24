CREATE SEQUENCE public.review_log_log_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.review_log_log_id_seq OWNER TO postgres;

ALTER SEQUENCE public.review_log_log_id_seq
	OWNED BY public.review_log.log_id;

CREATE TABLE public.review (
	review_id integer DEFAULT nextval('public.review_review_id_seq'::regclass) NOT NULL,
	product_id integer NOT NULL,
	client_id integer NOT NULL,
	content text NOT NULL,
	rating integer NOT NULL,
	date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE public.review OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_review_client_id ON public.review USING btree (client_id);

--------------------------------------------------------------------------------

CREATE INDEX idx_review_product_id ON public.review USING btree (product_id);

--------------------------------------------------------------------------------

CREATE TRIGGER review_trigger
	AFTER INSERT OR UPDATE OR DELETE ON public.review
	FOR EACH ROW
	EXECUTE PROCEDURE public.review_trigger_function();

--------------------------------------------------------------------------------

ALTER TABLE public.review
	ADD CONSTRAINT one_to_five_rating_range CHECK (((rating > 0) AND (rating < 6)));

--------------------------------------------------------------------------------

ALTER TABLE public.review
	ADD CONSTRAINT review_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;

--------------------------------------------------------------------------------

ALTER TABLE public.review
	ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);

--------------------------------------------------------------------------------

ALTER TABLE public.review
	ADD CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;

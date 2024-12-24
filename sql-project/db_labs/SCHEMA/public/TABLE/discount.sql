CREATE TABLE public.discount (
	discount_id integer DEFAULT nextval('public.discount_discount_id_seq'::regclass) NOT NULL,
	description character varying(50) NOT NULL,
	name character varying(30) NOT NULL,
	percent integer NOT NULL,
	is_active boolean NOT NULL
);

ALTER TABLE public.discount OWNER TO postgres;

--------------------------------------------------------------------------------

CREATE INDEX idx_discount_percent ON public.discount USING btree (percent);

--------------------------------------------------------------------------------

ALTER TABLE public.discount
	ADD CONSTRAINT discount_percent_value CHECK (((percent > 0) AND (percent < 100)));

--------------------------------------------------------------------------------

ALTER TABLE public.discount
	ADD CONSTRAINT discount_pkey PRIMARY KEY (discount_id);

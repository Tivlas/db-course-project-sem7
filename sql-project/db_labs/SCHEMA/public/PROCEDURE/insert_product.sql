CREATE OR REPLACE PROCEDURE public.insert_product(product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO product (
        product_category_id,
        price,
        name,
        production_date,
        quantity,
        brand,
        description
    )
VALUES (
        product_category_id,
        price,
        name,
        production_date,
        quantity,
        brand,
        description
    );

END;

$$;

ALTER PROCEDURE public.insert_product(product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text) OWNER TO postgres;

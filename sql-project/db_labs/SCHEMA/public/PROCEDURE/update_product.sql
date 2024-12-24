CREATE OR REPLACE PROCEDURE public.update_product(p_product_id integer, product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE product
SET product_category_id = update_product.product_category_id,
    price = update_product.price,
    name = update_product.name,
    production_date = update_product.production_date,
    quantity = update_product.quantity,
    brand = update_product.brand,
    description = update_product.description
WHERE product_id = p_product_id;

END;

$$;

ALTER PROCEDURE public.update_product(p_product_id integer, product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text) OWNER TO postgres;

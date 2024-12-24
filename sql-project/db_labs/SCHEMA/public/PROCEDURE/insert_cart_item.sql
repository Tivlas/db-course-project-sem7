CREATE OR REPLACE PROCEDURE public.insert_cart_item(p_cart_id integer, p_product_id integer, p_product_quantity integer, p_product_price numeric)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO cart_item (
        cart_id,
        product_id,
        product_quantity,
        product_price
    )
VALUES (
        p_cart_id,
        p_product_id,
        p_product_quantity,
        p_product_price
    );

END;

$$;

ALTER PROCEDURE public.insert_cart_item(p_cart_id integer, p_product_id integer, p_product_quantity integer, p_product_price numeric) OWNER TO postgres;

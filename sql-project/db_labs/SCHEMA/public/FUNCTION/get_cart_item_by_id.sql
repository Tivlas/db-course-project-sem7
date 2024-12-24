CREATE OR REPLACE FUNCTION public.get_cart_item_by_id(p_cart_item_id integer) RETURNS TABLE(cart_item_id integer, cart_id integer, product_id integer, product_quantity integer, product_price numeric, client_id integer, price numeric, product_category_id integer, name character varying, production_date date, quantity integer, brand character varying, description text)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT ci.cart_item_id,
    ci.cart_id,
    ci.product_id,
    ci.product_quantity,
    ci.product_price,
    c.client_id,
    c.price,
    p.product_category_id,
    p.name,
    p.production_date,
    p.quantity,
    p.brand,
    p.description
FROM cart_item ci
    JOIN cart c ON ci.cart_id = c.cart_id
    JOIN product p ON ci.product_id = p.product_id
WHERE ci.cart_item_id = p_cart_item_id;

END;

$$;

ALTER FUNCTION public.get_cart_item_by_id(p_cart_item_id integer) OWNER TO postgres;

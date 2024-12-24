CREATE OR REPLACE FUNCTION public.get_orders() RETURNS TABLE(order_id integer, client_id integer, date timestamp without time zone, price numeric, first_name character varying, last_name character varying, phone character, email character varying, password character varying, product_id integer, quantity integer, product_price numeric, name character varying, product_category_id integer, product_category_name character varying, brand character varying, description text)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT o.order_id,
    o.client_id,
    o.date,
    o.price,
    c.first_name,
    c.last_name,
    c.phone,
    c.email,
    c.password,
    oi.product_id,
    oi.product_quantity,
    oi.product_price,
    p.name,
    p.product_category_id,
    pc.name,
    p.brand,
    p.description
FROM "order" o
    JOIN "client" c ON o.client_id = c.client_id
    JOIN "order_item" oi ON o.order_id = oi.order_id
    JOIN "product" p ON oi.product_id = p.product_id
    JOIN "product_category" pc ON p.product_category_id = pc.product_category_id;

END;

$$;

ALTER FUNCTION public.get_orders() OWNER TO postgres;

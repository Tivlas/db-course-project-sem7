SET TIMEZONE TO 'UTC';

SET check_function_bodies = false;

SET search_path = pg_catalog;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.cart.cart_id

CREATE SEQUENCE public.cart_cart_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.cart_cart_id_seq OWNER TO postgres;

CREATE TABLE public.cart (
	cart_id integer DEFAULT nextval('public.cart_cart_id_seq'::regclass) NOT NULL,
	client_id integer NOT NULL,
	price numeric(7,2) NOT NULL
);

ALTER TABLE public.cart OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.cart_item.cart_item_id

CREATE SEQUENCE public.cart_item_cart_item_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.cart_item_cart_item_id_seq OWNER TO postgres;

CREATE TABLE public.cart_item (
	cart_item_id integer DEFAULT nextval('public.cart_item_cart_item_id_seq'::regclass) NOT NULL,
	cart_id integer NOT NULL,
	product_id integer NOT NULL,
	product_quantity integer NOT NULL,
	product_price numeric(7,2) NOT NULL
);

ALTER TABLE public.cart_item OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.client.client_id

CREATE SEQUENCE public.client_client_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.client_client_id_seq OWNER TO postgres;

CREATE TABLE public.client (
	client_id integer DEFAULT nextval('public.client_client_id_seq'::regclass) NOT NULL,
	first_name character varying(30) NOT NULL,
	last_name character varying(30) NOT NULL,
	phone character(13) NOT NULL,
	password character varying(20) NOT NULL,
	email character varying(30) NOT NULL
);

ALTER TABLE public.client OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.discount.discount_id

CREATE SEQUENCE public.discount_discount_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.discount_discount_id_seq OWNER TO postgres;

CREATE TABLE public.discount (
	discount_id integer DEFAULT nextval('public.discount_discount_id_seq'::regclass) NOT NULL,
	description character varying(50) NOT NULL,
	name character varying(30) NOT NULL,
	percent integer NOT NULL,
	is_active boolean NOT NULL
);

ALTER TABLE public.discount OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.employee.employee_id

CREATE SEQUENCE public.employee_employee_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.employee_employee_id_seq OWNER TO postgres;

CREATE TABLE public.employee (
	employee_id integer DEFAULT nextval('public.employee_employee_id_seq'::regclass) NOT NULL,
	employee_role_id integer NOT NULL,
	first_name character varying(30) NOT NULL,
	last_name character varying(30) NOT NULL,
	salary numeric(7,2) NOT NULL,
	phone character(13) NOT NULL,
	"position" character varying(30) NOT NULL,
	password character varying(20) NOT NULL,
	email character varying(30) NOT NULL
);

ALTER TABLE public.employee OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.employee_role.employee_role_id

CREATE SEQUENCE public.employee_role_employee_role_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.employee_role_employee_role_id_seq OWNER TO postgres;

CREATE TABLE public.employee_role (
	employee_role_id integer DEFAULT nextval('public.employee_role_employee_role_id_seq'::regclass) NOT NULL,
	name character varying(30) NOT NULL
);

ALTER TABLE public.employee_role OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.order_item.order_item_id

CREATE SEQUENCE public.order_item_order_item_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.order_item_order_item_id_seq OWNER TO postgres;

CREATE TABLE public.order_item (
	order_item_id integer DEFAULT nextval('public.order_item_order_item_id_seq'::regclass) NOT NULL,
	order_id integer NOT NULL,
	product_id integer NOT NULL,
	product_quantity integer NOT NULL,
	product_price numeric(7,2) NOT NULL
);

ALTER TABLE public.order_item OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public."order".order_id

CREATE SEQUENCE public.order_order_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.order_order_id_seq OWNER TO postgres;

CREATE TABLE public."order" (
	order_id integer DEFAULT nextval('public.order_order_id_seq'::regclass) NOT NULL,
	client_id integer NOT NULL,
	date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	price numeric(7,2) NOT NULL
);

ALTER TABLE public."order" OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.product_category.product_category_id

CREATE SEQUENCE public.product_category_product_category_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.product_category_product_category_id_seq OWNER TO postgres;

CREATE TABLE public.product_category (
	product_category_id integer DEFAULT nextval('public.product_category_product_category_id_seq'::regclass) NOT NULL,
	name character varying(30) NOT NULL
);

ALTER TABLE public.product_category OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.product.product_id

CREATE SEQUENCE public.product_product_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.product_product_id_seq OWNER TO postgres;

CREATE TABLE public.product (
	product_id integer DEFAULT nextval('public.product_product_id_seq'::regclass) NOT NULL,
	product_category_id integer NOT NULL,
	price numeric(7,2) NOT NULL,
	name character varying(30) NOT NULL,
	production_date date NOT NULL,
	quantity integer NOT NULL,
	brand character varying(30) NOT NULL,
	description text NOT NULL
);

ALTER TABLE public.product OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.review_log.log_id

CREATE SEQUENCE public.review_log_log_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.review_log_log_id_seq OWNER TO postgres;

CREATE TABLE public.review_log (
	log_id integer DEFAULT nextval('public.review_log_log_id_seq'::regclass) NOT NULL,
	operation text NOT NULL,
	review_id integer NOT NULL,
	product_id integer NOT NULL,
	client_id integer NOT NULL,
	content text NOT NULL,
	rating integer NOT NULL,
	date timestamp without time zone NOT NULL,
	modified_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.review_log OWNER TO postgres;

-- DEPCY: This SEQUENCE is a dependency of COLUMN: public.review.review_id

CREATE SEQUENCE public.review_review_id_seq
	AS integer
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

ALTER SEQUENCE public.review_review_id_seq OWNER TO postgres;

CREATE TABLE public.review (
	review_id integer DEFAULT nextval('public.review_review_id_seq'::regclass) NOT NULL,
	product_id integer NOT NULL,
	client_id integer NOT NULL,
	content text NOT NULL,
	rating integer NOT NULL,
	date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE public.review OWNER TO postgres;

CREATE TABLE public.product_discount (
	product_id integer NOT NULL,
	discount_id integer NOT NULL
);

ALTER TABLE public.product_discount OWNER TO postgres;

CREATE TABLE public.total_discount_percent (
	"coalesce" bigint
);

ALTER TABLE public.total_discount_percent OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.copy_cart_items_to_order_items() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE cur_cart_id INT;

BEGIN
SELECT cart_id INTO cur_cart_id
FROM cart
WHERE client_id = NEW.client_id;

INSERT INTO order_item (
    order_id,
    product_id,
    product_quantity,
    product_price
  )
SELECT NEW.order_id,
  product_id,
  product_quantity,
  product_price
FROM cart_item
WHERE cart_id = cur_cart_id;

DELETE FROM cart_item
WHERE cart_id = cur_cart_id;

UPDATE cart
SET price = 0
WHERE client_id = NEW.client_id;

RETURN NULL;

END;

$$;

ALTER FUNCTION public.copy_cart_items_to_order_items() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.create_cart_for_new_client() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO cart (client_id, price)
VALUES (NEW.client_id, 0.0);

RETURN NULL;

END;

$$;

ALTER FUNCTION public.create_cart_for_new_client() OWNER TO postgres;

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

CREATE OR REPLACE FUNCTION public.get_cart_items_by_cart_id(p_cart_id integer) RETURNS TABLE(cart_item_id integer, cart_id integer, product_id integer, product_quantity integer, product_price numeric, client_id integer, price numeric, product_category_id integer, name character varying, production_date date, quantity integer, brand character varying, description text)
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
WHERE ci.cart_id = p_cart_id;

END;

$$;

ALTER FUNCTION public.get_cart_items_by_cart_id(p_cart_id integer) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_discount_by_id(p_discount_id integer) RETURNS TABLE(discount_id integer, description character varying, name character varying, percent integer, is_active boolean)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT d.discount_id,
    d.description,
    d.name,
    d.percent,
    d.is_active
FROM discount d
WHERE d.discount_id = p_discount_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_discount_by_id(p_discount_id integer) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_discounts() RETURNS TABLE(discount_id integer, description character varying, name character varying, percent integer, is_active boolean)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT d.discount_id,
    d.description,
    d.name,
    d.percent,
    d.is_active
FROM discount d;

RETURN;

END;

$$;

ALTER FUNCTION public.get_discounts() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_employee_with_role(p_email text, p_password text) RETURNS TABLE(employee_id integer, employee_role_id integer, first_name character varying, last_name character varying, salary numeric, phone character, "position" character varying, password character varying, email character varying, name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT e.employee_id,
    e.employee_role_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.phone,
    e.position,
    e.password,
    e.email,
    r.name
FROM employee AS e
    INNER JOIN employee_role AS r ON e.employee_role_id = r.employee_role_id
WHERE e.email = p_email
    AND e.password = p_password;

END;

$$;

ALTER FUNCTION public.get_employee_with_role(p_email text, p_password text) OWNER TO postgres;

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

CREATE OR REPLACE FUNCTION public.get_product_with_category_by_id(p_product_id integer) RETURNS TABLE(product_id integer, product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text, category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT p.product_id,
    p.product_category_id,
    p.price,
    p.name,
    p.production_date,
    p.quantity,
    p.brand,
    p.description,
    pc.name AS category_name
FROM product p
    INNER JOIN product_category pc ON pc.product_category_id = p.product_category_id
WHERE p.product_id = p_product_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_product_with_category_by_id(p_product_id integer) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_products_with_categories() RETURNS TABLE(product_id integer, product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text, category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT p.product_id,
    p.product_category_id,
    p.price,
    p.name,
    p.production_date,
    p.quantity,
    p.brand,
    p.description,
    pc.name AS category_name
FROM product p
    INNER JOIN product_category pc ON pc.product_category_id = p.product_category_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_products_with_categories() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_products_with_categories_by_category_id(p_product_category_id integer) RETURNS TABLE(product_id integer, product_category_id integer, price numeric, name character varying, production_date date, quantity integer, brand character varying, description text, category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT p.product_id,
    p.product_category_id,
    p.price,
    p.name,
    p.production_date,
    p.quantity,
    p.brand,
    p.description,
    pc.name AS category_name
FROM product p
    INNER JOIN product_category pc ON pc.product_category_id = p.product_category_id
WHERE p.product_category_id = p_product_category_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_products_with_categories_by_category_id(p_product_category_id integer) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_review_by_id(p_review_id integer) RETURNS TABLE(review_id integer, product_id integer, client_id integer, content text, rating integer, date timestamp without time zone, client_first_name character varying, client_last_name character varying, client_phone character, client_email character varying, product_name character varying, product_price numeric, product_category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT r.review_id,
    r.product_id,
    r.client_id,
    r.content,
    r.rating,
    r.date,
    c.first_name AS client_first_name,
    c.last_name AS client_last_name,
    c.phone AS client_phone,
    c.email AS client_email,
    p.name AS product_name,
    p.price AS product_price,
    pc.name AS product_category_name
FROM review r
    INNER JOIN client c ON r.client_id = c.client_id
    INNER JOIN product p ON r.product_id = p.product_id
    INNER JOIN product_category pc ON p.product_category_id = pc.product_category_id
WHERE r.review_id = p_review_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_review_by_id(p_review_id integer) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_reviews() RETURNS TABLE(review_id integer, product_id integer, client_id integer, content text, rating integer, date timestamp without time zone, client_first_name character varying, client_last_name character varying, client_phone character, client_email character varying, product_name character varying, product_price numeric, product_category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT r.review_id,
    r.product_id,
    r.client_id,
    r.content,
    r.rating,
    r.date,
    c.first_name AS client_first_name,
    c.last_name AS client_last_name,
    c.phone AS client_phone,
    c.email AS client_email,
    p.name AS product_name,
    p.price AS product_price,
    pc.name AS product_category_name
FROM review r
    INNER JOIN client c ON r.client_id = c.client_id
    INNER JOIN product p ON r.product_id = p.product_id
    INNER JOIN product_category pc ON p.product_category_id = pc.product_category_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_reviews() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.get_reviews_by_product_id(p_product_id integer) RETURNS TABLE(review_id integer, product_id integer, client_id integer, content text, rating integer, date timestamp without time zone, client_first_name character varying, client_last_name character varying, client_phone character, client_email character varying, product_name character varying, product_price numeric, product_category_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT r.review_id,
    r.product_id,
    r.client_id,
    r.content,
    r.rating,
    r.date,
    c.first_name AS client_first_name,
    c.last_name AS client_last_name,
    c.phone AS client_phone,
    c.email AS client_email,
    p.name AS product_name,
    p.price AS product_price,
    pc.name AS product_category_name
FROM review r
    INNER JOIN client c ON r.client_id = c.client_id
    INNER JOIN product p ON r.product_id = p.product_id
    INNER JOIN product_category pc ON p.product_category_id = pc.product_category_id
WHERE p.product_id = p_product_id;

RETURN;

END;

$$;

ALTER FUNCTION public.get_reviews_by_product_id(p_product_id integer) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.insert_discount(p_description character varying, p_name character varying, p_percent integer, p_is_active boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE r_discount_id INT;

BEGIN
INSERT INTO discount (description, name, percent, is_active)
VALUES (p_description, p_name, p_percent, p_is_active)
RETURNING discount_id INTO r_discount_id;

RETURN r_discount_id;

END;

$$;

ALTER FUNCTION public.insert_discount(p_description character varying, p_name character varying, p_percent integer, p_is_active boolean) OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.review_trigger_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN IF (TG_OP = 'INSERT') THEN
INSERT INTO review_log (
        operation,
        review_id,
        product_id,
        client_id,
        content,
        rating,
        "date"
    )
VALUES (
        'INSERT',
        NEW.review_id,
        NEW.product_id,
        NEW.client_id,
        NEW.content,
        NEW.rating,
        NEW.date
    );

ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO review_log (
        operation,
        review_id,
        product_id,
        client_id,
        content,
        rating,
        "date"
    )
VALUES (
        'UPDATE',
        NEW.review_id,
        NEW.product_id,
        NEW.client_id,
        NEW.content,
        NEW.rating,
        NEW.date
    );

ELSIF (TG_OP = 'DELETE') THEN
INSERT INTO review_log (
        operation,
        review_id,
        product_id,
        client_id,
        content,
        rating,
        "date"
    )
VALUES (
        'DELETE',
        OLD.review_id,
        OLD.product_id,
        OLD.client_id,
        OLD.content,
        OLD.rating,
        OLD.date
    );

END IF;

RETURN NEW;

END;

$$;

ALTER FUNCTION public.review_trigger_function() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.update_cart_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE total_discount_percent numeric;

BEGIN PERFORM update_product_quantity(OLD, NEW, TG_OP);

IF TG_OP = 'DELETE' THEN
UPDATE cart
SET price = price - OLD.product_price * OLD.product_quantity
WHERE cart_id = OLD.cart_id;

ELSIF TG_OP = 'INSERT' THEN
SELECT COALESCE(SUM(d.percent), 0) INTO total_discount_percent
FROM discount d
  JOIN product_discount pd ON pd.discount_id = d.discount_id
WHERE pd.product_id = NEW.product_id
  AND d.is_active = TRUE;

total_discount_percent = total_discount_percent % 50;

NEW.product_price = NEW.product_price * (1 - total_discount_percent / 100);

UPDATE cart_item
SET product_price = NEW.product_price
WHERE cart_item_id = NEW.cart_item_id;

UPDATE cart
SET price = price + NEW.product_price * NEW.product_quantity
WHERE cart_id = NEW.cart_id;

ELSIF TG_OP = 'UPDATE' THEN
UPDATE cart
SET price = price + (NEW.product_quantity - OLD.product_quantity) * NEW.product_price
WHERE cart_id = NEW.cart_id;

END IF;

RETURN NULL;

END;

$$;

ALTER FUNCTION public.update_cart_price() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.update_product_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN IF TG_OP = 'INSERT' THEN
UPDATE product
SET quantity = quantity - NEW.product_quantity
WHERE product_id = NEW.product_id;

ELSIF TG_OP = 'DELETE' THEN
UPDATE product
SET quantity = quantity + OLD.product_quantity
WHERE product_id = OLD.product_id;

END IF;

RETURN NULL;

END;

$$;

ALTER FUNCTION public.update_product_quantity() OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.update_product_quantity(old anyelement, new anyelement, tg_op text) RETURNS void
    LANGUAGE plpgsql
    AS $$ BEGIN IF TG_OP = 'INSERT' THEN
UPDATE product
SET quantity = quantity - NEW.product_quantity
WHERE product_id = NEW.product_id;

ELSIF TG_OP = 'DELETE' THEN
UPDATE product
SET quantity = quantity + OLD.product_quantity
WHERE product_id = OLD.product_id;

ELSIF TG_OP = 'UPDATE' THEN
UPDATE product
SET quantity = quantity - (NEW.product_quantity - OLD.product_quantity)
WHERE product_id = OLD.product_id;

END IF;

RETURN;

END;

$$;

ALTER FUNCTION public.update_product_quantity(old anyelement, new anyelement, tg_op text) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.delete_cart_item_by_id(p_cart_item_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM cart_item
WHERE cart_item_id = p_cart_item_id;

END;

$$;

ALTER PROCEDURE public.delete_cart_item_by_id(p_cart_item_id integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.delete_category_by_id(category_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM product_category
WHERE product_category_id = category_id;

END;

$$;

ALTER PROCEDURE public.delete_category_by_id(category_id integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.delete_discount_by_id(p_discount_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM discount
WHERE discount_id = p_discount_id;

END;

$$;

ALTER PROCEDURE public.delete_discount_by_id(p_discount_id integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.delete_product_by_id(p_product_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM product
WHERE product_id = p_product_id;

END;

$$;

ALTER PROCEDURE public.delete_product_by_id(p_product_id integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.delete_review(p_review_id integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
DELETE FROM review
WHERE review_id = p_review_id;

END;

$$;

ALTER PROCEDURE public.delete_review(p_review_id integer) OWNER TO postgres;

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

CREATE OR REPLACE PROCEDURE public.insert_category(p_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO product_category (name)
    VALUES (p_name);
END;
$$;

ALTER PROCEDURE public.insert_category(p_name character varying) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.insert_client(p_first_name character varying, p_last_name character varying, p_phone character, p_password character varying, p_email character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO "client" (
        "first_name",
        "last_name",
        "phone",
        "password",
        "email"
    )
VALUES (
        p_first_name,
        p_last_name,
        p_phone,
        p_password,
        p_email
    );

END;

$$;

ALTER PROCEDURE public.insert_client(p_first_name character varying, p_last_name character varying, p_phone character, p_password character varying, p_email character varying) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.insert_employee(p_employee_role_id integer, p_first_name character varying, p_last_name character varying, p_salary numeric, p_phone character, p_position character varying, p_password character varying, p_email character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "employee" (
        "employee_role_id",
        "first_name",
        "last_name",
        "salary",
        "phone",
        "position",
        "password",
        "email"
    )
    VALUES (
        p_employee_role_id,
        p_first_name,
        p_last_name,
        p_salary,
        p_phone,
        p_position,
        p_password,
        p_email
    );
END;
$$;

ALTER PROCEDURE public.insert_employee(p_employee_role_id integer, p_first_name character varying, p_last_name character varying, p_salary numeric, p_phone character, p_position character varying, p_password character varying, p_email character varying) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.insert_order(p_client_id integer, p_price numeric)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO "order" ("client_id", "price")
VALUES (p_client_id, p_price);

END;

$$;

ALTER PROCEDURE public.insert_order(p_client_id integer, p_price numeric) OWNER TO postgres;

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

CREATE OR REPLACE PROCEDURE public.insert_product_discounts(p_discount_id integer, p_product_ids integer[])
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..array_length(p_product_ids, 1)
    LOOP
        INSERT INTO product_discount (product_id, discount_id)
        VALUES (p_product_ids[i], p_discount_id);
    END LOOP;
END;
$$;

ALTER PROCEDURE public.insert_product_discounts(p_discount_id integer, p_product_ids integer[]) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.insert_review(p_product_id integer, p_client_id integer, p_content text, p_rating integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
INSERT INTO review (product_id, client_id, content, rating)
VALUES (p_product_id, p_client_id, p_content, p_rating);

END;

$$;

ALTER PROCEDURE public.insert_review(p_product_id integer, p_client_id integer, p_content text, p_rating integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.update_cart_item_product_quantity(p_cart_item_id integer, p_product_quantity integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE cart_item
SET product_quantity = p_product_quantity
WHERE cart_item_id = p_cart_item_id;

END;

$$;

ALTER PROCEDURE public.update_cart_item_product_quantity(p_cart_item_id integer, p_product_quantity integer) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.update_category(id integer, new_name character varying)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE product_category
SET name = new_name
WHERE product_category_id = id;

END;

$$;

ALTER PROCEDURE public.update_category(id integer, new_name character varying) OWNER TO postgres;

CREATE OR REPLACE PROCEDURE public.update_discount(p_discount_id integer, p_description character varying, p_name character varying, p_percent integer, p_is_active boolean)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE discount
SET description = p_description,
    name = p_name,
    percent = p_percent,
    is_active = p_is_active
WHERE discount_id = p_discount_id;

END;

$$;

ALTER PROCEDURE public.update_discount(p_discount_id integer, p_description character varying, p_name character varying, p_percent integer, p_is_active boolean) OWNER TO postgres;

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

CREATE OR REPLACE PROCEDURE public.update_review(p_review_id integer, p_content text, p_rating integer)
    LANGUAGE plpgsql
    AS $$ BEGIN
UPDATE review
SET content = p_content,
    rating = p_rating
WHERE review_id = p_review_id;

END;

$$;

ALTER PROCEDURE public.update_review(p_review_id integer, p_content text, p_rating integer) OWNER TO postgres;

CREATE INDEX idx_cart_client_id ON public.cart USING btree (client_id);

CREATE INDEX idx_cart_item_cart_id ON public.cart_item USING btree (cart_id);

CREATE INDEX idx_cart_item_product_id ON public.cart_item USING btree (product_id);

CREATE INDEX idx_client_email ON public.client USING btree (email);

CREATE INDEX idx_discount_percent ON public.discount USING btree (percent);

CREATE INDEX idx_employee_email ON public.employee USING btree (email);

CREATE INDEX idx_employee_employee_role_id ON public.employee USING btree (employee_role_id);

CREATE INDEX idx_order_client_id ON public."order" USING btree (client_id);

CREATE INDEX idx_order_date ON public."order" USING btree (date);

CREATE INDEX idx_order_item_order_id ON public.order_item USING btree (order_id);

CREATE INDEX idx_order_item_product_id ON public.order_item USING btree (product_id);

CREATE INDEX idx_product_brand ON public.product USING btree (brand);

CREATE INDEX idx_product_name ON public.product USING btree (name);

CREATE INDEX idx_product_product_category_id ON public.product USING btree (product_category_id);

CREATE INDEX idx_product_category_name ON public.product_category USING btree (name);

CREATE INDEX idx_product_discount_discount_id ON public.product_discount USING btree (discount_id);

CREATE INDEX idx_product_discount_product_id ON public.product_discount USING btree (product_id);

CREATE INDEX idx_review_client_id ON public.review USING btree (client_id);

CREATE INDEX idx_review_product_id ON public.review USING btree (product_id);

-- DEPCY: This CONSTRAINT is a dependency of CONSTRAINT: public.cart.cart_client_id_fkey

ALTER TABLE public.client
	ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);

ALTER TABLE public.cart
	ADD CONSTRAINT cart_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;

ALTER TABLE public.cart
	ADD CONSTRAINT cart_client_id_key UNIQUE (client_id);

ALTER TABLE public.cart
	ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);

ALTER TABLE public.cart
	ADD CONSTRAINT non_negative_price CHECK ((price >= (0)::numeric));

ALTER TABLE public.cart_item
	ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id) ON DELETE CASCADE;

ALTER TABLE public.cart_item
	ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cart_item_id);

-- DEPCY: This CONSTRAINT is a dependency of CONSTRAINT: public.cart_item.cart_item_product_id_fkey

ALTER TABLE public.product
	ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);

ALTER TABLE public.cart_item
	ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE RESTRICT;

ALTER TABLE public.cart_item
	ADD CONSTRAINT positive_product_price CHECK ((product_price > (0)::numeric));

ALTER TABLE public.cart_item
	ADD CONSTRAINT positive_product_quantity CHECK ((product_quantity > 0));

ALTER TABLE public.client
	ADD CONSTRAINT client_email_key UNIQUE (email);

ALTER TABLE public.discount
	ADD CONSTRAINT discount_percent_value CHECK (((percent > 0) AND (percent < 100)));

ALTER TABLE public.discount
	ADD CONSTRAINT discount_pkey PRIMARY KEY (discount_id);

-- DEPCY: This CONSTRAINT is a dependency of CONSTRAINT: public.employee.employee_employee_role_id_fkey

ALTER TABLE public.employee_role
	ADD CONSTRAINT employee_role_pkey PRIMARY KEY (employee_role_id);

ALTER TABLE public.employee
	ADD CONSTRAINT employee_employee_role_id_fkey FOREIGN KEY (employee_role_id) REFERENCES public.employee_role(employee_role_id) ON DELETE RESTRICT;

ALTER TABLE public.employee
	ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);

ALTER TABLE public.employee
	ADD CONSTRAINT positive_salary CHECK ((salary > (0)::numeric));

ALTER TABLE public."order"
	ADD CONSTRAINT order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;

ALTER TABLE public."order"
	ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);

ALTER TABLE public."order"
	ADD CONSTRAINT positive_price CHECK ((price > (0)::numeric));

ALTER TABLE public.order_item
	ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;

ALTER TABLE public.order_item
	ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_item_id);

ALTER TABLE public.order_item
	ADD CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE RESTRICT;

ALTER TABLE public.order_item
	ADD CONSTRAINT positive_product_price CHECK ((product_price > (0)::numeric));

ALTER TABLE public.order_item
	ADD CONSTRAINT positive_product_quantity CHECK ((product_quantity > 0));

ALTER TABLE public.product
	ADD CONSTRAINT non_negative_quantity CHECK ((quantity >= 0));

ALTER TABLE public.product
	ADD CONSTRAINT positive_price CHECK ((price > (0)::numeric));

-- DEPCY: This CONSTRAINT is a dependency of CONSTRAINT: public.product.product_product_category_id_fkey

ALTER TABLE public.product_category
	ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_category_id);

ALTER TABLE public.product
	ADD CONSTRAINT product_product_category_id_fkey FOREIGN KEY (product_category_id) REFERENCES public.product_category(product_category_id) ON DELETE RESTRICT;

ALTER TABLE public.product_discount
	ADD CONSTRAINT product_discount_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discount(discount_id) ON DELETE CASCADE;

ALTER TABLE public.product_discount
	ADD CONSTRAINT product_discount_pkey PRIMARY KEY (product_id, discount_id);

ALTER TABLE public.product_discount
	ADD CONSTRAINT product_discount_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;

ALTER TABLE public.review
	ADD CONSTRAINT one_to_five_rating_range CHECK (((rating > 0) AND (rating < 6)));

ALTER TABLE public.review
	ADD CONSTRAINT review_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;

ALTER TABLE public.review
	ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);

ALTER TABLE public.review
	ADD CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;

ALTER TABLE public.review_log
	ADD CONSTRAINT review_log_pkey PRIMARY KEY (log_id);

CREATE VIEW public.vw_employee_with_role AS
	SELECT e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.phone,
    e."position",
    e.password,
    e.email,
    r.name
   FROM (public.employee e
     JOIN public.employee_role r ON ((e.employee_role_id = r.employee_role_id)));

ALTER VIEW public.vw_employee_with_role OWNER TO postgres;

CREATE TRIGGER after_delete_cart_item_trigger
	AFTER DELETE ON public.cart_item
	FOR EACH ROW
	EXECUTE PROCEDURE public.update_cart_price();

CREATE TRIGGER after_insert_cart_item_trigger
	AFTER INSERT ON public.cart_item
	FOR EACH ROW
	EXECUTE PROCEDURE public.update_cart_price();

CREATE TRIGGER after_update_cart_item_trigger
	AFTER UPDATE ON public.cart_item
	FOR EACH ROW
	EXECUTE PROCEDURE public.update_cart_price();

CREATE TRIGGER insert_cart_for_new_client
	AFTER INSERT ON public.client
	FOR EACH ROW
	EXECUTE PROCEDURE public.create_cart_for_new_client();

CREATE TRIGGER copy_cart_items_to_order_items_trigger
	AFTER INSERT ON public."order"
	FOR EACH ROW
	EXECUTE PROCEDURE public.copy_cart_items_to_order_items();

CREATE TRIGGER review_trigger
	AFTER INSERT OR UPDATE OR DELETE ON public.review
	FOR EACH ROW
	EXECUTE PROCEDURE public.review_trigger_function();

ALTER SEQUENCE public.cart_cart_id_seq
	OWNED BY public.cart.cart_id;

ALTER SEQUENCE public.cart_item_cart_item_id_seq
	OWNED BY public.cart_item.cart_item_id;

ALTER SEQUENCE public.client_client_id_seq
	OWNED BY public.client.client_id;

ALTER SEQUENCE public.discount_discount_id_seq
	OWNED BY public.discount.discount_id;

ALTER SEQUENCE public.employee_employee_id_seq
	OWNED BY public.employee.employee_id;

ALTER SEQUENCE public.employee_role_employee_role_id_seq
	OWNED BY public.employee_role.employee_role_id;

ALTER SEQUENCE public.order_item_order_item_id_seq
	OWNED BY public.order_item.order_item_id;

ALTER SEQUENCE public.order_order_id_seq
	OWNED BY public."order".order_id;

ALTER SEQUENCE public.product_category_product_category_id_seq
	OWNED BY public.product_category.product_category_id;

ALTER SEQUENCE public.product_product_id_seq
	OWNED BY public.product.product_id;

ALTER SEQUENCE public.review_log_log_id_seq
	OWNED BY public.review_log.log_id;

ALTER SEQUENCE public.review_review_id_seq
	OWNED BY public.review.review_id;
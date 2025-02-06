--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO saaulvrj;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO saaulvrj;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO saaulvrj;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO saaulvrj;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO saaulvrj;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO saaulvrj;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO saaulvrj;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO saaulvrj;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO saaulvrj;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO saaulvrj;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO saaulvrj;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO saaulvrj;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO saaulvrj;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO saaulvrj;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO saaulvrj;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO saaulvrj;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: checkout_order; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.checkout_order (
    id bigint NOT NULL,
    order_number character varying(32) NOT NULL,
    full_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    phone_number character varying(20) NOT NULL,
    country character varying(2) NOT NULL,
    postcode character varying(20),
    town_or_city character varying(40) NOT NULL,
    street_address1 character varying(80) NOT NULL,
    street_address2 character varying(80),
    county character varying(80),
    date timestamp with time zone NOT NULL,
    delivery_cost numeric(6,2) NOT NULL,
    order_total numeric(10,2) NOT NULL,
    grand_total numeric(10,2) NOT NULL,
    original_bag text NOT NULL,
    stripe_pid character varying(254) NOT NULL,
    user_profile_id bigint
);


ALTER TABLE public.checkout_order OWNER TO saaulvrj;

--
-- Name: checkout_order_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.checkout_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkout_order_id_seq OWNER TO saaulvrj;

--
-- Name: checkout_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.checkout_order_id_seq OWNED BY public.checkout_order.id;


--
-- Name: checkout_orderlineitem; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.checkout_orderlineitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    lineitem_total numeric(6,2) NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.checkout_orderlineitem OWNER TO saaulvrj;

--
-- Name: checkout_orderlineitem_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.checkout_orderlineitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkout_orderlineitem_id_seq OWNER TO saaulvrj;

--
-- Name: checkout_orderlineitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.checkout_orderlineitem_id_seq OWNED BY public.checkout_orderlineitem.id;


--
-- Name: cheesyblog_comment; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesyblog_comment (
    id bigint NOT NULL,
    body text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    approved boolean NOT NULL,
    post_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cheesyblog_comment OWNER TO saaulvrj;

--
-- Name: cheesyblog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesyblog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesyblog_comment_id_seq OWNER TO saaulvrj;

--
-- Name: cheesyblog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesyblog_comment_id_seq OWNED BY public.cheesyblog_comment.id;


--
-- Name: cheesyblog_post; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesyblog_post (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    slug character varying(200) NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    content text NOT NULL,
    featured_image character varying(255) NOT NULL,
    excerpt text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    status integer NOT NULL,
    author_id integer NOT NULL,
    keywords text NOT NULL
);


ALTER TABLE public.cheesyblog_post OWNER TO saaulvrj;

--
-- Name: cheesyblog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesyblog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesyblog_post_id_seq OWNER TO saaulvrj;

--
-- Name: cheesyblog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesyblog_post_id_seq OWNED BY public.cheesyblog_post.id;


--
-- Name: cheesystoreshop_category; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesystoreshop_category (
    id bigint NOT NULL,
    name character varying(254) NOT NULL,
    friendly_name character varying(254)
);


ALTER TABLE public.cheesystoreshop_category OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesystoreshop_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesystoreshop_category_id_seq OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesystoreshop_category_id_seq OWNED BY public.cheesystoreshop_category.id;


--
-- Name: cheesystoreshop_cheesetype; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesystoreshop_cheesetype (
    id bigint NOT NULL,
    name character varying(254) NOT NULL,
    friendly_name character varying(254)
);


ALTER TABLE public.cheesystoreshop_cheesetype OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_cheesetype_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesystoreshop_cheesetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesystoreshop_cheesetype_id_seq OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_cheesetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesystoreshop_cheesetype_id_seq OWNED BY public.cheesystoreshop_cheesetype.id;


--
-- Name: cheesystoreshop_origin; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesystoreshop_origin (
    id bigint NOT NULL,
    name character varying(254) NOT NULL,
    friendly_name character varying(254)
);


ALTER TABLE public.cheesystoreshop_origin OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesystoreshop_origin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesystoreshop_origin_id_seq OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_origin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesystoreshop_origin_id_seq OWNED BY public.cheesystoreshop_origin.id;


--
-- Name: cheesystoreshop_product; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesystoreshop_product (
    id bigint NOT NULL,
    sku character varying(254),
    name character varying(254) NOT NULL,
    description text NOT NULL,
    price numeric(6,2) NOT NULL,
    rating numeric(6,2),
    image_url character varying(1024),
    image character varying(100),
    category_id bigint,
    cheesetype_id bigint,
    origin_id bigint,
    in_stock boolean
);


ALTER TABLE public.cheesystoreshop_product OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesystoreshop_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesystoreshop_product_id_seq OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesystoreshop_product_id_seq OWNED BY public.cheesystoreshop_product.id;


--
-- Name: cheesystoreshop_rating; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.cheesystoreshop_rating (
    id bigint NOT NULL,
    stars integer NOT NULL,
    product_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cheesystoreshop_rating OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.cheesystoreshop_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheesystoreshop_rating_id_seq OWNER TO saaulvrj;

--
-- Name: cheesystoreshop_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.cheesystoreshop_rating_id_seq OWNED BY public.cheesystoreshop_rating.id;


--
-- Name: contact_contactmessage; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.contact_contactmessage (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.contact_contactmessage OWNER TO saaulvrj;

--
-- Name: contact_contactmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.contact_contactmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_contactmessage_id_seq OWNER TO saaulvrj;

--
-- Name: contact_contactmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.contact_contactmessage_id_seq OWNED BY public.contact_contactmessage.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO saaulvrj;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO saaulvrj;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO saaulvrj;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO saaulvrj;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO saaulvrj;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO saaulvrj;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO saaulvrj;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO saaulvrj;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO saaulvrj;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: django_summernote_attachment; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.django_summernote_attachment (
    id bigint NOT NULL,
    name character varying(255),
    file character varying(100) NOT NULL,
    uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.django_summernote_attachment OWNER TO saaulvrj;

--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.django_summernote_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_summernote_attachment_id_seq OWNER TO saaulvrj;

--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.django_summernote_attachment_id_seq OWNED BY public.django_summernote_attachment.id;


--
-- Name: faq_faq; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.faq_faq (
    id bigint NOT NULL,
    question character varying(255) NOT NULL,
    answer text NOT NULL,
    keywords character varying(255)
);


ALTER TABLE public.faq_faq OWNER TO saaulvrj;

--
-- Name: faq_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.faq_faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_faq_id_seq OWNER TO saaulvrj;

--
-- Name: faq_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.faq_faq_id_seq OWNED BY public.faq_faq.id;


--
-- Name: profiles_userprofile; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.profiles_userprofile (
    id bigint NOT NULL,
    default_phone_number character varying(20),
    default_country character varying(2),
    default_postcode character varying(20),
    default_town_or_city character varying(40),
    default_street_address1 character varying(80),
    default_street_address2 character varying(80),
    default_county character varying(80),
    user_id integer NOT NULL
);


ALTER TABLE public.profiles_userprofile OWNER TO saaulvrj;

--
-- Name: profiles_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.profiles_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_userprofile_id_seq OWNER TO saaulvrj;

--
-- Name: profiles_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.profiles_userprofile_id_seq OWNED BY public.profiles_userprofile.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO saaulvrj;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO saaulvrj;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO saaulvrj;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO saaulvrj;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO saaulvrj;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO saaulvrj;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: saaulvrj
--

CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id bigint NOT NULL,
    app_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO saaulvrj;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: saaulvrj
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO saaulvrj;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saaulvrj
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: checkout_order id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_order ALTER COLUMN id SET DEFAULT nextval('public.checkout_order_id_seq'::regclass);


--
-- Name: checkout_orderlineitem id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_orderlineitem ALTER COLUMN id SET DEFAULT nextval('public.checkout_orderlineitem_id_seq'::regclass);


--
-- Name: cheesyblog_comment id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_comment ALTER COLUMN id SET DEFAULT nextval('public.cheesyblog_comment_id_seq'::regclass);


--
-- Name: cheesyblog_post id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_post ALTER COLUMN id SET DEFAULT nextval('public.cheesyblog_post_id_seq'::regclass);


--
-- Name: cheesystoreshop_category id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_category ALTER COLUMN id SET DEFAULT nextval('public.cheesystoreshop_category_id_seq'::regclass);


--
-- Name: cheesystoreshop_cheesetype id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_cheesetype ALTER COLUMN id SET DEFAULT nextval('public.cheesystoreshop_cheesetype_id_seq'::regclass);


--
-- Name: cheesystoreshop_origin id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_origin ALTER COLUMN id SET DEFAULT nextval('public.cheesystoreshop_origin_id_seq'::regclass);


--
-- Name: cheesystoreshop_product id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_product ALTER COLUMN id SET DEFAULT nextval('public.cheesystoreshop_product_id_seq'::regclass);


--
-- Name: cheesystoreshop_rating id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_rating ALTER COLUMN id SET DEFAULT nextval('public.cheesystoreshop_rating_id_seq'::regclass);


--
-- Name: contact_contactmessage id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.contact_contactmessage ALTER COLUMN id SET DEFAULT nextval('public.contact_contactmessage_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: django_summernote_attachment id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_summernote_attachment ALTER COLUMN id SET DEFAULT nextval('public.django_summernote_attachment_id_seq'::regclass);


--
-- Name: faq_faq id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.faq_faq ALTER COLUMN id SET DEFAULT nextval('public.faq_faq_id_seq'::regclass);


--
-- Name: profiles_userprofile id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.profiles_userprofile ALTER COLUMN id SET DEFAULT nextval('public.profiles_userprofile_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	christopherryan91@gmail.com	t	t	1
14	jonnydelaney91@gmail.com	t	t	14
15	jufyebuknu@gufum.com	t	t	15
16	diknoderke@gufum.com	t	t	16
17	dipomay476@dxice.com	t	t	17
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add email address	8	add_emailaddress
30	Can change email address	8	change_emailaddress
31	Can delete email address	8	delete_emailaddress
32	Can view email address	8	view_emailaddress
33	Can add email confirmation	9	add_emailconfirmation
34	Can change email confirmation	9	change_emailconfirmation
35	Can delete email confirmation	9	delete_emailconfirmation
36	Can view email confirmation	9	view_emailconfirmation
37	Can add social account	10	add_socialaccount
38	Can change social account	10	change_socialaccount
39	Can delete social account	10	delete_socialaccount
40	Can view social account	10	view_socialaccount
41	Can add social application	11	add_socialapp
42	Can change social application	11	change_socialapp
43	Can delete social application	11	delete_socialapp
44	Can view social application	11	view_socialapp
45	Can add social application token	12	add_socialtoken
46	Can change social application token	12	change_socialtoken
47	Can delete social application token	12	delete_socialtoken
48	Can view social application token	12	view_socialtoken
49	Can add product	13	add_product
50	Can change product	13	change_product
51	Can delete product	13	delete_product
52	Can view product	13	view_product
53	Can add category	14	add_category
54	Can change category	14	change_category
55	Can delete category	14	delete_category
56	Can view category	14	view_category
57	Can add cheese type	15	add_cheesetype
58	Can change cheese type	15	change_cheesetype
59	Can delete cheese type	15	delete_cheesetype
60	Can view cheese type	15	view_cheesetype
61	Can add origin	16	add_origin
62	Can change origin	16	change_origin
63	Can delete origin	16	delete_origin
64	Can view origin	16	view_origin
65	Can add order line item	17	add_orderlineitem
66	Can change order line item	17	change_orderlineitem
67	Can delete order line item	17	delete_orderlineitem
68	Can view order line item	17	view_orderlineitem
69	Can add order	18	add_order
70	Can change order	18	change_order
71	Can delete order	18	delete_order
72	Can view order	18	view_order
73	Can add user profile	19	add_userprofile
74	Can change user profile	19	change_userprofile
75	Can delete user profile	19	delete_userprofile
76	Can view user profile	19	view_userprofile
77	Can add post	20	add_post
78	Can change post	20	change_post
79	Can delete post	20	delete_post
80	Can view post	20	view_post
81	Can add comment	21	add_comment
82	Can change comment	21	change_comment
83	Can delete comment	21	delete_comment
84	Can view comment	21	view_comment
85	Can add attachment	22	add_attachment
86	Can change attachment	22	change_attachment
87	Can delete attachment	22	delete_attachment
88	Can view attachment	22	view_attachment
89	Can add rating	23	add_rating
90	Can change rating	23	change_rating
91	Can delete rating	23	delete_rating
92	Can view rating	23	view_rating
93	Can add contact message	24	add_contactmessage
94	Can change contact message	24	change_contactmessage
95	Can delete contact message	24	delete_contactmessage
96	Can view contact message	24	view_contactmessage
97	Can add faq	25	add_faq
98	Can change faq	25	change_faq
99	Can delete faq	25	delete_faq
100	Can view faq	25	view_faq
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
14	pbkdf2_sha256$260000$yd9O7PaTA8oKFlsC4b6ONx$VWlcDVQ0rH/EiPXeBgg/Iyl1SVNtvPT3oTgiCu343yQ=	2024-04-03 18:15:09.339694+00	f	jonnydelaney91@gmail.com			jonnydelaney91@gmail.com	f	t	2024-04-03 18:12:27.823894+00
15	pbkdf2_sha256$260000$tFSaIqVVRj43EcRstWB7vM$/7zsAOoZKgFgPSj6AtdCsKGWhT5yYp2lWBcl60xoBJI=	2024-04-09 11:54:55.731164+00	f	newuser123			jufyebuknu@gufum.com	f	t	2024-04-09 10:26:42.798451+00
16	pbkdf2_sha256$260000$NPWsryMX0cN89uQWSFfOUt$clMwfwxjTcXr57/hG9cVPoi/HNfCyTLiSA2JMl5pcJ8=	2024-04-10 21:28:48.479128+00	f	CheeseLover			diknoderke@gufum.com	f	t	2024-04-10 21:20:59.362006+00
17	pbkdf2_sha256$260000$NiDgczIq18SnHjGbzUlebC$sllC+biGclenddC2Kds/d21HLZAav4w8gNH3vrmDDrw=	2024-04-24 18:56:52.767585+00	f	assessor			dipomay476@dxice.com	f	t	2024-04-24 18:56:26.313248+00
1	pbkdf2_sha256$260000$cMiZeEEfOC2iSSpnKtBnxF$ZVYRLXxCjEC9bYcBikRq1rXq4f8KR/upCzRTCePD0yw=	2024-06-14 15:09:51.182468+00	t	chrisryan			christopherryan91@gmail.com	t	t	2024-02-17 14:36:19.982274+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: checkout_order; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.checkout_order (id, order_number, full_name, email, phone_number, country, postcode, town_or_city, street_address1, street_address2, county, date, delivery_cost, order_total, grand_total, original_bag, stripe_pid, user_profile_id) FROM stdin;
53	E5C25A50C5864F7392D2CC5EAB304BF7	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 13:05:26.891788+00	0.00	0.00	0.00	{"60": 2}	pi_3OxqjXHIGFnXzskj0m9i9xKB	3
93	EBC4371F8B4149E3BA543837AAF8F55E	Dik Derke	diknoderke@gufum.com	086 455 1831	AF	808404	Trash Town	123 Wheely Bin	Skip Lane	Garbageville	2024-04-10 21:25:06.333148+00	2.95	29.50	32.45	{"121": 5}	pi_3P48baHIGFnXzskj1WdHOZqt	16
94	DEDC6A3D3906497AB66638ECA536DB60	Test User	dipomay476@dxice.com	1234567890	IE	\N	Test	Test	\N	\N	2024-04-24 18:56:06.823277+00	0.77	7.65	8.42	{"95": 1}	pi_3P9AyjHIGFnXzskj1VMywTxK	\N
95	9C29BC05F78F42FBA014187449CECB85	test	pefis62888@losvtn.com	123456789	CL	test	test	test	\N	test	2024-05-14 09:31:44.1374+00	0.68	6.80	7.48	{"64": 1}	pi_3PGHhKHIGFnXzskj1wnzfhpT	\N
96	81A0446B3BAC4C5DB846ED7814663E4A	Jonathan Delaney	jonnydelaney91@gmail.com	0031619435382	IE	D6W H721	Dublin 6W	68 College Square	\N	Co. Dublin	2024-06-11 17:48:14.12564+00	1.00	9.99	10.99	{"39": 1}	pi_3PQYnNHIGFnXzskj1A4I151g	\N
97	4A32914554B54F26ABFE880E56612A22	chris ryan	christopherryan91@gmail.com	0838124469	IE	Dublin	Dublin	6 Peter Place	Off Charlemont Street	\N	2024-12-07 12:01:38.159298+00	1.60	16.00	17.60	{"43": 1}	pi_3QTMgBHIGFnXzskj0H1bTH4h	\N
100	C840CA88279D43D9ADAAA1546BDC66BD	chris ryan	christopherryan91@gmail.com	hfhfh	IE	ereirel	hfhfh	hfhfh	hfhfh	hfhfhf	2024-12-07 18:03:27.608125+00	0.79	7.90	8.69	{"32": 1}	pi_3QTSKVHIGFnXzskj0yI92ka2	\N
103	9DF926886AAB425898C797561DC393E6	chris ryan	christopherryan91@gmail.com	hgkk	IE	jhg	hkh	hkg	hk	hkj	2024-12-07 18:19:31.603436+00	0.55	5.50	6.05	{"40": 1}	pi_3QTSakHIGFnXzskj1B3Hs1tr	\N
43	78F21A40688F492ABBC997A41C5768C3	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 12:19:12.025685+00	0.43	4.30	4.73	{"3": 1}	pi_3Oxq0oHIGFnXzskj1pBngkBA	3
39	54FA54D1E116429CB0B8BDB9D31B5579	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 11:56:03.992522+00	0.00	0.00	0.00	{"11": 1}	pi_3OxpeOHIGFnXzskj1O8lbCtv	3
98	8282262C0E444DF0B7199AB59475502A	chris ryan	christopherryan91@gmail.com	0838124469	IE	Dublin 2	Dublin	6 Suq Maa Road	Dublin	Dublin	2024-12-07 16:04:27.739924+00	0.90	9.00	9.90	{"63": 1}	pi_3QTQTqHIGFnXzskj0CJhy5K5	\N
64	8CABE4E3C40D4DF08E393F4F399F1775	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 16:01:48.829981+00	0.52	5.15	5.67	{"58": 1}	pi_3OxtRJHIGFnXzskj1qKFWfYG	3
101	4F897E436866416BBB1A4BCFC8F69CC5	chris ryan	christopherryan91@gmail.com	hhh	HT	hhh	hhh	hhh	hhh	hhh	2024-12-07 18:10:30.732464+00	0.67	6.70	7.37	{"36": 1}	pi_3QTSRdHIGFnXzskj0lO60rPR	\N
71	8FFEB66859B0451D94BACFBC064AD8EE	Chris Ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 18:15:01.965229+00	0.00	0.00	0.00	{"9": 2}	pi_3OxvYzHIGFnXzskj1F3uShhC	3
104	FBF2142937404214BEF4810A7AF7467E	chri	christopherryan91@gmail.com	huuhu	IE	hoho	hio	hiohiohio	ioi	ioji	2024-12-13 20:11:04.178143+00	0.66	6.60	7.26	{"41": 1}	pi_3QVfByHIGFnXzskj1LqD9WEX	\N
80	31ABB83C97B24AAFB7208FAA1FB824E2	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-04-04 16:36:31.785162+00	0.79	7.90	8.69	{"32": 1}	pi_3P1tGrHIGFnXzskj0gmY39Ge	3
68	4E2ACBF665D04E12AF9196D6A1815A7D	peter collins	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 16:36:02.619215+00	0.49	4.90	5.39	{"91": 1}	pi_3Oxu1FHIGFnXzskj1QdDtTkn	3
73	1B9A478F3F394B0D931B37399595FDB6	Chris Ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-26 16:38:02.333211+00	0.52	5.15	5.67	{"58": 1}	pi_3Oyd0SHIGFnXzskj195VaVSg	3
77	05BD6DD570064085A477DD18D49403B7	Joe	joehampson@ymail.com	38	GH	Dublin 1	Dublin	Teach Mhuire	Gardiner st	Dublin	2024-04-03 12:44:39.388106+00	0.00	0.00	0.00	{"10": 1}	pi_3P1TAYHIGFnXzskj1K1O7Ebm	\N
50	02923022027846FD9C34038FF9F87AFC	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 12:53:25.349371+00	0.00	0.00	0.00	{"12": 1}	pi_3OxqW0HIGFnXzskj1maP1DNx	3
42	B0C40A9E61DB4E6386251581928B65C8	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 12:17:24.125582+00	0.00	0.00	0.00	{"12": 1}	pi_3Oxpz7HIGFnXzskj0S0LHrYU	3
82	C3BDF758F26F4D9F82D2A1A21D6AE7F0	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-04-05 20:13:07.876151+00	0.43	4.30	4.73	{"37": 1}	pi_3P2J7XHIGFnXzskj1yCw5xCU	3
60	022273D34DE34114A6556D317D63ACCB	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-03-24 15:43:08.721411+00	0.00	0.00	0.00	{"109": 1}	pi_3OxtCAHIGFnXzskj1CdR36df	3
79	186BF85ACAE545578C32CF4905C8C262	Jonathan Delaney	jonnydelaney91@gmail.com	0031619435381	NL	1012 KK	Amsterdam	Rokin	49	\N	2024-04-03 18:07:09.36725+00	0.00	0.00	0.00	{"25": 2}	pi_3P1YBmHIGFnXzskj1OFP2Eiw	\N
83	C942A37B8C3E48C4AD125B98ABFF5ADD	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-04-06 17:25:35.39774+00	0.43	4.30	4.73	{"37": 1}	pi_3P2czEHIGFnXzskj0BKdnEek	3
81	27C9EB34A4644B50A45DC7C657DD6E4C	chris ryan	christopherryan91@gmail.com	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	2024-04-05 08:53:18.563827+00	0.00	0.00	0.00	{"13": 2}	pi_3P28V5HIGFnXzskj1Ls4TsXA	3
99	E911BDEDC70342E397149E28003FFA68	christopher ryan	christopherryan91@gmail.com	424242424	IE	efvefvirel	efvfv	44343434	wffe	evvev	2024-12-07 17:13:19.580134+00	3.64	36.40	40.04	{"40": 4, "50": 3}	pi_3QTRQ7HIGFnXzskj1wkiSJ7o	\N
102	066DBB703EE541EF976332A133124A17	chriss ryan	christopherryan91@gmail.com	r	IE	k	33rer	j	g	hg	2024-12-07 18:16:48.003779+00	0.43	4.30	4.73	{"3": 1}	pi_3QTSXAHIGFnXzskj0Yl0Jr5a	\N
105	6BBE9D517C41487C906EA90F947AEBE6	chris ryan	christopherryan91@gmail.com	757575757	IE	iib	iiuui	ddx	iggiu	iui	2024-12-13 20:17:00.980109+00	0.79	7.90	8.69	{"32": 1}	pi_3QVfHjHIGFnXzskj01A9RVdd	\N
\.


--
-- Data for Name: checkout_orderlineitem; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.checkout_orderlineitem (id, quantity, lineitem_total, order_id, product_id) FROM stdin;
74	5	29.50	93	121
75	1	7.65	94	95
76	1	6.80	95	64
77	1	9.99	96	39
78	1	16.00	97	43
79	1	9.00	98	63
80	4	22.00	99	40
81	3	14.40	99	50
82	1	7.90	100	32
83	1	6.70	101	36
84	1	4.30	102	3
85	1	5.50	103	40
86	1	6.60	104	41
87	1	7.90	105	32
36	1	4.30	43	3
44	1	5.15	64	58
47	1	4.90	68	91
50	1	5.15	73	58
57	1	7.90	80	32
59	1	4.30	82	37
60	1	4.30	83	37
\.


--
-- Data for Name: cheesyblog_comment; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesyblog_comment (id, body, created_on, approved, post_id, user_id) FROM stdin;
52	so have mine! it's amazing	2024-04-09 11:51:34.747272+00	t	11	1
50	Good to know! :)	2024-04-09 11:50:17.521551+00	t	13	15
54	Sorry, I deleted my previous comment accidently! Slippy finger :/	2024-04-09 11:58:48.171381+00	t	11	15
56	Very good post. You learn something new everyday :)	2024-04-10 21:26:33.719311+00	f	13	16
\.


--
-- Data for Name: cheesyblog_post; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesyblog_post (id, title, slug, updated_on, content, featured_image, excerpt, created_on, status, author_id, keywords) FROM stdin;
2	Introduction to Cheesy Delights	introduction-to-cheesy-delights	2024-04-11 08:24:45.015022+00	<p><font color="#000000" style="background-color: rgb(255, 255, 255);"><font style=""><span style="font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;">Welcome to our cheesy blog! In this post, we'll introduce you to the world of cheesy delights, from gooey grilled cheese sandwiches to savory cheese platters. Cheese has been a beloved culinary staple for centuries, captivating taste buds with its rich flavors and creamy textures. Whether you're a seasoned cheese enthusiast or just beginning to explore the world of fromage, there's something here for everyone.\r\n</span><br></font><span style="font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;">Join us as we embark on a delicious journey through the diverse and delightful world of cheese. From artisanal cheeses handcrafted by skilled cheesemakers to mass-produced favorites found in supermarkets worldwide, there's no shortage of cheesy goodness to discover. Get ready to indulge your senses and expand your palate with our mouthwatering cheesy adventures!</span></font></p><p><span style="color: rgb(236, 236, 236); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(33, 33, 33);"><br></span></p><p><span style="color: rgb(236, 236, 236); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(33, 33, 33);"><br></span></p><p><span style="color: rgb(236, 236, 236); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(33, 33, 33);"><br></span></p><p><span style="color: rgb(236, 236, 236); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(33, 33, 33);"><br></span></p><p><span style="color: rgb(236, 236, 236); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(33, 33, 33);"><br></span><br></p>	glog9_rKQenEl.webp	Welcome to our cheesy blog! Explore the world of cheesy delights with us.	2024-03-10 11:09:35.108297+00	1	1	
3	The Art of Cheese Making	the-art-of-cheese-making	2024-04-11 08:25:50.091261+00	<p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">Learn about the art and science behind cheese making. From milk curdling to aging, discover the secrets to crafting delicious cheeses at home. Cheese making is a time-honored tradition that dates back thousands of years, with each culture putting its own unique spin on the craft. Whether you're interested in making soft, creamy cheeses like Brie or hard, aged cheeses like Cheddar, we'll guide you through the process step by step.</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">Join us as we explore the fascinating world of cheese making, from the humble beginnings of milk and rennet to the final aging process that gives each cheese its distinctive flavor profile. With the right ingredients, equipment, and know-how, you too can become a master cheesemaker in your own kitchen. Get ready to roll up your sleeves and unleash your inner cheese artisan!</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">From beginner-friendly recipes for fresh cheeses like mozzarella to advanced techniques for aged cheeses like Gouda, our blog is your go-to resource for all things cheese making. Whether you're a seasoned pro or a curious novice, we'll provide you with the knowledge and inspiration you need to create delicious cheeses right at home. So grab your apron and let's get started on your cheese making journey!</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><a href="https://www.youtube.com/watch?v=wxm8jTzU_8o" target="_blank" rel="noopener"><u>Excellent video regarding the production of cheese.</u></a><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p>	ezgif-2-2886487179_uaSyshr.webp	Discover the art and science of cheese making in our latest post...	2024-03-10 11:10:57.142741+00	1	1	Cheese making, cheese production, industrial produced dairy products
6	The Health Benefits of Cheese	the-health-benefits-of-cheese	2024-04-11 08:26:34.193341+00	<p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 1.25em; margin-bottom: 1.25em; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">Prepare to be pleasantly surprised as we debunk the myth that cheese is solely a guilty pleasure. While it's often perceived as indulgent, cheese actually boasts an array of health benefits that may come as a delightful revelation. Beyond its delicious flavor and creamy texture, cheese is packed with essential nutrients that contribute to overall well-being. From calcium and protein to probiotics, cheese offers a nutritious punch that may just change the way you view this beloved dairy product.</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 1.25em; margin-bottom: 1.25em; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">In our comprehensive exploration of the health benefits of cheese, we'll delve into the science behind its nutritional value and its potential impact on various aspects of health. Discover how cheese can support bone health with its calcium content, aid in muscle repair and growth with its protein content, and promote gut health with its probiotic properties. Additionally, we'll explore how different varieties of cheese stack up in terms of nutritional composition, helping you make informed choices that align with your dietary preferences and health goals. So join us as we uncover the surprising health benefits of cheese and embark on a journey to rediscover this versatile and nourishing food staple.</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 1.25em; margin-bottom: 1.25em; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><a href="https://www.irishexaminer.com/lifestyle/healthandwellbeing/arid-41089510.html" target="_blank"><u>Article from the Irish Examiner regarding health benefits of cheese</u></a><br></p>	blog7_8reeHa6.webp	Discover the surprising health benefits of cheese in our latest post. Prepare to be pleasantly surprised as we debunk the myth that cheese is solely a guilty pleasure, and explore its nutritional value in depth...	2024-03-10 11:24:58.957628+00	1	1	Health, Wellbeing
10	The History of Cheese	the-history-of-cheese	2024-04-11 08:13:19.059674+00	<p>Take a fascinating journey through time as we delve into the rich and storied history of cheese, from its humble beginnings in ancient civilizations to its status as a beloved culinary staple in modern times. Cheese has played a central role in human culture for thousands of years, with each region of the world contributing its own unique traditions, techniques, and flavors to the rich tapestry of cheese-making.</p><p><br></p><p>In this enlightening exploration, we'll uncover the origins of cheese-making, the evolution of cheese production methods, and the cultural significance of cheese throughout history. From the cheese-loving Romans to the medieval monks who perfected the art of cheese-making, the story of cheese is as diverse and intriguing as the cheeses themselves. So grab a wedge of your favorite cheese, settle in, and prepare to be transported through time as we uncover the fascinating history of cheese.</p><p><br></p><p><a href="https://www.youtube.com/watch?v=uQxUHCeU5xY" target="_blank" rel="noopener"><u>Read this interesting pose from the Cheese Museum for more information!</u></a><br></p>	blog2_1.webp	In this enlightening exploration, we'll uncover the origins of cheese-making...	2024-03-10 11:33:22.669031+00	1	1	Cheese History, Cheese Museum
7	Cheese Festivals Around the Globe	cheese-festivals-around-the-globe	2024-04-11 08:18:38.302329+00	<p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">Prepare to embark on a cheese lover's dream journey as we explore the enchanting world of cheese festivals happening around the globe. These festivals are not just gatherings; they are celebrations of culture, tradition, and, of course, the beloved cheese itself. From the picturesque countryside of France to the bustling streets of the United States, cheese enthusiasts from all walks of life come together to revel in the glory of their favorite dairy delight.</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000">At these festivals, visitors can expect an array of activities, from cheese tastings featuring local and international varieties to cheese-making workshops where participants can learn the craft from master cheesemakers. The atmosphere is nothing short of magical, with live music, artisanal food stalls, and, of course, plenty of cheese-themed merchandise to take home as souvenirs. So pack your bags, sharpen your cheese knives, and get ready to experience the ultimate cheese lover's paradise at these extraordinary festivals!</font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><a href="https://gff.co.uk/for-producers/world-cheese-awards/" target="_blank" rel="noopener"><u>View website for the World Cheese Awards</u></a><span style="background-color: rgb(255, 255, 255);"><font color="#000000"><br></font></span></p>	blog6_rX0fwpa.webp	Prepare to embark on a cheese lover's dream journey as we explore the enchanting world of cheese festivals happening around the globe...	2024-03-10 11:27:02.767874+00	1	1	Cheese Festival, Cheese Celebration
11	Cheeseboard Styling Tips	cheeseboard-styling-tips	2024-04-11 08:13:09.577898+00	<p>Transform your cheeseboard from ordinary to extraordinary with our expert styling tips that will take your entertaining game to the next level. A well-curated cheeseboard is not just a feast for the taste buds; it's also a feast for the eyes. With the right combination of cheeses, accompaniments, and presentation techniques, you can create a visually stunning centerpiece that will wow your guests and leave a lasting impression.</p><p><br></p><p>In this comprehensive guide, we'll share insider secrets on everything from selecting the perfect cheeses to arranging them on the board in an aesthetically pleasing way. From balancing flavors and textures to adding garnishes like fresh herbs, fruits, and nuts, you'll learn how to create cheeseboards that are as beautiful as they are delicious. Whether you're hosting a casual gathering with friends or a formal dinner party, these styling tips will ensure that your cheeseboard is the star of the show.</p><p><br></p><p><a href="https://www.youtube.com/watch?v=uQxUHCeU5xY" target="_blank" rel="noopener"><u>View this video from EasyPeasyKitchen for more!</u></a></p>	blog3_1.webp	In this comprehensive guide, we'll share insider secrets on everything from selecting the perfect cheeses to arranging them on the board in an aesthetically pleasing way...	2024-03-10 11:35:43.849413+00	1	1	Cheeseboard, EasyPeasyKitchen
8	Creative Cheese Recipes	creative-cheese-recipes	2024-04-11 08:14:23.135185+00	<p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);">Get ready to unleash your inner culinary artist with our curated collection of innovative cheese recipes that are sure to tantalize your taste buds and impress your guests. From savory dishes like cheesy pasta bakes and gourmet grilled cheese sandwiches to decadent desserts such as cheesecake and cheese soufflés, the possibilities are endless when it comes to cooking with cheese. Whether you're a novice in the kitchen or a seasoned chef, these recipes offer something for everyone to enjoy.</font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);"><br></font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);">With our step-by-step instructions and helpful tips, you'll discover just how versatile and delicious cheese can be as an ingredient in both savory and sweet dishes. Experiment with different cheese varieties, textures, and flavor profiles to create unique and memorable meals that will have your friends and family coming back for seconds. So dust off your apron, fire up the stove, and let your creativity run wild as you explore the wonderful world of cheese-inspired cuisine!</font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);"><br></font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><a href="https://www.pinterest.com/meltyway/creative-uses-of-cheese/" target="_blank"><u>View this Pinterest thread for creative cheese ideas!</u></a><font color="#000000" style="background-color: rgb(255, 255, 255);"><br></font></p>	blog5_1.webp	With our step-by-step instructions and helpful tips, you'll discover just how versatile and delicious cheese can be as an ingredient in both savory and sweet dishes...	2024-03-10 11:29:39.027419+00	1	1	Food art, Creativity
13	The Art of Cheese	the-art-of-cheese-a-journey-through-flavor-and-tradition	2024-04-11 08:13:07.347448+00	<p>In a world where culinary arts continually evolve, cheese stands out as a testament to the enduring legacy of traditional food craftsmanship. This blog post embarks on a flavorful journey through the rich landscapes of cheese, exploring its diverse varieties, the secrets behind its production, and the ways it captivates our senses and traditions.\r\n\r\nCheese's history stretches back thousands of years, a serendipitous discovery that has become a cornerstone of many cultures' cuisines. </p><p><br></p><p>From the pastoral hills of Switzerland to the sun-kissed fields of Italy, each region has nurtured its unique cheese, contributing to an astounding variety of flavors and textures. This diversity not only speaks to the ingenuity of cheese makers but also to the rich cultural tapestries of the societies that cherish them.\r\n\r\nThe world of cheese is as vast as it is delightful. Soft, creamy Brie; sharp, aged Cheddar; tangy, crumbly Feta—each variety offers a unique flavor profile and texture that can turn any meal into an occasion. Tasting cheese is akin to a sensory journey, with each bite revealing notes of grass, nuts, fruit, or even wood, depending on the cheese's aging process and the diet of the animals whose milk produced it.</p><p><br></p>\r\n\r\n<p><a href="https://sheridanscheesemongers.com/sheridans-annual-irish-food-festival/" target="_blank" rel="noopener"><u style="">More information about Sheridan's Cheese Festival, 2023</u></a><br></p>	blog1_1.webp	In a world where culinary arts continually evolve, cheese stands out as a testament to the enduring	2024-03-17 14:48:23.353223+00	1	1	Cheese, Cheesemonger
4	Cheese Pairing Guide	cheese-pairing-guide	2024-04-11 08:23:18.459843+00	<p><font face="Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji" color="#000000"><span style="font-size: 16px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);">"Welcome to our cheese pairing guide, where we'll help you master the art of pairing cheeses with the perfect accompaniments. Whether you're hosting a dinner party or simply indulging in a cheese platter for one, understanding how to pair cheeses with complementary flavors can elevate your culinary experience to new heights. From wines and beers to fruits, nuts, and condiments, we'll provide you with expert tips and tricks to create harmonious flavor combinations that tantalize your taste buds."</span></font></p><p><font face="Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji" color="#000000"><span style="font-size: 16px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);"><br></span></font></p><p><font face="Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji" color="#000000"><span style="font-size: 16px; white-space-collapse: preserve;"><span style="background-color: rgb(255, 255, 255);">"Join us as we explore the intricacies of cheese pairing, from classic combinations like Brie and Chardonnay to unexpected pairings that surprise and delight. With our comprehensive guide, you'll learn how to balance flavors, textures, and ar</span>omas to create cheese platters that are as beautiful as they are delicious. So grab your favorite cheeses and get ready to embark on a flavor-packed journey through the wonderful world of cheese pairing!"</span></font></p><p><font face="Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji" color="#000000"><span style="font-size: 16px; white-space-collapse: preserve;"><br></span></font></p><p><a href="https://www.youtube.com/watch?v=rpkNXTjBdCg" target="_blank" rel="noopener"><u>Excellent video from Chef Tips on how to pair cheeses!</u></a><font face="Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji" color="#000000"><span style="font-size: 16px; white-space-collapse: preserve;"><br></span></font></p>	blogblog10_Uc8H4Nj.webp	Elevate your cheese platters with our expert pairing guide....	2024-03-10 11:20:50.64663+00	1	1	Cheese pairing, pairing guides
5	Exploring International Cheeses	exploring-international-cheeses	2024-04-11 08:26:21.935204+00	<p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);">Embark on a gastronomic journey around the globe as we explore the diverse and delicious world of international cheeses. From the creamy delights of French Brie to the sharp tang of Italian Parmigiano-Reggiano, each cheese tells a unique story of its origin, culture, and traditions. Join us as we delve into the rich history and complex flavors of cheeses from different corners of the world, uncovering the secrets behind their production and the rituals that surround their consumption.</font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);"><br></font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);">With our comprehensive guide to international cheeses, you'll gain a deeper appreciation for the artistry and craftsmanship that goes into creating these culinary treasures. Whether you're a seasoned cheese enthusiast or a curious newcomer, there's something here for everyone to enjoy. So prepare your taste buds for a global adventure, and let's embark on a cheesy journey that transcends borders and boundaries!</font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><font color="#000000" style="background-color: rgb(255, 255, 255);"><br></font></p><p style="border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;"><a href="https://wbcheese.com/" target="_blank" rel="noopener"><u>View to website for World Cheese</u></a><font color="#000000" style="background-color: rgb(255, 255, 255);"><br></font></p>	blog8_V03Unjq.webp	ravel the world through the taste of international cheeses in our latest post.	2024-03-10 11:22:13.387471+00	1	1	World Cheese, International Cheese
\.


--
-- Data for Name: cheesystoreshop_category; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesystoreshop_category (id, name, friendly_name) FROM stdin;
3	new_arrival	New Arrivals
1	cheeses	Cheeses
2	otherproducts	Other Products
\.


--
-- Data for Name: cheesystoreshop_cheesetype; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesystoreshop_cheesetype (id, name, friendly_name) FROM stdin;
1	bluecheese	Blue Cheese
2	firmcheese	Firm Cheese
3	hardcheese	Hard Cheese
4	softcheese	Soft Cheese
5	creamcheese	Cream Cheese
6	goatscheese	Goats Cheese
7	bakingcheese	Baking Cheese
8	cracker	Cracker
9	butter	Butter
\.


--
-- Data for Name: cheesystoreshop_origin; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesystoreshop_origin (id, name, friendly_name) FROM stdin;
1	Ireland	Ireland
3	France	France
4	Holland	Holland
5	Italy	Italy
6	Spain	Spain
7	Switzerland	Switzerland
8	Greece	Greece
2	United-Kingdom	United Kingdom
\.


--
-- Data for Name: cheesystoreshop_product; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesystoreshop_product (id, sku, name, description, price, rating, image_url, image, category_id, cheesetype_id, origin_id, in_stock) FROM stdin;
39	pp5003960062	Durrus	Semi-soft, washed-rind Irish Farmhouse cheese with a delicately pungent flavour. The aroma is one of hay, undergrowth and wet soil, in short it smells of the hillside in Coomkeen. The flavour is long, round and earthy, a flavour which is uniquely and unmistakably Durrus.	9.99	3.80	https://sheridanscheesemongers.com/wp-content/uploads/2023/02/durrus_farmhousecheese_sq.jpg	Durrus.webp	1	4	1	t
40	pp5003960682	Durrus Og 225g	Durrus Og is a semi-soft, washed-rind Irish Farmhouse cheese with a mild and creamy flavour. The orangey pink washed rind gives the cheese mild earthy flavour which pairs perfectly with the buttery inside. This cheese makes a great alternative to Reblochon in recipes like Tartiflette.	5.50	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/durrus-og.jpg	DurrusOg225g.webp	1	4	1	t
41	pp5003960775	Dutch Farmhouse Sheep Gouda 180g	A rich and sweet sheep milk Gouda with a creamy texture. A fine addition to a cheese board.	6.60	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/5391521682185_T1-2-640x640.png	DutchFarmhouseSheepGouda180g.png	1	2	4	t
32	pp5003780391	Cravero Parmigiano Reggiano 180g	Fruity, nutty, and deeply savoury with great texture and slight crunch, our Parmigiano Reggiano comes exclusively from Giorgio Cravero, friend and trusted affineur. We think this is the highest quality Parmigiano Reggiano around.	7.90	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/parmesan2_square.jpg	CraveroParmigianoReggiano180g.webp	1	3	5	t
37	pp5003950574	Millers Damsel Charcoal Wafer.	Dark and crisp wafers. Hexagonal wafers made with stone-ground flour, grown and milled in England. Perfectly paired with soft or hard cheeses.	4.30	2.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/5014908003310_T9_Miller_s_Damsel_Crackers_125g-640x640.png	5014908003310_T9_Miller_s_Damsel_Crackers_125g-640x640.png	2	8	2	t
35	pp5003861402	Crottin De Chavignol 60g	Crottin de Chavignol is subtle, slightly earthy and nutty. The texture is crumbly and the mould on the rind matures into a bluish colour. Great on a cheese board and/or once a little older and on the firmer side, shaved onto a salad.	5.50	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/0-1-640x426.jpge	CrottinDeChavignol60g.webp	1	6	3	t
36	pp5003910638	Crozier Blue	Crozier has a rich, full, well rounded flavour. It is saltier and richer tasting and like its sibling cheese, has no blue sting or harshness to it!	6.70	4.60	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/cashel_crozier_blue-1.jpg	CrozierBlue.webp	1	1	3	t
43	pp5003990746	Epoisses Marc de Bourgogne 250g	This very special cheese is ripened with Marc de Bourgogne, it has a soft paste and a strong, pungent flavour. Made in Burgundy, France with cow’s milk. The award of the AOC to Epoisses in 1991 is testament to the success of their endeavors. This is a wonderful cheese, its bright orange rind has a distinctive farmyard aroma that is the perfect match for the soft, salty paste beneath. The flavour is extraordinary, somehow managing to be strong, sweet and milky all at the same time.	16.00	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/11/Eppoise-berthaut_square.jpg	EpoissesMarcdeBourgogne250g.webp	1	4	3	t
46	pp5004310089	Flocon de Savoie, 120g	Flocon de Savoie has a mild, soft paste with flavours of hazelnut and fresh cream. The soft white interior is encased by a fine white satiny rind.	4.30	4.50	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/front_fr.13.full_.jpg	FlocondeSavoie120g.webp	1	4	3	t
47	pp5004610254	Fourme dAmbert AOC 290g	With its delicate flavor, its fragrant notes with aromas of undergrowth and a very soft and round taste, Fourme dAmbert stands out from all blue cheeses. The sweetness of the Fourme d’Ambert allows it to adapt to all the key moments of the meal; on a beautiful cheese platter but can also be combined with many savory or sweet dishes.	7.77	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/fourme-dambert-web-640x640.jpg	FourmedAmbertAOC290g.webp	1	4	3	t
48	pp5004650050	Fromage Frais Raspberry	Isigny Ste. Mère fromage frais is a rich fresh cheese, similar to yogurt, that comes in three flavours – caramelized apple, raspberry, or strawberry. 	2.30	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/3254550048570_T5_Isigny_Ste_MSre_Fromage_Frais_Raspberry_150g-640x640.png	FromageFraiRaspberry.png	1	4	3	t
49	pp5004821375	Fromage Frais Strawberry	Isigny Ste. Mère fromage frais is a rich fresh cheese, similar to yogurt, that comes in three flavours – caramelized apple, raspberry, or strawberry.	2.30	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/3254550048587_T5_Isigny_Ste_MSre_Fromage_Frais_Strawberry_150g-640x640.png	FromageFraisStrawberry.png	1	4	3	t
50	pp5004900522	Knockanore Smoked 150g	Traditional smoked cheddar cheese with a great cheddar tang complimented by savoury smoky flavour.	4.80	4.60	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/smoked_knocknamore_square.jpg	smoked_knocknamore_square.jpg	1	2	1	t
51	pp5004910158	Garofalo Buffalo Bocconcini 250g	Made with a mixture of cow and buffalo milk, this mild cheese is slightly more buttery and sweet flavour compared regular mozzarella. Beautifully creamy, it works wonderfully in salads, wrapped in prosciutto, and on your pizzas, of course.	7.90	3.80	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/0-2.jpg	GarofaloBuffaloBocconcini250g.webp	1	4	5	t
52	pp5004910477	Garofalo Burrata 125g	A soft shell wrapped around a creamy centre delivers a contrast of texture and a rich consistency particular to this product. When cut open, the creamy interior flows from the centre. Mild, smooth and fresh, Burrata is a customer favourite due to its unique profile and delicate palate. Can be eaten on its own or a great addition to salads, charcuterie or grilled vegetables.	4.50	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/burrata.jpg	GarofaloBurrata125g.webp	1	4	5	t
53	pp5004940703	Goat Gouda Mature 200g	With a delicious nutty flavour with notes of toffee and roasted nuts. Strong in flavour with a long finish, perfectly complemented by its crystalline crunch. Made in Holland.	8.80	3.70	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/2058840000000_T1_Sheridans_Cheesemongers_Goat_Gouda_Mature_200g.png	GoatGoudaMature200g.png	1	2	4	t
54	pp5004991006	Gorgonzola 200g	Rich, creamy and beautifully marbled. Our Gorgonzola is semi-firm in texture, and has the kind of flavour you simply dont find in standard productions of this oft-maligned cheese.	7.40	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/gorgonzola-web-640x640.jpg	Gorgonzola200g.webp	1	4	5	t
56	pp5005000046	Gubbeen	Gubbeen is a semi-firm washed-rind with a medium nutty flavour. This is the mini version that comes as a single unit, not cut. Made with cows milk by the Ferguson family in West Cork.	5.99	3.90	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/gubbeen_square-2.jpg	Gubbeen.webp	1	2	1	t
57	pp5005070254	Gubbeen Smoked Mini 390g	This oak smoked version of Gubbeen cheese is mild and firm with a waxed rind. The smoke adds a great meaty flavour to the creamy, buttery, earthy wheels of Gubbeen.	12.30	4.70	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/oak_smoked_gubbeen-e1542387208335.jpg	GubbeenSmokedMini390g.webp	1	2	1	t
58	pp5005071145	Halloumi 250g	Briny, tangy, and a bit milky in flavour this cheese has a springy texture perfect for the grill or frying pan.	5.15	3.30	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/Halloumi-1-640x426.jpg	Halloumi250g.webp	1	2	8	t
59	pp5005140282	Hegartys Cheddar 200g	Flavours of this great Irish cheddar range depending on season and age. Wheels are frequently nutty and relatively mild, but still possess that essential cheddar tang.  Young wheels can show more lactic, grassy and fresh citrusy flavours. Hegartys Cheddar has a firm texture but maintains a nice balanced creaminess making it a favourite in the Irish cheese family.	6.95	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/sherdians_26101802454-e1542386135982.jpg	HegartysCheddar200g.webp	1	2	1	t
55	pp5004991162	Gruyere 6 months	Gruyère has a nutty flavour with hints of ripe orchard fruits such as apples and pears. The initial fruitiness gives way to more robust, beefy aromas. Our Gruyère tends to have a more pungent and savoury flavour than its close French relation Comté.	18.00	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/2058844000000_T1.png	Gruyere6months.png	1	2	3	t
61	pp5005210241	Italian Cow Mozzarella 125g	Valcolatte Mozzarella Cows milk is produced with 100% Italian milk and lactic ferments.	2.50	4.50	https://sheridanscheesemongers.com/wp-content/uploads/2023/09/images-4.jpg	ItalianCowMozzarella125g.webp	1	4	5	t
62	pp5005280104	Italian Ricotta 250g	An Italian Ricotta from Caseificio Valcolatte is produced only with 100% Italian milk.	3.25	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/06/RICOTTA-NEW.jpg	ItalianRicotta250g.webp	1	4	5	t
63	pp5005310360	Jumi Emmentaler 200g	Should you ask us, its well worth the wait! The unique character of this old Emmentaler is an interplay of texture, flavour and acidity developed in the maturation process. During this time, around the 13 month mark, protein crystals begin to form giving the cheese lovely crunchy bits. This is a stand out cheese and unlike any other classic Emmental youve ever had!	9.00	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/10/emmentaler-old-web-640x640.jpg	JumiEmmentaler200g.webp	1	3	7	t
64	pp5005330595	Jumi Schlossberger 200G	This cave matured Emmental has been aged for approx. 14 months and presents itself as a lightly salty, nutty character, perfect for a cheeseboard or fondue as recommended by Jumi.	6.80	4.90	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/jumi-640x641.jpg	JumiSchlossberger200G.webp	1	3	7	t
65	pp5005330596	Killeen Cumin 200g	Dutch-born Marion Roeleveld has been making Killeens cheese at the Killeen Millhouse outside Portumna since 2005. Before coming to Ireland Marion trained in cheesemaking in her native Netherlands. In-depth formal training of this sort is rare amongst Irish farmhouse cheesemakers and Marion’s technical expertise enabled her to develop cheeses for a number of different producers.	6.40	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/killeen_cumin_square.jpg	KilleenCumin200g.webp	1	3	4	t
66	pp5005430914	Killeen Fenugreek 200g	Gouda style goats cheese with a fresh, clean milky flavour accented by fenugreek seeds throughout the paste. The addition of fenugreek imparts a mild walnut flavour and additional pleasing texture.	7.60	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/killeen_fenugreek_square-1.jpg	KilleenFenugreek200g.webp	1	6	4	t
67	pp5005430944	Killeen Goat	Killeen goats is a gouda cheese. The natural orange-beige rind is covered in a thin layer of breathable plastic, whilst the paste is brilliant white. At three months the flavour is fresh, clean and milky, with a very slight lactic note in the finish. The cheese develops more fruitiness as it ages up to five months, and then gradually turns nutty.	12.99	4.50	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/Killeen_plain_square.jpg	KilleenGoat.webp	1	6	1	t
68	pp5005510265	Knockanore Red Cheddar 150g	Mild, sweet and creamy classic farmhouse cheddar.	4.80	4.70	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/5392000050914_T9_Knockanore_Red_Cheddar_150g-640x640.png	KnockanoreRedCheddar150g.png	1	3	1	t
70	pp5005520205	Knockanore White Cheddar 150g	Mild, sweet and creamy classic farmhouse cheddar.	4.80	4.20	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/5392000050907_T1_Knockanore_White_Cheddar_150g-640x640.png	KnockanoreWhiteCheddar150g.png	1	3	1	t
71	pp5005630545	Langres 200g	Langres has a powerful, penetrating aroma which belies the mild flavour of the cheese itself. The firm, yet supple paste is creamy and slightly salty, whilst the orange rind lends a pungent farmyard note. The cheese grows firmer with age but is more lively when young.	8.00	4.30	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/langres-scaled-640x640.jpg	Langres200g.webp	1	4	3	t
72	pp5005630605	Manchego Anejo 150g	Aged Manchego has a rich, slightly acidic flavour with subtle aromas of nuts and dried hay. The rind is a rich chestnut colour and the interior is flaky and dense.	6.00	4.60	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/mancego_mature_square.jpg	ManchegoAnejo150g.webp	1	3	6	t
73	pp5005630637	Manchego Semi Curado (6 month)	A quintessential Spanish cheese; salty, nutty, lightly piquant and mild lactic quality. Perfect for any cheeseboard or recipes.	6.90	4.70	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/5391521681379_T1_Sheridans_Cheesemongers_Manchego_Semi_Curado_180g.png	ManchegoSemiCurado(6month).png	1	3	6	t
74	pp5005630638	Meabh Rua 200g	Newest member of the Sheridans Cheese line up! 2 month old 5 kg Carbery Red Cheddar blocks are aged in our maturing rooms for 6 weeks. The blocks are regularly washed forming a natural rind that develops the complex savory flavour of the cheese.	4.60	4.20	https://sheridanscheesemongers.com/wp-content/uploads/2023/05/maeb-rua-SMALL-640x640.jpg	MeabhRua200g.webp	1	3	1	t
75	pp5005650677	Mikes Fancy Cheese Young Buck	Stilton style cheese made in Northern Ireland. The flavour is both fruity and savory with a touch of blue cheese spiciness and lightly crumbly texture.	10.00	4.40	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/youngbuck.jpg	MikesFancyCheeseYoungBuck.webp	1	3	1	t
77	pp5005740430	Mimolette 220g	Mimolette is fruity cheese with earthy, hazelnut notes that deepen with age. The cheese is iconic for its small round shape, vibrant orange paste and craggy rind texture.	9.80	4.70	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/mimolet-web-640x640.jpg	Mimolette220g.webp	1	4	3	t
78	pp5005740561	Mini French Goat Log with Truffle 100g	Delicate and mild fresh goats milk cheese with an infusion of truffle.	3.80	4.60	https://sheridanscheesemongers.com/wp-content/uploads/2023/11/3369640038833_T70.png	MiniFrenchGoatLogwithruffle100g.png	1	6	3	t
79	pp5005740634	Mini Goat Log 150g	A miniature goat log with smooth texture and mild, slightly piquant, citrusy flavour.	4.00	4.50	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/3369640019177_T9_P._Jacquin___Fils_Goat_Log_150g-640x640.png	MiniGoatLog150g.png	1	6	3	t
80	pp5005760088	Mini Goat Log with Flowers 100g	A delicate and mild fresh goats milk cheese with a coating of edible flowers.	3.30	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/3369640037645_T9_P._Jacquin___Fils_Goat_Log_with_Flowers_100g-640x640.png	MiniGoatLogwithFlowers100g.png	1	6	3	t
81	pp5005810108	Mini Goat Log with Garlic and Herb 100g	Delicate and mild fresh goats milk cheese with a coating of fresh Garlic & Herbs. Perfect on its own or in a salad or bake.	2.70	4.70	Mini Goat Log with Garlic and Herb 100g	MiniGoatLogwithGarlicandHerb100g.png	1	6	3	t
82	pp5005820197	Mini Goat Log with Honey 100g	A delicate and mild fresh goats milk cheese with an addition of honey. Perfect on its own or in a salad.	3.30	4.90	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/3369640030875_T9_P._Jacquin___Fils_Goat_Log_with_Honey_100g-640x640.png	MiniGoatLogwithHoney100g.png	1	6	3	t
83	pp5005840598	Monna Lisa Pecorino With Truffle 200g	Monna Lisa has a perfect combination of the sweet taste of the Pecorino cheese and the strong truffle taste. This aromatic dessert cheese is a fantastic hard cheese for a cheese tray, grating into salads or even on over your Fillet steak.	10.00	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2024/01/MONNA-LISA-640x571.jpg	MonnaLisaPecorinoWithTruffle200g.webp	1	3	5	t
84	pp5005840776	Montagnolo Blue 130g	A very rich, triple cream cheese with subtle spiciness and delicate sweet milk flavour. With more in common with Delice or mild Brie, the texture is soft and creamy with a hint of blue tang.	3.90	5.00	Montagnolo Blue 130g	MontagnoloBlue130g.png	1	4	5	t
85	pp5005850180	Mont dOr 500g	A luscious, creamy cheese from the Jura region of France. This cheese is only available from about October until April as only winter milk is used to produce it. It comes in a 500 g round, wrapped in spruce bark and in a wooden box.	13.90	4.20	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/mont-dor-web2-640x638.jpg	MontdOr500g.webp	1	4	3	t
86	pp5005851218	Monte Enebro 200g	Montenebro is a semi-pressed goats cheese log covered in ash and mould. The flavour is assertive and earthy with a nice salty tanginess.	9.60	4.10	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/IMG_9292-rotated-640x640.jpg	MonteEnebro200g.webp	1	6	5	t
87	pp5005860175	Morbier Marcel Petite	Morbier AOP has a thin rind, its supple and soft texture may have small holes, its taste is characterized by a slight aroma of cream and butter.	8.90	4.80	https://sheridanscheesemongers.com/wp-content/uploads/2024/02/morbier-stack-640x640.jpg	MorbierMarcelPetite.webp	1	4	3	t
88	pp5005860263	Mount Leinster Cheddar	One of our favourite cloth bound Irish Cheddars. Mount Leinster has a rich complex flavour with a  savoury undertone and classic cheddar tang.	7.60	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/coolattin-cheddar-web-002-640x640.jpg	MountLeinsterCheddar.webp	1	2	1	t
89	pp5005870183	Mozzarella di Bufala 125g	Fresh ball of Mozzarella produced by Fattorie Garofalo with a beautiful tearing texture, and soft lemony milky flavours. No other cheese epitomizes summer eating in quite the same way as mozzarella di bufala.	4.00	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/mbc-125g-TERMO-1-640x960.jpg	MozzarelladiBufala125g.webp	1	4	5	t
90	pp5005870599	Mozzarella di Bufala 250g	Fresh ball of Mozzarella in a single portion bag. Made from Buffalo milk.	7.50	4.40	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/mbc-250g-CLIP-640x960.jpg	MozzarelladiBufala250g.webp	1	4	5	t
92	pp5005910565	NEUFCHATEL VILLIERS COEUR 250G	Coeur de Neufchâtel cheese has the aroma and taste of earthy mushrooms, whilst retaining a very creamy consistency, occasionally with a yeasty undertone, depending on age.	5.00	4.30	NEUFCHATEL VILLIERS COEUR 250G	NEUFCHATELVILLIERSCOEUR250G.webp	1	4	3	t
94	pp5005940242	Paysan Breton Sea Salt Cream Cheese 150g	Fresh, flavourful and simply delicious. Breton cream cheese is salted and then whipped for a light and airy texture making it easy to spread or dip. The crystals of fleur-de-sel provide texture, as well as flavour.	3.80	3.70	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/3236240070313_T5_Paysan_Breton_Luxurious_French_Sea_Salt_Cream_Chee.png	PaysanBretonSeaSaltCreamCheese150g.png	1	5	3	t
95	pp5005940299	Pecorino Romana, 180g	Rich, brothy flavours and aromas, with a dense, flaky texture. Pecorino Romano is generally used as a sharper alternative to Parmesan. It is ideal for pasta and perfect with cured meats and olives. Pecorino Romano is the true cheese for both carbonara and cacio-e-pepe.	7.65	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/2058812602606_T14_Sheridans_Cheesemongers_Pecorino_Romano_DOP_200g.png	PecorinoRomana180g.png	1	3	5	t
96	pp5005941612	Petit Reblochon 230g	The flavour is fresh, creamy and rich with lingering notes of nuts and a fresh stoney minerality to the rind. The flavour and aromas evoke images of verdant pastures and stone barns.	8.80	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/roblochon-package-640x640.jpg	PetitReblochon230g.webp	1	5	3	t
97	pp5005980058	Pont LEveque 360g	Pont lEveque is rich and creamy, and in perfect condition, can be quite similar to Camembert. The rind of Graindorge’s Pont-l’Évêque is a ridged dusty white, with an occasional orangey/salmon pink tinge. The creamy yellow paste is soft, but not runny with air holes speckled throughout.	14.20	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/pont-leveque_square.jpg	PontLEveque360g.webp	1	4	3	t
98	pp5005980146	Pouligny Saint Pierre 250g	A dense flaky goats cheese with flavours of nuts, hay and herbs. Pouligny has a pyramidal shape with soft, wrinkled, ivory-coloured, natural rind. As the pyramid dries out, the wrinkles deepen and grey, white and blue moulds gather.	12.95	4.50	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/pouligney-web-1-640x853.jpg	PoulignySaintPierre250g.webp	1	6	3	t
91	pp5005870638	Dittys Irish Oatcakes	Handmade with Irish grown oats and buttermilk, these hearty oatcakes are golden and have a light, just baked crispness.	4.90	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/2f1deda254cda5ea22b20902a93c210c.jpg	2f1deda254cda5ea22b20902a93c210c.jpg	2	8	1	t
99	pp5006070077	Raclette Savoie	Raclette may be the most famous of all melting cheeses! Raclette has a mild, lactic flavour and with a slight fruity and savoury finish. Expect notes of hay and roast chicken. It has an elastic, semi-firm paste and a thin blushing pink rind that is fully edible. Known for its use in the classic Raclette dish, but also great on a cheeseboard or used in sandwiches.	12.00	4.40	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/Raclette-2-640x640.jpg	RacletteSavoie.webp	1	2	3	t
100	pp5006081758	Raclette Savoie Sliced 350g	Pre-sliced to take the work out of it! Raclette has a mild, lactic flavour and with a slight fruity and savoury finish. Expect notes of hay and roast chicken. It has an elastic, semi-firm paste and a thin blushing pink rind that is fully edible. This is packaged and ready for your raclette machine or your grilled cheese toastie.	10.95	4.80	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/OIP.jpg	RacletteSavoieSliced350g.webp	1	2	3	t
101	pp5006082011	Roquefort Gabriel Coulet 170g	Roquefort Petite Cave is smooth, sweet and buttery, with a pronounced, yet well integrated blue flavour. Gabriel Coulet Roquefort cheeses are of a consistently high quality, and the salt level is never overly pronounced.	8.25	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/2058871000000_T1_Sheridans_Cheesemongers_Roquefort_Gabriel_Coulet_2.png	RoqueforGabrielCoulet170g.png	1	4	3	t
102	pp5006150186	Scamorza Bianca 230g	Scamorza bianca is a mild cheese from Italy with a nice lactic tang and great springy texture. This cheese is perfect for grating onto pizza and pasta dishes, or sliced on a cheeseboard with charcuterie, on top of a sandwich or with fresh grilled/cooked vegetables.	5.60	4.20	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/scamorza-bianca-web-640x640.jpg	Scamorzaianca230g.webp	1	4	5	t
103	pp5006153172	Scamorza Smoked 220g	Smoked Scamorza has a subtle, smoky flavour with a sweet, light caramel note. Like the plain version Scamorza Bianca, this cheese is perfect for grating onto pizza and pasta dishes. It is also brilliant sliced on a cheeseboard with charcuterie, on top of a sandwich or with grilled or roasted vegetables.	5.60	4.20	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/8006103110570_T1_Pugliese_Scamorza_Smoked_220g-640x640.png	ScamorzaSmoked220g.png	1	4	5	t
104	pp5006160127	Schnebelhorn 180g	Sweet, nutty, and savoury, with undertones of roast onion. Schnebelhorn is a rich and robust cheese. It has a great bite with the occasional crystalline bit here and there. An excellent addition to a cheeseboard.	6.90	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/2058801000000_T1_Sheridans_Cheesemongers_Schnebelhorn_200g.png	Schnebelhorn180g.png	1	4	7	t
105	pp5006160833	Selles Sur Cher 150g	The steely grey charcoal ash rind encases a pure white paste which is smooth and mild with a fondant texture. The flavour is tart and salty with a rich hazelnut aroma.	7.50	4.80	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/selle_square.jpg	SellesSurCher150g.webp	1	4	3	t
106	pp5006170128	Sheridans Cheddar Extra Mature Red, 200g	Made in Ballineen Co. Cork, selected by Sheridans. With a rich texture and tangy flavour, perfectly paired with any sheridans jam or chutney. 200g slice. 	4.00	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/2058843000000_T1_Sheridans_Cheesemongers_Cheddar_Extra_Mature_Red_C.png	2058843000000_T1_Sheridans_Cheesemongers_Cheddar_Extra_Mature_Red_C.png	1	2	1	t
107	pp5006170131	Shropshire Blue	Colston Basset Shropshire Blue cheese has an exquisite, nutty flavour, shot through with spicy notes. Its delightful taste and creamy texture are matched by its beautiful appearance, as blue veins radiate through its deep-orange body.	11.99	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/shropshire_blue_square-4.jpg	ShropshireBlue.webp	1	1	2	t
110	pp5006200658	https://sheridanscheesemongers.com/wp-content/uploads/2023/08/saint-agur.jpg	Saint Agur is a delightful combination of smooth & creamy with a subtle salty and tangy bite, perfect for spreading, using in a dip or in a sauce.	11.25	4.80	https://sheridanscheesemongers.com/wp-content/uploads/2023/08/saint-agur.jpg	StAgur250g.webp	1	4	3	t
111	pp5006241766	St Killians 150g	This full-fat, mould ripened cheese can be instantly identified by its hexagonal shape. St. Killians has a fresh, grassy aromas with a mild, salty butter flavour and mushroomy rind. The paste can range from semi soft to nearly liquid when fully ripe.	4.50	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/st-killian-stone-wall.jpg	StKillians150g.webp	1	4	1	t
112	pp5006242155	St Tola Ash	Lightly flaky and chalky goats cheese with a floral and citrusy flavour. The exterior is covered in beautiful ash rind and the interior is a brilliant white. A great example of Irish cheesemaking and a must try.	13.99	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/st-tola-ash-stone-back-640x640.jpg	StTolaAsh.webp	1	6	1	t
113	pp5006242904	St Tola Crottin 120g	Siobhan Ni Ghairbhith runs St. Tola at Inagh Goat Farm, just south of the beautiful Burren area in Co. Clare. Meg and Derrick Gordon began making St Tola in the Burren in 1978. St Tola log is a fresh, mild cheese made with raw organic goats-milk from the St Tola herd of Saanen and Toggenburg goats. St. Tola crottin is made with fresh curd and a sprinkling of sea salt.	5.85	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/st-tola-ash-stone-back-640x640.jpg	StTolaCrottin120g.png	1	6	1	t
115	pp5006243106	Templegall	Made in Ireland but alpine in style, Templegall has a beautiful sweet and nutty flavour with a very smooth texture.	5.50	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/Tempelgall1-640x619.jpg	Templegall.webp	1	2	1	t
116	pp5006243276	Tomme de Savoie 300g	There is an aroma of the cellar about Tomme de Savoie, yet the flavour is mild and milky, with notes of butter, walnuts, herbs and an almost sweet smokiness. The texture is pliable but not soft with small airholes throughout.	11.70	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/tomme-de-savoie-web-640x640.jpg	TommedeSavoie300g.webp	1	2	3	t
7	pp5002440521	Boyne Valley Blue 200g	Robust and full flavour goats milk blue cheese with firm, chalky texture.	7.30	4.40	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/boyne-valley-blue-web-640x639.jpg	BoyneValleyBlue200g.webp	1	6	1	t
8	pp5002601115	Bride Valley Sundried Tomato Rosemary & Black Pepper Cheese	Irish cheddar with the lovely intense sweet. Tart flavour of sundried tomatoes with woody pine like undertones imparted from the rosemary and finished with piquant black pepper.	3.40	4.50	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/6059440255246_T1_Bride_Valley_Cheese_Irish_Cheddar_with_Sundried_To.png	BrideValleySundriedTomatoRosemary&BlackPepperCheese.png	1	2	1	t
1	pp5001340155	Ardsallagh Goats Cheese Cranberry Roulade 165g	Made by the Murphy family on their farm in East Cork. This is a fresh delicate Goats milk cheese with a swirl of cranbery adding a fruity sweetness.	6.00	4.60	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/ardsallgh-cran-roulade-640x640.jpg	ArdsallaghGoatsCheeseCranberryRoulade165g.webp	1	6	1	t
2	pp5001600425	Baking Cooleeney 200g	The perfect baking cheese equipped with its own dish! Creamy, buttery and mild, just perfect for some crusty bread.	5.50	4.60	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/baking_cooleeney-e1542386773306.jpg	BakingCooleeney200g.webp	1	7	1	t
3	pp5001730010	Millers Damsel Wheat Wafer	Crunchy and wheaty wafers. Hexagonal wafers made with stone-ground flour, grown and milled in England.	4.30	4.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/Millers-Damel-Packshot-ANGLED-Wheat-2018-01b.jpg	Millers-Damel-Packshot-ANGLED-Wheat-2018-01b.jpg	2	8	2	t
4	pp5001890157	Ballyhubbock Imaal	This Irish Halloumi-style cheese is made in the traditional way and with pure sheeps milk. George and Hanna make their IMAAL cheese from the milk of their sheep raised on their third-generation hill farm in The Glen-of-Imaal, Baltinglass, Co. Wicklow. 	5.50	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/5391533790106_T1_Ballyhubbock_Farm_Irish_Handmade_Sheep_Milk_Hallou.png	BallyhubbockImaal.png	1	2	1	t
5	pp5002111605	Bleu dAuvergne 300g	Bleu dAuvergne has a semi-soft paste with a reasonably sharp blue flavour that contrasts beautifully with its creamy texture. The paste melts wonderfully in the mouth leaving an impression of smoothness and a slightly longer blue finish. Good Bleu d’Auvergne is perfectly balanced between fruity-sweet flavours and white pepper spiciness from the blue penicillium mould. 	7.80	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/blue-dauvergne-web-640x640.jpg	BleudAuvergne300g.webp	1	4	3	t
6	pp5002260206	BookersVintage200g.webp	Mature Irish cheddar with a natural rind developed at Sheridans Cheesemongers. The flavour is lightly tangy and savoury with a firm texture. Perfect for cheeseboards or sandwiches. 	4.60	4.70	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/bookers-square-web-640x640.jpg	BookersVintage200g.webp	1	2	1	t
117	pp5006280064	Valdeon Blue 200g	Big, bold and beautiful. Valdeons flavour is strong and spicy with flavours of salted butter and earth. This is a great option for the blue cheese enthusiast who doesnt shy away from big flavours.	6.40	4.80	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/Photo-Apr-16-11-25-31-rotated-640x640.jpg	ValdeonBlue200g.webp	1	1	3	t
118	pp5006280190	Valencay Ash 110g	Valençay has a pyramidal shape and natural rind mould coated with a mixture of charcoal and salt. The paste is white/ivory with a fondant texture growing firmer with age. Valencay can range from light and fresh at a young stage with growing aroma of hazelnuts or peanuts, dried fruits and mushrooms as the cheese matures.	6.80	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/images-1.jpg	ValencayAsh110g.webp	1	4	3	t
76	pp5005700140	Milleens Dote 200g	Milleens is a washed rind cheese made with pasteurised cows milk.	9.00	5.00		MilleensDotes200g.webp	1	3	1	t
108	pp5006170357	Sliced Dutch Maasdam 165g		4.00	3.70		SlicedDutchMaasdam165g.webp	1	2	4	t
114	pp5006242905	Taleggio 200g		11.25	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/taleggio-640x640.jpg	Taleggio200g.webp	1	2	5	t
120	pp5006310072	Wensleydale with Cranberries	A Christmas favourite. Creamy, crumbly & full of flavour Yorkshire Wensleydale cheese, carefully combined with the delicate fruity succulence of pure, sweet cranberries. An original creation from The Wensleydale Creamery	5.50	5.00	https://sheridanscheesemongers.com/wp-content/uploads/2022/09/5025960003316_Wensleydale_Creamery_Yorkshire_Wensleydale___Cranb_T1-4-640x641.jpg	WensleydalewithCranberries.webp	1	2	2	t
119	pp5006291997	Millers Damsel Charcoal Gluten Free Crackers	A thin, crisp carrier for pâtés, savory spreads or cheese. Made from a blend of gluten-free cereals and flours. Hand-baked in England.	4.49	4.10	https://sheridanscheesemongers.com/wp-content/uploads/2023/06/gf_miller_s-damsel-charcoal_2020-packshot-640x640.jpg	gf_miller_s-damsel-charcoal_2020-packshot-640x640.jpg	2	8	2	t
121	pp5006310443	Dittys Irish Walnut Oaties	Handmade with rolled oats from County Armagh, these oaties are crammed with walnuts for a rich nutty taste and texture.	5.90	3.00	https://sheridanscheesemongers.com/wp-content/uploads/2023/01/9ea8c0365299df88e5485492cde640d6.jpg	9ea8c0365299df88e5485492cde640d6.jpg	3	8	1	t
\.


--
-- Data for Name: cheesystoreshop_rating; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.cheesystoreshop_rating (id, stars, product_id, user_id) FROM stdin;
4	5	91	1
1	3	37	1
15	5	32	1
2	3	121	1
16	3	55	15
17	3	35	1
\.


--
-- Data for Name: contact_contactmessage; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.contact_contactmessage (id, name, email, message, created_at) FROM stdin;
1	Denise Ryan	deniseryan258@gmail.com	You should stock vegan cheese!	2024-04-10 22:09:28.429419+00
2	Peter Collins	PeterC@gmail.com	My order was wrong!	2024-04-11 08:02:05.954777+00
3	Test User	dipomay476@dxice.com	Testing	2024-04-24 18:57:34.194704+00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
136	2024-04-10 14:37:58.751345+00	9	Cheese Etiquette 101	3		20	1
137	2024-04-11 08:05:39.152987+00	11	Cheeseboard Styling Tips	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
138	2024-04-11 08:07:18.276982+00	10	The History of Cheese	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
139	2024-04-11 08:10:08.563841+00	13	The Art of Cheese	2	[{"changed": {"fields": ["Content"]}}]	20	1
140	2024-04-11 08:11:41.038462+00	8	Creative Cheese Recipes	2	[{"changed": {"fields": ["Content"]}}]	20	1
141	2024-04-11 08:13:07.349691+00	13	The Art of Cheese	2	[{"changed": {"fields": ["Content"]}}]	20	1
142	2024-04-11 08:13:09.579305+00	11	Cheeseboard Styling Tips	2	[{"changed": {"fields": ["Content"]}}]	20	1
143	2024-04-11 08:13:19.061129+00	10	The History of Cheese	2	[{"changed": {"fields": ["Content"]}}]	20	1
144	2024-04-11 08:13:28.083925+00	8	Creative Cheese Recipes	2	[{"changed": {"fields": ["Content"]}}]	20	1
145	2024-04-11 08:14:23.137619+00	8	Creative Cheese Recipes	2	[{"changed": {"fields": ["Keywords"]}}]	20	1
146	2024-04-11 08:18:38.304252+00	7	Cheese Festivals Around the Globe	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
147	2024-04-11 08:19:31.544463+00	6	The Health Benefits of Cheese	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
148	2024-04-11 08:21:05.165535+00	5	Exploring International Cheeses	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
149	2024-04-11 08:23:18.462413+00	4	Cheese Pairing Guide	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
150	2024-04-11 08:24:18.219827+00	3	The Art of Cheese Making	2	[{"changed": {"fields": ["Content", "Keywords"]}}]	20	1
151	2024-04-11 08:24:35.924577+00	3	The Art of Cheese Making	2	[{"changed": {"fields": ["Content"]}}]	20	1
152	2024-04-11 08:24:45.016855+00	2	Introduction to Cheesy Delights	2	[]	20	1
153	2024-04-11 08:25:30.502193+00	5	Exploring International Cheeses	2	[{"changed": {"fields": ["Content"]}}]	20	1
154	2024-04-11 08:25:50.093665+00	3	The Art of Cheese Making	2	[{"changed": {"fields": ["Content"]}}]	20	1
155	2024-04-11 08:26:21.936996+00	5	Exploring International Cheeses	2	[]	20	1
156	2024-04-11 08:26:34.196017+00	6	The Health Benefits of Cheese	2	[{"changed": {"fields": ["Content"]}}]	20	1
157	2024-06-14 15:10:35.805281+00	1	Who are we?	1	[{"added": {}}]	25	1
158	2024-06-14 15:11:21.57431+00	2	How can I get in touch?	1	[{"added": {}}]	25	1
159	2024-06-14 15:12:00.314501+00	3	Is it Safe to Use My Credit/Debit Card on Your Website?	1	[{"added": {}}]	25	1
160	2024-06-14 15:12:24.791342+00	4	Why should I set up an account?	1	[{"added": {}}]	25	1
161	2024-06-14 15:13:15.354301+00	5	What is your return policy?	1	[{"added": {}}]	25	1
162	2024-06-14 15:13:39.652456+00	6	How do I change my account details?	1	[{"added": {}}]	25	1
163	2024-06-14 15:14:06.314413+00	7	How can I find out about upcoming promotions and deals?	1	[{"added": {}}]	25	1
164	2024-06-14 15:14:23.325305+00	8	How can I contact customer service?	1	[{"added": {}}]	25	1
165	2024-06-14 15:15:49.385845+00	9	What is your privacy policy?	1	[{"added": {}}]	25	1
166	2024-06-14 15:20:21.604532+00	1	Who are we?	2	[]	25	1
167	2024-06-14 15:21:19.154218+00	2	How can I get in touch?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
168	2024-06-14 15:21:25.022978+00	3	Is it Safe to Use My Credit/Debit Card on Your Website?	2	[]	25	1
169	2024-06-14 15:21:29.464283+00	2	How can I get in touch?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
170	2024-06-14 15:21:47.099002+00	4	Why should I set up an account?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
171	2024-06-14 15:21:55.421655+00	5	What is your return policy?	2	[]	25	1
172	2024-06-14 15:22:10.834224+00	6	How do I change my account details?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
173	2024-06-14 15:22:28.024159+00	7	How can I find out about upcoming promotions and deals?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
174	2024-06-14 15:22:47.495751+00	8	How can I contact customer service?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
175	2024-06-14 15:22:54.966215+00	9	What is your privacy policy?	2	[]	25	1
176	2024-06-14 15:22:56.120414+00	9	What is your privacy policy?	2	[]	25	1
177	2024-06-14 15:58:47.397355+00	2	How can I get in touch?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
178	2024-06-14 16:01:40.817847+00	3	Is it Safe to Use My Credit/Debit Card on Your Website?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
179	2024-06-14 16:02:10.295179+00	4	Why should I set up an account?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
180	2024-06-14 16:02:30.143338+00	1	Who are we?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
181	2024-06-14 16:03:33.223281+00	5	What is your return policy?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
182	2024-06-14 16:03:51.923784+00	6	How do I change my account details?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
183	2024-06-14 16:04:15.412843+00	7	How can I find out about upcoming promotions and deals?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
184	2024-06-14 16:04:32.79017+00	8	How can I contact customer service?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
185	2024-06-14 16:04:55.547353+00	9	What is your privacy policy?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
186	2024-06-14 16:16:49.15599+00	9	What is your privacy policy?	2	[{"changed": {"fields": ["Answer"]}}]	25	1
187	2024-06-17 20:44:30.289765+00	6	How do I change my account details?	2	[{"changed": {"fields": ["Keywords"]}}]	25	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	account	emailaddress
9	account	emailconfirmation
10	socialaccount	socialaccount
11	socialaccount	socialapp
12	socialaccount	socialtoken
13	cheesystoreshop	product
14	cheesystoreshop	category
15	cheesystoreshop	cheesetype
16	cheesystoreshop	origin
17	checkout	orderlineitem
18	checkout	order
19	profiles	userprofile
20	cheesyblog	post
21	cheesyblog	comment
22	django_summernote	attachment
23	cheesystoreshop	rating
24	contact	contactmessage
25	faq	faq
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-02-16 13:28:09.283432+00
2	auth	0001_initial	2024-02-16 13:28:10.782607+00
3	admin	0001_initial	2024-02-16 13:28:11.375691+00
4	admin	0002_logentry_remove_auto_add	2024-02-16 13:28:11.469528+00
5	admin	0003_logentry_add_action_flag_choices	2024-02-16 13:28:11.660415+00
6	contenttypes	0002_remove_content_type_name	2024-02-16 13:28:11.878845+00
7	auth	0002_alter_permission_name_max_length	2024-02-16 13:28:12.196104+00
8	auth	0003_alter_user_email_max_length	2024-02-16 13:28:12.445128+00
9	auth	0004_alter_user_username_opts	2024-02-16 13:28:12.664972+00
10	auth	0005_alter_user_last_login_null	2024-02-16 13:28:12.840887+00
11	auth	0006_require_contenttypes_0002	2024-02-16 13:28:12.988051+00
12	auth	0007_alter_validators_add_error_messages	2024-02-16 13:28:13.165151+00
13	auth	0008_alter_user_username_max_length	2024-02-16 13:28:13.365701+00
14	auth	0009_alter_user_last_name_max_length	2024-02-16 13:28:13.5768+00
15	auth	0010_alter_group_name_max_length	2024-02-16 13:28:13.758088+00
16	auth	0011_update_proxy_permissions	2024-02-16 13:28:13.920799+00
17	auth	0012_alter_user_first_name_max_length	2024-02-16 13:28:14.117961+00
18	sessions	0001_initial	2024-02-16 13:28:14.461833+00
19	account	0001_initial	2024-02-17 14:53:24.013734+00
20	account	0002_email_max_length	2024-02-17 14:53:24.625137+00
21	account	0003_auto_20240123_0958	2024-02-17 14:53:28.822097+00
22	sites	0001_initial	2024-02-17 14:53:29.751098+00
23	sites	0002_alter_domain_unique	2024-02-17 14:53:30.667995+00
24	socialaccount	0001_initial	2024-02-17 14:53:35.08097+00
25	socialaccount	0002_token_max_lengths	2024-02-17 14:53:35.715991+00
26	socialaccount	0003_extra_data_default_dict	2024-02-17 14:53:36.245242+00
27	socialaccount	0004_auto_20240123_0958	2024-02-17 14:53:42.817122+00
28	cheesystoreshop	0001_initial	2024-02-21 22:50:29.964568+00
29	cheesystoreshop	0002_auto_20240226_0904	2024-02-26 09:05:04.293155+00
30	checkout	0001_initial	2024-03-01 11:51:39.819013+00
31	checkout	0002_remove_orderlineitem_product_size	2024-03-01 12:06:11.847345+00
32	checkout	0003_auto_20240303_1446	2024-03-03 14:46:57.579374+00
33	checkout	0004_alter_order_country	2024-03-03 15:56:42.855369+00
34	profiles	0001_initial	2024-03-03 21:10:55.434103+00
35	checkout	0005_order_user_profile	2024-03-03 21:10:55.73146+00
36	cheesyblog	0001_initial	2024-03-08 22:46:32.41229+00
37	django_summernote	0001_initial	2024-03-09 15:07:33.09639+00
38	django_summernote	0002_update-help_text	2024-03-09 15:07:33.609218+00
39	django_summernote	0003_alter_attachment_id	2024-03-09 15:07:34.631335+00
40	cheesyblog	0002_post_keywords	2024-03-29 22:41:32.942901+00
41	cheesystoreshop	0003_rating	2024-03-30 17:22:13.028007+00
42	contact	0001_initial	2024-04-10 22:00:08.593575+00
43	faq	0001_initial	2024-06-14 15:07:18.961857+00
44	faq	0002_faq_keywords	2024-06-14 15:57:16.713517+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xc1dpfabqvwaey97yc2i0fi4g664gt7w	eyJiYWciOnsiMyI6MX19:1rttzK:sizXCOt6TuZ1NxOh8xUqRw55gVKFKVwcjGSuaWYjUrg	2024-04-22 18:45:02.058164+00
mj9qk49ql4t007582xhrtdlziirpol9o	eyJiYWciOnsiMjciOjF9fQ:1rsIzT:qlXZyvgT9YWtusaGXEKyjW2heyXA6GcBN9q2NIL0Ye8	2024-04-18 09:02:35.239729+00
8odbim7yozytm9917kvrw3ue4uajlqyj	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq48blfZ37YbaEUtKSbXg90_pmA78xi1ud7FbCapNnA2vZxXNIj5CPAOf5sBskWrZcm3_njEtz31XINRHW_WA8VxfUhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdz74_FoZDKg:1rgtYT:PZU86iRxAvvH4ezr4Y5ixtIFgtL3dcYDvncnlMxUMxg	2024-03-17 21:39:33.061007+00
9llis61x6urrsgh760vg6nbn4caqfsr5	.eJxVjMsOwiAUBf-FtSGUS3l06d5vIJeXoAZMaRON8d-1SRe6PTNnXsTiumS79jjbEshEBnL43Rz6a6wbCBes50Z9q8tcHN0UutNOTy3E23F3_wIZe_6-WTLBMIUSQCJDoZWPWmEQfJQwaGmY9gITuMANoHY8JWNAKBDoGbpxi_bYe2nVxse9zE8ysfcHbQc-tg:1rbMRW:pkIdSd0aPWJiICeT9jKUgxZEwUcxWVAX4tgoaLdOuo8	2024-03-02 15:17:30.914453+00
w8ffnbzozcygzfc40bniuvtixu4swgdi	eyJiYWciOnsiMTgiOjF9fQ:1rsQZd:Lo8OFsMkZ4jlD2XuIaVQzC2yvPszKxMHkd4u2F3bIaQ	2024-04-18 17:08:25.705703+00
0amud5ajr36d44hhgbqxsw3gpw2r33a5	e30:1rsQaj:kRRhRiPBjsBlLbhme6qZXpfvLSF8xlXt4OZTHFCprWg	2024-04-18 17:09:33.475815+00
yby40m4hp7hzlc7obvzkanc477ciclqb	.eJxVjVEOwiAMQO_S72XBgQP2pxchHZSMiMwMMBrj3d3MYuJn32tfX4DWzjUVc6cl-EDO0BVDhCHVGJufrZkWGEBCAwZrmb7ABLeywz8b0V4obQJj3HC7N9rvzq5ze1onSiVYLGFO5_3qLzVhntYO89ppJrHnvEeGQklLSqIT3bHnB9VrpqxAz0fXaY5q7LzXmgvJBVqG43GLZsp5fWPocQvLEwbWQMY7mZD8DENZKr0_GBZa5A:1rp9oI:T6eREJM_SGQclNmS81qs8GXZ1jks_auJUqeC8bUHRY8	2024-04-09 16:38:02.62805+00
53ofmsalj61mrmubdm8onn1umskh2ic3	eyJiYWciOnsiMzkiOjF9fQ:1rubhz:M9GGjcQnfYDhaWQ9K_s5OOXqArrTCCLacgRiWh1dEsE	2024-04-24 17:26:03.647548+00
0qat3qk7px7a3tqgynlu58a4fobrfola	.eJxVjMEKgzAQRP9lzyUYozF67L3fEHaTTU1bEjEKLaX_XgUvHgaGeTPzBVu4lJiT5fcU5w8M1QUsrsto18KzjR4GqOGUEbonpx34B6Z7Fi6nZY4k9oo4aBG37Pl1PbqngxHLuK11i1Q3jQpI0uhNUhMS98ahNrwZaQg7VsE0um8rVCipo9AymUqqQPD7Ax6wP8o:1rhc5c:ue-8xrIdR9id-uKVr2YfPVwKc0cS5Pq3OlcwqejQ9XE	2024-03-19 21:12:44.129945+00
pv4olw0yl7kfbic2urg7xxqdjfl0vyoq	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1ru8sC:4FD-fvKiE0HKqBEdSququbf2JCkCCv5hAUjlFaBVEaw	2024-04-23 10:38:40.944018+00
4ux5gqax4jb35mjo7jxkz2q18ynvoyo7	eyJzYXZlX2luZm8iOmZhbHNlLCJiYWciOnsiNDAiOjF9fQ:1tJwLc:Uupq5y_wpPAXWsbaU6SWQSTCPP6SgrUijDcMRsfSRkc	2024-12-21 15:03:56.086034+00
izrh1ye5d7q9b43a7ojbroflz0kj2t4l	.eJxVjUFuwyAQRa-CWFsWMdiG7NordBlHaDxATOuSyGOkWFXvXlx50S7n_T_vf3ELeZ1sJr_Y6PiZn3j1l42AHz7tAczzjmtAvOe01r-dI6b6pVw-rRFhjff0enz9U01AU_GIYJwRPXRSdiBA6R697sGppu3kSXdGaFQQ5OgaI0GPTQjGSNVLBShgbHcpeaIyY_3zEZeNn0Vhn4XBzVOZuFwGbu07lcZBB14xUbGmrdjA3zJiwSHP88Yo3pJ3LCYGxHBaIi0bpHrg1yv__gEAo2AZ:1rni9w:1hdBGWFPSjCfWEQM0po4MfrkMyWnF1IzWLXjksGYxhE	2024-04-05 16:54:24.392016+00
i8etf0896pkhi8vsgoph9t4h2h0o3az4	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1rsThG:NVQNewPbN1BjT4KAo6gAE-ZwSM8r_lHJJ1jPiMfDr0M	2024-04-18 20:28:30.627637+00
7vqcucwmohgfyfw8vxqriwb8t0e2cxr4	.eJxVjDkOgzAQRe8ytYWMx3uXXASNt4CCiBRMhbh7TESRVF9_ezsMtNVx2Nb8HqYEHnpgv1mg-MzLWdA8n3FHMb62pXbfzVWv3a25vNQpUp1ey_16_aFGWsfG4cUlxw1pRE2cpDUxW0NJCqWxt9pxGyUVDEk4JBtEKc6hNCgpcgqqQQM9wO-AAjwycAq8YKDB95yBsk3tcXwA4AdD2g:1reb2z:JiRm0x0rAd0nSBIcwuaKP51Kd1a1nsiOLFEXPs5CBN4	2024-03-11 13:29:33.514993+00
w0lrqpujh5an59x5b42kvrr21awk77we	.eJxVjUsOgyAURffC2BgU5OOsboQ84BFJDTYCTZume682Dtrh_Z37IgZqmU3NuJnoyUg60vx6FtwV0xHAshx2C86tNZX22znj3F52halEByWuaTpXf6gZ8rxzaNBeUwmCMQEUuJIOlQTP-0GwTglNleMQmPW9ZqBsH4LWjEvGwVGwwwHNmPN-Y_Bxi9uTjLQhGe5oYgorGctW8f0BRnlJTg:1rtwEm:uw_JDVvxToCC58OVtt49tgmL0I6JjqJUA1CXOLzbLKk	2024-04-22 21:09:08.271931+00
lp2wgbecte1bldsoqoj11qp89iqd1bty	.eJxVjcsOgyAQRf-FdWNQkIe79kfIAEMkNdg42LRp-u_Vxo3L-zr3wwie6HJJMxsSTIQX5mCto1sJF5cjG1jLTp6HcMeyBzBNu91ACPNaavPvHDE1101hqTlAzXO5HasTagQaNw5PNlquQQmhgIM0OqDREGXXK9EaZbkJEpLwsbMCjO9SslZILSQEDr7foYRE243D1yMvbzbw7w_rn0mZ:1rtQUO:Y37uSDJEa6WB0sVAB4sM8OC5VjHEsRYqifJOF57j76c	2024-04-21 11:15:08.823636+00
tybpjpdm1womdg8ed7yukabx14uj7fqe	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1rtwQm:fJpzYCbZEwzzTVK-V_YPBXcSgn0op2yJf4-n39XJXAw	2024-04-22 21:21:32.363274+00
o1611jbipjwri1zgb94dgeme7dhuiagh	.eJxVjckOgjAURf_lrQkptNBhpz_SvE7SSIqhxWgI_y4YFrq807kraFzKoJfsZx0dKGig-vUM2rtPR4DjeNg1WjstqdTfzhnn-rIrn0q0WOKUrufqDzVgHnYOCdJJwrGntEeCTHDrBUfH2q6njeglEZZhoMa1kqIwbQhSUsYpQ0vQdAc0-5z3G-1fjzi_QZEKMj69jilMoMq8-AoM3kCt2_YB5PhMGg:1riIGk:DohvKZlCeeqxaklUvAaJhcUWBcNFGO50DyOdDgF_QQE	2024-03-21 18:15:02.37977+00
hdxhdjvix4nv2m438zs53imswlcvw4a2	.eJxVjUsOgyAURffC2BgU5OOsboQ84BFJDTYCTZume682Dtrh_Z37IgZqmU3NuJnoyUg60vx6FtwV0xHAshx2C86tNZX22znj3F52halEByWuaTpXf6gZ8rxzaNBeUwmCMQEUuJIOlQTP-0GwTglNleMQmPW9ZqBsH4LWjEvGwVGwwwHNmPN-Y_Bxi9uTjLQhGe5oYgorGctW8f0BRnlJTg:1rtwwY:r5T4Vo3Z2B4-C1NFjCpm80KGt_hUirRxiendDxnBzls	2024-04-22 21:54:22.877588+00
wnw071b0m8fh3mynqnw8jv9egvyq32xy	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiIyIn0:1rgtLP:aBJ-ebEw2tiKaqJPEs-Jp8C_hLf9bx-5g9qb_V5yaKw	2024-03-17 21:26:03.985906+00
r3boetl9flah5u9x7urr7czuz3x130cl	e30:1rgtMg:9FSk9H2Z0PT8xRKFsBAhlr3nxhNEjsGmvVuksXkrH8Y	2024-03-17 21:27:22.048093+00
u7dhazfc3j5gzbak2tymkzt65xujig6h	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1ru8Th:tOhYoYII2FvxLkNHCyxNk3tFH04Vu7gSfoS0m8pLlVo	2024-04-23 10:13:21.636412+00
r9fokls7jgn2ee57osprzomr9u8fr801	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiIzIn0:1rgtOX:1d6dm_PE3fpDrZfQdDwwccqz_8E57JqzcRBsFxEHoGg	2024-03-17 21:29:17.09374+00
8px83fqjsaoq6jhg36ayj9a9egbk25tr	.eJxVjUsOgyAURffC2BgU5OOsboQ84BFJDTYCTZume682Dtrh_Z37IgZqmU3NuJnoyUg60vx6FtwV0xHAshx2C86tNZX22znj3F52halEByWuaTpXf6gZ8rxzaNBeUwmCMQEUuJIOlQTP-0GwTglNleMQmPW9ZqBsH4LWjEvGwVGwwwHNmPN-Y_Bxi9uTjLQhGe5oYgorGctW8f0BRnlJTg:1rnm88:fzkTuYfWbTc63Xbra6h-2rtWFwYco6UhxpBGKNFIfac	2024-04-05 21:08:48.582407+00
yzuggmsvnrz6j95w6lbx8v4h715kvaln	.eJxVjckOgjAURf_lrQkptHTa6Y80r5M0kmpoSTSEfxcMC13e6dwVDC51NEsJs0keNHTQ_HoW3T3kI8BpOuwWnXssubbfzhmX9rKrkGtyWNMjX8_VH2rEMu4cEpVXRCCnlCNBJoULUqBn_cBpJ7ki0jGM1PpeUZS2j1EpygRl6Aja4YCWUMp-Y8LrmeY3aNKAxRvoFTqiQHfb9gHv1Uc_:1rr1jd:5ytUmqUmo608k5ckEhNkWss-maxs48l3Q_56gLSG4sQ	2024-04-14 20:24:57.728772+00
l4nh9ftxrm87eha4448d4x2rdme891cy	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1rijLH:Yedqjg8g9e_wRuwi6D0qZl1faWyIXCGuTLpGv-Xknk8	2024-03-22 23:09:31.482304+00
hi489v7qq1hb27f8et7ca0yalo3kjanq	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1rnLBi:HunpEj1cW7QssNoqwPVeazw5er-gIDxf0nG-WDK3G90	2024-04-04 16:22:42.488787+00
ebcmoq6g2yxwsfyujvv2sx5klwa20k2o	eyJiYWciOnsiMzQiOjF9fQ:1rtusn:sbPelpPITNcgn-mT_GxO93pNPS2OPA8Rp3Nu0osbkZk	2024-04-22 19:42:21.335188+00
4cssa6nth0wmfgpnfc8rmal3nvk88arq	.eJxVjckOgjAURf_lrQkptHTa6Y80r5M0kmpoSTSEfxcMC13e6dwVDC51NEsJs0keNHTQ_HoW3T3kI8BpOuwWnXssubbfzhmX9rKrkGtyWNMjX8_VH2rEMu4cEpVXRCCnlCNBJoULUqBn_cBpJ7ki0jGM1PpeUZS2j1EpygRl6Aja4YCWUMp-Y8LrmeY3aNKAxRvoFegAutu2D6ksRw0:1ruUVG:dXMgACy2LvyNanP1G-vXrs_XbxQUIWe3TAAsFFSxVas	2024-04-24 09:44:26.956404+00
d0kw20cqafkhksnfodlxc2wzbxvk4suo	eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiI5IiwiYmFnIjp7IjI1IjoxfX0:1rsKeM:hy8O3xMGe9B26VGkyvZzcqICoahbvZfjfgEwxHx3Mt0	2024-04-18 10:48:54.220274+00
f30l4q14un4r1l7bgcm92ysw725jjfgi	.eJxVjcsOgyAQRf-FdWNQkIe79kfIAEMkNdg42LRp-u_Vxo3L-zr3wwie6HJJMxsSTIQX5mCto1sJF5cjG1jLTp6HcMeyBzBNu91ACPNaavPvHDE1101hqTlAzXO5HasTagQaNw5PNlquQQmhgIM0OqDREGXXK9EaZbkJEpLwsbMCjO9SslZILSQEDr7foYRE243D1yMvbzbw7w_rn0mZ:1rtvQy:hGu0rBCdflehooUQdD7fvtid8Fp9QbimRQoupnNGadg	2024-04-22 20:17:40.45413+00
p1tyxej2eonzt1r8oyp76bp3udt13ebb	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1rsfhz:q4-8mY36x5KR0g1xHTxXHaTfHaH_g2Tr66Gf20coW_I	2024-04-19 09:18:03.930641+00
l6albi9tclmbutjfjuav5vyg6rjaffmc	.eJxVjcsOgjAQRf-la0LKQF_s9EeaaRlCoymGtkZj_HeLYaG7uY8598UslrzYkmizYWIjM6z59Rz6C8U9wOt1t1v0fi0xt9_OEaf2VBXFHDzmsMbz8fWHWjAtlUMcQeteOglaIUI9OhBuMHLwpJVzThoCpSZUvkchEEQvgHtjOJ9xkjs0UUp1xtLjFrYnGzvgRnLesIR3siHOKxvzVuj9AffzSn8:1rrzyp:nmsCDN7udoHPyvuaCMAPuNNKvl8J72jGPD05GUnQGUw	2024-04-17 12:44:39.528145+00
koyv1tld4aa8sx4jxx5nwvddxmzd0v50	.eJxVjckOgjAURf_lrQkptNBhpz_SvE7SSIqhxWgI_y4YFrq807kraFzKoJfsZx0dKGig-vUM2rtPR4DjeNg1WjstqdTfzhnn-rIrn0q0WOKUrufqDzVgHnYOCdJJwrGntEeCTHDrBUfH2q6njeglEZZhoMa1kqIwbQhSUsYpQ0vQdAc0-5z3G-1fjzi_QZEKMj69jilMoMq8-AoM3kCt2_YB5PhMGg:1rtFXi:ST7SYPRyMnEeGVWe7dO6caYhT_76g1kaeVQLcQd_u2A	2024-04-20 23:33:50.500276+00
9t5zemo9g2i4zxenpj9lk1tlk95x68qe	.eJxVjMsOwiAURP-FtWloL-XhTn-kGS6QNjY0EVgZ_93WdKHLOTNzXmJCq_PUSnxOSxBX0YvLL_PgR8xHgXU9cAfmreXafTdnXbrbnmKuC6MuW76frz_VjDLvHplccNJAE2lIKGs4WoOghlFTb7WTlhUS-TA4gvVDSs6RMqTAEn4U7w-lOTvt:1ruZ5K:EBHHbzDEFjO450v1-g5mgPKOPmXWNuyBik6myLz7PAY	2024-04-24 14:37:58.866117+00
ab818uoa25mz01y0fcg90wcpv7nsolki	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1ru8qE:UojNIST6NOxkV5h6WOmtPdVtABOv5pHacSKJzDKwzBI	2024-04-23 10:36:38.856318+00
rij9dr8t2ejlyinrrtgs4gggv8sl75ak	.eJxVjMsOwiAUBf-FtSGUS3l06d5vIJeXoAZMaRON8d-1SRe6PTNnXsTiumS79jjbEshEBnL43Rz6a6wbCBes50Z9q8tcHN0UutNOTy3E23F3_wIZe_6-WTLBMIUSQCJDoZWPWmEQfJQwaGmY9gITuMANoHY8JWNAKBDoGbpxi_bYe2nVxse9zE8ysfcHbQc-tg:1rzi8Q:UBrbVWLRUeTLDlYKvczwXvxU3LgpCyCXaZ72-L7qYWU	2024-05-08 19:18:26.947599+00
ictudtq1d59ty2ureis1tturupmlmiuz	.eJxVjMsOgyAURP_lro1BQB7u2h8hl1clNZgU6Mb479XGRbucMzNnA4OtzqaV8DLJwwQDdL_MonuGfBa4LCfu0bm15dp_N1dd-tuRQq7JYU1rvl-vP9WMZT48JGqviUTBmECCXEkXlETP6SjYoIQmynGMzHqqGSpLY9Sacck4OoJ2PKQF38GkHFeY6quFDiw-YNqAjjAN-_4BzR5F8w:1rsQEw:IbaBhoeuFBs8b_sSg0TDT-Iy3TNBBusFMsUGCD3xjJc	2024-04-18 16:47:02.90694+00
yd0yj26gfktu99chcqtpxifl31zifg60	eyJiYWciOnsiMjUiOjF9fQ:1rsQaY:L2MQ-9WJf9Um0Qvq8WUzLKDgRMjLbmr7YXDksgPjzPk	2024-04-18 17:09:22.494163+00
v2o96c9tm7mq8vc1x7uzvgbbmsej14w9	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1ru8wM:umHVjnoYXDCgL6XuV_hEKNXKbW61da3NZiLwFF_vTP8	2024-04-23 10:42:58.804532+00
m9psmwgskdaae6eaccm8ysak5ek7k7xp	.eJxVjckOgjAURf_lrQkptHTa6Y80r5M0kmpoSTSEfxcMC13e6dwVDC51NEsJs0keNHTQ_HoW3T3kI8BpOuwWnXssubbfzhmX9rKrkGtyWNMjX8_VH2rEMu4cEpVXRCCnlCNBJoULUqBn_cBpJ7ki0jGM1PpeUZS2j1EpygRl6Aja4YCWUMp-Y8LrmeY3aNKAxRvoFSgH3W3bB6kyRw4:1rubTY:cjnfJM0oeReqOXQQApeG_Xer5tJ4KAcFLTAW5IYBLmc	2024-04-24 17:11:08.510811+00
id0x6b55fbhntk0nhviqcnklx4nk2cqk	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1ru8SH:M8PoHZkBzH7EeSrA6TeqK-ApjCTez1zDTqBoiTsNGb0	2024-04-23 10:11:53.028235+00
5kzgmo0moki2qyocbxh78rpqtripk0l9	.eJxFyTEKgDAMBdC7_LmDcy8Tiv5CIKbS2KKId3f0re9BlElRrw25FgsmlHVtw0-Z7FqVm3Avasg-zP4dwY4MIkGCEdpceB3ab-Tl_QCp7SA9:1rs57x:NFBgnh9F_gxfP-F9RUop303OEf2vwn094w5a5YlXI2U	2024-04-17 18:14:25.311656+00
jsa8b9ikllo3orybofxyykyqoafq3aia	.eJxVjctugzAQRX-Fzhohg3nZu1b9gOxDZA32EJw6EGFTtYry7zURqpTFLObcO2fugFrP6xTUNy12sGQUXdE6kNPqXPqfrp4WkGAghR7PIO9QVCDzRwoK1zA-c2VNrOTwwnrUXzRtATq34WxXZs_OHvvsPW40Basx2Hn62K9eVCP6MXrYIIxgDdac18iwbBtNbYOmLKqa520tWKtLHHhvCsGx7YthEIKXDS9RM-yrTerJ-_hG0c_NLr8gWWTXyPBMPr44HjtQ6uJjY6cdpAlLkyJOB4dlNqsOySc5CmTeOjid4PEHUKRt5w:1rsTW0:H89T6PSfpzDZMO7MHOhaWBWTfXUBFoX58AiiZ7JaVYs	2024-04-18 20:16:52.036858+00
a59wz2gcfstw07ah0ys2wzyo78mynkkf	.eJxVjEEOwiAQRe_C2hAo007bpXvPQAaYWtSAgTbRGO-uTbrQ7X_vv5ewtC6zXSsXG4MYhQZx-B0d-SunjYQLpXOWPqelRCc3Re60ylMOfDvu7l9gpjp_31Mb2Chk1VPjiHGYTKMQYOgMQdBu0BMBQBsUOod9F4ga7pG0d94w4xatXGvMyfLjHstTjOr9AcPFP8w:1rs58f:yMpHFvOQyzMVPa0uxW758ryw1vn6FyTU8471p3Ufgv4	2024-04-17 18:15:09.447034+00
igktuln6scr9ys3c4r4rqhr4x59dj35u	.eJxVjUsOgyAURffCuDEoyMdZuxHygEckNdgING2a7r3YOHF4f-d-SIYnmpjCSqayVbwQA7XMpmbcTPRkIj05eRbcHdMewLLsdgfOrTWV7t854txdm8JUooMS13Q7VifUDHluHBq011SCYEwABa6kQyXB82EUrFdCU-U4BGb9oBkoO4SgNeOScXAU7LhDM-bcbgy-HnF7k4l-f6psSU4:1rtazU:0WV-BZcuo8_RMvKorahKqjqOibn_NMcwMWFpCEccaiw	2024-04-21 22:27:56.982925+00
d1dzcyxwyxlaarba989bgtsaydxbzoo7	.eJxVjcsOgyAQRf-FdWPQQR7u6o-QYYBIarARTNo0_fdq46Jd3te5L2Zxq5PdSlht8mxgLbv8eg7pFvIR4DwfdoNEy5Zr8-2ccWmuuwq5JsKaljyeqz_UhGXaOTwab7hCCSCRo9CKglboRddLaLU0XJPACM53BlC7LkZjQCgQSBxdf0BLKGW_seFxT-uTDfz9AZ4TQyo:1rtqnx:ws8dTckkoUDdtsVFR255E2Vt5oucNANle0w4v-tPGP8	2024-04-22 15:21:05.283754+00
3954yik1tqko5jb20lvs5ozzrd50h5u7	.eJxVjc0OgjAQhN9lz4QUttKfm75Isy2tNJpiaDEaw7sLykFPk5nZ-fYFhuYymDn7ycQeNDRQ_WaW3MWnraDrdYtrcm6cU6k_N3ud6-PqfCrRUYljOu2rP9RAeVg5LKheMUEdYkeMuBTOS0E9bw8dNrJTTDpOAW3fKiRp2xCUQi6Qk2NkDxs0-5zXN8Y_bnF6gmYVZLp7E1MYQZdp9hVYOoN-AQrQTQUov6JWWZY38PBPwA:1rtB3a:AFSb6Ossvnyur35KatJj-mhbd2_TaFMHv7S-64qeNiA	2024-04-20 18:46:26.289426+00
vrntbn6p5tb7z9h5lvvwy54l2wgns407	.eJxVjckOgjAURf_lrQkptHTa6Y80r5M0kmpoSTSEfxcMC13e6dwVDC51NEsJs0keNHTQ_HoW3T3kI8BpOuwWnXssubbfzhmX9rKrkGtyWNMjX8_VH2rEMu4cEpVXRCCnlCNBJoULUqBn_cBpJ7ki0jGM1PpeUZS2j1EpygRl6Aja4YCWUMp-Y8LrmeY3aNKAxRvoFagA3W3bB6k4Rw8:1ruI6b:NXTIMJmywSnPpBz58ZKdx-e0O3v6twvBm0AIV4S7feM	2024-04-23 20:30:09.116561+00
hgnzo09ekganggv0rwd6okd2ocl7dr00	.eJxVjMsOwiAUBf-FtSGUS3l06d5vIJeXoAZMaRON8d-1SRe6PTNnXsTiumS79jjbEshEBnL43Rz6a6wbCBes50Z9q8tcHN0UutNOTy3E23F3_wIZe_6-WTLBMIUSQCJDoZWPWmEQfJQwaGmY9gITuMANoHY8JWNAKBDoGbpxi_bYe2nVxse9zE8ysfcHbQc-tg:1rupsA:CxToSL9cNibOolau_pEaDCTEQ_r53Yzfdju0F_QApG8	2024-04-25 08:33:30.018492+00
f7bkq3b71wfi6bn7lrboz6nrtn1ux4bk	eyJzYXZlX2luZm8iOmZhbHNlLCJiYWciOnsiNDAiOjF9fQ:1tMC8d:z4CNNp02GH8q2Q_Ew525MtNgeuytMCpvP1EQV_JfgDg	2024-12-27 20:19:51.005572+00
2v5sa0tl622xmy4z8832hci4plflo5ip	.eJxVjckOgjAURf_lrQkptHTa6Y80r5M0kmpoSTSEfxcMC13e6dwVDC51NEsJs0keNHTQ_HoW3T3kI8BpOuwWnXssubbfzhmX9rKrkGtyWNMjX8_VH2rEMu4cEpVXRCCnlCNBJoULUqBn_cBpJ7ki0jGM1PpeUZS2j1EpygRl6Aja4YCWUMp-Y8LrmeY3aNKAxRvoFVgHutu2D6kbRwo:1rucVs:BWdywDMoHRcZY-rovqnpk46Y0vAwX8ROu_vPrR09Xx4	2024-04-24 18:17:36.8836+00
0lqrnaw4ngl88faujwo2nkl2f0r08m2f	e30:1ruqK8:HNBqCe-sKbmfIrhXRoOXs3yA1asS3iOxwtSl_Bw8__k	2024-04-25 09:02:24.036483+00
eqjzk8wk1znldddj3ku96ctgcgbqc71e	eyJzYXZlX2luZm8iOmZhbHNlfQ:1s6oVc:P8fFX3IJ0Yb8oBWBpg10dIAFqkYf5hHgsSkLMeaYEyw	2024-05-28 09:31:44.262375+00
8hzvg9508nza45ruvx6bml6wegodk4z6	eyJzYXZlX2luZm8iOmZhbHNlfQ:1sH5bS:mWRNEZz-E1DrGZ6LkHswAh6Gm4M2BVEqbB7YLD6MMP8	2024-06-25 17:48:14.950141+00
svbm8w7xyk0ur3dzhncifpi55s8j1lgj	.eJxVjDkOgzAURO_y6wgZvvFCl1wEjbeAgowUTIW4eyCioZw3M28jhzd1G0lBXb0_qMdahn5d4rcfA3VU0405-E_MZ4FpOnEF7-c1l-q_ueqleh4p5jJ6lHHOr-t1Uw1YhsMjkg1WaChmBQFptI9GI8imVVwbZYXxEoldaCzDuCYla1lqlvACrqX9B4WFP8w:1sJJDL:vM-1_wvzF41474_NFmMtNeIDmk0tLPAHS7z62OiHW30	2024-07-01 20:44:31.373418+00
gdnm2hpdd7wf5ohzuwi21pjsxfaqxrt8	.eJxVjcsOgyAQRf-FdWNQHg7u6o-QAcZIarARTNo0_fdi46Jd3te5L2ZxL7PdM202BjawVrPLr-nQ3ygdCS7LYTfo_bqn0nw7Z5yba1WUSvRY4prGc_WHmjHPlQOd1CQIJCfuyJALindiAiO5cMprB1wp5U0AHaTsual9Qab1gNRDPx3QTDnXG0uPe9yebODvD8T6Qxc:1rufTv:pdEL-H7SLgwGO470S_T3EG2B1WW8fMfQ2nMx7XlQOfg	2024-04-24 21:27:47.225715+00
zflz9vkygrtb66yujb4um06u8zy6pmyu	eyJiYWciOnsiNDEiOjF9fQ:1s6oZd:eVh_1Xt7OoMFjaSUF4e9wVJP9hsTHrtR1e72o-IKhvs	2024-05-28 09:35:53.758566+00
69b8jec4jr10ay7i9hawaz9vh92a6dey	.eJxVjckOgjAURf_lrQkpdKDtTn-k6fCQRlINLYmG8O8Ww0KXdzp3A2PXMpk142JiAA2dgObXdNbfMR2JnefDbq33jzWV9ts549xeqsJUorclPtL1XP2hJpunypE9E0hRMoLEoUIXOOnpKBUj1HEvnCScc6-CFIGxgajap6g6Ly0OchgPaMac643B1zMub9CkAWdvoDegPehu3z_O5Eb3:1rufVl:3IAdTeCn9Tpd01s9MNqjt8EtpUdEG7k_3xfRLJTMMvA	2024-04-24 21:29:41.714045+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.django_site (id, domain, name) FROM stdin;
1	CheesyStore.com	Cheesy Store
\.


--
-- Data for Name: django_summernote_attachment; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.django_summernote_attachment (id, name, file, uploaded) FROM stdin;
\.


--
-- Data for Name: faq_faq; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.faq_faq (id, question, answer, keywords) FROM stdin;
6	How do I change my account details?	Once your logged in, you can visit your profile to change your details.	account, details, address
1	Who are we?	Welcome to Cheesy Store, your premier destination for exceptional cheeses online. We are a passionate team of cheese aficionados based in Ireland, dedicated to bringing the finest and most flavorful cheeses right to your doorstep. Our journey began from a shared love for the rich, diverse world of cheese, and a dream to make these culinary treasures accessible to everyone across Ireland and beyond.	Cheesy, Store, CheesyStore
5	What is your return policy?	At Cheesy Store, we offer a straightforward 30-day return policy for items that don't meet your satisfaction. Products must be returned in their original condition and packaging. To initiate a return, please contact our customer service for a return shipping label and instructions. Upon receiving and inspecting the returned item(s), we will process your refund or exchange.\r\n\r\nWhile return shipping costs for incorrect or defective items are on us, other returns may require you to cover the shipping. Sale items are final sale, except in cases of defects or damage. For any questions, our customer service team is ready to assist.	returns, return, policy, satisfied, satisfaction, package, packaging, returns, return, customer, service, shipping, incorrect, wrong, defective, defect, damage
7	How can I find out about upcoming promotions and deals?	Subscribe to our newsletter on our contact page.	newsletter, promotions, savings, deals
2	How can I get in touch?	We're here to help! For quick responses and updates, please visit our Facebook page! Feel free to send us a message there, and our team will get back to you as soon as possible. We look forward to hearing from you!\r\n\r\nAlternatively, user out contact page!	contact, email, phone, number, message
3	Is it Safe to Use My Credit/Debit Card on Your Website?	At Cheesy Store, the security of your transactions is paramount. We've partnered with Stripe, a global leader in online payment processing, to ensure that your credit/debit card information is handled with the utmost care.\r\n\r\nStripe employs encryption and is certified to PCI Service Provider Level 1, the highest level of certification in the payments industry. This means your payment details are encrypted and processed securely, without ever being stored on our servers. With advanced fraud detection measures in place, you can shop with confidence, knowing your information is safe and protected at all times.	card, payment, credit, transactions, safety, stripe, encryption, details, privacy, fraud
4	Why should I set up an account?	Creating an account with Cheesy Store unlocks a host of benefits designed to enhance your shopping experience. You can store your details on your profile page and leave comments on our blog. Registration is not nescessary for purchasing items.	account, benefits, details, saved, store, comments, registration
8	How can I contact customer service?	You can contact us on out contact page.	customer, customer service, help, contact
9	What is your privacy policy?	At Cheesy Store, we take your privacy and data protection very seriously. We are committed to ensuring the security and confidentiality of the personal information you entrust to us. To fully understand the measures we take to protect your privacy, as well as your rights regarding the use of your personal data, we encourage you to read our comprehensive Privacy Policy.\r\n\r\nOur Privacy Policy outlines how we collect, use, store, and safeguard your information, as well as detailing your rights to access, correct, or delete any personal data we hold. To provide you with the highest level of transparency and control over your personal information, our policy is designed in accordance with the latest data protection laws and standards.	privacy, policy, data
\.


--
-- Data for Name: profiles_userprofile; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.profiles_userprofile (id, default_phone_number, default_country, default_postcode, default_town_or_city, default_street_address1, default_street_address2, default_county, user_id) FROM stdin;
16	086 455 1831	AF	808404	Trash Town	123 Wheely Bin	Skip Lane	Garbageville	16
17	\N	\N	\N	\N	\N	\N	\N	17
3	00353838124469	IE	Dublin 2	Dublin	6 Peter Place	Off Charlemont Street	Dublin	1
14	\N	\N	\N	\N	\N	\N	\N	14
15	\N	\N	\N	\N	\N	\N	\N	15
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: saaulvrj
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 17, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 17, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: checkout_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.checkout_order_id_seq', 105, true);


--
-- Name: checkout_orderlineitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.checkout_orderlineitem_id_seq', 87, true);


--
-- Name: cheesyblog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesyblog_comment_id_seq', 56, true);


--
-- Name: cheesyblog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesyblog_post_id_seq', 15, true);


--
-- Name: cheesystoreshop_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesystoreshop_category_id_seq', 3, true);


--
-- Name: cheesystoreshop_cheesetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesystoreshop_cheesetype_id_seq', 9, true);


--
-- Name: cheesystoreshop_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesystoreshop_origin_id_seq', 8, true);


--
-- Name: cheesystoreshop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesystoreshop_product_id_seq', 130, true);


--
-- Name: cheesystoreshop_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.cheesystoreshop_rating_id_seq', 17, true);


--
-- Name: contact_contactmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.contact_contactmessage_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 187, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.django_summernote_attachment_id_seq', 1, false);


--
-- Name: faq_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.faq_faq_id_seq', 9, true);


--
-- Name: profiles_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.profiles_userprofile_id_seq', 17, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saaulvrj
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: checkout_order checkout_order_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_order
    ADD CONSTRAINT checkout_order_pkey PRIMARY KEY (id);


--
-- Name: checkout_orderlineitem checkout_orderlineitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_orderlineitem
    ADD CONSTRAINT checkout_orderlineitem_pkey PRIMARY KEY (id);


--
-- Name: cheesyblog_comment cheesyblog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_comment
    ADD CONSTRAINT cheesyblog_comment_pkey PRIMARY KEY (id);


--
-- Name: cheesyblog_post cheesyblog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_post
    ADD CONSTRAINT cheesyblog_post_pkey PRIMARY KEY (id);


--
-- Name: cheesyblog_post cheesyblog_post_slug_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_post
    ADD CONSTRAINT cheesyblog_post_slug_key UNIQUE (slug);


--
-- Name: cheesyblog_post cheesyblog_post_title_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_post
    ADD CONSTRAINT cheesyblog_post_title_key UNIQUE (title);


--
-- Name: cheesystoreshop_category cheesystoreshop_category_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_category
    ADD CONSTRAINT cheesystoreshop_category_pkey PRIMARY KEY (id);


--
-- Name: cheesystoreshop_cheesetype cheesystoreshop_cheesetype_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_cheesetype
    ADD CONSTRAINT cheesystoreshop_cheesetype_pkey PRIMARY KEY (id);


--
-- Name: cheesystoreshop_origin cheesystoreshop_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_origin
    ADD CONSTRAINT cheesystoreshop_origin_pkey PRIMARY KEY (id);


--
-- Name: cheesystoreshop_product cheesystoreshop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_product
    ADD CONSTRAINT cheesystoreshop_product_pkey PRIMARY KEY (id);


--
-- Name: cheesystoreshop_rating cheesystoreshop_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_rating
    ADD CONSTRAINT cheesystoreshop_rating_pkey PRIMARY KEY (id);


--
-- Name: cheesystoreshop_rating cheesystoreshop_rating_user_id_product_id_1bb3d24d_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_rating
    ADD CONSTRAINT cheesystoreshop_rating_user_id_product_id_1bb3d24d_uniq UNIQUE (user_id, product_id);


--
-- Name: contact_contactmessage contact_contactmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.contact_contactmessage
    ADD CONSTRAINT contact_contactmessage_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: django_summernote_attachment django_summernote_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_summernote_attachment
    ADD CONSTRAINT django_summernote_attachment_pkey PRIMARY KEY (id);


--
-- Name: faq_faq faq_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.faq_faq
    ADD CONSTRAINT faq_faq_pkey PRIMARY KEY (id);


--
-- Name: profiles_userprofile profiles_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.profiles_userprofile
    ADD CONSTRAINT profiles_userprofile_pkey PRIMARY KEY (id);


--
-- Name: profiles_userprofile profiles_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.profiles_userprofile
    ADD CONSTRAINT profiles_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: checkout_order_user_profile_id_949184a7; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX checkout_order_user_profile_id_949184a7 ON public.checkout_order USING btree (user_profile_id);


--
-- Name: checkout_orderlineitem_order_id_b4cfbe6b; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX checkout_orderlineitem_order_id_b4cfbe6b ON public.checkout_orderlineitem USING btree (order_id);


--
-- Name: checkout_orderlineitem_product_id_739c699d; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX checkout_orderlineitem_product_id_739c699d ON public.checkout_orderlineitem USING btree (product_id);


--
-- Name: cheesyblog_comment_post_id_3e746a6e; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesyblog_comment_post_id_3e746a6e ON public.cheesyblog_comment USING btree (post_id);


--
-- Name: cheesyblog_comment_user_id_ab056958; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesyblog_comment_user_id_ab056958 ON public.cheesyblog_comment USING btree (user_id);


--
-- Name: cheesyblog_post_author_id_37e9fed1; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesyblog_post_author_id_37e9fed1 ON public.cheesyblog_post USING btree (author_id);


--
-- Name: cheesyblog_post_slug_f1063e14_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesyblog_post_slug_f1063e14_like ON public.cheesyblog_post USING btree (slug varchar_pattern_ops);


--
-- Name: cheesyblog_post_title_f99b768e_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesyblog_post_title_f99b768e_like ON public.cheesyblog_post USING btree (title varchar_pattern_ops);


--
-- Name: cheesystoreshop_product_category_id_a5c8b082; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesystoreshop_product_category_id_a5c8b082 ON public.cheesystoreshop_product USING btree (category_id);


--
-- Name: cheesystoreshop_product_cheesetype_id_2318f76b; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesystoreshop_product_cheesetype_id_2318f76b ON public.cheesystoreshop_product USING btree (cheesetype_id);


--
-- Name: cheesystoreshop_product_origin_id_5d872396; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesystoreshop_product_origin_id_5d872396 ON public.cheesystoreshop_product USING btree (origin_id);


--
-- Name: cheesystoreshop_rating_product_id_f0419872; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesystoreshop_rating_product_id_f0419872 ON public.cheesystoreshop_rating USING btree (product_id);


--
-- Name: cheesystoreshop_rating_user_id_1fdee10d; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesystoreshop_rating_user_id_1fdee10d ON public.cheesystoreshop_rating USING btree (user_id);


--
-- Name: cheesystoreshop_rating_user_id_product_id_1bb3d24d_idx; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX cheesystoreshop_rating_user_id_product_id_1bb3d24d_idx ON public.cheesystoreshop_rating USING btree (user_id, product_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: saaulvrj
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_order checkout_order_user_profile_id_949184a7_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_order
    ADD CONSTRAINT checkout_order_user_profile_id_949184a7_fk_profiles_ FOREIGN KEY (user_profile_id) REFERENCES public.profiles_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_orderlineitem checkout_orderlineit_product_id_739c699d_fk_cheesysto; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_orderlineitem
    ADD CONSTRAINT checkout_orderlineit_product_id_739c699d_fk_cheesysto FOREIGN KEY (product_id) REFERENCES public.cheesystoreshop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_orderlineitem checkout_orderlineitem_order_id_b4cfbe6b_fk_checkout_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.checkout_orderlineitem
    ADD CONSTRAINT checkout_orderlineitem_order_id_b4cfbe6b_fk_checkout_order_id FOREIGN KEY (order_id) REFERENCES public.checkout_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesyblog_comment cheesyblog_comment_post_id_3e746a6e_fk_cheesyblog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_comment
    ADD CONSTRAINT cheesyblog_comment_post_id_3e746a6e_fk_cheesyblog_post_id FOREIGN KEY (post_id) REFERENCES public.cheesyblog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesyblog_comment cheesyblog_comment_user_id_ab056958_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_comment
    ADD CONSTRAINT cheesyblog_comment_user_id_ab056958_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesyblog_post cheesyblog_post_author_id_37e9fed1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesyblog_post
    ADD CONSTRAINT cheesyblog_post_author_id_37e9fed1_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesystoreshop_product cheesystoreshop_prod_category_id_a5c8b082_fk_cheesysto; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_product
    ADD CONSTRAINT cheesystoreshop_prod_category_id_a5c8b082_fk_cheesysto FOREIGN KEY (category_id) REFERENCES public.cheesystoreshop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesystoreshop_product cheesystoreshop_prod_cheesetype_id_2318f76b_fk_cheesysto; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_product
    ADD CONSTRAINT cheesystoreshop_prod_cheesetype_id_2318f76b_fk_cheesysto FOREIGN KEY (cheesetype_id) REFERENCES public.cheesystoreshop_cheesetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesystoreshop_product cheesystoreshop_prod_origin_id_5d872396_fk_cheesysto; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_product
    ADD CONSTRAINT cheesystoreshop_prod_origin_id_5d872396_fk_cheesysto FOREIGN KEY (origin_id) REFERENCES public.cheesystoreshop_origin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesystoreshop_rating cheesystoreshop_rati_product_id_f0419872_fk_cheesysto; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_rating
    ADD CONSTRAINT cheesystoreshop_rati_product_id_f0419872_fk_cheesysto FOREIGN KEY (product_id) REFERENCES public.cheesystoreshop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cheesystoreshop_rating cheesystoreshop_rating_user_id_1fdee10d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.cheesystoreshop_rating
    ADD CONSTRAINT cheesystoreshop_rating_user_id_1fdee10d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_userprofile profiles_userprofile_user_id_616bed88_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.profiles_userprofile
    ADD CONSTRAINT profiles_userprofile_user_id_616bed88_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk; Type: FK CONSTRAINT; Schema: public; Owner: saaulvrj
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


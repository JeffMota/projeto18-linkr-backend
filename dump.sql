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


CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.comments (
    id integer NOT NULL,
    text character varying(144) NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT comments_text_check CHECK (((text)::text <> ''::text))
);


CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE public.follows (
    "followerId" integer NOT NULL,
    "followingId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT follows_check CHECK (("followerId" <> "followingId"))
);



CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    description text,
    url text NOT NULL,
    "urlTitle" text NOT NULL,
    "urlDescription" text NOT NULL,
    "urlImage" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "posts_urlDescription_check" CHECK (("urlDescription" <> ''::text)),
    CONSTRAINT "posts_urlImage_check" CHECK (("urlImage" ~ '^(http|https)://.*'::text)),
    CONSTRAINT "posts_urlTitle_check" CHECK (("urlTitle" <> ''::text)),
    CONSTRAINT posts_url_check CHECK ((url ~ '^(http|https)://.*'::text))
);


CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE public.tags (
    "postId" integer NOT NULL,
    name text NOT NULL,
    "mentionsNumber" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT tags_name_check CHECK ((name <> ''::text))
);


CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password character varying(255) NOT NULL,
    "pictureUrl" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT users_email_check CHECK ((email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text)),
    CONSTRAINT users_password_check CHECK (((password)::text <> ''::text)),
    CONSTRAINT "users_pictureUrl_check" CHECK (("pictureUrl" ~* '^(http|https)://.*'::text)),
    CONSTRAINT users_username_check CHECK ((username <> ''::text))
);


CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



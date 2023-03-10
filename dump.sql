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
-- Name: likes; Type: TABLE; Schema: public; Owner: kjwqqunq
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.likes OWNER TO kjwqqunq;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: kjwqqunq
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO kjwqqunq;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kjwqqunq
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: kjwqqunq
--

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


ALTER TABLE public.posts OWNER TO kjwqqunq;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: kjwqqunq
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO kjwqqunq;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kjwqqunq
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: kjwqqunq
--

CREATE TABLE public.tags (
    "postId" integer NOT NULL,
    name text NOT NULL,
    "mentionsNumber" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT tags_name_check CHECK ((name <> ''::text))
);


ALTER TABLE public.tags OWNER TO kjwqqunq;

--
-- Name: users; Type: TABLE; Schema: public; Owner: kjwqqunq
--

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


ALTER TABLE public.users OWNER TO kjwqqunq;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kjwqqunq
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO kjwqqunq;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kjwqqunq
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: kjwqqunq
--

COPY public.likes (id, "userId", "postId", "createdAt") FROM stdin;
2	1	16	2023-03-10 03:13:37.431582
3	1	28	2023-03-10 10:49:41.452232
7	12	28	2023-03-10 11:51:19.107642
8	12	17	2023-03-10 11:57:22.158724
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: kjwqqunq
--

COPY public.posts (id, "userId", description, url, "urlTitle", "urlDescription", "urlImage", "createdAt") FROM stdin;
16	1	\N	https://oglobo.globo.com/esportes/noticia/2023/03/cano-e-gabigol-reencontram-suas-maiores-vitimas-e-sao-pontos-chaves-para-decidir-a-taca-guanabara.ghtml?utm_source=globo.com&utm_medium=oglobo	Cano e Gabigol reencontram suas maiores vítimas e são pontos chaves para decidir a Taça Guanabara 	Pelo tricolor, argentino tem quatro gols em Fla-Flu, enquanto novo camisa 10 do rubro-negro tem 10 bolas na rede no clássico. Nesta quarta-feira, eles decidem a Taça Guanabara 	https://s2.glbimg.com/NsDJZtR4sWiQHOw-cXbwarh1Ifo=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/6/h/s2DX4YTQiCpTuTHzuL1A/1.png	2023-03-10 01:16:04.725821
17	1	\N	https://oglobo.globo.com/esportes/noticia/2023/03/cano-e-gabigol-reencontram-suas-maiores-vitimas-e-sao-pontos-chaves-para-decidir-a-taca-guanabara.ghtml?utm_source=globo.com&utm_medium=oglobo	Cano e Gabigol reencontram suas maiores vítimas e são pontos chaves para decidir a Taça Guanabara 	Pelo tricolor, argentino tem quatro gols em Fla-Flu, enquanto novo camisa 10 do rubro-negro tem 10 bolas na rede no clássico. Nesta quarta-feira, eles decidem a Taça Guanabara 	https://s2.glbimg.com/NsDJZtR4sWiQHOw-cXbwarh1Ifo=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/6/h/s2DX4YTQiCpTuTHzuL1A/1.png	2023-03-10 01:16:58.563745
19	1	teste	https://www.globo.com	globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento	globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento	https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png	2023-03-10 01:51:31.432064
21	6	Se liga nesse post #Maladrão, #mermão #abracadabra	https://www.globo.com/	globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento	globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento	https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png	2023-03-10 01:54:26.019593
28	11	asd	https://github.com/JeffMota/projeto18-linkr-backend/tree/feat/search	GitHub - JeffMota/projeto18-linkr-backend at feat/search	Contribute to JeffMota/projeto18-linkr-backend development by creating an account on GitHub.	https://opengraph.githubassets.com/0535d6b12f5e336f80ba2da35a43e8b9cc4669782b693526f18cad9ddd0b4baf/JeffMota/projeto18-linkr-backend	2023-03-10 06:50:14.304776
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: kjwqqunq
--

COPY public.tags ("postId", name, "mentionsNumber", "createdAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kjwqqunq
--

COPY public.users (id, username, email, password, "pictureUrl", "createdAt") FROM stdin;
1	mkvasconcelos	mateus@gmail.com	$2b$10$nRqs32Ju6tpvCwX5LfFtsecLDPFa0R0F9wI7xzwjRrgYyxE34HE5m	https://sdinovacoesgraficas.com.br/wp-content/uploads/2020/07/the-flash_2023-Costurado-1I1-CAPA1.png	2023-03-09 11:50:18.486839
2	leonardo hirano	leoa@leo.com	$2b$10$dIAId1qszre5xrA4ykBl1uVA1dzn8414THFTdlbpH4Bwodr.gN6PS	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM2dYtqPV1Fkg33FAiKI82b2okNVzcsxM7RQ&usqp=CAU	2023-03-09 12:08:46.804921
6	creito	creito@creito.com	$2b$10$BylonpaXm8490lN.RRhwROeoksUcjDOndWesoLdAWomnbxbMko7ei	https://i.imgur.com/WQcNQXg.jpeg	2023-03-09 18:38:56.567884
7	teste	teste@teste.com	$2b$10$UB9J6e3jRdnCpfG.k3FssOhrZYWsJnew0mKI9X.3qp.K0dmHh2noa	https://pict.sindonews.net/dyn/850/pena/news/2022/01/13/39/655579/harga-fotofoto-ghozali-bikin-melongo-ada-yang-laku-rp42-miliiar-fwx.jpg	2023-03-09 22:56:25.857291
8	telmo1	teo@driven.com.br	$2b$10$qu9e1kG2b6YTaNlTYle64.e9wZRW60siQPQzGYNzdrZiVqVt0t/t.	https://i.pinimg.com/originals/62/6c/7a/626c7a0592f19675ab406df83eb352e9.png	2023-03-09 22:57:28.09435
9	telmo2	teo@test.com	$2b$10$vPLQX7vNod5b1rXYUne1huLC7cXRNpPNKD9sMJBYRD9K0S6oFxD6S	https://i.pinimg.com/originals/62/6c/7a/626c7a0592f19675ab406df83eb352e9.png	2023-03-09 23:04:07.19314
11	jorge	jorge@jorge.com	$2b$10$8uhAJJpZ/8jS4KoCyTKD2.mWCn9KbgqaNxAUaXMJLZpSm66wmktHa	https://www.wisdomgeek.com/wp-content/uploads/2020/09/useContext-react-hook.jpg	2023-03-10 06:25:15.089507
12	ana	ana@gmail.com	$2b$10$qe7FUyXzrsYzixdo.HXd..wZDb1bwipF7cNARTZmmFSnAxa9YPrlm	https://www.pngitem.com/pimgs/m/88-883162_wonder-woman-transparent-wonder-woman-cartoon-png-png.png	2023-03-10 10:50:28.743729
13	Jefferson	jeff@email.com	$2b$10$oCFA.KOW41nPgA5t7vHRJetToO52gBW7IZYyMNRPBtrHZ3daWxpky	https://uploads.jovemnerd.com.br/wp-content/uploads/2023/03/anya__y3q1ops-1210x544.jpg	2023-03-10 12:10:54.071468
\.


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kjwqqunq
--

SELECT pg_catalog.setval('public.likes_id_seq', 8, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kjwqqunq
--

SELECT pg_catalog.setval('public.posts_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kjwqqunq
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: tags tags_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kjwqqunq
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT "tags_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    text character varying(144) NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT comments_text_check CHECK (((text)::text <> ''::text))
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    "followerId" integer NOT NULL,
    "followingId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT follows_check CHECK (("followerId" <> "followingId"))
);


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    "postId" integer NOT NULL,
    name text NOT NULL,
    "mentionsNumber" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT tags_name_check CHECK ((name <> ''::text))
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.follows VALUES (13, 1, '2023-03-23 18:29:58.17714');
INSERT INTO public.follows VALUES (13, 6, '2023-03-23 18:30:09.502402');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (2, 1, 16, '2023-03-10 03:13:37.431582');
INSERT INTO public.likes VALUES (3, 1, 28, '2023-03-10 10:49:41.452232');
INSERT INTO public.likes VALUES (7, 12, 28, '2023-03-10 11:51:19.107642');
INSERT INTO public.likes VALUES (8, 12, 17, '2023-03-10 11:57:22.158724');
INSERT INTO public.likes VALUES (10, 6, 28, '2023-03-10 17:44:06.275756');
INSERT INTO public.likes VALUES (14, 12, 29, '2023-03-10 22:03:12.814693');
INSERT INTO public.likes VALUES (16, 17, 31, '2023-03-10 22:47:20.027597');
INSERT INTO public.likes VALUES (21, 12, 31, '2023-03-10 22:57:47.686506');
INSERT INTO public.likes VALUES (24, 17, 29, '2023-03-10 23:01:19.629272');
INSERT INTO public.likes VALUES (25, 17, 28, '2023-03-10 23:01:21.767844');
INSERT INTO public.likes VALUES (44, 13, 29, '2023-03-21 12:23:53.551574');
INSERT INTO public.likes VALUES (51, 6, 39, '2023-03-22 21:22:47.657099');
INSERT INTO public.likes VALUES (58, 12, 39, '2023-03-22 22:55:07.956262');
INSERT INTO public.likes VALUES (60, 12, 42, '2023-03-22 23:41:18.149191');
INSERT INTO public.likes VALUES (61, 12, 41, '2023-03-22 23:41:21.721331');


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (16, 1, NULL, 'https://oglobo.globo.com/esportes/noticia/2023/03/cano-e-gabigol-reencontram-suas-maiores-vitimas-e-sao-pontos-chaves-para-decidir-a-taca-guanabara.ghtml?utm_source=globo.com&utm_medium=oglobo', 'Cano e Gabigol reencontram suas maiores vítimas e são pontos chaves para decidir a Taça Guanabara ', 'Pelo tricolor, argentino tem quatro gols em Fla-Flu, enquanto novo camisa 10 do rubro-negro tem 10 bolas na rede no clássico. Nesta quarta-feira, eles decidem a Taça Guanabara ', 'https://s2.glbimg.com/NsDJZtR4sWiQHOw-cXbwarh1Ifo=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/6/h/s2DX4YTQiCpTuTHzuL1A/1.png', '2023-03-10 01:16:04.725821');
INSERT INTO public.posts VALUES (17, 1, NULL, 'https://oglobo.globo.com/esportes/noticia/2023/03/cano-e-gabigol-reencontram-suas-maiores-vitimas-e-sao-pontos-chaves-para-decidir-a-taca-guanabara.ghtml?utm_source=globo.com&utm_medium=oglobo', 'Cano e Gabigol reencontram suas maiores vítimas e são pontos chaves para decidir a Taça Guanabara ', 'Pelo tricolor, argentino tem quatro gols em Fla-Flu, enquanto novo camisa 10 do rubro-negro tem 10 bolas na rede no clássico. Nesta quarta-feira, eles decidem a Taça Guanabara ', 'https://s2.glbimg.com/NsDJZtR4sWiQHOw-cXbwarh1Ifo=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/6/h/s2DX4YTQiCpTuTHzuL1A/1.png', '2023-03-10 01:16:58.563745');
INSERT INTO public.posts VALUES (19, 1, 'teste', 'https://www.globo.com', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-10 01:51:31.432064');
INSERT INTO public.posts VALUES (21, 6, 'Se liga nesse post #Maladrão, #mermão #abracadabra', 'https://www.globo.com/', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-10 01:54:26.019593');
INSERT INTO public.posts VALUES (28, 11, 'asd', 'https://github.com/JeffMota/projeto18-linkr-backend/tree/feat/search', 'GitHub - JeffMota/projeto18-linkr-backend at feat/search', 'Contribute to JeffMota/projeto18-linkr-backend development by creating an account on GitHub.', 'https://opengraph.githubassets.com/0535d6b12f5e336f80ba2da35a43e8b9cc4669782b693526f18cad9ddd0b4baf/JeffMota/projeto18-linkr-backend', '2023-03-10 06:50:14.304776');
INSERT INTO public.posts VALUES (29, 6, 'Mais um post #Maladrão, mermão #abracadabra', 'https://www.globo.com/', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-10 20:48:48.639767');
INSERT INTO public.posts VALUES (31, 17, 'teste ', 'https://github.com/Leonardoyusuke/Projeto-18---Projet-o-Linkr-Frontend', 'GitHub - Leonardoyusuke/Projeto-18---Projet-o-Linkr-Frontend', 'Contribute to Leonardoyusuke/Projeto-18---Projet-o-Linkr-Frontend development by creating an account on GitHub.', 'https://opengraph.githubassets.com/9e762353da92e5cbc936e6fafd3d375a507b166c2dc7083d36a6f352dcc94448/Leonardoyusuke/Projeto-18---Projet-o-Linkr-Frontend', '2023-03-10 22:11:20.399793');
INSERT INTO public.posts VALUES (36, 8, 'driven', 'https://www.google.com', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-10 23:14:50.380345');
INSERT INTO public.posts VALUES (39, 13, '#algumacoisa', 'https://ge.globo.com/sp/futebol/noticia/2023/03/22/a-vez-do-agua-santa-veja-16-times-zebras-que-chocaram-o-pais-com-titulos-estaduais.ghtml', 'A vez do Água Santa? Veja 16 zebras que chocaram o país com títulos estaduais', 'Netuno tenta desbancar o favorito Palmeiras na decisão do Paulistão. No Campeonato Baiano, o Jacuipense vai encarar o Bahia ', 'https://s2.glbimg.com/TvzjqiGA8yYBT1i031IsjnKqG1Q=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2023/N/A/AX604ZRZaTSbzST06xXQ/agif2303202329181.jpg', '2023-03-22 12:10:24.538947');
INSERT INTO public.posts VALUES (41, 1, NULL, 'https://www.globo.com/', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-22 23:04:44.304297');
INSERT INTO public.posts VALUES (42, 1, NULL, 'https://www.globo.com/', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-22 23:06:13.262759');
INSERT INTO public.posts VALUES (44, 1, NULL, 'https://www.globo.com/', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento', 'https://s3.glbimg.com/v1/AUTH_fd78dc4be9404a2e92b908ade306e9e6/prod/globocom_opengraph.png', '2023-03-22 23:42:24.67984');


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'mkvasconcelos', 'mateus@gmail.com', '$2b$10$nRqs32Ju6tpvCwX5LfFtsecLDPFa0R0F9wI7xzwjRrgYyxE34HE5m', 'https://sdinovacoesgraficas.com.br/wp-content/uploads/2020/07/the-flash_2023-Costurado-1I1-CAPA1.png', '2023-03-09 11:50:18.486839');
INSERT INTO public.users VALUES (2, 'leonardo hirano', 'leoa@leo.com', '$2b$10$dIAId1qszre5xrA4ykBl1uVA1dzn8414THFTdlbpH4Bwodr.gN6PS', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM2dYtqPV1Fkg33FAiKI82b2okNVzcsxM7RQ&usqp=CAU', '2023-03-09 12:08:46.804921');
INSERT INTO public.users VALUES (6, 'creito', 'creito@creito.com', '$2b$10$BylonpaXm8490lN.RRhwROeoksUcjDOndWesoLdAWomnbxbMko7ei', 'https://i.imgur.com/WQcNQXg.jpeg', '2023-03-09 18:38:56.567884');
INSERT INTO public.users VALUES (7, 'teste', 'teste@teste.com', '$2b$10$UB9J6e3jRdnCpfG.k3FssOhrZYWsJnew0mKI9X.3qp.K0dmHh2noa', 'https://pict.sindonews.net/dyn/850/pena/news/2022/01/13/39/655579/harga-fotofoto-ghozali-bikin-melongo-ada-yang-laku-rp42-miliiar-fwx.jpg', '2023-03-09 22:56:25.857291');
INSERT INTO public.users VALUES (8, 'telmo1', 'teo@driven.com.br', '$2b$10$qu9e1kG2b6YTaNlTYle64.e9wZRW60siQPQzGYNzdrZiVqVt0t/t.', 'https://i.pinimg.com/originals/62/6c/7a/626c7a0592f19675ab406df83eb352e9.png', '2023-03-09 22:57:28.09435');
INSERT INTO public.users VALUES (9, 'telmo2', 'teo@test.com', '$2b$10$vPLQX7vNod5b1rXYUne1huLC7cXRNpPNKD9sMJBYRD9K0S6oFxD6S', 'https://i.pinimg.com/originals/62/6c/7a/626c7a0592f19675ab406df83eb352e9.png', '2023-03-09 23:04:07.19314');
INSERT INTO public.users VALUES (11, 'jorge', 'jorge@jorge.com', '$2b$10$8uhAJJpZ/8jS4KoCyTKD2.mWCn9KbgqaNxAUaXMJLZpSm66wmktHa', 'https://www.wisdomgeek.com/wp-content/uploads/2020/09/useContext-react-hook.jpg', '2023-03-10 06:25:15.089507');
INSERT INTO public.users VALUES (12, 'ana', 'ana@gmail.com', '$2b$10$qe7FUyXzrsYzixdo.HXd..wZDb1bwipF7cNARTZmmFSnAxa9YPrlm', 'https://www.pngitem.com/pimgs/m/88-883162_wonder-woman-transparent-wonder-woman-cartoon-png-png.png', '2023-03-10 10:50:28.743729');
INSERT INTO public.users VALUES (13, 'Jefferson', 'jeff@email.com', '$2b$10$oCFA.KOW41nPgA5t7vHRJetToO52gBW7IZYyMNRPBtrHZ3daWxpky', 'https://uploads.jovemnerd.com.br/wp-content/uploads/2023/03/anya__y3q1ops-1210x544.jpg', '2023-03-10 12:10:54.071468');
INSERT INTO public.users VALUES (14, 'ahhhh', 'ahhh@a.com', '$2b$10$5zLFkbMVV71OCfyZux1vC.pc6r3mvAyUnhgjqv22FuYQCtp.tlK7.', 'https://www.researchgate.net/publication/257754474/figure/fig4/AS:435933968375811@1480946165799/Figura-5-El-Grito-1893-el-cuadro-mas-famoso-de-Munch.png', '2023-03-10 22:01:27.704622');
INSERT INTO public.users VALUES (15, 'clone do creito', 'ahhh@aa.com', '$2b$10$B2evglbFnmBST2i4qiQDZ.1m0WE6G/EZjOi/eSzLwP5nJBZFHXgci', 'https://www.researchgate.net/publication/257754474/figure/fig4/AS:435933968375811@1480946165799/Figura-5-El-Grito-1893-el-cuadro-mas-famoso-de-Munch.png', '2023-03-10 22:05:59.530492');
INSERT INTO public.users VALUES (16, 'cleiton rasta', 'ahhh@teste.com', '$2b$10$/kLNX5yOcUy0ukGIENNwA.4thND2FsxRiOyHJJQAbwx2mRMYaHcSG', 'https://pbs.twimg.com/profile_images/562980018712616960/gF1X2twf_400x400.jpeg', '2023-03-10 22:07:51.412592');
INSERT INTO public.users VALUES (17, 'CLEITON RASTA', 'ahhh@testeAA.com', '$2b$10$QTW7iXvZHUBZLXvJajOVe.OXEIFfPktX8a1/ZRglsJat/Gng1wTHq', 'https://pbs.twimg.com/profile_images/562980018712616960/gF1X2twf_400x400.jpeg', '2023-03-10 22:10:01.644273');
INSERT INTO public.users VALUES (18, 'teste2', 'teste1@teste.com', '$2b$10$tM.z84.tq8SS4ZhJSyTq0uvfufl6U3JPNFd7IWNhK.38NAWk1pnXO', 'https://yt3.ggpht.com/ytc/AL5GRJVg4yl4GY1JR109kFhP21l_pA_xQpvt14khgN87=s88-c-k-c0x00ffffff-no-rj', '2023-03-21 23:15:35.676643');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 62, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 44, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: follows follows_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public.users(id);


--
-- Name: follows follows_followingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES public.users(id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: tags tags_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT "tags_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--


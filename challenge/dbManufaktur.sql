--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: komponen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.komponen (
    id_komponen bigint NOT NULL,
    komponen character varying(50) NOT NULL,
    deskripsi text NOT NULL
);


ALTER TABLE public.komponen OWNER TO postgres;

--
-- Name: komponen_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.komponen_detail (
    id bigint NOT NULL,
    id_produk integer,
    id_komponen integer,
    id_pemasok integer
);


ALTER TABLE public.komponen_detail OWNER TO postgres;

--
-- Name: komponen_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.komponen_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.komponen_detail_id_seq OWNER TO postgres;

--
-- Name: komponen_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.komponen_detail_id_seq OWNED BY public.komponen_detail.id;


--
-- Name: komponen_id_komponen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.komponen_id_komponen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.komponen_id_komponen_seq OWNER TO postgres;

--
-- Name: komponen_id_komponen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.komponen_id_komponen_seq OWNED BY public.komponen.id_komponen;


--
-- Name: pemasok; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pemasok (
    id_pemasok bigint NOT NULL,
    pemasok character varying(50) NOT NULL
);


ALTER TABLE public.pemasok OWNER TO postgres;

--
-- Name: pemasok_id_pemasok_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pemasok_id_pemasok_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pemasok_id_pemasok_seq OWNER TO postgres;

--
-- Name: pemasok_id_pemasok_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pemasok_id_pemasok_seq OWNED BY public.pemasok.id_pemasok;


--
-- Name: produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produk (
    id_produk bigint NOT NULL,
    nama_produk character varying(50) NOT NULL,
    kuantitas integer NOT NULL
);


ALTER TABLE public.produk OWNER TO postgres;

--
-- Name: produk_id_produk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produk_id_produk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produk_id_produk_seq OWNER TO postgres;

--
-- Name: produk_id_produk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produk_id_produk_seq OWNED BY public.produk.id_produk;


--
-- Name: komponen id_komponen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen ALTER COLUMN id_komponen SET DEFAULT nextval('public.komponen_id_komponen_seq'::regclass);


--
-- Name: komponen_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen_detail ALTER COLUMN id SET DEFAULT nextval('public.komponen_detail_id_seq'::regclass);


--
-- Name: pemasok id_pemasok; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemasok ALTER COLUMN id_pemasok SET DEFAULT nextval('public.pemasok_id_pemasok_seq'::regclass);


--
-- Name: produk id_produk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk ALTER COLUMN id_produk SET DEFAULT nextval('public.produk_id_produk_seq'::regclass);


--
-- Data for Name: komponen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.komponen (id_komponen, komponen, deskripsi) FROM stdin;
1	busi	busi terbaik
2	sein	sein sop
3	head unit	head unit digital
4	suspensi	suspensi terempuk
\.


--
-- Data for Name: komponen_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.komponen_detail (id, id_produk, id_komponen, id_pemasok) FROM stdin;
1	1	1	2
2	3	4	1
3	2	3	1
4	2	1	1
5	3	2	1
\.


--
-- Data for Name: pemasok; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pemasok (id_pemasok, pemasok) FROM stdin;
1	Honda
2	Mitshubisi
3	Nasmoco
\.


--
-- Data for Name: produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produk (id_produk, nama_produk, kuantitas) FROM stdin;
1	Pajero	10
2	Avanza	20
3	Civic	5
\.


--
-- Name: komponen_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.komponen_detail_id_seq', 5, true);


--
-- Name: komponen_id_komponen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.komponen_id_komponen_seq', 4, true);


--
-- Name: pemasok_id_pemasok_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pemasok_id_pemasok_seq', 3, true);


--
-- Name: produk_id_produk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produk_id_produk_seq', 4, true);


--
-- Name: komponen_detail komponen_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen_detail
    ADD CONSTRAINT komponen_detail_pkey PRIMARY KEY (id);


--
-- Name: komponen komponen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen
    ADD CONSTRAINT komponen_pkey PRIMARY KEY (id_komponen);


--
-- Name: pemasok pemasok_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemasok
    ADD CONSTRAINT pemasok_pkey PRIMARY KEY (id_pemasok);


--
-- Name: produk produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk
    ADD CONSTRAINT produk_pkey PRIMARY KEY (id_produk);


--
-- Name: komponen_detail FK_komponen_detail.id_komponen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen_detail
    ADD CONSTRAINT "FK_komponen_detail.id_komponen" FOREIGN KEY (id_komponen) REFERENCES public.komponen(id_komponen);


--
-- Name: komponen_detail FK_komponen_detail.id_pemasok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen_detail
    ADD CONSTRAINT "FK_komponen_detail.id_pemasok" FOREIGN KEY (id_pemasok) REFERENCES public.pemasok(id_pemasok);


--
-- Name: komponen_detail FK_komponen_detail.id_produk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komponen_detail
    ADD CONSTRAINT "FK_komponen_detail.id_produk" FOREIGN KEY (id_produk) REFERENCES public.produk(id_produk);


--
-- PostgreSQL database dump complete
--


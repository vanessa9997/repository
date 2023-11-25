--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-24 15:20:05

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
-- TOC entry 214 (class 1259 OID 16399)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying NOT NULL,
    password text NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16476)
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.owners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.owners_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pets (
    id_pet integer NOT NULL,
    pet_name character varying(20) NOT NULL,
    id_owner integer NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE public.pets OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16475)
-- Name: pets_id_pet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pets ALTER COLUMN id_pet ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pets_id_pet_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3325 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, name, password, email) FROM stdin;
1	Tomek	$2y$10$SBfCfh/7zcM65tUIPmG9i.xm6riZE5fp7WHgARongN3wIxqTfE2dq	tomek123@gmail.com
2	Marek	$2y$10$E8KFBPbVxG18SAe68n3I/utBIBgKwQQltH3ZC1HNZ/QfpxoCaalAy	marek123@gmail.com
\.


--
-- TOC entry 3326 (class 0 OID 16404)
-- Dependencies: 215
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pets (id_pet, pet_name, id_owner, type) FROM stdin;
2	Max	1	pies
3	Adso	1	kot
8	James	1	kot
1	Rex	2	pies
11	Archie	2	piesek
17	Sammy	1	żółw
19	Charlie	2	pies
\.


--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 3, false);


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 216
-- Name: pets_id_pet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_id_pet_seq', 19, true);


--
-- TOC entry 3179 (class 2606 OID 16403)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- TOC entry 3181 (class 2606 OID 16408)
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id_pet);


--
-- TOC entry 3182 (class 2606 OID 16409)
-- Name: pets pets_id_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_id_owner_fkey FOREIGN KEY (id_owner) REFERENCES public.owners(id);


-- Completed on 2023-06-24 15:20:05

--
-- PostgreSQL database dump complete
--


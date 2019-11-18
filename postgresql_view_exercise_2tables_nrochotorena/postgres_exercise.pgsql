--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    emp_num integer NOT NULL,
    emp_fname text NOT NULL,
    emp_lname text NOT NULL,
    emp_initial text,
    emp_address text,
    emp_dob date
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.training (
    id integer NOT NULL,
    trai_num integer NOT NULL,
    trai_location text NOT NULL,
    trai_num_employee integer NOT NULL,
    employee_id integer
);


ALTER TABLE public.training OWNER TO postgres;

--
-- Name: otm_exercise; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.otm_exercise AS
 SELECT employee.id AS employee_id_,
    employee.emp_num,
    employee.emp_fname,
    employee.emp_lname,
    training.id AS training_id,
    training.trai_num,
    training.trai_location,
    training.trai_num_employee,
    training.employee_id
   FROM (public.employee
     JOIN public.training ON ((employee.id = training.id)));


ALTER TABLE public.otm_exercise OWNER TO postgres;

--
-- Name: training_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.training_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_id_seq OWNER TO postgres;

--
-- Name: training_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.training_id_seq OWNED BY public.training.id;


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: training id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training ALTER COLUMN id SET DEFAULT nextval('public.training_id_seq'::regclass);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob) FROM stdin;
1	2019000	Albert	Yao	A	Taguig City	1996-10-25
2	2019001	Bianca	Yu	B	Pasay City	1993-05-20
\.


--
-- Data for Name: training; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.training (id, trai_num, trai_location, trai_num_employee, employee_id) FROM stdin;
1	19000	Makati City	2019000	1
2	19001	Makati City	2019001	2
\.


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 2, true);


--
-- Name: training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.training_id_seq', 2, true);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: training training_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training
    ADD CONSTRAINT training_pkey PRIMARY KEY (id);


--
-- Name: training training_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training
    ADD CONSTRAINT training_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- PostgreSQL database dump complete
--


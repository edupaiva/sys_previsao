--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1

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
-- Name: tempo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tempo;


ALTER SCHEMA tempo OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clientes; Type: TABLE; Schema: tempo; Owner: postgres
--

CREATE TABLE tempo.clientes (
    cli_id integer NOT NULL,
    cli_nome character varying,
    cli_cpf character varying,
    cli_nascimento date,
    cli_data_cadastro date DEFAULT now()
);


ALTER TABLE tempo.clientes OWNER TO postgres;

--
-- Name: clientes_cli_id_seq; Type: SEQUENCE; Schema: tempo; Owner: postgres
--

CREATE SEQUENCE tempo.clientes_cli_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo.clientes_cli_id_seq OWNER TO postgres;

--
-- Name: clientes_cli_id_seq; Type: SEQUENCE OWNED BY; Schema: tempo; Owner: postgres
--

ALTER SEQUENCE tempo.clientes_cli_id_seq OWNED BY tempo.clientes.cli_id;


--
-- Name: funcionarios; Type: TABLE; Schema: tempo; Owner: postgres
--

CREATE TABLE tempo.funcionarios (
    fun_id integer NOT NULL,
    fun_nome character varying,
    fun_cpf character varying,
    fun_nascimento date,
    fun_data_cadastro date DEFAULT now()
);


ALTER TABLE tempo.funcionarios OWNER TO postgres;

--
-- Name: funcionarios_fun_id_seq; Type: SEQUENCE; Schema: tempo; Owner: postgres
--

CREATE SEQUENCE tempo.funcionarios_fun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo.funcionarios_fun_id_seq OWNER TO postgres;

--
-- Name: funcionarios_fun_id_seq; Type: SEQUENCE OWNED BY; Schema: tempo; Owner: postgres
--

ALTER SEQUENCE tempo.funcionarios_fun_id_seq OWNED BY tempo.funcionarios.fun_id;


SET default_tablespace = space_geral;

--
-- Name: pedido; Type: TABLE; Schema: tempo; Owner: postgres; Tablespace: space_geral
--

CREATE TABLE tempo.pedido (
    ped_codigo integer NOT NULL,
    ped_cliente integer NOT NULL,
    ped_funcionario_id integer NOT NULL,
    ped_data timestamp without time zone NOT NULL
);


ALTER TABLE tempo.pedido OWNER TO postgres;

--
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE; Schema: tempo; Owner: postgres
--

CREATE SEQUENCE tempo.pedido_ped_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo.pedido_ped_codigo_seq OWNER TO postgres;

--
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE OWNED BY; Schema: tempo; Owner: postgres
--

ALTER SEQUENCE tempo.pedido_ped_codigo_seq OWNED BY tempo.pedido.ped_codigo;


--
-- Name: user; Type: TABLE; Schema: tempo; Owner: postgres; Tablespace: space_geral
--

CREATE TABLE tempo."user" (
    id integer NOT NULL,
    login character varying,
    password character varying(32)
);


ALTER TABLE tempo."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: tempo; Owner: postgres
--

CREATE SEQUENCE tempo.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: tempo; Owner: postgres
--

ALTER SEQUENCE tempo.user_id_seq OWNED BY tempo."user".id;


--
-- Name: clientes cli_id; Type: DEFAULT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.clientes ALTER COLUMN cli_id SET DEFAULT nextval('tempo.clientes_cli_id_seq'::regclass);


--
-- Name: funcionarios fun_id; Type: DEFAULT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.funcionarios ALTER COLUMN fun_id SET DEFAULT nextval('tempo.funcionarios_fun_id_seq'::regclass);


--
-- Name: pedido ped_codigo; Type: DEFAULT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.pedido ALTER COLUMN ped_codigo SET DEFAULT nextval('tempo.pedido_ped_codigo_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo."user" ALTER COLUMN id SET DEFAULT nextval('tempo.user_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: tempo; Owner: postgres
--

COPY tempo.clientes (cli_id, cli_nome, cli_cpf, cli_nascimento, cli_data_cadastro) FROM stdin;
3	\N	\N	2021-12-22	2021-12-13
1	Eduardo Paiva	61866733320	1980-05-29	2021-12-10
2	Vera Nice	23423423	2022-01-06	2021-12-10
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: tempo; Owner: postgres
--

COPY tempo.funcionarios (fun_id, fun_nome, fun_cpf, fun_nascimento, fun_data_cadastro) FROM stdin;
1	joao	2345235	2021-12-16	2021-12-14
2	daniel	6549874314	2021-12-29	2021-12-31
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: tempo; Owner: postgres
--

COPY tempo.pedido (ped_codigo, ped_cliente, ped_funcionario_id, ped_data) FROM stdin;
3	3	1	2021-12-10 00:00:00
1	1	2	2021-12-10 00:00:00
4	2	1	2021-12-10 10:49:00
5	2	2	2021-12-10 10:54:00
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: tempo; Owner: postgres
--

COPY tempo."user" (id, login, password) FROM stdin;
1	eduardo	202cb962ac59075b964b07152d234b70
2	julianna	123
3	joao	teste
\.


--
-- Name: clientes_cli_id_seq; Type: SEQUENCE SET; Schema: tempo; Owner: postgres
--

SELECT pg_catalog.setval('tempo.clientes_cli_id_seq', 3, true);


--
-- Name: funcionarios_fun_id_seq; Type: SEQUENCE SET; Schema: tempo; Owner: postgres
--

SELECT pg_catalog.setval('tempo.funcionarios_fun_id_seq', 2, true);


--
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE SET; Schema: tempo; Owner: postgres
--

SELECT pg_catalog.setval('tempo.pedido_ped_codigo_seq', 5, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: tempo; Owner: postgres
--

SELECT pg_catalog.setval('tempo.user_id_seq', 3, true);


SET default_tablespace = '';

--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cli_id);


--
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (fun_id);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (ped_codigo);


--
-- Name: pedido ped_cliente; Type: FK CONSTRAINT; Schema: tempo; Owner: postgres
--

ALTER TABLE ONLY tempo.pedido
    ADD CONSTRAINT ped_cliente FOREIGN KEY (ped_cliente) REFERENCES tempo.clientes(cli_id);


--
-- PostgreSQL database dump complete
--


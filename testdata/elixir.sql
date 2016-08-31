--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: motivations; Type: TABLE; Schema: public; Owner: owncloud; Tablespace: 
--

CREATE TABLE motivations (
    id integer NOT NULL,
    content character varying(255),
    priority integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE motivations OWNER TO owncloud;

--
-- Name: motivations_id_seq; Type: SEQUENCE; Schema: public; Owner: owncloud
--

CREATE SEQUENCE motivations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE motivations_id_seq OWNER TO owncloud;

--
-- Name: motivations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owncloud
--

ALTER SEQUENCE motivations_id_seq OWNED BY motivations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: owncloud; Tablespace: 
--

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


ALTER TABLE schema_migrations OWNER TO owncloud;

--
-- Name: training; Type: TABLE; Schema: public; Owner: owncloud; Tablespace: 
--

CREATE TABLE training (
    id integer NOT NULL,
    "user" character varying(255),
    description character varying(255),
    version integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE training OWNER TO owncloud;

--
-- Name: training_id_seq; Type: SEQUENCE; Schema: public; Owner: owncloud
--

CREATE SEQUENCE training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE training_id_seq OWNER TO owncloud;

--
-- Name: training_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owncloud
--

ALTER SEQUENCE training_id_seq OWNED BY training.id;


--
-- Name: weight; Type: TABLE; Schema: public; Owner: owncloud; Tablespace: 
--

CREATE TABLE weight (
    id integer NOT NULL,
    "user" character varying(255),
    weight double precision,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE weight OWNER TO owncloud;

--
-- Name: weight_id_seq; Type: SEQUENCE; Schema: public; Owner: owncloud
--

CREATE SEQUENCE weight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE weight_id_seq OWNER TO owncloud;

--
-- Name: weight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owncloud
--

ALTER SEQUENCE weight_id_seq OWNED BY weight.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: owncloud
--

ALTER TABLE ONLY motivations ALTER COLUMN id SET DEFAULT nextval('motivations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: owncloud
--

ALTER TABLE ONLY training ALTER COLUMN id SET DEFAULT nextval('training_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: owncloud
--

ALTER TABLE ONLY weight ALTER COLUMN id SET DEFAULT nextval('weight_id_seq'::regclass);


--
-- Data for Name: motivations; Type: TABLE DATA; Schema: public; Owner: owncloud
--

COPY motivations (id, content, priority, inserted_at, updated_at) FROM stdin;
2	Endelig begynner du å trene!	2	2015-05-30 18:30:07	2015-05-30 18:30:07
3	Det burde vises snart!	3	2015-05-30 18:30:19	2015-05-30 18:30:19
4	De muskler kommer (sikker snart)!	4	2015-05-30 18:30:31	2015-05-30 18:30:31
5	De muskler kommer (snart)!	5	2015-05-30 18:30:45	2015-05-30 18:30:45
6	Woki mit dem popo! (over halftime, wow)	6	2015-05-30 18:30:54	2015-05-30 18:30:54
7	Yeah! You work out	7	2015-05-30 18:31:04	2015-05-30 18:31:12
8	Småsmerter er ingen smerter	8	2015-05-30 18:31:24	2015-05-30 18:31:24
9	Fortsetter å jobbe så hardt!	9	2015-05-30 18:31:34	2015-05-30 18:31:34
12	Yes! Veien til målet er veldig kort!	12	2015-05-30 18:32:27	2015-05-30 18:33:34
13	Bra jobb du er nesten der!	13	2015-05-30 18:32:43	2015-06-08 18:32:26
10	Over 70% fitness guru here I come	10	2015-05-30 18:31:44	2015-07-17 06:56:48
14	Helt utrolig!!! 60 treninger er så sykt mange (også vant du seff!!!)	99	2015-06-13 13:06:23	2015-07-30 20:39:13
11	Du gjør en skikkelig bra jobb! Snart har du vunnet!	11	2015-05-30 18:32:06	2015-07-30 20:40:16
1	Get your lazy ass up from the sofa!	1	2015-05-30 18:29:52	2015-08-17 13:53:42
\.


--
-- Name: motivations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owncloud
--

SELECT pg_catalog.setval('motivations_id_seq', 14, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: owncloud
--

COPY schema_migrations (version, inserted_at) FROM stdin;
20150529205807	2015-05-30 12:22:10
20150529210420	2015-05-30 12:22:10
20150529210448	2015-05-30 12:22:10
20150530071409	2015-05-30 12:22:10
\.


--
-- Data for Name: training; Type: TABLE DATA; Schema: public; Owner: owncloud
--

COPY training (id, "user", description, version, inserted_at, updated_at) FROM stdin;
1	bla@gmail.com	Fresh	0	2014-07-10 00:50:52	2014-07-10 00:50:52
\.


--
-- Name: training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owncloud
--

SELECT pg_catalog.setval('training_id_seq', 193, true);


--
-- Data for Name: weight; Type: TABLE DATA; Schema: public; Owner: owncloud
--

COPY weight (id, "user", weight, inserted_at, updated_at) FROM stdin;
1	bla@gmail.com	87.9000015258789062	2014-07-16 07:21:25	2014-07-16 07:21:25
\.


--
-- Name: weight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owncloud
--

SELECT pg_catalog.setval('weight_id_seq', 30, true);


--
-- Name: motivations_pkey; Type: CONSTRAINT; Schema: public; Owner: owncloud; Tablespace: 
--

ALTER TABLE ONLY motivations
    ADD CONSTRAINT motivations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: owncloud; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: training_pkey; Type: CONSTRAINT; Schema: public; Owner: owncloud; Tablespace: 
--

ALTER TABLE ONLY training
    ADD CONSTRAINT training_pkey PRIMARY KEY (id);


--
-- Name: weight_pkey; Type: CONSTRAINT; Schema: public; Owner: owncloud; Tablespace: 
--

ALTER TABLE ONLY weight
    ADD CONSTRAINT weight_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


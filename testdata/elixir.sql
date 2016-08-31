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
1	kjersti.b.rygg@gmail.com	Fresh	0	2014-07-10 00:50:52	2014-07-10 00:50:52
2	mkrallinger@gmail.com	Jelena fredh	0	2014-10-20 23:42:59	2014-10-20 23:42:59
3	mkrallinger@gmail.com	Fresh	0	2014-07-10 00:51:04	2014-07-10 00:51:04
4	kjersti.b.rygg@gmail.com	SaikoStyrketreningFresh	0	2014-07-10 01:02:30	2014-07-10 01:02:30
5	mkrallinger@gmail.com	400 opp 1300 nede	0	2014-07-21 19:49:34	2014-07-21 19:49:34
6	kjersti.b.rygg@gmail.com	Mandagsyoga p hode og hender	1	2015-03-30 21:31:07	2015-03-30 21:31:07
7	mkrallinger@gmail.com	Fresh	0	2014-07-10 00:51:00	2014-07-10 00:51:00
8	mkrallinger@gmail.com	fresh	0	2014-07-30 18:29:03	2014-07-30 18:29:03
9	kjersti.b.rygg@gmail.com	Linderudkollen 14km	1	2015-05-24 15:25:46	2015-05-24 15:25:46
10	kjersti.b.rygg@gmail.com	sndagslangrenn	1	2015-02-08 13:22:39	2015-02-08 13:22:39
11	mkrallinger@gmail.com	Hemsedal	1	2015-02-01 09:57:49	2015-02-01 09:57:49
12	mkrallinger@gmail.com	fresh	0	2014-09-17 21:32:50	2014-09-17 21:32:50
13	mkrallinger@gmail.com	Fotball som breker beina	1	2015-04-10 20:38:31	2015-04-10 20:38:31
14	mkrallinger@gmail.com	fresh	0	2014-07-28 23:02:21	2014-07-28 23:02:21
15	kjersti.b.rygg@gmail.com	4x4-smell	0	2014-07-30 18:02:12	2014-07-30 18:02:12
16	kjersti.b.rygg@gmail.com	Laaaaang gtur med Ane Aarre	0	2014-09-10 06:50:14	2014-09-10 06:50:14
17	kjersti.b.rygg@gmail.com	Siste trening fr sentrumslpet!5km	1	2015-04-21 21:17:03	2015-04-21 21:17:03
18	kjersti.b.rygg@gmail.com	uke 3 fresh	1	2015-02-08 13:19:52	2015-02-08 13:19:52
19	kjersti.b.rygg@gmail.com	Nedoverbakkehelvete Juvasshytta-Galdhpiggen-Spiterstulen. NEVERAGAIN!!	0	2014-07-21 20:46:10	2014-07-21 20:46:10
20	mkrallinger@gmail.com	Fresh	0	2014-07-10 00:14:28	2014-07-10 00:14:28
21	kjersti.b.rygg@gmail.com	Skitur med far (1 mil)	1	2015-02-16 19:18:44	2015-02-16 19:18:44
22	kjersti.b.rygg@gmail.com	Soooo Fresh!	0	2014-10-14 18:50:45	2014-10-14 18:50:45
23	kjersti.b.rygg@gmail.com	Leirvassbu-Olavsbu 4,5t	0	2014-07-25 17:46:03	2014-07-25 17:46:03
24	kjersti.b.rygg@gmail.com	Fredagsyoga	1	2015-02-13 17:10:25	2015-02-13 17:10:25
25	kjersti.b.rygg@gmail.com	Sooo fresh!	0	2014-11-19 07:03:04	2014-11-19 07:03:04
26	kjersti.b.rygg@gmail.com	Fresh	0	2014-07-10 00:50:45	2014-07-10 00:50:45
27	mkrallinger@gmail.com	fussball	0	2014-09-14 13:07:06	2014-09-14 13:07:06
28	mkrallinger@gmail.com	fresher 4x4	0	2014-08-05 18:17:39	2014-08-05 18:17:39
29	kjersti.b.rygg@gmail.com	yeeehaaa, FRESH!	0	2014-10-07 21:58:46	2014-10-07 21:58:46
30	kjersti.b.rygg@gmail.com	Fresh	0	2014-07-10 00:50:38	2014-07-10 00:50:38
31	mkrallinger@gmail.com	Langlaufen	1	2015-02-08 13:22:25	2015-02-08 13:22:25
32	mkrallinger@gmail.com	55min, 7.5km	1	2015-05-07 20:25:17	2015-05-07 20:25:17
33	kjersti.b.rygg@gmail.com	Sooo freeeesh! 4km + styrke	1	2015-03-17 19:11:25	2015-03-17 19:11:25
34	mkrallinger@gmail.com	olavshytte	0	2014-07-25 17:47:53	2014-07-25 17:47:53
35	mkrallinger@gmail.com	fresh	0	2014-07-17 19:46:44	2014-07-17 19:46:44
36	kjersti.b.rygg@gmail.com	Fresh	0	2014-07-10 00:50:33	2014-07-10 00:50:33
37	kjersti.b.rygg@gmail.com	Fredagsfresh!	1	2015-02-08 13:09:46	2015-02-08 13:09:46
38	mkrallinger@gmail.com	lazy fresh	0	2014-08-10 23:16:14	2014-08-10 23:16:14
39	mkrallinger@gmail.com	Fussball	1	2015-03-11 08:50:03	2015-03-11 08:50:03
40	kjersti.b.rygg@gmail.com	tirsdagsfresh med lisbeth	0	2014-12-02 18:05:41	2014-12-02 18:05:41
41	mkrallinger@gmail.com	fresher 4x4	0	2014-09-22 19:23:42	2014-09-22 19:23:42
42	kjersti.b.rygg@gmail.com	Tirsdagsfresh!	1	2015-02-08 13:09:19	2015-02-08 13:09:19
43	mkrallinger@gmail.com	Freesh	1	2015-03-28 20:13:44	2015-03-28 20:13:44
44	kjersti.b.rygg@gmail.com	Fresh	0	2014-07-10 00:50:41	2014-07-10 00:50:41
45	mkrallinger@gmail.com	14km wandern	1	2015-05-24 15:25:26	2015-05-24 15:25:26
46	mkrallinger@gmail.com	fussball	0	2014-09-06 13:08:24	2014-09-06 13:08:24
47	kjersti.b.rygg@gmail.com	10km 	1	2015-05-17 19:06:22	2015-05-17 19:06:22
48	mkrallinger@gmail.com	Fussball	0	2014-10-11 13:08:24	2014-10-11 13:08:24
49	kjersti.b.rygg@gmail.com	Spiterstulen-Leirvassbu 17km	0	2014-07-25 17:45:06	2014-07-25 17:45:06
50	kjersti.b.rygg@gmail.com	8km! 1time!	1	2015-03-20 17:22:34	2015-03-20 17:22:34
51	mkrallinger@gmail.com	60min, 8.5 km	1	2015-05-21 23:10:36	2015-05-21 23:10:36
52	kjersti.b.rygg@gmail.com	5km restitusjonslping (37,5 min)	1	2015-02-10 18:29:21	2015-02-10 18:29:21
53	mkrallinger@gmail.com	fresh	0	2014-07-14 19:32:10	2014-07-14 19:32:10
54	mkrallinger@gmail.com	Fussball	1	2015-03-28 20:13:33	2015-03-28 20:13:33
55	mkrallinger@gmail.com	tur	0	2014-09-14 13:07:18	2014-09-14 13:07:18
56	mkrallinger@gmail.com	Fussball	0	2014-10-17 08:00:50	2014-10-17 08:00:50
57	mkrallinger@gmail.com	fresh!!!!!	1	2015-01-28 20:53:31	2015-01-28 20:53:31
58	mkrallinger@gmail.com	Fresh	0	2014-10-14 18:50:18	2014-10-14 18:50:18
59	kjersti.b.rygg@gmail.com	Trappetrening med smund	0	2014-07-14 21:55:00	2014-07-14 21:55:00
60	mkrallinger@gmail.com	Fussball	0	2014-12-04 20:57:07	2014-12-04 20:57:07
61	mkrallinger@gmail.com	Langlaufen	1	2015-03-28 20:13:57	2015-03-28 20:13:57
62	mkrallinger@gmail.com	60 min, 8.5 km	1	2015-05-21 07:22:30	2015-05-21 07:22:30
63	mkrallinger@gmail.com	fresh	0	2014-08-28 22:10:40	2014-08-28 22:10:40
64	mkrallinger@gmail.com	Fresh brutal	1	2015-03-29 19:25:12	2015-03-29 19:25:12
65	kjersti.b.rygg@gmail.com	Fredagsfresh	0	2014-08-01 18:58:31	2014-08-01 18:58:31
66	kjersti.b.rygg@gmail.com	Fresh, whooop!:-)	0	2014-07-31 15:30:08	2014-07-31 15:30:08
67	kjersti.b.rygg@gmail.com	Laber trening p Fresh Grnland (bein)	1	2015-05-19 19:36:39	2015-05-19 19:36:39
68	kjersti.b.rygg@gmail.com	1200 hydemeter. Elveseter-Juvasshytta	0	2014-07-20 20:41:28	2014-07-20 20:41:28
69	kjersti.b.rygg@gmail.com	uke 4 fresh	1	2015-02-08 13:20:14	2015-02-08 13:20:14
70	kjersti.b.rygg@gmail.com	Sooooo FRESH!	0	2014-09-09 16:52:07	2014-09-09 16:52:07
71	kjersti.b.rygg@gmail.com	Drittrening p drittfresh. Zumba og lp og ro	1	2015-04-17 06:41:26	2015-04-17 06:41:26
72	kjersti.b.rygg@gmail.com	10km! 66 minutter	1	2015-03-29 19:24:34	2015-03-29 19:24:34
73	mkrallinger@gmail.com	Fresh	1	2015-04-08 20:19:55	2015-04-08 20:19:55
74	kjersti.b.rygg@gmail.com	Elena @ Fresh CB	0	2014-10-20 22:44:32	2014-10-20 22:44:32
75	mkrallinger@gmail.com	fresh halv ass	0	2014-08-25 19:20:49	2014-08-25 19:20:49
76	kjersti.b.rygg@gmail.com	Fresh!	1	2015-01-30 16:09:54	2015-01-30 16:09:54
77	kjersti.b.rygg@gmail.com	Sentrumslpet (1:04:09)	1	2015-04-26 10:51:17	2015-04-26 10:51:17
78	mkrallinger@gmail.com	roing hard	0	2014-08-03 12:17:48	2014-08-03 12:17:48
79	mkrallinger@gmail.com	Kickit	1	2015-01-29 20:33:02	2015-01-29 20:33:02
80	kjersti.b.rygg@gmail.com	sooo fresh!	0	2014-11-25 17:01:13	2014-11-25 17:01:13
81	kjersti.b.rygg@gmail.com	PAIN!!	0	2014-09-16 18:07:11	2014-09-16 18:07:11
82	kjersti.b.rygg@gmail.com	Litt slapp pga syyyykt stl fra i gr..	0	2014-08-07 12:59:45	2014-08-07 12:59:45
83	kjersti.b.rygg@gmail.com	Kikut-Sognsvann (til sammen 3mil skitur)	1	2015-04-03 11:15:08	2015-04-03 11:15:08
84	kjersti.b.rygg@gmail.com	Feber-Fresh!	1	2015-03-24 18:16:08	2015-03-24 18:16:08
85	mkrallinger@gmail.com	Fresh	0	2014-07-10 00:50:56	2014-07-10 00:50:56
86	mkrallinger@gmail.com	Fresssshhh	1	2015-03-11 08:50:23	2015-03-11 08:50:23
87	kjersti.b.rygg@gmail.com	2, 3, BISLETT!	0	2014-08-20 22:36:26	2014-08-20 22:36:26
88	kjersti.b.rygg@gmail.com	Skitur med mkrallinger@gmail.com gmail.com 	1	2015-03-28 20:13:48	2015-03-28 20:13:48
89	kjersti.b.rygg@gmail.com	ALLE styrkeapparatene p Ensj	0	2014-08-06 10:45:02	2014-08-06 10:45:02
90	mkrallinger@gmail.com	fresh	0	2014-09-10 17:36:02	2014-09-10 17:36:02
91	kjersti.b.rygg@gmail.com	Fresh	0	2014-07-10 00:50:49	2014-07-10 00:50:49
92	mkrallinger@gmail.com	Freeeeeesh!	0	2014-11-03 19:28:18	2014-11-03 19:28:18
93	kjersti.b.rygg@gmail.com	CecilieFresh	1	2015-03-27 16:58:15	2015-03-27 16:58:15
94	kjersti.b.rygg@gmail.com	Morgenyoga	1	2015-04-01 08:07:48	2015-04-01 08:07:48
95	kjersti.b.rygg@gmail.com	volley	0	2014-08-28 07:18:22	2014-08-28 07:18:22
96	kjersti.b.rygg@gmail.com	uke 2 fresh	1	2015-02-08 13:19:38	2015-02-08 13:19:38
97	kjersti.b.rygg@gmail.com	ro-lig p Fresh	1	2015-04-28 14:46:17	2015-04-28 14:46:17
98	kjersti.b.rygg@gmail.com	Herr we go again!	0	2014-09-23 16:56:19	2014-09-23 16:56:19
99	mkrallinger@gmail.com	40min 5km	1	2015-05-30 19:19:07	2015-05-30 19:19:07
100	mkrallinger@gmail.com	Fussball	0	2014-11-22 13:03:24	2014-11-22 13:03:24
101	kjersti.b.rygg@gmail.com	soooo Freeeeesh	0	2014-07-28 14:07:06	2014-07-28 14:07:06
102	mkrallinger@gmail.com	Kikeut til sognsvann	1	2015-04-03 13:46:17	2015-04-03 13:46:17
103	mkrallinger@gmail.com	1200 hyemeter	0	2014-07-20 20:38:21	2014-07-20 20:38:21
104	kjersti.b.rygg@gmail.com	uledaglangrenn	1	2015-02-08 13:22:54	2015-02-08 13:22:54
105	mkrallinger@gmail.com	fussball	0	2014-09-26 17:19:27	2014-09-26 17:19:27
106	mkrallinger@gmail.com	siste etappe	0	2014-07-25 17:48:22	2014-07-25 17:48:22
107	mkrallinger@gmail.com	Minimal fresh	0	2014-10-30 17:59:14	2014-10-30 17:59:14
108	mkrallinger@gmail.com	Fresh 4x4	0	2014-11-19 19:59:35	2014-11-19 19:59:35
109	kjersti.b.rygg@gmail.com	sndagslangrenn	1	2015-02-08 13:22:25	2015-02-08 13:22:25
110	mkrallinger@gmail.com	17 km 	0	2014-07-23 09:47:50	2014-07-23 09:47:50
111	kjersti.b.rygg@gmail.com	hodelyktskkti	1	2015-02-18 20:29:13	2015-02-18 20:29:13
112	kjersti.b.rygg@gmail.com	5km og arm BRA trening!	1	2015-05-21 20:14:03	2015-05-21 20:14:03
113	kjersti.b.rygg@gmail.com	CecilieFresh Grnland	1	2015-03-31 17:35:34	2015-03-31 17:35:34
114	mkrallinger@gmail.com	fussball	0	2014-09-06 13:08:12	2014-09-06 13:08:12
115	kjersti.b.rygg@gmail.com	Sooo freeesh	0	2014-08-28 22:10:48	2014-08-28 22:10:48
116	mkrallinger@gmail.com	35 min, 7.5 rudern	1	2015-05-21 07:23:13	2015-05-21 07:23:13
117	kjersti.b.rygg@gmail.com	Frognerseteren-Kikut	1	2015-04-03 11:14:45	2015-04-03 11:14:45
118	kjersti.b.rygg@gmail.com	Soo Freeesh!	0	2014-08-19 18:00:39	2014-08-19 18:00:39
119	mkrallinger@gmail.com	Langlaufen	1	2015-02-08 13:22:10	2015-02-08 13:22:10
120	kjersti.b.rygg@gmail.com	litt half-ass tirsdagstrening p Fresh	1	2015-03-11 07:08:58	2015-03-11 07:08:58
121	mkrallinger@gmail.com	Locker laufen	1	2015-04-22 19:20:01	2015-04-22 19:20:01
122	mkrallinger@gmail.com	fussball	0	2014-09-18 20:54:34	2014-09-18 20:54:34
123	mkrallinger@gmail.com	Frognerseteret til kikeut	1	2015-04-03 13:46:00	2015-04-03 13:46:00
124	kjersti.b.rygg@gmail.com	Olavsbu-Gjendebu FERDIGDA!	0	2014-07-25 17:46:34	2014-07-25 17:46:34
125	kjersti.b.rygg@gmail.com	YogaYoga	1	2015-05-26 20:00:09	2015-05-26 20:00:09
126	kjersti.b.rygg@gmail.com	Intervalldronninga!	0	2014-08-08 22:55:51	2014-08-08 22:55:51
127	kjersti.b.rygg@gmail.com	PT p Srenga p SNDAG MORGEN	1	2015-02-08 13:10:18	2015-02-08 13:10:18
128	kjersti.b.rygg@gmail.com	Telttur	0	2014-09-15 06:53:22	2014-09-15 06:53:22
129	kjersti.b.rygg@gmail.com	uke 5 fresh	1	2015-02-08 13:21:40	2015-02-08 13:21:40
130	kjersti.b.rygg@gmail.com	Sooo fresh! to uker siden sist...	0	2014-11-05 10:43:42	2014-11-05 10:43:42
131	kjersti.b.rygg@gmail.com	Sndag mrra, OJE!!	0	2014-09-07 09:56:56	2014-09-07 09:56:56
132	kjersti.b.rygg@gmail.com	7km lping, litt styrke 1t 15min	0	2014-08-05 16:17:43	2014-08-05 16:17:43
133	mkrallinger@gmail.com	Langlaufen	1	2015-02-08 13:22:38	2015-02-08 13:22:38
134	kjersti.b.rygg@gmail.com	svømming med Mari i Tøyenbadet	1	2015-06-08 18:30:53	2015-06-08 18:30:53
135	kjersti.b.rygg@gmail.com	5km løping, 11km/t og mageøvelsene	1	2015-06-09 14:04:20	2015-06-09 14:04:20
136	mkrallinger@gmail.com	60min, 8.98km	1	2015-06-11 19:00:38	2015-06-11 19:00:38
137	kjersti.b.rygg@gmail.com	Svømming og mageøvelser	1	2015-06-16 18:10:25	2015-06-16 18:10:25
138	kjersti.b.rygg@gmail.com	20 min. løping, styrke arm og bein(60min til sammen)	1	2015-06-18 13:56:07	2015-06-18 13:56:07
139	kjersti.b.rygg@gmail.com	1t yoga og 40 min roooolig jogg 5km	1	2015-06-22 14:08:31	2015-06-22 14:08:31
140	kjersti.b.rygg@gmail.com	10.000m roing(55min) og mageøvelsene	1	2015-06-23 08:55:17	2015-06-23 08:55:17
141	kjersti.b.rygg@gmail.com	45 min ellipsemaskin (6km) og mageøvelsene	1	2015-06-24 08:05:37	2015-06-24 08:05:37
142	kjersti.b.rygg@gmail.com	I går: Spinning 45 min og mageøvelsene	1	2015-06-26 08:07:39	2015-06-26 08:07:39
143	kjersti.b.rygg@gmail.com	5km jogg tredemølle og mageøvelsene med Cecilie	1	2015-06-26 08:08:14	2015-06-26 08:08:14
144	kjersti.b.rygg@gmail.com	6km jogg langs elva og mageøvelsene	1	2015-06-29 19:45:29	2015-06-29 19:45:29
145	kjersti.b.rygg@gmail.com	5km mølle og 2x mageøvelsene. Fresh med Cecilie	1	2015-07-01 08:40:28	2015-07-01 08:40:28
146	kjersti.b.rygg@gmail.com	Alenefresh. 10.000 m roing, mageøvelsene og 5km jogging	1	2015-07-01 08:41:13	2015-07-01 08:41:13
147	kjersti.b.rygg@gmail.com	20 min elipsemaskin,mageøvelsene og styrke, bein	1	2015-07-02 14:20:33	2015-07-02 14:20:33
148	kjersti.b.rygg@gmail.com	oppvarming, sittesykkel (15min), mageøvelsene,armstyrke og 10km roooooilig jogg på tredemølla	1	2015-07-03 09:16:45	2015-07-03 09:16:45
149	kjersti.b.rygg@gmail.com	Yogic arts flow og mageøvelsene	1	2015-07-06 16:16:54	2015-07-06 16:16:54
150	mkrallinger@gmail.com	65min, 8.58km	1	2015-07-06 17:01:39	2015-07-06 17:01:39
151	mkrallinger@gmail.com	2km laufen, 60min 10500m rudern	1	2015-07-07 17:54:39	2015-07-07 17:54:39
152	kjersti.b.rygg@gmail.com	I går: mageøvelsene og 11 km jogge/gå på tredemølla(78 min)	1	2015-07-08 05:44:33	2015-07-08 05:44:33
153	kjersti.b.rygg@gmail.com	10 km roing, 55:30	1	2015-07-08 08:37:19	2015-07-08 08:37:19
154	kjersti.b.rygg@gmail.com	Tur til Varden (1t), 5km, 500 høydemeter. Mageøvelsene	1	2015-07-09 11:58:29	2015-07-09 11:58:29
155	kjersti.b.rygg@gmail.com	Tur til Kistefjell, Steinfjellet og Varden. 1.000 høydemeter, 19 km, 5 timer. Mageøvelsene	1	2015-07-10 13:08:15	2015-07-10 13:08:15
156	mkrallinger@gmail.com	10km, 68min	1	2015-07-16 07:05:20	2015-07-16 07:05:20
157	kjersti.b.rygg@gmail.com	i går: 10.000 m roing og mageøvelsene	1	2015-07-16 15:03:06	2015-07-16 15:03:06
158	mkrallinger@gmail.com	25 längen schwimmen, 60min	1	2015-07-17 06:55:57	2015-07-17 06:55:57
159	kjersti.b.rygg@gmail.com	To dager siden: 1250 meter svømming	1	2015-07-18 20:32:36	2015-07-18 20:32:36
160	mkrallinger@gmail.com	1.2km laufen, 60min 10500m rudern	1	2015-07-20 18:32:59	2015-07-20 18:32:59
161	kjersti.b.rygg@gmail.com	i går: alpetur #1. 1000 høydemeter opp, 18km. Heis ned.	1	2015-07-29 18:15:39	2015-07-29 18:15:39
162	kjersti.b.rygg@gmail.com	Alpetur #2. I flokk: opp ca 500 høydemeter, til 2000moh, ned cirka 1000 hm, 19km	1	2015-07-29 18:19:15	2015-07-29 18:19:15
163	mkrallinger@gmail.com	Bergtur #1	1	2015-07-29 18:20:43	2015-07-29 18:20:43
164	mkrallinger@gmail.com	Bergtur #2	1	2015-07-29 18:21:03	2015-07-29 18:21:03
165	kjersti.b.rygg@gmail.com	Alpetur#3. 900 høydemeter, 8 km, heis ned	1	2015-07-30 20:36:50	2015-07-30 20:36:50
166	mkrallinger@gmail.com	Bergtur #3	1	2015-07-30 20:40:41	2015-07-30 20:40:41
167	mkrallinger@gmail.com	Bergtur #4	1	2015-08-01 07:33:20	2015-08-01 07:33:20
168	kjersti.b.rygg@gmail.com	Mange dager siden: Alpetur#4	1	2015-08-08 07:15:36	2015-08-08 07:15:36
169	mkrallinger@gmail.com	10km, 64min laufen	2	2015-08-17 13:53:10	2015-08-17 13:53:10
170	mkrallinger@gmail.com	Golf + protime	2	2015-08-17 13:53:16	2015-08-17 13:53:16
171	mkrallinger@gmail.com	Zelteln	2	2015-08-17 13:53:24	2015-08-17 13:53:24
172	mkrallinger@gmail.com	10500m rudern, 60min	2	2015-08-18 11:19:03	2015-08-18 11:19:03
173	mkrallinger@gmail.com	Kveldskozz	2	2015-08-20 09:31:31	2015-08-20 09:31:31
174	kjersti.b.rygg@gmail.com	Fresh mandag, dårlig trening men bedre enn ingenting	2	2015-08-21 18:23:02	2015-08-21 18:23:02
175	kjersti.b.rygg@gmail.com	Torsdag: Protime golf	2	2015-08-21 18:23:32	2015-08-21 18:23:32
176	kjersti.b.rygg@gmail.com	lørdag/søndag telttur 11km	2	2015-08-21 18:24:01	2015-08-21 18:24:01
177	kjersti.b.rygg@gmail.com	Mandag: løp 2km, gikk 1, løp 2, gikk en. 10 totalt	2	2015-08-21 18:25:26	2015-08-21 18:25:26
178	kjersti.b.rygg@gmail.com	Onsdag: rask gange langs Akerselva, cirka 1t	2	2015-08-21 18:26:02	2015-08-21 18:26:02
179	kjersti.b.rygg@gmail.com	Halfass 7km og mageøvelser med Markus	2	2015-08-21 19:41:14	2015-08-21 19:41:14
180	mkrallinger@gmail.com	8km, 57min	2	2015-08-21 20:31:16	2015-08-21 20:31:16
181	mkrallinger@gmail.com	Golf + kveldskoz + mage	2	2015-08-26 20:09:30	2015-08-26 20:09:30
182	kjersti.b.rygg@gmail.com	Gåtur og mageøvelser	2	2015-08-26 20:09:38	2015-08-26 20:09:38
183	kjersti.b.rygg@gmail.com	AWESOME styrketrening:-)	2	2015-08-27 20:45:21	2015-08-27 20:45:21
184	kjersti.b.rygg@gmail.com	Torsdag: 10km roing	2	2015-09-05 16:00:29	2015-09-05 16:00:29
185	kjersti.b.rygg@gmail.com	KK-mila! 1:06:54	2	2015-09-05 16:01:33	2015-09-05 16:01:33
186	kjersti.b.rygg@gmail.com	5000m roing, litt styrke og mageøvelser	2	2015-09-07 19:54:05	2015-09-07 19:54:05
187	kjersti.b.rygg@gmail.com	svømming med Hanne (1.000m)	2	2015-09-10 20:29:55	2015-09-10 20:29:55
188	mkrallinger@gmail.com	Fresh	2	2015-09-13 17:45:15	2015-09-13 17:45:15
189	mkrallinger@gmail.com	Fresh	2	2015-09-13 17:45:23	2015-09-13 17:45:23
190	mkrallinger@gmail.com	Fresh	2	2015-09-13 17:45:28	2015-09-13 17:45:28
191	mkrallinger@gmail.com	Fussball	2	2015-09-13 17:45:36	2015-09-13 17:45:36
192	mkrallinger@gmail.com	Fresh	2	2015-09-13 17:45:40	2015-09-13 17:45:40
193	mkrallinger@gmail.com	2.2 km laufen, 10530m rudern	2	2015-09-15 19:04:41	2015-09-15 19:04:41
\.


--
-- Name: training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owncloud
--

SELECT pg_catalog.setval('training_id_seq', 193, true);


--
-- Data for Name: weight; Type: TABLE DATA; Schema: public; Owner: owncloud
--

COPY weight (id, "user", weight, inserted_at, updated_at) FROM stdin;
1	mkrallinger@gmail.com	87.9000015258789062	2014-07-16 07:21:25	2014-07-16 07:21:25
2	mkrallinger@gmail.com	87.3000030517578125	2014-07-15 00:44:52	2014-07-15 00:44:52
3	mkrallinger@gmail.com	88	2015-04-10 20:42:25	2015-04-10 20:42:25
4	mkrallinger@gmail.com	86.0999984741210938	2014-07-31 08:04:56	2014-07-31 08:04:56
5	kjersti.b.rygg@gmail.com	66.8000030517578125	2014-08-10 12:18:43	2014-08-10 12:18:43
6	mkrallinger@gmail.com	87	2015-04-10 20:48:25	2015-04-10 20:48:25
7	kjersti.b.rygg@gmail.com	66.6999969482421875	2014-08-01 08:14:16	2014-08-01 08:14:16
8	kjersti.b.rygg@gmail.com	67	2015-04-10 20:42:48	2015-04-10 20:42:48
9	mkrallinger@gmail.com	88	2015-04-10 20:40:46	2015-04-10 20:40:46
10	mkrallinger@gmail.com	87.3000030517578125	2014-07-15 00:44:43	2014-07-15 00:44:43
11	kjersti.b.rygg@gmail.com	66.4000015258789062	2014-08-09 09:23:04	2014-08-09 09:23:04
12	kjersti.b.rygg@gmail.com	67.0999984741210938	2014-08-07 08:55:35	2014-08-07 08:55:35
13	kjersti.b.rygg@gmail.com	68.1999969482421875	2014-07-28 14:07:29	2014-07-28 14:07:29
14	mkrallinger@gmail.com	86.9000000000000057	2015-02-21 10:49:56	2015-02-21 10:49:56
15	kjersti.b.rygg@gmail.com	66.5999984741210938	2014-08-08 09:36:04	2014-08-08 09:36:04
16	mkrallinger@gmail.com	87.5999984741210938	2015-02-08 13:18:00	2015-02-08 13:18:00
17	kjersti.b.rygg@gmail.com	67.1999969482421875	2014-08-06 09:20:40	2014-08-06 09:20:40
18	mkrallinger@gmail.com	87.6999969482421875	2014-07-20 09:59:39	2014-07-20 09:59:39
19	mkrallinger@gmail.com	88	2014-07-19 12:35:39	2014-07-19 12:35:39
20	kjersti.b.rygg@gmail.com	67.1999969482421875	2014-07-31 10:46:48	2014-07-31 10:46:48
21	mkrallinger@gmail.com	87.3000030517578125	2014-07-17 08:40:21	2014-07-17 08:40:21
22	mkrallinger@gmail.com	88	2015-02-04 07:35:59	2015-02-04 07:35:59
23	kjersti.b.rygg@gmail.com	68	2014-07-20 10:01:18	2014-07-20 10:01:18
24	kjersti.b.rygg@gmail.com	66.8000030517578125	2014-08-05 16:16:56	2014-08-05 16:16:56
25	mkrallinger@gmail.com	88	2015-05-30 18:44:46	2015-05-30 18:44:46
28	mkrallinger@gmail.com	87.2999999999999972	2015-06-02 05:18:31	2015-06-02 05:18:31
29	mkrallinger@gmail.com	87.2999999999999972	2015-06-05 06:01:47	2015-06-05 06:01:47
30	mkrallinger@gmail.com	87.5999999999999943	2015-06-11 20:27:14	2015-06-11 20:27:14
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


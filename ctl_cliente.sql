--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-02-11 10:56:47 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16934)
-- Name: ctl_cliente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ctl_cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    giro character varying(100) NOT NULL,
    nit character varying(25) NOT NULL,
    nrc character varying(25) NOT NULL,
    direccion character varying(100) NOT NULL,
    telefono character varying(25) NOT NULL,
    activo boolean NOT NULL,
    id_departamento integer NOT NULL,
    id_municipio integer NOT NULL,
    date_add date NOT NULL,
    id_user_mod integer,
    id_user_add integer NOT NULL,
    date_mod date,
    email character varying(100),
    exento boolean,
    id_zona integer NOT NULL,
    codigo character varying(25),
    agente_retencion boolean,
    id_tipo_cliente integer,
    estado character varying(10)
);


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE ctl_cliente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE ctl_cliente IS 'Catalogo de clientes';


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.nombre IS 'Nombre de la empresa no puede ser repetido';


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.nombre_comercial; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.nombre_comercial IS 'Nombre comercial de la empresa';


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.giro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.giro IS 'Giro de la empresa, según naturaliza del negocio';


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.nit; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.nit IS 'Nit de la empresa';


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.nrc; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.nrc IS 'Numero de registro de contribuyente';


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.direccion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.direccion IS 'Direccion del negocio';


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.telefono; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.telefono IS 'Telefonos puede ser mas de uno';


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.activo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.activo IS 'estado del registro true=activo; false=inactivo';


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.id_departamento; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.id_departamento IS 'fk - id del departamento según dirección del negocio';


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.id_municipio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.id_municipio IS 'fk - id municipio segun dirección del negocio';


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.date_add; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.date_add IS 'Fecha de creacion del registro';


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.id_user_mod; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.id_user_mod IS 'Usuario que modifica el registro';


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.id_user_add; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.id_user_add IS 'Usuario que agrego el registro';


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.date_mod; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.date_mod IS 'Fecha de modificacion del registro';


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.agente_retencion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.agente_retencion IS 'Cuando se factura valor sin iva mayor o igual que 100 multiplicar 100 por 0.01 y aplicar el total en la retención';


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.id_tipo_cliente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.id_tipo_cliente IS 'llave foranea de ctl_tipo_cliente donde se almacena si es cliente consumidor final o de credito fiscal';


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN ctl_cliente.estado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ctl_cliente.estado IS 'almacena el estado de cliente, si es cliente moroso u otro';


--
-- TOC entry 186 (class 1259 OID 16940)
-- Name: ctl_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ctl_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 186
-- Name: ctl_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ctl_cliente_id_seq OWNED BY ctl_cliente.id;


--
-- TOC entry 2112 (class 2604 OID 17101)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente ALTER COLUMN id SET DEFAULT nextval('ctl_cliente_id_seq'::regclass);


--
-- TOC entry 2232 (class 0 OID 16934)
-- Dependencies: 185
-- Data for Name: ctl_cliente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ctl_cliente (id, nombre, nombre_comercial, giro, nit, nrc, direccion, telefono, activo, id_departamento, id_municipio, date_add, id_user_mod, id_user_add, date_mod, email, exento, id_zona, codigo, agente_retencion, id_tipo_cliente, estado) FROM stdin;
1	Abigail Zelaya de Lizama 	Laboratorio Clinico Zeliz	s/d	s/d	193020-2	LA  UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
2	Acar, S.A. de C.V.	s/d	s/d	0614-200509-101-3	194065-9	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
3	Adilia Roxana Manzon Villatoro	s/d	s/d	9483-300687-101-1	208194-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
4	Adolfo Platero Canales	Laboratorio Clínico Biotetico Virgen Maria	s/d	0614-180772-107-5	210686-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
5	Adyanira Evelyn Martínez de Gil	s/d	s/d	s/d	138291-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
6	Alba Lilian Martinez Lab Menfis	s/d	s/d	s/d	160954-2	STA ROSA, LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
7	Alexander Salvador Portillo	s/d	s/d	1315-260168-101-7	130861-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
8	Alexander Salvador Portillo del Cid.	s/d	Laboratorio clinico	1315-260168-101-7	130861-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
9	Alicia Josefina Moran Lara	s/d	s/d	0210-260848-001-3	5852-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
10	Álvaro Leonel Díaz Coto 	s/d	s/d	s/d	182862-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
11	Amanda Mendoza de Conteras	s/d	s/d	1205-200471-101-2	175125-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
12	Amanda Mendoza de Contreras	s/d	s/d	1205-200471-101-2	175125-0	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
13	Americares Foundation, Inc.	s/d	s/d	9450-260779-102-7	142399-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
14	Aminta Turcios de Luna	Laboratorio Centro de Diagnostico	s/d	s/d	59704-0	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
15	Ana Cecilia de Ramos	s/d	s/d	s/d	168139-7	S.S	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
16	Ana Cecilia Vásquez	s/d	s/d	s/d	191692-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
17	Ana Elsy de Espinoza	s/d	s/d	s/d	38394-5	CUSCATLAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
18	Ana Estela de Paniagua	s/d	s/d	0614-231155-010-1	158495-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
19	Ana Gladis Zepeda de Martinez	s/d	s/d	0315-211156-001-3	76238-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
20	Ana Gladys Briotez	s/d	s/d	0614-160568-104-4	154697-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
21	Ana Julia Damas de Soler 	Laboratorio Clinico Interlab	s/d	s/d	26998-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
22	Ana Leonor Pocasangre de Chita	s/d	s/d	s/d	142238-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
23	Ana Lidia Miranda de Rivas	s/d	s/d	s/d	80377-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
24	Ana Maria de Los Angeles Ramírez de Calderon	s/d	s/d	0210-090469-002-1	145848-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
25	Ana Maria Gutierrez Hernandez	s/d	s/d	0308-040878-104-8	218033-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
26	Ana Morena Padilla Cárcamo	Laboratorio Clínico Servi-Lab	s/d	0614-260749-004-4	33154-6	La Union	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
27	Ana Raquel Mendoza 	Laboratorio Clinico Sagrado Corazón	s/d	s/d	165336-5	C USCATLAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
28	Ana Rosario Ramirez 	Laboratorio Clinico de Emergencia	s/d	0711-040663-101-5	13950-5	CABAÑAS	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
29	Ana Ruth Gamez Amc. Anita Mastercut	s/d	s/d	s/d	125255-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
30	Ana Victoria Mendoza de Zacarias	s/d	s/d	0315-230253-002-7	94411-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
31	Ana Victoria Rivas	s/d	s/d	s/d	213917-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
32	Angel Hidalgo Retana	s/d	s/d	s/d	26018-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
33	Ángel Rafael Eguizabal Mariona	Laboratorio Clínico Tecnicomlab	s/d	0614-310172-115-6	120280-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
34	Angela Margarita Machuca Majano	s/d	s/d	s/d	22462-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
35	Angela Victoria Rivas de Calderon 	Laboratorio Clinico Alfalab	s/d	0407-010355-001-7	174910-9	COL. IMPET MEJICANO, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
36	Angelica Guadalupe  Guzman	Laboratorio Clinico Gúzman Ayala	s/d	s/d	158501-8	CABAÐAS	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
37	Any Lazo	Laboratorio Nueva Vida	s/d	s/d	174585-1	MORAZAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
38	Arcadia Castellon	Laboratorio Castellon	s/d	1109-060950-001-0	29033-5	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
39	Arevalo Cruz, S.A. de C.V.	s/d	s/d	0614-060906-105-5	174698-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
40	Armando Rios	Laboratorio Clinico Matus	s/d	s/d	182139-0	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
41	Asebursa, S.A.	s/d	s/d	0614-191007-103-8	182616-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
42	Asociación de Frailes Franciscanos O.F.M. de C.A. y Panamá	s/d	s/d	s/d	186774-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
43	Asociacion Demografica Salvadoreña	s/d	s/d	0614-170562-003-8	30450-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
44	Asociacion Nuevo Amanecer de El Salvador	s/d	s/d	0614-060490-104-7	61649-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
45	Bartolome Jacinto Villaran	s/d	s/d	7101-230564-001-0	71963-3	Colonia Santa Maria Pasaje 17 Casa 17, San Martin	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
46	Beatriz Elizabeth Ardon de Torrez	s/d	s/d	s/d	172354-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
47	Bioquímicos Salvadoreños, S.A. de C.V.	s/d	s/d	0614-180386-001-9	758-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
48	Biotest S.A. de C.V.	s/d	s/d	0614-040293-105-0	108878-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
49	Blanca Adalila Rivera Portillo	Laboratorio Clínico Los Cedros	s/d	0711-250666-101-1	183863-0	2a AV NORTE #14, SAN RAFAEL CEDROS, CUSCATLAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
50	Blanca Elizabeth Galdámez de Flores	s/d	s/d	0315-290771-102-4	141411-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
51	Blanca Eloisa Rodriguez de Chafoya	s/d	s/d	0617-210479-101-5	201748-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
52	Blanca Estela A. de Pacas	s/d	s/d	1203-230353-001-1	54509-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
53	Blanca Lilian Mendoza  Villalta 	Laboratorio Clínico Juan Diego	s/d	1010-081073-104-7	188546-0	SAN VICENTE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
54	Boa Computer System, S.A.	Laboratorio Clínico Braxec	s/d	0614-290200-105-1	11978-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
55	Brito de Martinez	s/d	s/d	0315-070273-102-2	149730-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
56	Carlos A. Quintanilla	s/d	s/d	s/d	868-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
57	Carlos Aguilar Chavarría	s/d	s/d	s/d	27089-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
58	Carlos Alberto Rosales	s/d	s/d	0315-051166-002-5	137048-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
59	Carlos Alberto Salinas Escoto	Laboratorio Clínico Milagro de Dios	s/d	0821-250778-102-7	205598-8	ZACATECOLUCA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
60	Carlos Andrés Vásquez Peraza	Laboratorio Clínico Vasper	s/d	0502-150854-001-8	23325-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
61	Carlos Antonio Guerra Flores	s/d	s/d	0511-200159-003-9	108140-3	SANTA TECLA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
62	Carlos Armando Figueroa	s/d	s/d	s/d	201213-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
63	Carlos Diaz Mesquita	s/d	Laboratorio clinico radiologia y asimilados	0210-030453-001-8	31795-03	AV INDEPENDENCIA SUR ENTRE 13 Y 15 CALLE PTE CLINICA YAN NO 82, SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
64	Carlos Joaquin Parr Cardona	s/d	s/d	0614-140772-104-1	191267-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
65	Carlos Rene Solis Ramirez	s/d	s/d	0614-190887-110-8	221966-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
66	Carmen Elena Bazan de Sandoval	s/d	s/d	0210-220753-004-2	75504-4	AHUACHAPAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
67	Carmen Elena Grande	Laboratorio Clínico Intipuca	s/d	1414-190371-102-2	232664-0	Avenida Ursulo Marquez, La Union	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
68	Carmen Emperatriz González	s/d	s/d	s/d	s/d	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
69	Carolina Lisette de Davilla	Laboratorio Sinai	s/d	0315-310571-103-6	90691-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
70	Carolina Recinos Bolaños	s/d	s/d	0614-170672-121-0	165253-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
71	Carolina Recinos Recinos	s/d	s/d	0614-170672-121-0	165253-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
72	Carrillo Velasquez de Herrera 	Laboratorio Clínico Carver	s/d	0014-140174-113-0	192197-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
73	Cecilia Lorena Padilla de Romero	s/d	s/d	s/d	145753-5	MORAZAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
74	CEL	s/d	Energia electrica	0614-180948-001-4	8198-1	9A CALLE PONIENTE No 950 CENYTRO DE GOBIERNO, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
75	Centro Cardiometabolico S.A.	s/d	s/d	0614-170308-101-5	185803-5	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
76	Centro Clinico Hospitalario Ceclisa	s/d	Servicios hospitalarios	0101-031075-001-7	1899-6	Final Sexta Calle Oriente N? 3-3, Ahuchapan	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
77	Centro de Cirugia Ambulatoria S.A. de .C.V./	Laboratorio Ceclam	s/d	0614-230306-104-6	171470-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
78	Centro de Procedimientos Medicos S.A. de C.V.	s/d	s/d	0614-270488-104-6	2978-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
79	Centro de Salud Josefino Vilaseca	s/d	s/d	s/d	91827-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
80	Centro Medico de Oriente, S.A. de C.V.	s/d	s/d	1217-020176-001-8	8537-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
81	Centro Medico Santa  Ana S.A. de C.V.	s/d	s/d	0210-121270-001-0	2015-0	SNTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
82	Centro Medico Usuluteco	s/d	s/d	s/d	2781-2	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
83	Centro Pedriatico De El Salvador S.A. de C..V.	s/d	s/d	s/d	455-3	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
84	Centrolab Especialidades Diagnosticas, S.A. de C.V.	s/d	s/d	s/d	215673-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
85	Cesar Dario Rodas	s/d	s/d	0617-191273-101-5	149648-0	SOYAPANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
86	Cirugía Plástica y Spa, S.A de C.V	s/d	Servicios medicos	0614-300309-103-9	193943-3	San salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
87	Claudia Judith Quinteros Pichinte	s/d	s/d	0614-080187-115-8	211648-0	San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
88	Claudia Lipe Viscarra	s/d	s/d	s/d	151614-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
89	Claudia Lorena Portillo	Laboratorio Clínico Lister	s/d	0614-240667-005-8	23577-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
90	Claudia Lorena Portillo Barraza	s/d	s/d	0614-040867-005-8	23577-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
91	Claudia Maria Alvarado  	Laboratorio Diagnosis	s/d	1118-240179-101-1	185828-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
92	Clinica de Tecnologia Avanzada, S.A de C.V.	s/d	s/d	0614-121006-101-5	175165-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
93	Clinica Medica y Laboratorio Clinico Los Angeles	s/d	s/d	0614-100147-004-9	42027-1	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
94	Clinica Salud Vital, S.A. de C.V.	s/d	s/d	0614-261010-103-9	205133-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
95	Clinicas Medicas Integrales de Oriente S.A. de C.V.	s/d	s/d	1217-151009-101-3	196873-3	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
96	Clínico y RX Policlinica Casa de La Salud, S.A de C.V.	s/d	s/d	0614-261094-101-0	83118-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
97	Club Playas de Salinitas S.A. de C.V	s/d	s/d	0614-300866-001-4	5305-8	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
98	COHS, S.A de C.V.	s/d	Otros servicios relacionados a la salud	0614-081209-109-1	202259-7	San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
99	COMBIO S.A. de C.V.	s/d	s/d	s/d	3028-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
100	Comercio y representaciones S.A de C.V	s/d	Laboratorio clinico radiologia y asimilados	0614-280775-001-3	1690-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
101	Concepción Brito de Martinez	s/d	s/d	0315-070273-102-2	149730-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
102	Concepción González Melgar	s/d	s/d	s/d	56221-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
103	Consultorio San Vicente de Paul	s/d	s/d	0614-100392-001-0	9296-7	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
104	Contreras Molina, S.A. de C.V.	s/d	s/d	1217-310550-710-1	180266-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
105	Corporacion de Contadores de El Salvador	s/d	s/d	0614-051030-003-2	101176-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
106	Corporative system of health S.A. de C.V.	s/d	s/d	0614-081209-109-1	1202259-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
107	Corporative Systems of Healths, S.A. de C.V.	s/d	s/d	0614-081209-109-1	202259-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
108	CRIAVES S.A. de C.V.	s/d	s/d	0614-150875-001-6	272-0	LA LIBERTAD	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
109	Cristela Alejandra Guzman Pineda	s/d	s/d	0602-050282-101-9	191489-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
110	Cristian Rafael Lazo Rivera	Laboratorio Urologico	s/d	1104-030779-101-7	210727-3	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
111	Cristina Ayala Cruz	s/d	s/d	s/d	189251-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
112	Daniel Antonio Menjivar Marin	Laboratorio Clínico Bio Geminis	s/d	0601-250403-101-4	134011-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
113	David Ramon Gutierrez	s/d	s/d	1217-150846-001-0	50477-7	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
114	Daysi Rosario Sanchez 	Laboratorio Oriental	s/d	s/d	085464-0	SANTA ROS DE LIMA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
115	Delia America Arias de Guevarra	s/d	s/d	1111-050567-101-7	174706-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
116	Delia Elena Osorio	s/d	s/d	0614-010371-003-7	128117-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
117	Delia Milagro Loewner de Quijano	s/d	s/d	s/d	226851-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
118	Deysi Ercilia Rivera de Romero	Laboratorio Pasteur	s/d	1214-141050-016-	50403-3	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
119	Diagnostico Clínico / Polanco	s/d	s/d	0203-280650-002-7	23806-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
120	Diagnosticos Salvadoreños	s/d	s/d	0614-291012-106-6	221356-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
121	Digna de Garcia Reyes	Laboratorio Clic Carlos Enrique	s/d	s/d	178683-0	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
122	Dina de Henriquez	s/d	s/d	s/d	81686-8	SANTA ROSA, LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
123	Dina Ester De Martinez 	Laboratorio Clínico Clidisa	s/d	0103-290347-001-9	3665-0	SONSONATE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
124	Dinora Elisa Carias Garozona	s/d	s/d	0315-231182-102-0	181077-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
125	Distribucion e Inversión S.A. de C.V.	s/d	s/d	0614-021096-102-8	95812-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
126	Distribuidora Médica Salvadoreña, S.A. de C.V.	s/d	s/d	s/d	203078-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
127	Douglas Armando Molina Herrador	s/d	s/d	s/d	193794-7	SAN  SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
128	Douglas Arturo Guevara Mendoza	s/d	s/d	s/d	88866-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
129	Droguería Americana S.A. de C. V.	s/d	s/d	0614-130985-003-5	1166-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
130	Edgar Antonio Minero Rodríguez	s/d	s/d	0610-090674-102-3	173183-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
131	Edgar Mauricio Aguirre Olivares	s/d	s/d	0210-040269-104-4	134924-3	Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
132	Edgar Rafael Herrera Segura	s/d	s/d	s/d	25492-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
133	Edgar Rogelio Flores Sandoval	s/d	s/d	0207-140576-101-9	186222-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
134	Edith Benitez	Laboratorio Clínico Bio-Analisis	s/d	1416-240661-001-0	77860-5	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
135	Edith Del Carmen Shater Alfaro 	Laboratorio Clínico Epimediologico	s/d	s/d	157979-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
136	Eduardo Arturo Sanchez Cordova	s/d	s/d	0614-231157-004-5	39889-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
137	Elmer Boris Panameño	Laboratorio Hashem	s/d	0805-040381-101-3	233612-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
138	Elsa Raquel Funes Guerrero	s/d	s/d	0412-030148-001-0	41267-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
139	Elssie Medrano de Velasquez 	Laboratorio Hematologico	s/d	0715-081248-001-0	22192-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
140	Endoofta S.A. de S.V.	s/d	s/d	0614-030709-103-6	202915-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
141	Enrimar, S.A. de C.V.	s/d	s/d	s/d	41703-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
142	Ercilia Beatriz Guardado de Prieto	Laboratorio Clínico Nazaret	s/d	0821-290573-103-0	163951-0	ZACATECOLUCA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
143	Erika Lopez De Artiga	s/d	s/d	1010-021078-102-4	119311-0	SAN VICENTE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
144	Eserski Hnos., SA de CV	s/d	s/d	0614-180357-001-7	4280-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
145	Esmeralda Marisabel Aviles de Flores	s/d	s/d	s/d	197640-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
146	Especialidades Medicas, S.A. de C.V.	Laboratorio Clínico Bautista	s/d	0614-150610-105-5	203342-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
147	Ester Arevalo de Doño 	Laboratorio Clínico Promesa	s/d	s/d	4163-7	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
148	Esther Arevalo de Doño	s/d	s/d	0302-251049-001-7	4163-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
149	Estudios de Imágenes Médicos	s/d	Servicios medicos	0614-190707-104-0	182127-5	27 Avenida Norte N? 1211, Col. Medica, San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
150	Farmaceutica, S.A. de C.V.	s/d	s/d	0511-190501-101-2	136286-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
151	Fatima del C. Merino de Gutierrez	s/d	Servicios medicos venta de otros productos	0614-021080-139-0	219873-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
152	Fermin Rodrigo Vides Escalón	Laboratorio Clínico Vides	s/d	0614-230471-108-7	134707-0	6? Avenida Sur entre 23 y 25 Calle Poniente, Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
153	Fermina Ramos	Laboratorio Clínico Ramos	s/d	s/d	15002-9	GOTERA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
154	Fermina Ramos, 	Laboratorio Clínico Ramos	s/d	s/d	150002-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
155	FERSON, S.A. de C.V	s/d	s/d	1121-250348-001-7	1069-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
156	Flora Isabel Corleto de Yanes	Laboratorio San Miguelito	s/d	0208-220553-001-3	29385-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
157	Florentino Alexander Benitez	s/d	s/d	s/d	1123-70-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
158	Fondo De Actividades Especiales del Ministerio de Salud	s/d	s/d	0614-291190-105-7	154543-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
159	Francisco Amilcar Melendez Guzman	Laboratorio Clínico El Angel	s/d	1123-281262-002-6	90228-4	CARA SUCIA, SONSONATE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
160	Francisco Antonio Rosales Cruz	Laboratorio Clínico Labfar	Primaria y otros servicios relacionados con la salud	0613-240563-001-3	230671-3	9? Avenida Sur Urbanizacion Providencia, San Martin, San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
161	Francisco Guillermo Castro Alvarado 	Laboratorio San Judas	s/d	0501-050271-101-0	133406-0	SOYAPANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
162	Fund Junta Constructora y Conservadora del Templo Sn Miguel Arcangel	s/d	s/d	0614-080437-001-3	62632-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
163	Fundacion de Desarrollo Social	s/d	s/d	0614-080877-002-2	62302-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
164	Fundacion Padre Arrupe de El Salvador	s/d	s/d	0614-060594-107-7	136278-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
165	Gabriela Margarita Cardona Bolaños 	Laboratorio Clínico Lamsal	s/d	s/d	206901-0	SANTA TECLA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
166	Geovanny Francisco Zapata Rodríguez	s/d	s/d	1217-200974-104-7	230792-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
167	Geovany Antonio Alfaro Rivera.	Laboratorio Clinico Biotlan	s/d	1123-190775-101-9	160672-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
168	Gilma Maribel Diaz de Garcia	Laboratorio Clínico Diaz Navarrete	s/d	1123-280753-001-8	28015-7	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
169	Gilma Maribel Diaz de Mancia	Laboratorio Diaz Navarrete	s/d	1123-280753-001-8	29015-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
170	Giovanni Francisco Zapata Rodriguez	s/d	s/d	1217-200974-104-7	230792-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
171	Gladis Argentina Hernandez. 	Laboratorio. Medico de Occidente	s/d	0101-011051-001-1	7025-4	Ahuachapan.	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
172	Gladys Guillen Romero 	Laboratorio Clínico Medalla Milagrosa	s/d	s/d	162929-8	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
173	Glenda Idalia Nuñez Cañas	Laboratorio Clínico Onix	Laboratorio clinico	0202-280187-101-2	234870-9	Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
174	Glenda Maria Diaz	s/d	s/d	1214-240677-101-0	189546-1	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
175	Glenda Romero Trejo	Laboratorio Clínico Trejo	s/d	s/d	160778-3	ILOBASCO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
176	Glenda Roxana Joya	s/d	Servicios clinicos	0614-120681-106-9	219939-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
177	Global Med, S.A. de C.V.	s/d	s/d	0614-101014-102-2	236096-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
178	Gloria Alicia Quintanilla Ortiz	Laboratorio C.Garcia	s/d	1010-070153-001-0	80925-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
179	Gloria Antonia Calderón Alférez	Laboratorio Bacterium	s/d	1010-170348-001-0	30843-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
180	Gloria Elizabeth Rodríguez de Vanegas 	Laboratorio Clínico Hematologico	s/d	0614-101052-012-1	70975-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
181	Gloria Estela Sanches de Liborio	s/d	s/d	0515-200180-104-2	231743-3	Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
182	Gloria Ivette Sorto de Ortez	s/d	s/d	1416-090750-001-9	41462-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
183	Gloria Juarez Lara de Flores	s/d	s/d	s/d	4019-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
184	Gloria Mercedes Bolaños Amaya	s/d	s/d	s/d	206342-4	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
185	Gloria Mercedes Lucha de Lazo	s/d	s/d	0614-190457-012-6	184606-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
186	Granjita El Progreso S.A. de C.V.	s/d	s/d	0614-101207-103-0	183697-0	Ilobasco	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
187	Griselda Guadalupe Figueroa 	Laboratorio Clínico Figueroa	s/d	0429-120371-101-7	167121-7	SAN MARTIN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
188	Griselda Lisseth Somosa de Granados	s/d	s/d	0301-101136-103-5	225831-0	Final Avenida Alberto Mansferrer, Sonsonate	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
189	Griselda Rivera de Galdamez	s/d	s/d	0515-110177-103-9	206666-5	LA LIBERTAD	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
236	José Carlos Sosa Beltrán	s/d	s/d	0511-240472-101-2	202620-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
190	GUZEL S.A. de C.V.	s/d	s/d	0614-121011-104-7	212170-3	CENTRO COMERCIAL GAMES PLACE, ANTIGHUO CUSCATLAN, LA LIBERTAD	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
191	Héctor de Jesús Amaya	Laboratorio Clinico Maya	s/d	1202-150259-001-0	15531-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
192	Hector Eduardo Rodriguez	s/d	s/d	0608-031166-101-4	91370-7	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
193	Héctor Salvador Zelaya Galdámez, SA de CV	Hszg 	s/d	0614-090310-106-5	201166-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
194	Helen Stefany Flores de Sosa	s/d	Servicio de analisis y estudio de diagnostico	0715-090789-101-9	234371-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
195	Herbert Tito Morales Guardado	s/d	Ventas de otros productos no clasificados	0210-110464-105-1	185430-0	21 CALLE ORIENTE Y 3a AVENIDA SUR BO SAN MIGUELITO, SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
196	Heydi Lorena Batrez	Laboratorio Clinico Minerva	s/d	1120-270469-101-0	119657-6	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
197	Hilda Gloribel Melendez de Ponce	s/d	s/d	1414-051086-101-8	225013-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
198	Hosp. de La Mujer s.a. de c.v.	s/d	s/d	s/d	499-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
199	Hospital CADER, S.A. de C.V.	s/d	s/d	0210-260901-102-0	136118-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
200	Hospital Climesa	s/d	Servicios medicos hospitalarios	0210-010870-001-4	4671-0	Colonia Santa Marina, Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
201	Hospital de la Mujer, S.A. de C.V.	s/d	s/d	0614-280287-001-6	499-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
202	Hospital MÚdico Central	s/d	s/d	0613-030771-101-2	134196-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
203	Hospital Policlinica Casa de Salud, S.A. de C.V.	s/d	s/d	0614-270975-101-8	2537-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
204	Hugo Nahum Liborio Grijalva	s/d	s/d	0103-101269-101-3	50994-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
205	Imprenta Wilbot, S.A.	s/d	s/d	0614-101265-002-0	22607-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
206	INSACOR, S.A. de C.V.	s/d	s/d	0614-010492-107-6	64359-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
207	Insumed, S.A. de C.V.	s/d	s/d	0614-300408-102-9	186705-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
208	Inversiones de Salud, S.A. de C.V.	Laboratorio Centro de Diagnostico	s/d	0614-120288-102-0	40522-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
209	Inversiones Medicas San Francisco S.A. de C.V.	s/d	s/d	s/d	155507-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
210	Inversiones Montealegre Cader S.A. de C.V.	s/d	Laboratorio	0210-260901-101-1	13611-0	13 AV  SUR, SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
211	Inversiones Médicas de Oriente S.A. de C.V.	s/d	s/d	0614-150591-102-9	50470-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
212	Inversiones Sara S.A. de C.V.	s/d	s/d	0210-240508-101-0	188345-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
213	Inversiones Veterinarias Salvadoreñas, S.A. de C.V.	s/d	s/d	0614-220197-105-6	98737-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
214	Iris Veronica Sorto Arriaza 	Laboratorio Galiano	s/d	1316-141176-101-3	95421-0	SANTA ROSA DE LIMA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
215	Iris Violeta Vigil Zamora	s/d	s/d	s/d	166508-5	MONCAGUA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
216	Irma Jeannete Cortez de Molina	Laboratorio Koch	s/d	0614-240774-115-4	135007-0	San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
217	Isabel Del Carmen Perez 	Laboratorio Clínico Luz y Vida	s/d	1009-020751-001-8	162408-1	COJUTEPEQUE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
218	ISAC S.A. de C.V.	s/d	s/d	0210-160294-101-7	79619-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
219	Israel Espinal Guerra 	Laboratorio Analisis Clinico Mirian Guerra	Laboratorio clinico	1408-271084-102-0	222667-3	1? Calle Oriente y 1¬ avenida norte, Barrio Concepcion, La Union	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
220	Ivette Guadalupe Sánchez Durán	s/d	s/d	s/d	215032-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
221	Jaime Edmundo Portillo Méndez	s/d	s/d	1005-130274-001-0	157697-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
222	Jaime Monterrosa Escalante	s/d	s/d	0614-210258-017-0	33235-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
223	Jaime Walter Orellana Rivas	s/d	s/d	0614-230968-117-8	147769-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
224	Jazmin Elizabeth Ventura	Laboratorio Zuniga	s/d	1408-110282-103-6	180362-7	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
225	Jenny Lisset Molina de Benítez	s/d	s/d	1009-280973-101-4	216368-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
226	Jenny Lisseth Rivas Torres	s/d	s/d	0101-230253-101-9	221452-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
227	Jessica Rossana Alvarado Vega	s/d	s/d	s/d	235763-4	2¬ Calle Oriente Barrio Santa Cruz Metapan, Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
228	Jesus Adalberto Marroquin Jule	s/d	s/d	0819-261051-001-4	59942-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
229	Jimmy Endryks Huezo Mejia	s/d	s/d	1123-230179-101-1	184319-4	SANTA ELENA USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
230	Jonathan Alberto Aguilar Mendez	s/d	s/d	0210-050780-101-5	109988-4	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
231	Jorge Antonio Orellana	s/d	Laboratorio clinico	0819-270874-101-4	196986-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
232	Jose Antonio Campos Montoya	s/d	Servicios medicos	1207-040161-001-5	129979-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
233	Jose Antonio Recinos	s/d	Laboratorio clinico	1202-300940-001-3	33239-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
234	Jose Antonio Recinos 	Laboratorio Clínico Kahn	s/d	1202-300940-001-3	33239-9	SAN JACINTO, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
235	Jose Camila Guzman	Laboratorio Democracia	s/d	0614-251073-110-8	188123-8	AV SAN JOSE, SAN MARCOS, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
237	José David Romero Amaya	Laboratorio Clinico Alas	Laboratorio clinico	s/d	234963-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
238	José Domingo Pineda	s/d	s/d	0819-220751-001-9	48616-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
239	José Eduardo Cruz	s/d	s/d	0821-040754-001-1	37585-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
240	Jose Federico Arevalo Solorzano	s/d	s/d	s/d	32713-1	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
241	Jose Humberto Zelaya Lopez	s/d	s/d	1215-130745-001-2	6115-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
242	Jose Mario Aguilar Rivera 	Laboratorio Clínico Santa Tecla	s/d	0511-251153-001-6	38190-5	SANTA TECLA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
243	Jose Neftali Hernandez	s/d	s/d	0614-260372-119-6	209457-7	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
244	Jose Omar Duarte Mendoza	s/d	s/d	0614-091251-009-4	73022-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
245	Jose Ricardo Nolasco Loza	Laboratorio Clínico Lozano	s/d	1217-261271-103-9	150525-1	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
246	José Roberto Pacheco	s/d	s/d	s/d	89211-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
247	Jose Teodoro Marin Maravilla	s/d	s/d	1007-141146-001-0	162909-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
248	Jose Vicente Barrientos	s/d	s/d	s/d	2587-9	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
249	Josefina Del Carmen Amaya Lopez	s/d	s/d	s/d	127825-2	SAN VICENTE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
250	Juan Carlos Cisneros Cea	Laboratorio Clínico Sermes	s/d	0306-120872-101-1	204865-6	Sonsonate	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
251	Juan Carlos Menendez	Laboratorio Menendez	s/d	0614-150238-002-1	8928-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
252	Juan Francisco Villatoro Velasquez	s/d	Laboratorio clinico	s/d	236213-0	Boulevard Enmanuel, Contiguo a Bingo Lime±o, La Union	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
253	Juan Jose Martinez Labor	s/d	s/d	0103-261075-101-0	019641-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
254	Juan Manuel Ramirez Lazo	Clinica San Pablo	s/d	0619-221268-102-2	125468-1	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
255	Juan Merlin Acosta	s/d	s/d	s/d	100778-3	SOYAPANGO  UNICENTRO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
256	Juventino Alexander Benitez Merino	s/d	s/d	0614-070180-102-2	112370-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
257	Karina Gaytan	Laboratorio Clínico Gaytan	s/d	s/d	194886-5	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
258	Karla Ma. MÚndez R.	s/d	s/d	0210-290875-102-0	187249-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
259	Karla Margarita Johana Elizabeth Villeda	s/d	Venta al por mayor de otros productos	0614-300385-103-3	152806-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
260	Karla María Menendez Rodríguez	s/d	s/d	0210-290875-102-1	187249-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
261	Karla Milena Soler Damas 	Laboratorio Clínico Interlab	s/d	0614-150678-103-0	175282-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
262	Kenny Maricela Campos de Hernández	s/d	s/d	s/d	208222-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
263	Kirian Yamileth Palacios	Laboratorio Clínico Mark	s/d	1009-170376-101-5	235756-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
264	La B Belle y Sonodigedt, S.A. de C.V.	s/d	s/d	s/d	221889-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
265	Laboratorio Álvarez Alemán	s/d	s/d	0614-080390-101-3	911-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
266	Laboratorio Centro Pronostico	s/d	s/d	1001-210272-101-9	1103335-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
267	Laboratorio Clínico Alfaro Hernández	s/d	Laboratorio clinico	0614-200953-001-0	210033-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
268	Laboratorio Clínico Belloso	s/d	s/d	0210-170952-005-4	160301-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
269	Laboratorio Clínico de Diagnostico San Juan	s/d	s/d	s/d	79194-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
270	Laboratorio Clínico Especializado S.A.	s/d	s/d	0614-010975-003-4	4744-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
271	Laboratorio Clínico Familiar Rivas Romero	s/d	s/d	s/d	162104-9	ZACATECOLUCA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
272	Laboratorio Clínico Flores	s/d	s/d	1323-300868-101-9	128703-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
273	Laboratorio Clínico Instituto de Ojos, S. A de C.V.	s/d	s/d	0614-300878-003-0	2582-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
274	Laboratorio Clínico Labor	s/d	s/d	0103-261075-101-9	019641-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
275	Laboratorio Clínico Mercadeño	s/d	s/d	s/d	177026-0	MERCEDES UMAÐA USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
276	Laboratorio Clínico Moran S.A. de C.V.	s/d	s/d	0614-300787-002-3	3488-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
277	Laboratorio Clínico Pérez	s/d	s/d	0614-170395-104-4	84670-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
278	Laboratorio Clínico Popular	s/d	s/d	0821-110849-001-0	3380-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
279	Laboratorio Clínico Providencia	s/d	s/d	s/d	117408-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
280	Laboratorio Clínico ROUX, Sucesión Delmy Castellanos de Jaimes	s/d	s/d	0614-150531-003-0	163901-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
281	Laboratorio Clínico San Carlos	s/d	s/d	0210-030453-001-8	31795-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
282	Laboratorio Clínico San Juan	s/d	s/d	0614-020383-003-0	2620-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
283	Laboratorio Clínico Tecleño	s/d	Laboratorio clinico	0500-220770-101-4	91249-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
284	Laboratorio Clínico Vasper	s/d	s/d	0502-150854-001-8	23325-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
285	Laboratorio Clínico y Rayo X Policlinica Casa de la Salud	s/d	s/d	0614-261094-101-0	83118-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
286	Laboratorio de Diagnostico Escalón	s/d	s/d	0614-190799-101-0	114011-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
287	Laboratorio Diagnostico Clínico	s/d	s/d	0203-280650-002-7	23806-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
288	Laboratorio Insumed S.A de C.V	s/d	Distribucion de material medico y equipo	0614-300408-102-9	186705-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
289	Laboratorio Jerusalen	s/d	s/d	0416-160567-101-0	134033-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
290	Laboratorio Lambda S.A. de C.V.	s/d	s/d	0614-101184-001-9	23099-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
291	Laboratorio Langermans	s/d	s/d	s/d	176691-1	OLOCUILTA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
292	Laboratorio Medico Agepym	s/d	s/d	0614-011066-001-0	44565-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
293	Laboratorio Medico Central, S.A de C.V.	s/d	s/d	0614-061276-001-9	844-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
294	Laboratorio Monrroy	s/d	s/d	0210-101252-002-4	24398-1	SANATA TECLA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
295	Laboratorio Plaza Medica, S.A. de C.V.	s/d	s/d	1217-100399-101-0	111923-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
296	Laboratorio San Gerardo	s/d	s/d	0515-251052-001-5	101748-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
297	Laboratorio Vijosa S.A. de C.V.	s/d	s/d	0614-240775-001-0	32757-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
298	Laboratorios Arsal S.A. de C.V.	s/d	s/d	0614-140861-001-4	249-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
299	Laboratorios Bioquímicos salvadoreños S.A. de C.V.	s/d	s/d	0614-180386-001-9	758-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
300	Laboratorios Centro Ginecologico, S.A. de C.V.	s/d	s/d	0614-210488-104-2	6421-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
301	Laboratorios Linares S.A. de C.V.	s/d	s/d	0614-090186-004-0	3751-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
302	Labymed S.A. de C.V.	s/d	s/d	0614-050608-101-5	187449-4	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
303	LC Centro Scan, S.A de C.V	s/d	Analisis clinico	s/d	33028-0	Edificio Centro  Scan	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
304	LC Diagnostico San Juan Mercedes Ventura	s/d	s/d	1217-110456-002-9	79194-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
305	LC Especializado	Laboratorio Clinesa	s/d	0614-010975-003-4	4744-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
306	LC Flores	s/d	s/d	1323-300868-101-9	128703-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
307	LC Pérez	s/d	s/d	0614-170395-104-4	84670-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
308	LC Popular	s/d	s/d	0821-110849-001-0	3380-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
309	LC Roux, Sucesión Delmy Castellanos	s/d	s/d	0614-150531-003-0	163901-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
310	LC San Carlos	s/d	s/d	0210-030453-001-8	31795-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
311	LC San Juan	s/d	s/d	0614-020383-003-0	2620-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
312	LC Seprosa	s/d	s/d	0614-250285-001-2	9051-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
313	León Antonio Guzmán Herrera	Laboratorio Demogracia	s/d	0612-030878-101-9	190052-1	CENTRO COM.ERCIAL PORTAL SAGRERA, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
314	Lidia Ester de Tobar	s/d	s/d	0315-241157-001-2	7246-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
315	Liliam Gaitan Chevez	s/d	s/d	1118-180375-101-0	164970-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
316	Lilian Diaz	s/d	s/d	s/d	202300-8	STA ROSA, LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
317	Lilian Gaitan Chevez 	Laboratorio Bernal	s/d	1118-180375-101-0	164970-1	USULUTA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
318	Liliana Esmeralda Campos	Laboratorio Clínico Lecar	s/d	s/d	193020-0	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
319	Lina de La Cruz Guadalupe de Romero	Laboratorio Clínico Inmuno Diagnostico	s/d	0614-230951-006-5	31322-3	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
320	Liseth Beatriz Saldaña de Vásquez	Laboratorio Bloom	s/d	s/d	171225-6	AHUACHAPAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
321	Lizeth Sabrina Hernández	s/d	s/d	1408-090779-102-1	120159-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
322	Lizeth Sabrina Hernández de Alvarado	s/d	s/d	1408-090779-102-1	120159-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
323	Lorena Arely Vásquez	Laboratorio Clínico Shaday	s/d	1206-150269-101-0	130270-2	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
324	Lourdes Elizabeth Araujo Galan	s/d	s/d	1121-280786-101-7	240729-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
325	Lucia Gloribel Duanas	Laboratorio Florida	s/d	1123-110968-102-8	118723-5	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
326	Lucio Alberto Sorto Benítez	s/d	s/d	1408-190962-002-6	198272-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
327	Luis Alfredo Álvarez	s/d	s/d	s/d	8214-1	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
328	Luis Vásquez Cuellar	s/d	s/d	0614-170749-010-9	29198-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
329	Luz  de María Larios 	Laboratorio Clínico Larios	s/d	s/d	156398-5	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
330	Manuel de Jesús Cañas Blanco	s/d	s/d	s/d	144257-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
331	Manuel de Jesús Castro Montes	s/d	s/d	s/d	224160-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
332	Manuel de Jesús Romero	s/d	s/d	0821-241268-102-5	145816-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
333	Marbin Francisco Sandoval Zavaleta / 	Laboratorio Clínico Sandoval	s/d	0602-030456-001-5	122170-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
334	Margarita Ermita Alvarado de Martinez	Laboratorio Clínico Levy	s/d	0619-100369-101-4	134032-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
335	María  Isabel Lemus 	Laboratorio Clínico Lui-Lab	s/d	0710-130538-109-	209495-7	SENSUNTEPEQUE CABAÐAS	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
336	María de Los Ángeles Nájera de Reyes	s/d	s/d	s/d	84548-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
337	María Delsa Flores de Molina	s/d	s/d	1402-140664-001-3	71527-1	LA  UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
338	María Elba Portillo Orellana	Laboratorio Clínico Prodiagnostic	s/d	0512-141148-002-8	28559-5	ANTIGUA CALLE AL MATAZANO SOYAPANGO, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
339	María Elena Montalvo	s/d	s/d	0614-310553-009-7	31885-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
340	María Esperanza Guardado de Castro	s/d	s/d	0416-160567-101-0	134033-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
341	María Espinoza Bonilla Zavala	s/d	s/d	s/d	173512-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
342	María Eugenia Campos	Laboratorio Campos	s/d	1121-200352-001-2	20456-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
343	María Eugenia Zelaya de Bendek	s/d	s/d	s/d	141052-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
344	María Gabriela Romero	s/d	s/d	1217-231079-109-2	170616-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
345	María Gabriela Romero Zamora	Laboratorio Ciudad Pacifica	s/d	s/d	170616-4	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
346	María Gladis Reyes López	s/d	s/d	1217-200248-001-9	36315-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
347	María Hilda Escalante de Cárcamo	s/d	s/d	0420-190545-001-0	22013-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
348	María Isabel de Salguero	Laboratorio Clínico Sigma	s/d	0614-010757-023-5	81381-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
349	María Lourdes Gómez de Martinez	s/d	s/d	s/d	165044-8	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
350	María Luisa Cañas Crespo 	Laboratorio Clínico Santa Fe	s/d	s/d	92104-1	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
351	María Magdalena Zetino	s/d	s/d	0619-070953-002-1	64056-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
352	María Mercedes Amaya de Bolaños	Laboratorio Santa Barbara	s/d	1217-240955-002-0	118652-4	SANTA ANA  LABORATORIO SANTA BARBARA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
353	María Stella  V. de Soundy	s/d	s/d	0614-200549-002-9	160833-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
354	María Teresa Melgar	Laboratorio Delmer	s/d	s/d	197785-0	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
355	Marina Del Carmen Montenegro Chávez	s/d	s/d	1123-160853-003-2	81335-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
356	Marina Hortensia Calderón de Acosta	s/d	s/d	0210-120254-005-8	9430-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
357	Marina Malene Cabrera Murgas	Laboratorio Clinico Cruz	s/d	0203-010970-101-0	171906-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
358	Mario Enrique Figueroa M.	s/d	s/d	s/d	99369-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
359	Mario Oliva	Laboratorio Clínico Caduceus	s/d	0210-070158-001-4	30306-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
360	Maritza Karina Sánchez	s/d	s/d	1314-041274-101-9	149862-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
361	Maritza Susana Ramírez	s/d	s/d	0210-240770-104-0	94824-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
362	Marta  Elena Girón de Cortez	s/d	s/d	0614-120554-012-1	757689-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
363	Marta Alicia Montecino de Guillen	s/d	s/d	1217-040254-400-1	50466-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
364	Marta Cortez de Herrera	s/d	s/d	0203-311049-001-1	80845-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
365	Marta de Herrera	Laboratorio Clínico Herrera Cortez	s/d	0203-311049-001-1	80845-8	LA LIBERTAD	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
366	Marta Elena Giron de Cortez	Laboratorio Clínico Cortez	s/d	0614-120554-012-1	57689-1	2? Avenida Norte Edif. Ca±as Prieto, Aguilares	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
367	Marta Gladys Hernández de Cardona	s/d	s/d	s/d	41882-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
368	Marta Isabel de Salguero 	Laboratorio Clínico Sigma	s/d	0614-010757-023-5	81381-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
369	Marta Lilian Campos de Zelaya	s/d	s/d	1205-050254-001-8	52135-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
370	Marta Lilian Homberger de Mejía  	Laboratorio Clínico Homberger	s/d	0614-030153-001-9	30835-8	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
371	Martha Alicia Montecino de Guillen	s/d	s/d	1217-040254-001-0	50466-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
372	Martha Iveth Escobar de Calles	s/d	s/d	1010-250672-106-2	118962-3	SANTA TECLA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
373	Marvin Filimon Turcios Romero	s/d	s/d	1414-300368-001-9	115602-6	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
374	Marvin Stanley Rodríguez Aquino	s/d	s/d	0315-210884-109-0	227556-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
375	Mauricio Calles Ramírez 	Laboratorio Cerritos	s/d	1408-020253-002-4	160556-9	CHALATENANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
376	Mauricio Edgardo Reyes	s/d	Laboratorio clinico	0702-210552-001-0	87797-2	San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
377	Mauricio Nolasco Chavarria	s/d	s/d	0614-020250-007-1	44792-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
378	Mayra Adela Portillo	s/d	s/d	s/d	787309-8	CUSCATLAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
379	Medico Central	s/d	s/d	0614-061276-001-9	844-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
380	Melida Guadalupe  Pineda de Chávez	s/d	s/d	s/d	177466-6	SAN VICENTE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
381	Merbin  Francisco Sandoval Zavaleta	Laboratorio Clínico  Sandoval	s/d	s/d	122170-2	MEJICANOS SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
382	Mercedes Idalia Alvarado	s/d	s/d	0817-040381-101-9	218817-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
383	Mercedes Ramos Nolasco 	Laboratorio Clínico Corazón de Maria	s/d	0609-141240-001-7	60176-4	COL ESCALON, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
384	Mercy Auxiliadora Flores de Campos	s/d	s/d	0614-150772-102-2	237987-8	San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
385	Meybel de Galvez	Laboratorio Clínico Profesional	s/d	1103-090351-001-1	48312-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
386	Ministerio Paravida	s/d	s/d	0614-300884-002-6	33683-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
387	Mirian Diaz Mendez 	Laboratorio Diaz Mendez	Laboratorio clinico	s/d	101793-4	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
388	Mirian Lorena Rendero Bautista 	Laboratorio Clínico Bautista	s/d	s/d	131482-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
389	Mirna Isabel Villatoro	Laboratorio Clínico Medical Test	s/d	1219-231077-105-9	169658-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
390	Mirna Isabel Villatoro Dueñas	s/d	s/d	1217-231077-105-9	169658-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
391	Mirna Madeli Caceres de Aleman	Laboratorio Aleman	s/d	0205-100568-101-5	34965-8	AHUACHAPAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
392	Mirna Rivas de Marcenaro	Laboratorio Clínico Loma Linda	s/d	0614-050753-013-7	114272-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
393	Morena Yanira Saravia Rivera 	Laboratorio Clínico Sensuntepecano	s/d	0906-200571-102-7	210759-7	CABAÐAS	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
394	Nancy Yoshie Arrazola Bucaro	s/d	s/d	0614-131170-118-0	140218-5	SANTIAGO TEXACUANGO, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
395	Nidia Arcenia Rivas	s/d	s/d	s/d	181937-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
396	Nidia Rivas/ 	Laboratorio Edelman-Gally	s/d	0403-751013-   -	181937-3	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
397	Nipro Medical Corporation Sucursal El Salvador	s/d	s/d	9450-220296-101-4	137599-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
398	Nora  Argentina Rugama Alvarez	s/d	s/d	s/d	27088-1	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
399	Nora Angélica Chavarria	Laboratorio Clínico Samaria	s/d	1220-260178-101-5	224018-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
400	Nora Argentina Rugama Álvarez	s/d	s/d	1323-300868-101-9	27088-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
401	Nury Rodriguez Murcia	s/d	s/d	0614-090174-101-7	185417-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
402	Nutrivet,S.A. de C.V.	s/d	s/d	0614-241106-102-8	176481-2	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
403	Ocon S.A. de C.V.	s/d	s/d	0614-300806-105-7	175635-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
404	Oduver Vladimir Melendez	Laboratorio Inmontes	s/d	s/d	163123-0	LAB.INMONTES, SOYAPANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
405	Omar Antonio Amaya Calix 	Laboratorio Climesan	s/d	1404-140479-101-0	191541-5	LA UNION	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
406	Omar Wilfredo Mena	Laboratorio Diagnostico Profesional	s/d	0512-070871-101-6	157027-4	QUEZALTEPEQUE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
407	Orlando Mauricio Gomez	Laboratorio Clínico Guadalupano	s/d	0210-130567-003-0	194806-2	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
408	Oscar A. Clara Colato	s/d	s/d	0608-291068-001-1	115761-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
409	Oscar Alberto Clara Colato	s/d	s/d	0608-291068-001-1	115761-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
410	Oscar Atilio Pleitez Juarez	s/d	Venta de productos no clasificados previamente	0614-260352-010-8	75046-8	CALLE PRINCIPAL 303 CENTRO URBANO MONSERRAT, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
411	Oscar Nabih Eva Melgar	s/d	s/d	1408-020253-002-4	27473-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
412	Oscar Rivas	Laboratorio Clínico Rivas Morales	s/d	0614-170445-001-0	77372-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
413	Oscar Zelaya Amaya 	Laboratorio Clínico Especializado Cojutepeque	s/d	1010-130967-101-4	36069-4	Avenida Jose Maria Rivas, Cojutepeque, Cuscatlan	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
414	Patronato de La Inmaculada Concepcion	s/d	s/d	0511-200488-101-5	146665-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
415	Pedro Vicente Lara Pinto	s/d	Servicios medicos	0404-080762-002-3	84546-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
416	Porfirio de Jesus Martinez 	Laboratorio Clínico Linares Vasquez	s/d	s/d	180047-1	SENSUNTEPEQUE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
417	Profelab, S.A. de C.V.	s/d	s/d	0614-027011-105-3	209137-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
418	Promed de El Salvador S.A. de C.V.	s/d	s/d	0614-240206-107-4	171091-7	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
419	Promedica Hospitalaria S.A. de C.V.	s/d	s/d	0614-150291-105-2	23966-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
420	QLS, S.A. de C.V.	s/d	s/d	s/d	218143-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
421	Randolfo Guerra Vidal	s/d	s/d	0207-130466-101-3	118504-5	Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
422	Raul Ernesto Gutierrez Palomo	s/d	Servicios medicos	0614-230958-005-5	22429-4	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
423	Raul Humberto Cubias Hernandez	s/d	s/d	1011-141161-001-9	169768-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
424	Rebeca Toledo Henriquez 	Laboratorio Central	s/d	0203-290952-001-1	45613-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
425	Reina de la Paz Luna de Villalobos	Laboratorio Clínico Albert	s/d	1412-111174-103-9	223892-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
426	Reina Rosa Reyes	Laboratorio Clínico Integral	s/d	s/d	152298-1	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
427	Rene Mauricio Marroquin	Laboratorio Clínico Marroquin	s/d	0906-221251-001-5	60884-0	Caba±as	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
428	Rene Orlando Urrutia Alfaro	s/d	s/d	1205-271273-101-5	207590-4	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
429	Reyesarev, S.A. de C.V.	s/d	s/d	0210-210203-101-0	148413-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
430	Ricardo Francisco Galdamez de La O	s/d	Servicios de odontologia	0614-050375-104-4	167243-1	Cuscatlan	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
431	Roáana Seáa de Artiga 	Laboratorio Clínico Saga	Servicios medicos	0614-270162-007-9	31396-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
432	Roberto Antonio Aparicio	Laboratorio Guatemala	s/d	s/d	1482083-0	CABAÐAS	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
433	Roberto Bell	s/d	s/d	0614-300553-005-1	63415-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
434	Roberto Carlos Cabezas Sorto	s/d	s/d	1416-011179-101-5	215132-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
435	Romel  Ernesto Zuniga	Laboratorio Clínico Labcom	s/d	s/d	166277-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
436	Romel Ernesto Zuniga	Laboratorio Clínico Labcom	s/d	1217-121074-101-6	166277-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
437	Roque Herbert Padilla Duran	Laboratorio Clinico Roque	s/d	0614-030753-002-6	187217-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
438	Rosa Alicia Alegrýa de Tejada	s/d	s/d	0701-230251-001-2	144832-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
439	Rosa Alicia Escobar de Grande	Laboratorio Escobar	s/d	0602-260878-102-7	145377-6	AGUILARES, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
440	Rosa Amelia Amya de Vasquez 	Laboratorio Clínico Centinel	s/d	s/d	199886-0	ILOPANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
441	Rosa Amelia Lopez	s/d	Laboratorio de radiologia	s/d	78169-0	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
442	Rosa Candida Sánchez	s/d	s/d	0702-260566-101-6	126717-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
443	Rosa Delmi Ramos	Laboratorio Clínico Papanicolau	s/d	s/d	55101-5	SABN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
444	Rosa María Minero 	Laboratorio Clínico Minero	s/d	s/d	82064-4	LA PAZ	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
445	Rosa Maribel Barahona	s/d	s/d	s/d	94823-3	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
446	Roxana Del Carmen Juarez Santeliz 	Laboratorio Clínico Santeliz	s/d	0213-141275-101-3	146978-5	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
447	Roxana Guadalupe Colorado	Laboratorio Clínico Profesional	s/d	0810-051272-101-3	121076-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
448	Ruben Gonzalo Jovel	s/d	s/d	s/d	25782-6	USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
449	Ruth Marcela Majano	s/d	s/d	0614-250272-102-0	169739-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
450	S.V.C.I.S., S.A. de C.V. 	Laboratorio Clínico Centro Medico Integral	Servicios medicos y laboratorio clinico	0614-240608-101-0	187888-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
451	Salvador Herrera	Laboratorio San Antonio	s/d	0203-151275-101-6	120613-0	SONSONATE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
452	Samuel Tejada Gomez	s/d	s/d	0816-080971-001-3	106063-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
453	Sanchez Y Duran	Laboratorio Clínico Santa Clara	s/d	0614-011113-106-4	229672-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
454	Sandra Amalia Platero de Morales Ab	Laboratorio Clínico Prof Chalateco	s/d	s/d	88796-0	CHALATENANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
455	Sandra Hernández de Milla	s/d	s/d	0602-100261-001-2	99134-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
456	Sandra Yaneth Peñate de Guzman	Laboratorio Clínico Democracia	Servicios de analisis y estudios	0614-271076-125-7	200729-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
457	Sandra Yanira Sosa de Martinez	s/d	s/d	0511-060769-103-5	168783-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
458	Santa Ana Cirugia Plastica y Spa	s/d	s/d	0614-300309-103-9	193943-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
459	Santa María Bonilla Cruz	s/d	s/d	s/d	150872-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
460	Scientific Instruments S.A. de C.V.	s/d	s/d	0614-170902-103-0	145162-6	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
461	Selma Matal de Guevarra	Laboratorio Candelaria	s/d	0614-030479-106-1	184817-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
462	Seprosa, S.A. de C.V.	s/d	s/d	0614-250285-001-2	9051-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
463	Servicios Integrales Medicos S.A. de C.V.	s/d	s/d	0614-080695-102-0	86676-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
464	Servicios Integrales Soundy Viaud, S.A. de C.V.	s/d	s/d	0614-160614-101-9	234106-4	San Salvador	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
465	Servicios Quirurgicos de El Salvador S.A. de C.V.	s/d	s/d	0614-240298-105-0	105145-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
466	Servicios Y Suministros de Alta Tecnologia	s/d	Laboratorio clinico radiologia y asimilados	0614-300103-111-0	148424-9	CENTRO FINANCIERO SISA, LA LIBERTAD	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
467	Silvia Estela Molina Rivera	Laboratorio Clínico Jesse	s/d	s/d	127689-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
468	Silvia Lisbeth Aguilar de Romero	s/d	s/d	s/d	198543-8	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
469	Simon Eduardo Avalos Marroquin 	Laboratorio Clínico Cuscatlan	s/d	s/d	147359-6	SUCHITOTO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
470	Sociedad Anónima Sanabria Figueroa de Capital Variable	s/d	s/d	s/d	226409-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
471	Sociedad de Profesionales Medicos S.A. de C.V	s/d	s/d	0207-090592-101-6	76823-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
472	Sociedad Mount Sinai, S.A. de C.V.	s/d	s/d	0614-160407-104-0	179552-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
473	Solucion Pharma	s/d	s/d	0614-271010-107-9	205854-9	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
474	Sonia Carranza de Osorio	Laboratorio Clínico Carranza	s/d	0614-190251-010-2	72384-3	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
475	Sonia Elizabeth Vega de Orellana	s/d	s/d	1218-031152-001-4	38617-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
476	Sonia Guadalupe Portillo Giron	s/d	s/d	0714-111283-109-9	234737-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
477	Sonia Jeannette Eva Hernandez	s/d	Laboratorios clinicos radiologia y asimilados	0614-040971-104-7	192226-9	1a AV SUR No 15  BARRIO LA SOLEDAD, SAN FRANCISCO GOTERA, MORAZAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
478	Suceccion Delmy Castellanos de Jaimes	s/d	s/d	s/d	16901-5	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
479	Sucesores Luis Torres y CompañIa	s/d	s/d	0614-070169-001-1	117-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
480	Suministros LR	s/d	s/d	s/d	203438-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
481	Susana Abrego Tobar	s/d	s/d	0614-311266-012-4	124169-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
482	Susana Carolina Castellon Lopez	s/d	s/d	0502-301276-101-3	180090-0	SONSONATE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
483	Tecnolab Laboratorio Clinico S.A. de C.V.	s/d	s/d	0614-181104-105-4	160920-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
484	Transito de Jesus Portillo	s/d	s/d	s/d	149233-0	S.S	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
485	Udp 	Laboratorio Clínico Los Cedros	s/d	0614-051012-106-4	220601-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
486	Udp, Laboratorio Clinico Los Cedros.	s/d	Laboratorio clinico y asimilados	0614-051012-106-4	220601-8	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
487	Ultra Servimedic S.A. de C.V.	s/d	Servicios medicos	0614-140994-107-3	182120-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
488	Universidad Catolica de El Salvador	s/d	Enseñanza formal	s/d	26024-6	25 Calle Oriente y 25 Av. Sur Carretera Antigua a San Salvador, Santa Ana	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
489	Universidad Evangelica de El Salvador	s/d	s/d	0614-170181-001-5	32832-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
490	Universidad SalvadoreñA Alberto Masferrer	s/d	s/d	0614-170680-001-2	71890-4	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
491	Verónica Cecilia Rodríguez de Quintero	s/d	s/d	0614-141172-130-7	196550-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
492	Verónica Yasmin Navarro de Linares 	Laboratorio Clínico Navarro	s/d	s/d	230158-2	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
493	Victor Manuel Alvarado Vaquerano	s/d	s/d	0614-010769-121-1	197179-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
494	Villalobos Velado, S.A. de C.V.	Laboratorio Prolab	s/d	0614-110401-101-7	158214-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
495	Vilma Dinora Cerna de Aguilar	s/d	s/d	0316-170576-101-3	162842-9	CARA SUCIA, AHUACHAPAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
496	Vilma Quintanilla	Laboratorio Seprolab	s/d	s/d	122076-1	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
497	Virginia Del Carmen Hernandez	s/d	s/d	1108-011053-002-5	40361-0	SAN JUAN NONUALCO LA PAZ	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
498	Virna Mercedes Fuente/ 	Laboratorio Gram	s/d	0819-161186-001-0	86398-0	SANTIAGO NONUALCO, LA PAZ	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
499	Vivel S.A. de  C.V. /VILLALOBOS Velado S.A. de C.V. 	Laboratorio Prolab	s/d	0614-110401-101-7	158214-1	SANTA TECLA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
500	Waldina Bertaly Gaitan de Rivera	s/d	s/d	1406-300174-101-8	130416-1	SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
501	Wally Cecilia Benitez de Gutierrez 	Laboratorio Clínico Imedic	s/d	1213-260659-002-5	22430-8	SANTA ANA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
502	Walter Alexander Mendoza Chavez	Laboratorio Clínico Mm Fisherst	s/d	1010-070573-103-1	239739-0	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
503	Wilfredo Parada	Laboratorio Molina	s/d	s/d	177137-7	SANTIAGO NONUALGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
504	Wilfredo Tobar	s/d	s/d	1324-250946-001-8	53168-5	Calle la Fuente frente a Unicentro, SOYAPANGO, SAN SALVADOR	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
505	Will Salomon Saravia 	Laboratorio Clínico Saravia	s/d	s/d	149104-1	CUSCATLAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
506	William Alexander Canizalez	Laboratorio Clínico Mendel	s/d	s/d	137186-7	AHUACHAPAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
507	William Alfredo Mayorga	Laboratorio Mayorga	s/d	s/d	167690-2	CHALCHUAPA	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
508	Wilson Edgardo Barrientos Guillen	Laboratorio Clínico Universal	s/d	0210-021071-108-4	155772-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
509	Xiomara Chavez Perez 	Laboratorio Clínico Melgares	s/d	1217-290678-105-1	121388-9	Morazan	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
510	Yanira Cañas de Molina	s/d	s/d	0616-260766-001-6	134117-9	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
511	Yanira Granados  Granados  	Laboratorio Clinico Jucuapence	Laboratorio clinico y asimilados	1218-250379-101-0	1956004	JUCUAPA, USULUTAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
512	Yanira Rivera	s/d	s/d	s/d	223041-7	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
513	Yeáenia Ventura	Laboratorio Clínico Kolmer	s/d	s/d	186576-6	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
514	Yecenia Maritza Garcia Zamora 	Laboratorio Clínico Corinto	s/d	1009-191083-101-5	196870-9	MORAZAN	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
515	Yenny Lisset Molina de Benítez	s/d	s/d	1009-280973-101-4	216368-3	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
516	Yeny  Rene Perez 	Laboratorio Clínico Maklyn	s/d	s/d	205313-4	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
517	Zaida Arely Perla de Lovo 	Laboratorio Clinico San Nicolas	s/d	s/d	187489-9	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
518	Zelaya Ramentol, S.A. de C.V.	s/d	Servicios medicos	0614-190810-106-0	203955-5	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
519	Zelgal, S.A. de C.V.	s/d	s/d	0614-101094-102-9	82161-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
520	Zoila Amanda Rivas 	Laboratorio Clínico Roosvelt	s/d	0619-181249-002-2	103154-6	SOYAPANGO	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
521	Zoila Areli  Hernandez	Laboratorio Rochester	s/d	s/d	51915-4	SAN MIGUEL	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
522	Zonia Martinez de Chavez	s/d	s/d	1416-250950-002-9	33185-6	s/d	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
523	Zoraida Beatriz Monterrosa	Laboratorio Clínico MM Fisherst	s/d	s/d	147267-1	SAN VICENTE	s/d	t	6	97	2015-11-07	1	1	2015-11-07	s/d	f	1	s/d	f	1	1
\.


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 186
-- Name: ctl_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ctl_cliente_id_seq', 523, true);


--
-- TOC entry 2114 (class 2606 OID 17139)
-- Name: ctl_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT ctl_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 37303)
-- Name: uk_cliente_nombre; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT uk_cliente_nombre UNIQUE (nombre);


--
-- TOC entry 2117 (class 2606 OID 17270)
-- Name: lnk_ctl_departamento_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_departamento_ctl_cliente FOREIGN KEY (id_departamento) REFERENCES ctl_departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2118 (class 2606 OID 17290)
-- Name: lnk_ctl_municipio_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_municipio_ctl_cliente FOREIGN KEY (id_municipio) REFERENCES ctl_municipio(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2122 (class 2606 OID 37293)
-- Name: lnk_ctl_tipo_cliente_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_tipo_cliente_ctl_cliente FOREIGN KEY (id_tipo_cliente) REFERENCES ctl_tipo_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2121 (class 2606 OID 17600)
-- Name: lnk_ctl_zona_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_zona_ctl_cliente FOREIGN KEY (id_zona) REFERENCES ctl_zona(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2119 (class 2606 OID 17340)
-- Name: lnk_fos_user_user_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_fos_user_user_ctl_cliente FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2120 (class 2606 OID 17345)
-- Name: lnk_fos_user_user_ctl_cliente_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_fos_user_user_ctl_cliente_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2016-02-11 10:56:47 CST

--
-- PostgreSQL database dump complete
--


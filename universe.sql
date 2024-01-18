--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_types character varying(30),
    name character varying(30) NOT NULL,
    description character varying(60) NOT NULL,
    age_in_millions_of_years numeric(6,1),
    more_info text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(60),
    planet_id integer,
    distance_from_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    name character varying(30) NOT NULL,
    more_info_id integer NOT NULL,
    fill character varying(60)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(60),
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(60),
    galaxy_id integer,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxia espiral barrada', 'Vía Láctea', 'Nuestra galaxia espiral con vasta diversidad estelar.', 13500.0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Galaxia espiral', 'Andrómeda (M31)', 'Colosal espiral vecina a la Vía Láctea.', 10000.0, NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxia espiral', 'Galaxia del Triángulo (M33)', 'Hermosa espiral en el Triángulo.', 8000.0, NULL);
INSERT INTO public.galaxy VALUES (4, 'Galaxia espiral', 'Sombrero (M104)', 'Elegante galaxia con forma de sombrero.', 9000.0, NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxia elíptica', 'Centaurus A', 'Galaxia activa con intensa emisión de radio.', 12000.0, NULL);
INSERT INTO public.galaxy VALUES (6, 'Galaxia espiral', 'Galaxia del Molinete (M101)', 'Espiral grande con brazos espirales prominentes.', 9000.0, NULL);
INSERT INTO public.galaxy VALUES (7, 'Galaxia espiral', 'Galaxia del Remolino (M51)', 'Espectacular galaxia con características únicas.', 9500.0, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Satélite natural de la Tierra', 3, 0);
INSERT INTO public.moon VALUES (2, 'Fobos', 'Una de las lunas de Marte', 4, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Otra luna de Marte', 4, 0);
INSERT INTO public.moon VALUES (4, 'Ío', 'Luna volcánica de Júpiter', 5, 0);
INSERT INTO public.moon VALUES (5, 'Europa', 'Luna con océano subsuperficial en Júpiter', 5, 0);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 'La luna más grande de Júpiter', 5, 0);
INSERT INTO public.moon VALUES (7, 'Calisto', 'Luna con una antigua superficie en Júpiter', 5, 0);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Pequeña luna con un gran cráter en Saturno', 6, 0);
INSERT INTO public.moon VALUES (9, 'Titán', 'Luna más grande de Saturno, con atmósfera', 6, 0);
INSERT INTO public.moon VALUES (10, 'Encélado', 'Luna de Saturno con géiseres de agua', 6, 0);
INSERT INTO public.moon VALUES (11, 'Oberon', 'Luna de Urano con una superficie oscura', 7, 0);
INSERT INTO public.moon VALUES (12, 'Titania', 'Luna de Urano con cañones y fracturas', 7, 0);
INSERT INTO public.moon VALUES (13, 'Tritón', 'Luna peculiar de Neptuno con actividad geológica', 8, 0);
INSERT INTO public.moon VALUES (14, 'Caronte', 'Luna más grande de Plutón, en sistema binario', 9, 0);
INSERT INTO public.moon VALUES (15, 'Endor', 'Luna boscosa en la galaxia', 10, 0);
INSERT INTO public.moon VALUES (16, 'Mustafar', 'Luna volcánica en la galaxia', 10, 0);
INSERT INTO public.moon VALUES (17, 'Kashyyyk', 'Luna arbolada habitada por wookiees', 10, 0);
INSERT INTO public.moon VALUES (18, 'Hoth', 'Luna helada en la galaxia', 10, 0);
INSERT INTO public.moon VALUES (19, 'Jakku', 'Luna desértica en la galaxia', 10, 0);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Luna de Urano con terreno accidentado', 7, 0);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES ('Javier', 1, 'aaaa');
INSERT INTO public.more_info VALUES ('Andres', 2, 'aaaa');
INSERT INTO public.more_info VALUES ('Jose', 3, 'aaa');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Planeta rocoso cercano al Sol', 0, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planeta brillante con una gruesa atmósfera', 0, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Tierra', 'Nuestro hogar, único en soportar vida conocida', 0, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 'Planeta rojo, objeto de exploración', 0, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Júpiter', 'El gigante gaseoso con la Gran Mancha Roja', 0, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Famoso por sus impresionantes anillos', 0, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Urano', 'Planeta inclinado con atmósfera azulada', 0, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Lejano y azul, con vientos veloces', 0, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Plutón', 'Planeta enano en los confines del sistema solar', 0, false, true, 1);
INSERT INTO public.planet VALUES (10, 'Tatooine', 'Planeta en el sistema binario de Tatoo', 0, true, true, 2);
INSERT INTO public.planet VALUES (11, 'Naboo', 'Hermoso planeta acuático en la galaxia', 0, true, true, 2);
INSERT INTO public.planet VALUES (12, 'Coruscant', 'Centro político de la galaxia', 0, false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Nuestra estrella principal', 1, 8);
INSERT INTO public.star VALUES (2, 'Estrella de Andrómeda', 'Estrella en la galaxia vecina', 2, 2);
INSERT INTO public.star VALUES (3, 'Estrella en Triángulo', 'Brilla en la Galaxia del Triángulo', 3, 2);
INSERT INTO public.star VALUES (4, 'Sombrero Brillante', 'Estrella central en Sombrero (M104)', 4, 28);
INSERT INTO public.star VALUES (5, 'Centauri A', 'Estrella activa en Centaurus A', 5, 13);
INSERT INTO public.star VALUES (6, 'Molinete Brillante', 'Destaca en Galaxia del Molinete (M101)', 6, 21);
INSERT INTO public.star VALUES (7, 'Remolino Estelar', 'Luminosa en Galaxia del Remolino (M51)', 7, 23);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_constraint UNIQUE (name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info pk_more_info; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT pk_more_info PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_constraint UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_constraint UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_constraint UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(30),
    stars_in_billion integer
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
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moon boolean,
    diameter_in_km numeric(15,2),
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
-- Name: planet_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_star (
    planet_star_id integer NOT NULL,
    planet_id integer,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet_star OWNER TO freecodecamp;

--
-- Name: planet_star_planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_planet_star_id_seq OWNED BY public.planet_star.planet_star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    magnitude numeric(10,2),
    galaxy_id integer
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
-- Name: planet_star planet_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star ALTER COLUMN planet_star_id SET DEFAULT nextval('public.planet_star_planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milkey Way.', 'Spiral Galaxy', 220000);
INSERT INTO public.galaxy VALUES (2, 'Cartwheel Galaxy', 'The Cartwheel Galaxy is a lenticular ring galaxy about 500 million light-years away in the cosntellation Sculptor.', 'Lenticular', 130000);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', '82 Galaxy Messier 82 is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major.', 'Starburst', 37000);
INSERT INTO public.galaxy VALUES (4, 'Bode''s Galaxy', 'Messier 81 is a grand design spiral galaxy about 12 million light-years away in the constellation Ursa major.', 'Spiral', 90000);
INSERT INTO public.galaxy VALUES (5, 'Hoag''s Object', 'Hoag''s Object is an unusual ring galaxy in the constellation of Serpens Caput.', 'Ring', 121000);
INSERT INTO public.galaxy VALUES (6, 'Milky Way Galaxy', 'The Milky Way is the galaxy taht includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 'Spiral', 105700);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', true, 4.50, 1);
INSERT INTO public.moon VALUES (2, 'Io', true, 4.50, 5);
INSERT INTO public.moon VALUES (3, 'Europa', true, 4.50, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 4.50, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', true, 4.50, 5);
INSERT INTO public.moon VALUES (6, 'Titan', true, 4.50, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', true, 4.50, 6);
INSERT INTO public.moon VALUES (8, 'Triton', true, 4.50, 8);
INSERT INTO public.moon VALUES (9, 'Phobos', false, 4.30, 4);
INSERT INTO public.moon VALUES (10, 'Deimos', false, 4.30, 4);
INSERT INTO public.moon VALUES (11, 'Miranda', true, 4.50, 7);
INSERT INTO public.moon VALUES (12, 'Ariel', true, 4.50, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', true, 4.50, 7);
INSERT INTO public.moon VALUES (14, 'Titania', true, 4.50, 7);
INSERT INTO public.moon VALUES (15, 'lapetus', true, 4.50, 6);
INSERT INTO public.moon VALUES (16, 'Rhea', true, 4.50, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', true, 4.50, 6);
INSERT INTO public.moon VALUES (18, 'Phoebe', false, 4.50, 6);
INSERT INTO public.moon VALUES (19, 'Chiron', false, 4.50, 6);
INSERT INTO public.moon VALUES (20, 'Thebe', false, 4.50, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 12742.00, 4);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 4880.00, 4);
INSERT INTO public.planet VALUES (3, 'Venus', false, 12104.00, 4);
INSERT INTO public.planet VALUES (4, 'Mars', true, 6779.00, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 139820.00, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 116460.00, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 50742.00, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 49244.00, 4);
INSERT INTO public.planet VALUES (9, 'Sirius A', NULL, 119000000.00, 6);
INSERT INTO public.planet VALUES (10, 'Sirius B', NULL, 6000000.00, 6);
INSERT INTO public.planet VALUES (11, 'Upsilon Andromedae b', NULL, 139820.00, 3);
INSERT INTO public.planet VALUES (12, 'Upsilon Andromedae c', NULL, 143740.00, 3);


--
-- Data for Name: planet_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_star VALUES (4, 1, 4, '1-4');
INSERT INTO public.planet_star VALUES (5, 2, 4, '2-4');
INSERT INTO public.planet_star VALUES (6, 9, 6, '9-6');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 97, 10.80, 1);
INSERT INTO public.star VALUES (2, 'Mirach', 199, 2.07, 1);
INSERT INTO public.star VALUES (3, 'Upsilon Andromedae', 44, 4.09, 1);
INSERT INTO public.star VALUES (4, 'Sun', NULL, -26.70, 6);
INSERT INTO public.star VALUES (5, 'Sirius', 9, -1.46, 6);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 643, 0.50, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_planet_star_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_star planet_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star
    ADD CONSTRAINT planet_star_name_key UNIQUE (name);


--
-- Name: planet_star planet_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star
    ADD CONSTRAINT planet_star_pkey PRIMARY KEY (planet_star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_star planet_star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star
    ADD CONSTRAINT planet_star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_star planet_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star
    ADD CONSTRAINT planet_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


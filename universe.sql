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
-- Name: celestial_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body (
    celestial_body_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    type character varying(20) NOT NULL,
    star_id integer,
    CONSTRAINT celestial_body_type_check CHECK (((type)::text = ANY (ARRAY[('Planet'::character varying)::text, ('Moon'::character varying)::text])))
);


ALTER TABLE public.celestial_body OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_celestial_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_celestial_body_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_celestial_body_id_seq OWNED BY public.celestial_body.celestial_body_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    galaxy_types character varying(20)
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
    name character varying(20) NOT NULL,
    description text,
    distance_from_earth integer,
    is_spherical boolean,
    has_life boolean,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth integer,
    columnis_spherical boolean,
    planet_types character varying(20),
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    has_life boolean,
    galaxy_id integer NOT NULL
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
-- Name: celestial_body celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


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
-- Data for Name: celestial_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body VALUES (1, 'Earth', 'The third planet from the Sun', 'Planet', NULL);
INSERT INTO public.celestial_body VALUES (2, 'Mars', 'The fourth planet from the Sun, known for its red color', 'Planet', NULL);
INSERT INTO public.celestial_body VALUES (3, 'Earth', 'The third planet from the Sun, known for life', 'Planet', NULL);
INSERT INTO public.celestial_body VALUES (4, 'Mars', 'The fourth planet from the Sun, known for its red color', 'Planet', NULL);
INSERT INTO public.celestial_body VALUES (5, 'Alpha Centauri Bb', 'Likely a rocky planet orbiting Alpha Centauri A', 'Planet', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy to the Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'Elliptical galaxy, second-closest large galaxy to Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral galaxy known for its active star formation', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Ic 1011', 'Irregular dwarf galaxy with unknown life potential', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'Ring galaxy known for its distinctive appearance', false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 'Earth is only natural satellite, with craters, maria, and potential for water ice', 384400, true, false, 2);
INSERT INTO public.moon VALUES (5, 'Phobos', 'Inner moon of Mars with an irregular shape, possibly captured asteroid', 20923, true, false, 7);
INSERT INTO public.moon VALUES (7, 'Deimos', 'Outer moon of Mars with an elongated shape, possibly captured asteroid', 23460, true, false, 7);
INSERT INTO public.moon VALUES (8, 'Io', 'Volcanic moon of Jupiter with sulfurous surface', 778347, true, true, 15);
INSERT INTO public.moon VALUES (9, 'Europa', 'Moon of Jupiter with subsurface ocean, potential for life', 671034, true, true, 15);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Largest moon in the solar system, with icy surface and internal ocean', 1070412, true, false, 15);
INSERT INTO public.moon VALUES (12, 'Callisto', 'Second-largest moon of Jupiter, with heavily cratered icy surface', 1882709, true, false, 15);
INSERT INTO public.moon VALUES (15, 'Titan', 'Largest moon of Saturn with lakes and atmosphere', 1200000, true, false, 8);
INSERT INTO public.moon VALUES (16, 'Rhea', 'Second-largest moon of Saturn with icy surface and rings', 1514200, true, true, 8);
INSERT INTO public.moon VALUES (17, 'Dione', 'Icy moon of Saturn with canyons and fractures', 1377000, true, true, 8);
INSERT INTO public.moon VALUES (19, 'Triton', 'Largest moon of Neptune with geysers and icy plains, potential for subsurface ocean', 30179000, true, false, 18);
INSERT INTO public.moon VALUES (37, 'Artemis', 'Hypothetical moon of Neptune with a nitrogen atmosphere', 4504, true, false, 18);
INSERT INTO public.moon VALUES (39, 'Kepler-186f-b', 'Hypothetical moon with potential for liquid water on its surface', 495000000, true, false, 10);
INSERT INTO public.moon VALUES (41, 'Enceladus', 'Icy moon with geysers and a subsurface ocean, potential for life', 1272000000, true, false, 15);
INSERT INTO public.moon VALUES (42, 'Mimas', 'Small moon with a large impact crater, giving it a "Death Star" appearance', 1255200000, true, false, 15);
INSERT INTO public.moon VALUES (43, 'Gliese 581 g-I', 'Hypothetical moon of Gliese 581 g, potentially tidally locked', 20400000, true, false, 19);
INSERT INTO public.moon VALUES (44, 'Kepler-186f-I', 'Hypothetical moon of Kepler-186f, potentially habitable', 495000000, true, false, 10);
INSERT INTO public.moon VALUES (45, 'Miranda', 'Geologically diverse moon with canyons and unusual surface features', 2871, true, false, 16);
INSERT INTO public.moon VALUES (46, 'Charon', 'Large moon of Pluto, sometimes considered a binary system with Pluto', 5906, true, false, 17);
INSERT INTO public.moon VALUES (48, 'Iapetus', 'Unique moon with a striking difference in coloration between its leading and trailing hemispheres', 3561, true, false, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 'Our home planet, third planet from the Sun', 4500.00, 150, true, 'Terrestrial', true, 7);
INSERT INTO public.planet VALUES (5, 'Venus', 'Second planet from the Sun, known for its hot and dense atmosphere', 4600.00, 1, true, 'Terrestrial', false, 7);
INSERT INTO public.planet VALUES (7, 'Mars', 'Fourth planet from the Sun, with potential for past or microbial life', 4500.00, 2, true, 'Terrestrial', false, 8);
INSERT INTO public.planet VALUES (8, 'Titan', 'Largest moon of Saturn, with lakes and atmosphere', 1.80, 1, true, 'Gas Giant Moon', true, 8);
INSERT INTO public.planet VALUES (9, 'Mercury', 'Closest planet to the Sun, with no atmosphere', 4.50, 0, true, 'Terrestrial', false, 7);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Exoplanet in the habitable zone of star Kepler-186, potential for life', 5.00, 495, true, 'Terrestrial', false, 7);
INSERT INTO public.planet VALUES (12, 'Europa', 'Moon of Jupiter with subsurface ocean, potential for life', 1.00, 5, true, 'Ice Giant Moon', true, 7);
INSERT INTO public.planet VALUES (15, 'Jupiter', 'Largest planet in the solar system, gas giant with many moons', 4500.00, 5, true, 'Gas Giant', true, 9);
INSERT INTO public.planet VALUES (16, 'Uranus', 'Seventh planet from the Sun, ice giant with tilted axis', 4500.00, 20, true, 'Ice Giant', false, 9);
INSERT INTO public.planet VALUES (17, 'Pluto', 'Dwarf planet in the Kuiper Belt, formerly classified as the ninth planet, with icy mountains and plains', 4.60, 40, true, 'Dwarf Planet', true, 13);
INSERT INTO public.planet VALUES (18, 'Neptune', 'Eighth and farthest planet from the Sun, ice giant with strong winds and a Great Dark Spot', 4500.00, 30, true, 'Ice Giant', true, 13);
INSERT INTO public.planet VALUES (19, 'Gliese 581 g', 'Exoplanet in the habitable zone of star Gliese 581', -2.50, 20, true, 'Super-Earth', false, 9);
INSERT INTO public.planet VALUES (20, 'Saturn', 'Sixth planet from the Sun, known for its rings and numerous moons', 4503.00, 1275, true, 'Gas Giant', false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 'Yellow dwarf star', 4600.00, true, 1);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'Red dwarf star', 4.85, false, 2);
INSERT INTO public.star VALUES (9, 'Alpha Centauri A', 'Sun-like star in the Alpha Centauri system', 4880.00, true, 1);
INSERT INTO public.star VALUES (13, 'Sirius', 'Brightest star in the night sky (visible from Earth)', 250.00, true, 3);
INSERT INTO public.star VALUES (15, 'Beta Andromedae', 'Hot, blue-white main sequence star', 5.00, false, 4);
INSERT INTO public.star VALUES (16, 'Barnar', 'Red dwarf star, one of the closest stars to the Sun', 9.50, false, 5);


--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_celestial_body_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 48, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: celestial_body celestial_body_name_parent_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_name_parent_id_key UNIQUE (name, star_id);


--
-- Name: celestial_body celestial_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_pkey PRIMARY KEY (celestial_body_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


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
-- Name: moon moon_planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_unique UNIQUE (planet_id, name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_on_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_on_planet UNIQUE (name, planet_id);


--
-- Name: moon unique_moon_overall; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_overall UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: celestial_body star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


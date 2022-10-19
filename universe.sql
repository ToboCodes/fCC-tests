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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    has_life boolean NOT NULL,
    name character varying(20),
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    has_life boolean NOT NULL,
    year_discovered integer,
    distance_light_years numeric,
    name character varying(20),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    has_life boolean NOT NULL,
    year_discovered integer,
    distance_light_years integer,
    name character varying(20),
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    year_discovered integer,
    distance_light_years integer,
    name character varying(20),
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    year_discovered integer,
    distance_light_years integer,
    name character varying(20),
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, false, 'Azure Dragon', 1);
INSERT INTO public.constellation VALUES (2, false, 'Black Tortoise', 1);
INSERT INTO public.constellation VALUES (3, false, 'White Tiger', 1);
INSERT INTO public.constellation VALUES (4, false, 'Vermilion Bird', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, true, -500, 0, 'Milky Way', NULL);
INSERT INTO public.galaxy VALUES (2, false, 964, 25881, 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (3, false, 1941, 500, 'Cartwheel Galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, false, 1835, 212, 'Condor Galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, false, 1971, 128, 'Medusa merger', NULL);
INSERT INTO public.galaxy VALUES (6, false, 2002, 290, 'Mice Galaxies', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, false, NULL, NULL, 'Moon', NULL, 3);
INSERT INTO public.moon VALUES (2, false, NULL, NULL, 'Phobos', NULL, 4);
INSERT INTO public.moon VALUES (3, false, NULL, NULL, 'Deimos', NULL, 4);
INSERT INTO public.moon VALUES (4, false, NULL, NULL, 'Io', NULL, 5);
INSERT INTO public.moon VALUES (5, false, NULL, NULL, 'Europa', NULL, 5);
INSERT INTO public.moon VALUES (6, false, NULL, NULL, 'Ganymede', NULL, 5);
INSERT INTO public.moon VALUES (7, false, NULL, NULL, 'Callisto', NULL, 5);
INSERT INTO public.moon VALUES (8, false, NULL, NULL, 'Amalthea', NULL, 5);
INSERT INTO public.moon VALUES (9, false, NULL, NULL, 'Himalia', NULL, 5);
INSERT INTO public.moon VALUES (10, false, NULL, NULL, 'Elara', NULL, 5);
INSERT INTO public.moon VALUES (11, false, NULL, NULL, 'Pasiphae', NULL, 5);
INSERT INTO public.moon VALUES (12, false, NULL, NULL, 'Sinope', NULL, 5);
INSERT INTO public.moon VALUES (13, false, NULL, NULL, 'Lysithea', NULL, 5);
INSERT INTO public.moon VALUES (14, false, NULL, NULL, 'Carme', NULL, 5);
INSERT INTO public.moon VALUES (15, false, NULL, NULL, 'Ananke', NULL, 5);
INSERT INTO public.moon VALUES (16, false, NULL, NULL, 'Leda', NULL, 5);
INSERT INTO public.moon VALUES (17, false, NULL, NULL, 'Thebe', NULL, 5);
INSERT INTO public.moon VALUES (18, false, NULL, NULL, 'Adrastea', NULL, 5);
INSERT INTO public.moon VALUES (19, false, NULL, NULL, 'Metis', NULL, 5);
INSERT INTO public.moon VALUES (20, false, NULL, NULL, 'Callirrhoe', NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, -7000, 0, 'Mercury', NULL, 1);
INSERT INTO public.planet VALUES (2, false, -7000, 0, 'Venus', NULL, 1);
INSERT INTO public.planet VALUES (3, true, -7000, 0, 'Earth', NULL, 1);
INSERT INTO public.planet VALUES (4, false, -7000, 0, 'Mars', NULL, 1);
INSERT INTO public.planet VALUES (5, false, -7000, 0, 'Jupiter', NULL, 1);
INSERT INTO public.planet VALUES (6, false, -7000, 0, 'Saturn', NULL, 1);
INSERT INTO public.planet VALUES (7, false, -7000, 0, 'Uranus', NULL, 1);
INSERT INTO public.planet VALUES (8, false, -7000, 0, 'Neptune', NULL, 1);
INSERT INTO public.planet VALUES (9, false, 1900, 45, 'Corot-7b', NULL, 2);
INSERT INTO public.planet VALUES (10, false, 1900, 45, 'Gliese 581', NULL, 3);
INSERT INTO public.planet VALUES (11, false, 1900, 45, 'Kepler-186f', NULL, 3);
INSERT INTO public.planet VALUES (12, false, 1900, 45, 'HIP 13044b', NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, false, -7000, 0, 'Sun', NULL, 1);
INSERT INTO public.star VALUES (3, false, 2000, 249, 'Musica', NULL, 1);
INSERT INTO public.star VALUES (4, false, 2000, 101, 'Beta Delphini', NULL, 1);
INSERT INTO public.star VALUES (5, false, 2021, 25, 'Vega', NULL, 1);
INSERT INTO public.star VALUES (6, false, 1603, 250, 'Bellatrix', NULL, 1);
INSERT INTO public.star VALUES (2, false, 2001, 455, 'OU And', NULL, 2);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    games_id integer NOT NULL,
    random_number integer NOT NULL,
    number_of_guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_games_id_seq OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_games_id_seq OWNED BY public.games.games_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games games_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN games_id SET DEFAULT nextval('public.games_games_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (125, 619, 620, 94);
INSERT INTO public.games VALUES (126, 238, 239, 94);
INSERT INTO public.games VALUES (127, 657, 658, 96);
INSERT INTO public.games VALUES (128, 718, 719, 96);
INSERT INTO public.games VALUES (129, 940, 943, 94);
INSERT INTO public.games VALUES (130, 944, 945, 94);
INSERT INTO public.games VALUES (131, 711, 712, 94);
INSERT INTO public.games VALUES (132, 777, 778, 101);
INSERT INTO public.games VALUES (133, 90, 91, 101);
INSERT INTO public.games VALUES (134, 837, 838, 103);
INSERT INTO public.games VALUES (135, 570, 571, 103);
INSERT INTO public.games VALUES (136, 789, 792, 101);
INSERT INTO public.games VALUES (137, 404, 405, 101);
INSERT INTO public.games VALUES (138, 462, 463, 101);
INSERT INTO public.games VALUES (139, 585, 586, 108);
INSERT INTO public.games VALUES (140, 986, 987, 108);
INSERT INTO public.games VALUES (141, 802, 803, 110);
INSERT INTO public.games VALUES (142, 483, 484, 110);
INSERT INTO public.games VALUES (143, 834, 837, 108);
INSERT INTO public.games VALUES (144, 536, 537, 108);
INSERT INTO public.games VALUES (145, 756, 757, 108);
INSERT INTO public.games VALUES (146, 677, 678, 117);
INSERT INTO public.games VALUES (147, 565, 566, 117);
INSERT INTO public.games VALUES (148, 219, 220, 119);
INSERT INTO public.games VALUES (149, 214, 215, 119);
INSERT INTO public.games VALUES (150, 898, 901, 117);
INSERT INTO public.games VALUES (151, 858, 859, 117);
INSERT INTO public.games VALUES (152, 923, 924, 117);
INSERT INTO public.games VALUES (153, 682, 683, 124);
INSERT INTO public.games VALUES (154, 649, 650, 124);
INSERT INTO public.games VALUES (155, 433, 434, 125);
INSERT INTO public.games VALUES (156, 461, 462, 125);
INSERT INTO public.games VALUES (157, 197, 200, 124);
INSERT INTO public.games VALUES (158, 409, 410, 124);
INSERT INTO public.games VALUES (159, 133, 134, 124);
INSERT INTO public.games VALUES (160, 542, 543, 126);
INSERT INTO public.games VALUES (161, 983, 984, 126);
INSERT INTO public.games VALUES (162, 258, 259, 127);
INSERT INTO public.games VALUES (163, 69, 70, 127);
INSERT INTO public.games VALUES (164, 327, 330, 126);
INSERT INTO public.games VALUES (165, 857, 858, 126);
INSERT INTO public.games VALUES (166, 452, 453, 126);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (117, 'user_1743143052158');
INSERT INTO public.users VALUES (119, 'user_1743143052157');
INSERT INTO public.users VALUES (124, 'user_1743143076755');
INSERT INTO public.users VALUES (125, 'user_1743143076754');
INSERT INTO public.users VALUES (126, 'user_1743143101175');
INSERT INTO public.users VALUES (127, 'user_1743143101174');
INSERT INTO public.users VALUES (94, 'user_1743142892222');
INSERT INTO public.users VALUES (96, 'user_1743142892221');
INSERT INTO public.users VALUES (101, 'user_1743143008736');
INSERT INTO public.users VALUES (103, 'user_1743143008735');
INSERT INTO public.users VALUES (108, 'user_1743143018206');
INSERT INTO public.users VALUES (110, 'user_1743143018205');
INSERT INTO public.users VALUES (115, 'asdfa');
INSERT INTO public.users VALUES (116, 'sdfasdf');


--
-- Name: games_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_games_id_seq', 166, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 127, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (games_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


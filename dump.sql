--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Ubuntu 15.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg20.04+1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    u_token text NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    url_id integer NOT NULL,
    user_id integer NOT NULL,
    url text NOT NULL,
    short_url text,
    visit_count integer DEFAULT 0 NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_url_id_seq OWNED BY public.urls.url_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    name character varying(60) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls url_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN url_id SET DEFAULT nextval('public.urls_url_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '9a168f6f-3b73-48b3-b489-22bbe8525045', '2023-05-20 22:05:24.447431');
INSERT INTO public.sessions VALUES (2, 1, 'c149178d-2a24-4043-8863-69ef469013eb', '2023-05-21 15:21:01.265214');
INSERT INTO public.sessions VALUES (3, 1, '09daa865-8035-4b3a-8b1c-d258e5b9a591', '2023-05-21 15:39:42.51947');
INSERT INTO public.sessions VALUES (4, 1, '9a0e12be-93c7-4672-9c51-0890003329e2', '2023-05-21 15:39:43.68561');
INSERT INTO public.sessions VALUES (5, 1, 'dcfcfda0-100b-46d4-8de5-b3b89b4a0635', '2023-05-21 15:39:44.616388');
INSERT INTO public.sessions VALUES (6, 1, '3d1a17e9-3665-4310-8cbf-e2edd6d4bfd8', '2023-05-21 15:39:46.18397');
INSERT INTO public.sessions VALUES (7, 2, '051ec10a-b1c3-4659-8e48-c992559c63a7', '2023-05-21 19:20:19.004226');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (2, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', '2s2AH79Bpqmz6kiamsiCS', 0, '2023-05-21 16:36:46.684133');
INSERT INTO public.urls VALUES (4, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', '94jEyD3x7NUXCiVzsH_qj', 0, '2023-05-21 17:00:06.190418');
INSERT INTO public.urls VALUES (6, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', '52Ppud31E0AC1SpLUuRIy', 0, '2023-05-21 17:07:42.740897');
INSERT INTO public.urls VALUES (7, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', 'Z_RKLQpo5WhGXobnJD9sN', 0, '2023-05-21 17:08:02.373605');
INSERT INTO public.urls VALUES (8, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', '-bENBrPJsXhlMy4VsUyua', 0, '2023-05-21 17:09:05.748119');
INSERT INTO public.urls VALUES (5, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', 'dcJpUoyzZ7uaBFmIh4OiO', 6, '2023-05-21 17:02:24.53922');
INSERT INTO public.urls VALUES (11, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbXrBx21yfiqy7BwZ7pbR28aEVBLJ9pgpZDQ&usqp=CAU', 'g31DxhykkKlm52zeFHcLM', 0, '2023-05-21 20:21:59.349699');
INSERT INTO public.urls VALUES (10, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbXrBx21yfiqy7BwZ7pbR28aEVBLJ9pgpZDQ&usqp=CAU', 'RQUT759T_eCmXJPd4MCJi', 2, '2023-05-21 19:25:10.134457');
INSERT INTO public.urls VALUES (3, 1, 'https://s.yimg.com/ny/api/res/1.2/2dSxnVqJpUuMyy89Hf5cew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTk2MA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/9917de65aaf6670c35871ca84107e25f', 'bvZUJDKSZHd1KJuy85v0A', 1, '2023-05-21 16:56:14.203383');
INSERT INTO public.urls VALUES (12, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSflP0cNGnFAmYLFx-ViQ9PdC2lyqbreOjr1Q&usqp=CAU', 'PyZ-Oj0Pgwr2swmi_xW0G', 2, '2023-05-22 00:43:05.444088');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@br.com', '$2b$10$mjLM.btnC3NwrzVdr4kAtuW6n8PhBZFOVR0qxK3wE2K4F3C2ikraq', '2023-05-20 21:07:02.419405');
INSERT INTO public.users VALUES (2, 'leticia', 'leticia@br.com', '$2b$10$pScWrBwZwZldAtEWh./FgefZwrHEcdtruG.NsBBDxrVPXtfaBcq3a', '2023-05-21 19:20:05.435286');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 7, true);


--
-- Name: urls_url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_url_id_seq', 12, true);


--
-- Name: users_u_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_u_id_seq', 2, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_u_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_u_token_key UNIQUE (u_token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (url_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (u_id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(u_id);


--
-- Name: urls urls_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(u_id);


--
-- PostgreSQL database dump complete
--


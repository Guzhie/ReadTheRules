--
-- PostgreSQL database dump
--

\restrict qHONHPJ8pzfTeZyaDkDbz7YfDk2yRZKeGbYkj6ct8Wtlf1qZogbb0ZL4gj0mMfm

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-07-16 18:54:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 16866)
-- Name: Alianca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Alianca" (
    id_alianca uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text
);


ALTER TABLE public."Alianca" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16835)
-- Name: CalendarioEvento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CalendarioEvento" (
    id_evento uuid NOT NULL,
    id_campanha uuid NOT NULL,
    titulo character varying(100) NOT NULL,
    dt_evento timestamp without time zone NOT NULL,
    dt_criacao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."CalendarioEvento" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16846)
-- Name: CalendarioRsvp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CalendarioRsvp" (
    id_rsvp uuid NOT NULL,
    id_evento uuid NOT NULL,
    id_usuario uuid NOT NULL,
    status character varying(15) DEFAULT 'pendente'::character varying NOT NULL,
    dt_resposta timestamp without time zone
);


ALTER TABLE public."CalendarioRsvp" OWNER TO postgres;

--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "CalendarioRsvp".status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CalendarioRsvp".status IS 'pendente | confirmado | recusado';


--
-- TOC entry 220 (class 1259 OID 16799)
-- Name: Campanha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Campanha" (
    id_campanha uuid NOT NULL,
    titulo character varying(100) NOT NULL,
    descricao text,
    dt_criacao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."Campanha" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16908)
-- Name: Conceito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Conceito" (
    id_conceito uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(100) NOT NULL,
    categoria character varying(60),
    descricao text
);


ALTER TABLE public."Conceito" OWNER TO postgres;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN "Conceito".categoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Conceito".categoria IS 'magia | religiao | lei | outro';


--
-- TOC entry 229 (class 1259 OID 16898)
-- Name: Criatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Criatura" (
    id_criatura uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(100) NOT NULL,
    tipo character varying(60),
    descricao text
);


ALTER TABLE public."Criatura" OWNER TO postgres;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "Criatura".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Criatura".tipo IS 'besta | morto-vivo | humanoide | etc';


--
-- TOC entry 225 (class 1259 OID 16856)
-- Name: Deus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Deus" (
    id_deus uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(100) NOT NULL,
    dominio character varying(100),
    descricao text
);


ALTER TABLE public."Deus" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16970)
-- Name: DocumentoExterno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DocumentoExterno" (
    id_documento uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(150) NOT NULL,
    tipo character varying(10) NOT NULL,
    conteudo text NOT NULL,
    vector text,
    dt_upload timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."DocumentoExterno" OWNER TO postgres;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "DocumentoExterno".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."DocumentoExterno".tipo IS 'pdf | md';


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "DocumentoExterno".vector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."DocumentoExterno".vector IS 'vector(1536) — pgvector';


--
-- TOC entry 236 (class 1259 OID 16984)
-- Name: HistoricoIA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistoricoIA" (
    id_consulta uuid NOT NULL,
    id_campanha uuid NOT NULL,
    id_usuario uuid NOT NULL,
    pergunta text NOT NULL,
    resposta text NOT NULL,
    tipo character varying(15) NOT NULL,
    dt_consulta timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."HistoricoIA" OWNER TO postgres;

--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "HistoricoIA".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HistoricoIA".tipo IS 'campanha | sistema';


--
-- TOC entry 231 (class 1259 OID 16918)
-- Name: Item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Item" (
    id_item uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text,
    raridade character varying(20) DEFAULT 'comum'::character varying
);


ALTER TABLE public."Item" OWNER TO postgres;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "Item".raridade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Item".raridade IS 'comum | incomum | raro | lendario';


--
-- TOC entry 232 (class 1259 OID 16929)
-- Name: ItemPosse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ItemPosse" (
    id_item_posse uuid NOT NULL,
    id_item uuid NOT NULL,
    dono_tipo character varying(20) NOT NULL,
    dono_id uuid NOT NULL,
    dt_posse timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."ItemPosse" OWNER TO postgres;

--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "ItemPosse".dono_tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."ItemPosse".dono_tipo IS 'personagem | deus | alianca | criatura | local';


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "ItemPosse".dono_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."ItemPosse".dono_id IS 'UUID do dono, resolvido pelo backend';


--
-- TOC entry 227 (class 1259 OID 16876)
-- Name: Local; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Local" (
    id_local uuid NOT NULL,
    id_campanha uuid NOT NULL,
    nome character varying(100) NOT NULL,
    tipo character varying(50),
    descricao text
);


ALTER TABLE public."Local" OWNER TO postgres;

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "Local".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Local".tipo IS 'cidade | dungeon | regiao | outro';


--
-- TOC entry 221 (class 1259 OID 16810)
-- Name: MembroCampanha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MembroCampanha" (
    id_membro uuid NOT NULL,
    id_campanha uuid NOT NULL,
    id_usuario uuid NOT NULL,
    role character varying(10) DEFAULT 'jogador'::character varying NOT NULL,
    status character varying(15) DEFAULT 'pendente'::character varying NOT NULL,
    dt_entrada timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."MembroCampanha" OWNER TO postgres;

--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN "MembroCampanha".role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."MembroCampanha".role IS 'mestre | jogador';


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN "MembroCampanha".status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."MembroCampanha".status IS 'pendente | ativo';


--
-- TOC entry 233 (class 1259 OID 16940)
-- Name: Nota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Nota" (
    id_nota uuid NOT NULL,
    id_campanha uuid NOT NULL,
    titulo character varying(100) NOT NULL,
    corpo text NOT NULL,
    categoria character varying(20) NOT NULL,
    visibilidade character varying(10) DEFAULT 'mestre'::character varying NOT NULL,
    dt_criacao timestamp without time zone DEFAULT now() NOT NULL,
    dt_atualizacao timestamp without time zone
);


ALTER TABLE public."Nota" OWNER TO postgres;

--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Nota".categoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Nota".categoria IS 'npc | lugar | item | evento | lore';


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Nota".visibilidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Nota".visibilidade IS 'mestre | publico';


--
-- TOC entry 234 (class 1259 OID 16956)
-- Name: NoteEmbedding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NoteEmbedding" (
    id_embedding uuid NOT NULL,
    id_nota uuid NOT NULL,
    vector text NOT NULL,
    dt_criacao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."NoteEmbedding" OWNER TO postgres;

--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "NoteEmbedding".vector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."NoteEmbedding".vector IS 'vector(1536) — pgvector';


--
-- TOC entry 228 (class 1259 OID 16886)
-- Name: Personagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Personagem" (
    id_personagem uuid NOT NULL,
    id_campanha uuid NOT NULL,
    id_alianca uuid,
    nome character varying(100) NOT NULL,
    tipo character varying(10) DEFAULT 'npc'::character varying NOT NULL,
    descricao text
);


ALTER TABLE public."Personagem" OWNER TO postgres;

--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "Personagem".id_alianca; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Personagem".id_alianca IS 'opcional';


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "Personagem".tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Personagem".tipo IS 'pc | npc';


--
-- TOC entry 222 (class 1259 OID 16824)
-- Name: Sessao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sessao" (
    id_sessao uuid NOT NULL,
    id_campanha uuid NOT NULL,
    titulo character varying(100),
    resumo text,
    status character varying(20) DEFAULT 'planejada'::character varying NOT NULL,
    dt_sessao timestamp without time zone
);


ALTER TABLE public."Sessao" OWNER TO postgres;

--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "Sessao".status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Sessao".status IS 'planejada | em_andamento | concluida | cancelada';


--
-- TOC entry 219 (class 1259 OID 16784)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    id_usuario uuid NOT NULL,
    nome_usuario character varying(80) NOT NULL,
    email_usuario character varying(120) NOT NULL,
    senha_usuario character varying(255) NOT NULL,
    foto_perfil character varying(255),
    dt_criacao timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Usuario".senha_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Usuario".senha_usuario IS 'bcrypt hash';


--
-- TOC entry 5173 (class 0 OID 16866)
-- Dependencies: 226
-- Data for Name: Alianca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Alianca" (id_alianca, id_campanha, nome, descricao) FROM stdin;
\.


--
-- TOC entry 5170 (class 0 OID 16835)
-- Dependencies: 223
-- Data for Name: CalendarioEvento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CalendarioEvento" (id_evento, id_campanha, titulo, dt_evento, dt_criacao) FROM stdin;
\.


--
-- TOC entry 5171 (class 0 OID 16846)
-- Dependencies: 224
-- Data for Name: CalendarioRsvp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CalendarioRsvp" (id_rsvp, id_evento, id_usuario, status, dt_resposta) FROM stdin;
\.


--
-- TOC entry 5167 (class 0 OID 16799)
-- Dependencies: 220
-- Data for Name: Campanha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Campanha" (id_campanha, titulo, descricao, dt_criacao) FROM stdin;
\.


--
-- TOC entry 5177 (class 0 OID 16908)
-- Dependencies: 230
-- Data for Name: Conceito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Conceito" (id_conceito, id_campanha, nome, categoria, descricao) FROM stdin;
\.


--
-- TOC entry 5176 (class 0 OID 16898)
-- Dependencies: 229
-- Data for Name: Criatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Criatura" (id_criatura, id_campanha, nome, tipo, descricao) FROM stdin;
\.


--
-- TOC entry 5172 (class 0 OID 16856)
-- Dependencies: 225
-- Data for Name: Deus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Deus" (id_deus, id_campanha, nome, dominio, descricao) FROM stdin;
\.


--
-- TOC entry 5182 (class 0 OID 16970)
-- Dependencies: 235
-- Data for Name: DocumentoExterno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DocumentoExterno" (id_documento, id_campanha, nome, tipo, conteudo, vector, dt_upload) FROM stdin;
\.


--
-- TOC entry 5183 (class 0 OID 16984)
-- Dependencies: 236
-- Data for Name: HistoricoIA; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HistoricoIA" (id_consulta, id_campanha, id_usuario, pergunta, resposta, tipo, dt_consulta) FROM stdin;
\.


--
-- TOC entry 5178 (class 0 OID 16918)
-- Dependencies: 231
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Item" (id_item, id_campanha, nome, descricao, raridade) FROM stdin;
\.


--
-- TOC entry 5179 (class 0 OID 16929)
-- Dependencies: 232
-- Data for Name: ItemPosse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ItemPosse" (id_item_posse, id_item, dono_tipo, dono_id, dt_posse) FROM stdin;
\.


--
-- TOC entry 5174 (class 0 OID 16876)
-- Dependencies: 227
-- Data for Name: Local; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Local" (id_local, id_campanha, nome, tipo, descricao) FROM stdin;
\.


--
-- TOC entry 5168 (class 0 OID 16810)
-- Dependencies: 221
-- Data for Name: MembroCampanha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MembroCampanha" (id_membro, id_campanha, id_usuario, role, status, dt_entrada) FROM stdin;
\.


--
-- TOC entry 5180 (class 0 OID 16940)
-- Dependencies: 233
-- Data for Name: Nota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Nota" (id_nota, id_campanha, titulo, corpo, categoria, visibilidade, dt_criacao, dt_atualizacao) FROM stdin;
\.


--
-- TOC entry 5181 (class 0 OID 16956)
-- Dependencies: 234
-- Data for Name: NoteEmbedding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NoteEmbedding" (id_embedding, id_nota, vector, dt_criacao) FROM stdin;
\.


--
-- TOC entry 5175 (class 0 OID 16886)
-- Dependencies: 228
-- Data for Name: Personagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Personagem" (id_personagem, id_campanha, id_alianca, nome, tipo, descricao) FROM stdin;
\.


--
-- TOC entry 5169 (class 0 OID 16824)
-- Dependencies: 222
-- Data for Name: Sessao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sessao" (id_sessao, id_campanha, titulo, resumo, status, dt_sessao) FROM stdin;
\.


--
-- TOC entry 5166 (class 0 OID 16784)
-- Dependencies: 219
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" (id_usuario, nome_usuario, email_usuario, senha_usuario, foto_perfil, dt_criacao) FROM stdin;
\.


--
-- TOC entry 4956 (class 2606 OID 16875)
-- Name: Alianca Alianca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alianca"
    ADD CONSTRAINT "Alianca_pkey" PRIMARY KEY (id_alianca);


--
-- TOC entry 4950 (class 2606 OID 16845)
-- Name: CalendarioEvento CalendarioEvento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioEvento"
    ADD CONSTRAINT "CalendarioEvento_pkey" PRIMARY KEY (id_evento);


--
-- TOC entry 4952 (class 2606 OID 16855)
-- Name: CalendarioRsvp CalendarioRsvp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioRsvp"
    ADD CONSTRAINT "CalendarioRsvp_pkey" PRIMARY KEY (id_rsvp);


--
-- TOC entry 4944 (class 2606 OID 16809)
-- Name: Campanha Campanha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Campanha"
    ADD CONSTRAINT "Campanha_pkey" PRIMARY KEY (id_campanha);


--
-- TOC entry 4964 (class 2606 OID 16917)
-- Name: Conceito Conceito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conceito"
    ADD CONSTRAINT "Conceito_pkey" PRIMARY KEY (id_conceito);


--
-- TOC entry 4962 (class 2606 OID 16907)
-- Name: Criatura Criatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Criatura"
    ADD CONSTRAINT "Criatura_pkey" PRIMARY KEY (id_criatura);


--
-- TOC entry 4954 (class 2606 OID 16865)
-- Name: Deus Deus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Deus"
    ADD CONSTRAINT "Deus_pkey" PRIMARY KEY (id_deus);


--
-- TOC entry 4976 (class 2606 OID 16983)
-- Name: DocumentoExterno DocumentoExterno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DocumentoExterno"
    ADD CONSTRAINT "DocumentoExterno_pkey" PRIMARY KEY (id_documento);


--
-- TOC entry 4978 (class 2606 OID 16998)
-- Name: HistoricoIA HistoricoIA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoricoIA"
    ADD CONSTRAINT "HistoricoIA_pkey" PRIMARY KEY (id_consulta);


--
-- TOC entry 4968 (class 2606 OID 16939)
-- Name: ItemPosse ItemPosse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemPosse"
    ADD CONSTRAINT "ItemPosse_pkey" PRIMARY KEY (id_item_posse);


--
-- TOC entry 4966 (class 2606 OID 16928)
-- Name: Item Item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (id_item);


--
-- TOC entry 4958 (class 2606 OID 16885)
-- Name: Local Local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Local"
    ADD CONSTRAINT "Local_pkey" PRIMARY KEY (id_local);


--
-- TOC entry 4946 (class 2606 OID 16823)
-- Name: MembroCampanha MembroCampanha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MembroCampanha"
    ADD CONSTRAINT "MembroCampanha_pkey" PRIMARY KEY (id_membro);


--
-- TOC entry 4970 (class 2606 OID 16955)
-- Name: Nota Nota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nota"
    ADD CONSTRAINT "Nota_pkey" PRIMARY KEY (id_nota);


--
-- TOC entry 4972 (class 2606 OID 16969)
-- Name: NoteEmbedding NoteEmbedding_id_nota_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoteEmbedding"
    ADD CONSTRAINT "NoteEmbedding_id_nota_key" UNIQUE (id_nota);


--
-- TOC entry 4974 (class 2606 OID 16967)
-- Name: NoteEmbedding NoteEmbedding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoteEmbedding"
    ADD CONSTRAINT "NoteEmbedding_pkey" PRIMARY KEY (id_embedding);


--
-- TOC entry 4960 (class 2606 OID 16897)
-- Name: Personagem Personagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personagem"
    ADD CONSTRAINT "Personagem_pkey" PRIMARY KEY (id_personagem);


--
-- TOC entry 4948 (class 2606 OID 16834)
-- Name: Sessao Sessao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sessao"
    ADD CONSTRAINT "Sessao_pkey" PRIMARY KEY (id_sessao);


--
-- TOC entry 4940 (class 2606 OID 16798)
-- Name: Usuario Usuario_email_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_email_usuario_key" UNIQUE (email_usuario);


--
-- TOC entry 4942 (class 2606 OID 16796)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY (id_usuario);


--
-- TOC entry 4993 (class 2606 OID 17034)
-- Name: Alianca Alianca_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alianca"
    ADD CONSTRAINT "Alianca_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4994 (class 2606 OID 17135)
-- Name: Alianca Alianca_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alianca"
    ADD CONSTRAINT "Alianca_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4985 (class 2606 OID 17014)
-- Name: CalendarioEvento CalendarioEvento_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioEvento"
    ADD CONSTRAINT "CalendarioEvento_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4986 (class 2606 OID 17115)
-- Name: CalendarioEvento CalendarioEvento_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioEvento"
    ADD CONSTRAINT "CalendarioEvento_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4987 (class 2606 OID 17019)
-- Name: CalendarioRsvp CalendarioRsvp_id_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioRsvp"
    ADD CONSTRAINT "CalendarioRsvp_id_evento_fkey" FOREIGN KEY (id_evento) REFERENCES public."CalendarioEvento"(id_evento) ON DELETE CASCADE;


--
-- TOC entry 4988 (class 2606 OID 17120)
-- Name: CalendarioRsvp CalendarioRsvp_id_evento_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioRsvp"
    ADD CONSTRAINT "CalendarioRsvp_id_evento_fkey1" FOREIGN KEY (id_evento) REFERENCES public."CalendarioEvento"(id_evento) ON DELETE CASCADE;


--
-- TOC entry 4989 (class 2606 OID 17024)
-- Name: CalendarioRsvp CalendarioRsvp_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioRsvp"
    ADD CONSTRAINT "CalendarioRsvp_id_usuario_fkey" FOREIGN KEY (id_usuario) REFERENCES public."Usuario"(id_usuario);


--
-- TOC entry 4990 (class 2606 OID 17125)
-- Name: CalendarioRsvp CalendarioRsvp_id_usuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CalendarioRsvp"
    ADD CONSTRAINT "CalendarioRsvp_id_usuario_fkey1" FOREIGN KEY (id_usuario) REFERENCES public."Usuario"(id_usuario);


--
-- TOC entry 5003 (class 2606 OID 17054)
-- Name: Conceito Conceito_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conceito"
    ADD CONSTRAINT "Conceito_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5004 (class 2606 OID 17155)
-- Name: Conceito Conceito_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conceito"
    ADD CONSTRAINT "Conceito_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5001 (class 2606 OID 17049)
-- Name: Criatura Criatura_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Criatura"
    ADD CONSTRAINT "Criatura_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5002 (class 2606 OID 17150)
-- Name: Criatura Criatura_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Criatura"
    ADD CONSTRAINT "Criatura_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4991 (class 2606 OID 17029)
-- Name: Deus Deus_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Deus"
    ADD CONSTRAINT "Deus_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4992 (class 2606 OID 17130)
-- Name: Deus Deus_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Deus"
    ADD CONSTRAINT "Deus_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5013 (class 2606 OID 17084)
-- Name: DocumentoExterno DocumentoExterno_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DocumentoExterno"
    ADD CONSTRAINT "DocumentoExterno_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5014 (class 2606 OID 17185)
-- Name: DocumentoExterno DocumentoExterno_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DocumentoExterno"
    ADD CONSTRAINT "DocumentoExterno_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5015 (class 2606 OID 17089)
-- Name: HistoricoIA HistoricoIA_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoricoIA"
    ADD CONSTRAINT "HistoricoIA_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5016 (class 2606 OID 17190)
-- Name: HistoricoIA HistoricoIA_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoricoIA"
    ADD CONSTRAINT "HistoricoIA_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5017 (class 2606 OID 17094)
-- Name: HistoricoIA HistoricoIA_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoricoIA"
    ADD CONSTRAINT "HistoricoIA_id_usuario_fkey" FOREIGN KEY (id_usuario) REFERENCES public."Usuario"(id_usuario);


--
-- TOC entry 5018 (class 2606 OID 17195)
-- Name: HistoricoIA HistoricoIA_id_usuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoricoIA"
    ADD CONSTRAINT "HistoricoIA_id_usuario_fkey1" FOREIGN KEY (id_usuario) REFERENCES public."Usuario"(id_usuario);


--
-- TOC entry 5007 (class 2606 OID 17069)
-- Name: ItemPosse ItemPosse_id_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemPosse"
    ADD CONSTRAINT "ItemPosse_id_item_fkey" FOREIGN KEY (id_item) REFERENCES public."Item"(id_item) ON DELETE CASCADE;


--
-- TOC entry 5008 (class 2606 OID 17170)
-- Name: ItemPosse ItemPosse_id_item_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemPosse"
    ADD CONSTRAINT "ItemPosse_id_item_fkey1" FOREIGN KEY (id_item) REFERENCES public."Item"(id_item) ON DELETE CASCADE;


--
-- TOC entry 5005 (class 2606 OID 17059)
-- Name: Item Item_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5006 (class 2606 OID 17160)
-- Name: Item Item_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4995 (class 2606 OID 17039)
-- Name: Local Local_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Local"
    ADD CONSTRAINT "Local_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4996 (class 2606 OID 17140)
-- Name: Local Local_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Local"
    ADD CONSTRAINT "Local_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4979 (class 2606 OID 16999)
-- Name: MembroCampanha MembroCampanha_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MembroCampanha"
    ADD CONSTRAINT "MembroCampanha_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4980 (class 2606 OID 17100)
-- Name: MembroCampanha MembroCampanha_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MembroCampanha"
    ADD CONSTRAINT "MembroCampanha_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4981 (class 2606 OID 17004)
-- Name: MembroCampanha MembroCampanha_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MembroCampanha"
    ADD CONSTRAINT "MembroCampanha_id_usuario_fkey" FOREIGN KEY (id_usuario) REFERENCES public."Usuario"(id_usuario);


--
-- TOC entry 4982 (class 2606 OID 17105)
-- Name: MembroCampanha MembroCampanha_id_usuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MembroCampanha"
    ADD CONSTRAINT "MembroCampanha_id_usuario_fkey1" FOREIGN KEY (id_usuario) REFERENCES public."Usuario"(id_usuario);


--
-- TOC entry 5009 (class 2606 OID 17074)
-- Name: Nota Nota_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nota"
    ADD CONSTRAINT "Nota_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5010 (class 2606 OID 17175)
-- Name: Nota Nota_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nota"
    ADD CONSTRAINT "Nota_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5011 (class 2606 OID 17079)
-- Name: NoteEmbedding NoteEmbedding_id_nota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoteEmbedding"
    ADD CONSTRAINT "NoteEmbedding_id_nota_fkey" FOREIGN KEY (id_nota) REFERENCES public."Nota"(id_nota) ON DELETE CASCADE;


--
-- TOC entry 5012 (class 2606 OID 17180)
-- Name: NoteEmbedding NoteEmbedding_id_nota_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoteEmbedding"
    ADD CONSTRAINT "NoteEmbedding_id_nota_fkey1" FOREIGN KEY (id_nota) REFERENCES public."Nota"(id_nota) ON DELETE CASCADE;


--
-- TOC entry 4997 (class 2606 OID 17064)
-- Name: Personagem Personagem_id_alianca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personagem"
    ADD CONSTRAINT "Personagem_id_alianca_fkey" FOREIGN KEY (id_alianca) REFERENCES public."Alianca"(id_alianca);


--
-- TOC entry 4998 (class 2606 OID 17165)
-- Name: Personagem Personagem_id_alianca_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personagem"
    ADD CONSTRAINT "Personagem_id_alianca_fkey1" FOREIGN KEY (id_alianca) REFERENCES public."Alianca"(id_alianca);


--
-- TOC entry 4999 (class 2606 OID 17044)
-- Name: Personagem Personagem_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personagem"
    ADD CONSTRAINT "Personagem_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 5000 (class 2606 OID 17145)
-- Name: Personagem Personagem_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personagem"
    ADD CONSTRAINT "Personagem_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4983 (class 2606 OID 17009)
-- Name: Sessao Sessao_id_campanha_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sessao"
    ADD CONSTRAINT "Sessao_id_campanha_fkey" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


--
-- TOC entry 4984 (class 2606 OID 17110)
-- Name: Sessao Sessao_id_campanha_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sessao"
    ADD CONSTRAINT "Sessao_id_campanha_fkey1" FOREIGN KEY (id_campanha) REFERENCES public."Campanha"(id_campanha) ON DELETE CASCADE;


-- Completed on 2026-07-16 18:54:11

--
-- PostgreSQL database dump complete
--

\unrestrict qHONHPJ8pzfTeZyaDkDbz7YfDk2yRZKeGbYkj6ct8Wtlf1qZogbb0ZL4gj0mMfm


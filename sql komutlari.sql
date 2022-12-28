--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13
-- Dumped by pg_dump version 15rc2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: anaokul; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anaokul (
    "anaokulNo" integer NOT NULL,
    "ulkeNo" integer,
    anaokulisim character varying
);


ALTER TABLE public.anaokul OWNER TO postgres;

--
-- Name: anaokulIletisim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."anaokulIletisim" (
    "anaokulIletisimNo" integer NOT NULL,
    mail character varying(75),
    telefon character varying,
    "anaokulNo" integer
);


ALTER TABLE public."anaokulIletisim" OWNER TO postgres;

--
-- Name: calisan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calisan (
    "calisanlNo" integer NOT NULL,
    isim character varying,
    soyad character varying,
    dogumtarihi character varying,
    "anaokulNo" integer
);


ALTER TABLE public.calisan OWNER TO postgres;

--
-- Name: mahalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mahalle (
    "mahalleNo" integer NOT NULL,
    "sehirNo" integer NOT NULL,
    ad character varying(50) DEFAULT 'Gaziantep'::character varying
);


ALTER TABLE public.mahalle OWNER TO postgres;

--
-- Name: memur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memur (
    "calisanNo" integer NOT NULL,
    maas money
);


ALTER TABLE public.memur OWNER TO postgres;

--
-- Name: mudur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mudur (
    "calisanNo" integer NOT NULL,
    maas money,
    issaatleri integer
);


ALTER TABLE public.mudur OWNER TO postgres;

--
-- Name: ogrenci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenci (
    "ogrenciNo" integer NOT NULL,
    isim character varying,
    soyad character varying,
    dogumtarihi character varying,
    sube character varying,
    "sinifNo" integer,
    "veliNo" integer
);


ALTER TABLE public.ogrenci OWNER TO postgres;

--
-- Name: ogretme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogretme (
    "calisanNo" integer NOT NULL,
    maas money
);


ALTER TABLE public.ogretme OWNER TO postgres;

--
-- Name: ogretmen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogretmen (
    "ogretmenNo" integer NOT NULL,
    adi character varying,
    soyad character varying,
    telfon text
);


ALTER TABLE public.ogretmen OWNER TO postgres;

--
-- Name: sehir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sehir (
    "sehirNo" integer NOT NULL,
    "ulkeNo" integer,
    isim character varying
);


ALTER TABLE public.sehir OWNER TO postgres;

--
-- Name: sinif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinif (
    "sinifNo" integer NOT NULL,
    "sinifHarf" character varying,
    "anaokulNo" integer
);


ALTER TABLE public.sinif OWNER TO postgres;

--
-- Name: sofer_anaokul; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sofer_anaokul (
    "soferNo" integer NOT NULL,
    "anaokulNo" integer NOT NULL
);


ALTER TABLE public.sofer_anaokul OWNER TO postgres;

--
-- Name: sofur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sofur (
    "sofurNo" integer NOT NULL,
    ad character varying,
    soyad character varying,
    dogumtarihi character varying,
    maas money,
    issaatleri integer,
    telefon character varying
);


ALTER TABLE public.sofur OWNER TO postgres;

--
-- Name: ulke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulke (
    "ulkeNo" integer NOT NULL,
    ad character varying
);


ALTER TABLE public.ulke OWNER TO postgres;

--
-- Name: veli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veli (
    "veliNo" integer NOT NULL,
    isim character varying,
    soyad character varying
);


ALTER TABLE public.veli OWNER TO postgres;

--
-- Name: veliiletisim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veliiletisim (
    "veliiletisimNo" integer NOT NULL,
    "veliNo" integer,
    mail character varying,
    telefon character varying
);


ALTER TABLE public.veliiletisim OWNER TO postgres;

--
-- Data for Name: anaokul; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.anaokul VALUES
	(9, 1, 'mesail'),
	(1, 5, 'muaaz'),
	(5, 65, '243434343434343434'),
	(4, 2, '243434343434343434'),
	(2, 11, 'Aloo');


--
-- Data for Name: anaokulIletisim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: calisan; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mahalle; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: memur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mudur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ogrenci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ogrenci VALUES
	(55, 'BESSAM ', 'ALSHEHABI', '01.01.1999', 'A', 34, 44),
	(10, 'Ali', 'Hamadu', '01.08.2000', 'A', 20, 5),
	(12, 'Hani', 'Selim', '10.08.2001', 'B', NULL, 12),
	(1, 'Rami', 'Ahmed', '2002', 'B', NULL, 9),
	(23, 'Sami', 'Alzin', '1998', 'C', 32, 2),
	(22, 'Dara', 'sbhfgvysuj', '2008', 'B', 2, 4);


--
-- Data for Name: ogretme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ogretmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ogretmen VALUES
	(5, 'Ali', 'Aldus', '05564782565'),
	(6, 'Mahmud', 'Almusa', '04485885'),
	(4, 'Muaz', 'Alhamed', '02568798578'),
	(2, 'basar', 'Kenj', '025687954587'),
	(43, 'Bessam', 'Alshehabi', '+905524907408'),
	(97, 'Hamadu', 'Fares', '055487952');


--
-- Data for Name: sehir; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sinif; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sofer_anaokul; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sofur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ulke; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ulke VALUES
	(1, 'TR'),
	(2, 'SYR');


--
-- Data for Name: veli; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: veliiletisim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: anaokul anaokul_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anaokul
    ADD CONSTRAINT anaokul_pkey PRIMARY KEY ("anaokulNo");


--
-- Name: mahalle mahalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahalle
    ADD CONSTRAINT mahalle_pkey PRIMARY KEY ("mahalleNo");


--
-- Name: mudur mudur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mudur
    ADD CONSTRAINT mudur_pkey PRIMARY KEY ("calisanNo");


--
-- Name: sinif sinif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinif
    ADD CONSTRAINT sinif_pkey PRIMARY KEY ("sinifNo");


--
-- Name: sofer_anaokul sofer_anaokul_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sofer_anaokul
    ADD CONSTRAINT sofer_anaokul_pkey PRIMARY KEY ("anaokulNo", "soferNo");


--
-- Name: sofur sofur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sofur
    ADD CONSTRAINT sofur_pkey PRIMARY KEY ("sofurNo");


--
-- Name: anaokulIletisim unique_anaokulIletisim_anaokulIletisimNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."anaokulIletisim"
    ADD CONSTRAINT "unique_anaokulIletisim_anaokulIletisimNo" UNIQUE ("anaokulIletisimNo");


--
-- Name: anaokul unique_anaokul_ulkeNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anaokul
    ADD CONSTRAINT "unique_anaokul_ulkeNo" UNIQUE ("ulkeNo");


--
-- Name: mahalle unique_mahalle_mahalleNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahalle
    ADD CONSTRAINT "unique_mahalle_mahalleNo" UNIQUE ("mahalleNo");


--
-- Name: memur unique_memur_calisanNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memur
    ADD CONSTRAINT "unique_memur_calisanNo" PRIMARY KEY ("calisanNo");


--
-- Name: mudur unique_mudur_calisanNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mudur
    ADD CONSTRAINT "unique_mudur_calisanNo" UNIQUE ("calisanNo");


--
-- Name: ogrenci unique_ogrenci_ogrenciNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT "unique_ogrenci_ogrenciNo" PRIMARY KEY ("ogrenciNo");


--
-- Name: ogrenci unique_ogrenci_sinifNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT "unique_ogrenci_sinifNo" UNIQUE ("sinifNo");


--
-- Name: ogrenci unique_ogrenci_veliNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT "unique_ogrenci_veliNo" UNIQUE ("veliNo");


--
-- Name: ogretme unique_ogretme_calisanNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogretme
    ADD CONSTRAINT "unique_ogretme_calisanNo" PRIMARY KEY ("calisanNo");


--
-- Name: ogretmen unique_ogretmen_ogretmenNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogretmen
    ADD CONSTRAINT "unique_ogretmen_ogretmenNo" PRIMARY KEY ("ogretmenNo");


--
-- Name: calisan unique_personal_personalNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisan
    ADD CONSTRAINT "unique_personal_personalNo" PRIMARY KEY ("calisanlNo");


--
-- Name: sehir unique_sehir_sehirNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT "unique_sehir_sehirNo" PRIMARY KEY ("sehirNo");


--
-- Name: sofer_anaokul unique_sofer_anaokul_anaokulNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sofer_anaokul
    ADD CONSTRAINT "unique_sofer_anaokul_anaokulNo" UNIQUE ("anaokulNo");


--
-- Name: sofer_anaokul unique_sofer_anaokul_soferNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sofer_anaokul
    ADD CONSTRAINT "unique_sofer_anaokul_soferNo" UNIQUE ("soferNo");


--
-- Name: sofur unique_sofur_sofurNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sofur
    ADD CONSTRAINT "unique_sofur_sofurNo" UNIQUE ("sofurNo");


--
-- Name: ulke unique_ulke_ulkeNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulke
    ADD CONSTRAINT "unique_ulke_ulkeNo" PRIMARY KEY ("ulkeNo");


--
-- Name: veli unique_veli_veliNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veli
    ADD CONSTRAINT "unique_veli_veliNo" PRIMARY KEY ("veliNo");


--
-- Name: veliiletisim unique_veliiletisim_veliiletisimNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veliiletisim
    ADD CONSTRAINT "unique_veliiletisim_veliiletisimNo" PRIMARY KEY ("veliiletisimNo");


--
-- Name: index_anaokulNo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "index_anaokulNo" ON public.sofer_anaokul USING btree ("anaokulNo");


--
-- Name: index_sinifNo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "index_sinifNo" ON public.sinif USING btree ("sinifNo");


--
-- Name: anaokulIletisim anaokul_anaokuliletisim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."anaokulIletisim"
    ADD CONSTRAINT anaokul_anaokuliletisim FOREIGN KEY ("anaokulNo") REFERENCES public.anaokul("anaokulNo") MATCH FULL;


--
-- Name: calisan anaokul_calisan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisan
    ADD CONSTRAINT anaokul_calisan FOREIGN KEY ("anaokulNo") REFERENCES public.anaokul("anaokulNo") MATCH FULL;


--
-- Name: sinif anaokul_sinif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinif
    ADD CONSTRAINT anaokul_sinif FOREIGN KEY ("anaokulNo") REFERENCES public.anaokul("anaokulNo") MATCH FULL;


--
-- Name: sofer_anaokul anaokul_sofur_anaokul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sofer_anaokul
    ADD CONSTRAINT anaokul_sofur_anaokul FOREIGN KEY ("anaokulNo") REFERENCES public.anaokul("anaokulNo") MATCH FULL;


--
-- Name: ulke anaokul_ulke; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulke
    ADD CONSTRAINT anaokul_ulke FOREIGN KEY ("ulkeNo") REFERENCES public.anaokul("ulkeNo") MATCH FULL;


--
-- Name: memur calisan_memur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memur
    ADD CONSTRAINT calisan_memur FOREIGN KEY ("calisanNo") REFERENCES public.calisan("calisanlNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mudur calisan_mudur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mudur
    ADD CONSTRAINT calisan_mudur FOREIGN KEY ("calisanNo") REFERENCES public.calisan("calisanlNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ogretme calisan_ogretmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogretme
    ADD CONSTRAINT calisan_ogretmen FOREIGN KEY ("calisanNo") REFERENCES public.calisan("calisanlNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sinif ogrenci_sinif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinif
    ADD CONSTRAINT ogrenci_sinif FOREIGN KEY ("sinifNo") REFERENCES public.ogrenci("sinifNo") MATCH FULL;


--
-- Name: veli ogrenci_veli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veli
    ADD CONSTRAINT ogrenci_veli FOREIGN KEY ("veliNo") REFERENCES public.ogrenci("veliNo") MATCH FULL;


--
-- Name: mahalle sehir_mahalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahalle
    ADD CONSTRAINT sehir_mahalle FOREIGN KEY ("sehirNo") REFERENCES public.sehir("sehirNo") MATCH FULL;


--
-- Name: sehir ulke_sehir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT ulke_sehir FOREIGN KEY ("ulkeNo") REFERENCES public.ulke("ulkeNo") MATCH FULL;


--
-- Name: veliiletisim veli_veliiletisim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veliiletisim
    ADD CONSTRAINT veli_veliiletisim FOREIGN KEY ("veliNo") REFERENCES public.veli("veliNo") MATCH FULL;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


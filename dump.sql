--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: drzava; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drzava (
    iddrzava integer NOT NULL,
    nazivdrzava character varying(50) NOT NULL
);


ALTER TABLE public.drzava OWNER TO postgres;

--
-- Name: lokacija; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokacija (
    idlokacija integer NOT NULL,
    nazivlokacija character varying(100) NOT NULL
);


ALTER TABLE public.lokacija OWNER TO postgres;

--
-- Name: mjestoprodajeulaznice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mjestoprodajeulaznice (
    nazivprodajnogmjesta character varying(100) NOT NULL,
    idpark integer NOT NULL
);


ALTER TABLE public.mjestoprodajeulaznice OWNER TO postgres;

--
-- Name: park; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.park (
    idpark integer NOT NULL,
    naziv character varying(100) NOT NULL,
    povrsina double precision NOT NULL,
    utemeljen date NOT NULL,
    sluzbenastranica character varying(100),
    email character varying(100),
    idlokacija integer NOT NULL,
    iddrzava integer NOT NULL,
    idvrsta integer NOT NULL
);


ALTER TABLE public.park OWNER TO postgres;

--
-- Name: telefon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefon (
    tel character varying(20) NOT NULL,
    idpark integer NOT NULL
);


ALTER TABLE public.telefon OWNER TO postgres;

--
-- Name: vrsta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vrsta (
    idvrsta integer NOT NULL,
    nazivvrsta character varying(100) NOT NULL
);


ALTER TABLE public.vrsta OWNER TO postgres;

--
-- Name: znamenitost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.znamenitost (
    idznamenitost integer NOT NULL,
    nazivznamenitosti character varying(100) NOT NULL,
    opisznamenitosti character varying(1000) NOT NULL,
    idpark integer NOT NULL
);


ALTER TABLE public.znamenitost OWNER TO postgres;

--
-- Data for Name: drzava; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drzava (iddrzava, nazivdrzava) FROM stdin;
1	Hrvatska
\.


--
-- Data for Name: lokacija; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lokacija (idlokacija, nazivlokacija) FROM stdin;
1	Istarska ??upanija
2	Jadransko more
3	Srednja Dalmacija
4	Otok Mljet
5	Velebit
6	Li??ko-senjska i Karlova??ka ??upanija
7	Gorski kotar
8	Splitsko-dalmatinska ??upanija
9	Splitsko-dalmatinska ??upanija, ??ibensko-kninska ??upanija
10	Baranja
11	Lonsko Polje
12	Grad Zagreb
13	Viroviti??ko-podravska, Po??e??ko-slavonska ??upanija
\.


--
-- Data for Name: mjestoprodajeulaznice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mjestoprodajeulaznice (nazivprodajnogmjesta, idpark) FROM stdin;
Izletni??ka poslovnica NP Brijuni u Fa??ani, Brionska 10	1
Recepcija Aba, Butina 2, Murter	2
Marina ??ibenik d.o.o., Obala Jerka ??i??gori??a 1, ??ibenik	2
Danuvius marina d.o.o., Jurjevgradska 2, Tribunj	2
Marina Kornati, ??etali??te kneza Branimira 1, Biograd n/m	2
Euronautic d.o.o., Marina Kornati, Biograd n/m	2
Bimex Adria, Marina Dalmacija, Suko??an	2
Albatros Yachting, I. Me??trovi??a 2, Marina Zadar	2
Prosper Yachting d.o.o., Marina Tankerkomerc Zadar, Ivana Gunduli??a 1/B, Zadar	2
Adamo Travel, Sali 112, Sali, Dugi otok	2
ACI marina ??ut, otok ??ut	2
ACI marina Jezera, Obala sv. Ivana 47 E, Jezera	2
ACI marina Vodice, Artina 13 A, Vodice	2
ACI marina Skradin, Obala bana Pavla ??ubi??a 18, Skradin	2
T. A. Bisage, Put Zarati??a 3, Jezera	2
Makirina turist d.o.o., Trg Domovinskog rata 1, Pirovac	2
Nautika Veli Rat, ??etali??te Ivana Klarina 1, Veli Rat, Dugi Otok	2
Nauti??ki centa Trogir, Marina Baoti??, Don Petra ??pike 2A, Seget Donji	2
Lozovac	3
Skradin	3
Ro??ki slap	3
Kistanje	3
Burnum	3
Pomena	4
Pola??e	4
Vrbovica	4
Infopunkt	4
Mali most	4
Ulaz 1 Velika Paklenica	5
Ulaz 2 Mala Paklenica	5
Ulaz 1	6
Ulaz 2	6
Flora	6
Bijela Vodica - infopunkt	7
Bijela Vodica - restoran	7
Kupari - infopunkt	7
Razloge - infopunkt	7
Risnjak - planinarski dom	7
Infocentar Krasno (Uprava NP Sjeverni Velebit), Krasno 96, Krasno	8
Ulazna recepcija Parka uz cestu D 512 Makarska - Vrgorac (8 km od smjera Makarske prema Vrgorcu)	9
Infocentar Marineta u Makarskoj, Marineta - Mala obala 16, 21 300 Makarska	9
Prijemni centar Kopa??evo	11
Krapje 18, 44324 Jasenovac	12
??igo?? 26, 44203 Gu????e	12
??pilja Veternica (Glavica bb)	13
Rudnik Zrinski (Malo Sljeme bb)	13
Srednjovjekovni grad Medvedgrad (Sljemenska cesta bb)	13
Velika, S. Radi??a 46 - Centar za posjetitelje	14
Jankovac - Ekoto??ka Jankovac	14
\.


--
-- Data for Name: park; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.park (idpark, naziv, povrsina, utemeljen, sluzbenastranica, email, idlokacija, iddrzava, idvrsta) FROM stdin;
1	Brijuni	33.9	1983-10-27	https://www.np-brijuni.hr/hr	izleti@np-brijuni.hr	1	1	2
2	Kornati	220	1980-08-13	http://www.np-kornati.hr	turizam@np-kornati.hr	2	1	2
3	Krka	109	1985-01-24	https://www.npkrka.hr/hr/	info@npk.hr	3	1	2
4	Mljet	53.75	1960-11-11	https://www.np-mljet.hr	np-mljet@np-mljet.hr	4	1	2
5	Paklenica	95	1949-10-19	https://np-paklenica.hr/hr/	np-paklenica@paklenica.hr	5	1	2
6	Plitvi??ka jezera	296.8515	1949-04-08	https://np-plitvicka-jezera.hr/	\N	6	1	2
7	Risnjak	63.5	1953-09-15	https://www.risnjak.hr/	marketing@np-risnjak.hr	7	1	2
8	Sjeverni Velebit	109	1999-06-09	https://np-sjeverni-velebit.hr	promidzba@np-sjeverni-velebit.hr	5	1	2
9	Biokovo	195.5	1981-01-01	https://pp-biokovo.hr/en	info@pp-biokovo.hr	8	1	1
10	Dinara	630.52	2021-02-20	\N	\N	9	1	1
11	Kopa??ki rit	177	1976-05-13	https://pp-kopacki-rit.hr/	prijemni.centar@pp-kopacki-rit.hr	10	1	1
12	Lonsko Polje	506.5	1993-02-03	http://www.pp-lonjsko-polje.hr	info@pp-lonjsko-polje.hr	11	1	1
13	Medvednica	179.38	1981-06-16	https://www.pp-medvednica.hr/	info@pp-medvednica.hr	12	1	1
14	Papuk	336	1999-04-23	https://www.pp-papuk.hr/	kontakt@pp-papuk.hr	13	1	1
\.


--
-- Data for Name: telefon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telefon (tel, idpark) FROM stdin;
00385 (0)52 525 882	1
00385 (0)52 525 883	1
00385 (0)22 435 740	2
00385 (0)22 201 777	3
00385 (0)20 744 041	4
00385 (0)23 369 155	5
00385 (0)23 369 202	5
00385 (0)23 369 803	5
00385 (0)53 751 026	6
00385 (0)53 751 014	6
00385 (0)53 751 015	6
00385 (0)51 836 133	7
00385 (0)51 836 261	7
00385 (0)53 665 393	8
00385 (0)31 445 445	11
00385 (0)31 752 320	11
00385 (0)31 752 322	11
00385 (0)44 672 080	12
00385 (0)44 611 190	12
00385 (0)1 458 6317	13
00385 (0)34 313 029	14
00385 (0)34 313 030	14
\.


--
-- Data for Name: vrsta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vrsta (idvrsta, nazivvrsta) FROM stdin;
1	Park Prirode
2	Nacionalni Park Prirode
\.


--
-- Data for Name: znamenitost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.znamenitost (idznamenitost, nazivznamenitosti, opisznamenitosti, idpark) FROM stdin;
1	Rimska vila u uvali Verige	Na zapadnoj obali Brijuna, u uvali Verige, smje??tena je rasko??na rimska vila. Najve??i sjaj vila je dosegla u 1. stolje??u poslije Krista, a pojedini dijelovi vile koristili su se do 6. stolje??a. Sastojala se od vi??e gra??evina razli??itih namjena smje??tenih na pomno odabranim lokacijama u raznim dijelovima uvale.	1
2	Vidikovac na Ciprovcu	Najo??uvaniji od tri Kupelwieserova vidikovca koji se zbog svoje konstrukcije izlagao na brojnim izlo??bama. Izra??eni su oko 1900. godine u ??eljezari u Vitkovicama, u kojoj je do dolaska na Brijune radio Paul Kupelwieser. Neko?? dominantnu turisti??ku atrakciju nadrasla je ??uma. Drugi o??uvani vidikovac nalazi se na brdu Saluga, iznad glavnog brijunskog kupali??ta.	1
3	Krune	??uvene kornatske ???krune??? (strmci ili litice) okrenute prema otvorenom moru, koje karakteriziraju ve??inu vanjskih otoka u pu??inskom oto??nom nizu, posebna su odlika i vrijednost ovog prostora. ???Krune??? su posljedica pucanja i rasjedanja Zemljine kore uslijed podvla??enja Afri??ke tektonske plo??e pod Euroazijsku.	2
4	Utvrda Tureta	Vrijeme Bizanta ostavilo je po mnogima najmarkantniju gra??evinu koju danas nalazimo na Kornatima - utvrdu Tureta na otoku Kornatu koja je izgra??ena najvjerojatnije u 6. stolje??u (kasna antika/rani srednji vijek). Pretpostavlja se da je njezina vojna posada kontrolirala plovidbu kornatskim arhipelagom i ??uvala kr??ka polja Tarac i ??eljkovci od iznenadnih napada s mora.	2
5	Vidikovci	Vidikovac Metlina na otoku Kornatu najvi??i je i najimpresivniji vrh Nacionalnog parka Kornati (237 m), ali je do njega najte??e do??i.	2
6	Skradinski buk	Skradinski buk, najdu??i slap na rijeci Krki, jedna je od najpoznatijih prirodnih ljepota Hrvatske. Slap tvore sedrene barijere, otoci i jezera. Mo??e ga se razgledati tijekom cijele godine zahvaljuju??i mre??i staza i mostova koji omogu??uju ugodnu i sigurnu ??etnju. Na Skradinskom buku nalaze se obnovljeni mlinovi, valjavice i stupe, koje stolje??ima koriste snagu vodenog toka.	3
7	Ro??ki slap	Ro??kim slapom naziva se prostrano slapi??te koje ??ine 22,5 metra visoki glavni slapovi i bezbroj rukavaca, kaskada i sedrenih otoka. Ro??ki slap smje??ten je oko 36 km nizvodno od izvora rijeke Krke. Po??etak barijere ??ini niz malih kaskada (u narodu zvanih ???ogrlice???) nakon kojih slijede brojni rukavci i oto??i??i. Od ???ogrlica??? vodi 517 drvenih stepenica prema Ozi??anoj pe??ini.	3
8	Odisejeva ??pilja	Na sredi??njem ju??nom dijelu mljetske obale nalazi se geomorfolo??ki fenomen Jama (Odisejeva ??pilja) - kr??ka ??upljina ??iji se strop odlomio pa uistinu izgleda kao jama ili ??iroki bunar. U njezinom je dnu more jer je Jama prirodnim tunelom povezana s pu??inom. Uz rub tunela privezano je nekoliko ribarskih ??amaca ??iji su vlasnici stanovnici obli??nja Babina Polja, najve??eg naselja na Mljetu.	4
9	??pilja Manita pe??	Manita pe?? jedina je ??pilja na prostoru parka koja je otvorena i ure??ena za posjet. Svojom prostrano????u i ljepotom ukrasa odu??evljava posjetitelje jo?? od 1937. godine, kada je nakon ure??enja staze zapo??elo njeno posje??ivanje. Ulaz u ??pilju nalazi se na 570 m nadmorske visine, a uspon od parkirali??ta u Velikoj Paklenici do nje traje oko sat i pol.	5
10	Kanjon Velike Paklenice	Dolina Velike Paklenice duga je 14,5 km. Zbog vodonepropusne litolo??ke podloge od izvora Velike Paklenice, pa do njenog sutoka s Brezimenja??om, voda je u koritu Velike Paklenice prisutna tijekom cijele godine.	5
11	??pilja ??upljara	Procje??ivanjem vode kroz raspucalu povr??inu otapala se vapnena??ka stijena. Pritom su se pro??irivale podzemne pukotine i stvarali kanali. Urezivanje kanjona Donjih jezera i pove??anje podzemnih ??upljina ispod jedne vrta??e smje??tene na rubnom dijelu kanjona dovelo je do nestabilnosti i uru??avanja dna vrta??e, odnosno svoda spilje.	6
12	Izvor Kupe	Podru??je je progla??eno za??ti??enim 12. prosinca 1963. godine na povr??ini od 10 ha. Izvor rijeke Kupe, jedna od mnogih jo?? uvijek nerije??enih zagonetki kr??a, jedno od najja??ih, najve??ih i najdubljih hrvatskih vrela. Na nadmorskoj visini od 321 m, vodena je masa oblikovala jezero zelenoplave boje koje ??e vas o??arati svojim izgledom. Do samoga dna izvora jo?? se nije do??lo, a zadnji uron bio je do 154 m.	7
13	Rodna ku??a rijeke Kupe	Rodna ku??a rijeke Kupe centar je za prihvat, educiranje i informiranje posjetitelja koji svojim imenom jasno kazuje kako je smje??ten u neposrednoj blizini izvora Kupe, koja tako postaje jedina hrvatska rijeka s ???rodnom ku??om???, a u svom prostoru interpretira bogatu bioraznolikost ove teku??ice.	7
14	Pou??na staza Leska	Godine 1993. u NP Risnjak otvorena je prva pou??na staza unutar hrvatskih nacionalnih parkova - Leska. Staza je kru??nog oblika, du??ine 4200 metara i smje??tena je na nadmorskoj visini od 700 metara. Du?? staze postavljene su plo??e koje na hrvatskom i engleskom jeziku pou??avaju posjetitelje o najzna??ajnijim objektima i pojavama karakteristi??nima kako za Risnjak, tako i za cijeli Gorski kotar.	7
15	Velebitski botani??ki vrt	U neposrednoj blizini Zavi??ana, petnaestak minuta hoda od planinarskog doma, nalazi se Velebitski botani??ki vrt osnovan 1967. godine, na inicijativu dr. Frana Ku??ana, profesora na Farmaceutsko-biokemijskom fakultetu u Zagrebu. Ve?? 1969. godine vrt dobiva status spomenika parkovne arhitekture. Ideja koja je vodila osniva??e botani??kog vrta aktualna je i danas - ??eljeli su bogatstvo flore Velebita u??initi dostupnim ne samo znanstvenicima, istra??iva??ima i zaljubljenicima u Velebit, nego i svim posjetiteljima koji do??u na Sjeverni Velebit. Nedugo nakon osnivanja vrta okolno je podru??je progla??eno posebnim botani??kim rezervatom Zavi??an - Balinovac - Velika kosa.	8
16	Biokovski botani??ki vrt Koti??ina	Smje??ten je na primorskim obroncima planine Biokovo iznad sela Koti??ina, na nadmorskoj visini od 350 do 500 metara i dijelom je u Parku prirode Biokovo.	9
17	Kompleks dvoraca Tikve??	U srcu Baranje obuhva??en Parkom prirode Kopa??ki rit, smjestio se romanti??arski arhitektonski sklop ladanjske arhitekture ??? kompleks dvoraca Tikve??. To je prostor ??uma i perivoja unutar kojega su smje??teni rezidencijalni objekti: novi dvorac s aneksom, stari dvorac, mali sakralni objekt (kapelica Papinog blagoslova), te prate??i objekti s restoranom.	11
18	??etnica bijelog lopo??a	Nova ??etnica kroz ovo jedinstveno za??ti??eno podru??je duga je ukupno 2550 m. ??etnica povezuje prijemni centar i pristani??te brodova preko jezera Mali Sakada??. Posjetitelji tijekom ??etnje mogu do??ivjeti Kopa??ki rit u malom, u??ivati u bogatoj ritskoj vegetaciji, trski, ??a??u te mno??tvu lopo??a i vrbe.	11
19	Petsto Horvatovih stuba	Petsto kamenih stuba mnogi smatraju najimpresivnijim i najljep??im lokalitetom izgra??enim ljudskom rukom na ovoj planini.	13
20	Stari grad Kaptol	U sredi??tu mjesta Kaptol nalaze se u velikom opsegu sa??uvani ostaci utvrde, crkve i stambenog trakta, te nedavno obnovljen crkveni zvonik. Kaptolska utvrda ??esterokutni je kasnogoti??ko-renesansni ka??tel s kru??nim polukulama i ??etvrtastom ulaznom kulom.	14
\.


--
-- Name: drzava drzava_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drzava
    ADD CONSTRAINT drzava_pkey PRIMARY KEY (iddrzava);


--
-- Name: lokacija lokacija_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokacija
    ADD CONSTRAINT lokacija_pkey PRIMARY KEY (idlokacija);


--
-- Name: mjestoprodajeulaznice mjestoprodajeulaznice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mjestoprodajeulaznice
    ADD CONSTRAINT mjestoprodajeulaznice_pkey PRIMARY KEY (nazivprodajnogmjesta);


--
-- Name: park park_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_pkey PRIMARY KEY (idpark);


--
-- Name: telefon telefon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefon
    ADD CONSTRAINT telefon_pkey PRIMARY KEY (tel);


--
-- Name: vrsta vrsta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vrsta
    ADD CONSTRAINT vrsta_pkey PRIMARY KEY (idvrsta);


--
-- Name: znamenitost znamenitost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znamenitost
    ADD CONSTRAINT znamenitost_pkey PRIMARY KEY (idznamenitost);


--
-- Name: mjestoprodajeulaznice mjestoprodajeulaznice_idpark_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mjestoprodajeulaznice
    ADD CONSTRAINT mjestoprodajeulaznice_idpark_fkey FOREIGN KEY (idpark) REFERENCES public.park(idpark);


--
-- Name: park park_iddrzava_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_iddrzava_fkey FOREIGN KEY (iddrzava) REFERENCES public.drzava(iddrzava);


--
-- Name: park park_idlokacija_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_idlokacija_fkey FOREIGN KEY (idlokacija) REFERENCES public.lokacija(idlokacija);


--
-- Name: park park_idvrsta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_idvrsta_fkey FOREIGN KEY (idvrsta) REFERENCES public.vrsta(idvrsta);


--
-- Name: telefon telefon_idpark_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefon
    ADD CONSTRAINT telefon_idpark_fkey FOREIGN KEY (idpark) REFERENCES public.park(idpark);


--
-- Name: znamenitost znamenitost_idpark_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znamenitost
    ADD CONSTRAINT znamenitost_idpark_fkey FOREIGN KEY (idpark) REFERENCES public.park(idpark);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--


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
1	Istarska županija
2	Jadransko more
3	Srednja Dalmacija
4	Otok Mljet
5	Velebit
6	Ličko-senjska i Karlovačka županija
7	Gorski kotar
8	Splitsko-dalmatinska županija
9	Splitsko-dalmatinska županija, Šibensko-kninska županija
10	Baranja
11	Lonsko Polje
12	Grad Zagreb
13	Virovitičko-podravska, Požeško-slavonska županija
\.


--
-- Data for Name: mjestoprodajeulaznice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mjestoprodajeulaznice (nazivprodajnogmjesta, idpark) FROM stdin;
Izletnička poslovnica NP Brijuni u Fažani, Brionska 10	1
Recepcija Aba, Butina 2, Murter	2
Marina Šibenik d.o.o., Obala Jerka Šižgorića 1, Šibenik	2
Danuvius marina d.o.o., Jurjevgradska 2, Tribunj	2
Marina Kornati, Šetalište kneza Branimira 1, Biograd n/m	2
Euronautic d.o.o., Marina Kornati, Biograd n/m	2
Bimex Adria, Marina Dalmacija, Sukošan	2
Albatros Yachting, I. Meštrovića 2, Marina Zadar	2
Prosper Yachting d.o.o., Marina Tankerkomerc Zadar, Ivana Gundulića 1/B, Zadar	2
Adamo Travel, Sali 112, Sali, Dugi otok	2
ACI marina Žut, otok Žut	2
ACI marina Jezera, Obala sv. Ivana 47 E, Jezera	2
ACI marina Vodice, Artina 13 A, Vodice	2
ACI marina Skradin, Obala bana Pavla Šubića 18, Skradin	2
T. A. Bisage, Put Zaratića 3, Jezera	2
Makirina turist d.o.o., Trg Domovinskog rata 1, Pirovac	2
Nautika Veli Rat, Šetalište Ivana Klarina 1, Veli Rat, Dugi Otok	2
Nautički centa Trogir, Marina Baotić, Don Petra Špike 2A, Seget Donji	2
Lozovac	3
Skradin	3
Roški slap	3
Kistanje	3
Burnum	3
Pomena	4
Polače	4
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
Prijemni centar Kopačevo	11
Krapje 18, 44324 Jasenovac	12
Čigoč 26, 44203 Gušće	12
Špilja Veternica (Glavica bb)	13
Rudnik Zrinski (Malo Sljeme bb)	13
Srednjovjekovni grad Medvedgrad (Sljemenska cesta bb)	13
Velika, S. Radića 46 - Centar za posjetitelje	14
Jankovac - Ekotočka Jankovac	14
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
6	Plitvička jezera	296.8515	1949-04-08	https://np-plitvicka-jezera.hr/	\N	6	1	2
7	Risnjak	63.5	1953-09-15	https://www.risnjak.hr/	marketing@np-risnjak.hr	7	1	2
8	Sjeverni Velebit	109	1999-06-09	https://np-sjeverni-velebit.hr	promidzba@np-sjeverni-velebit.hr	5	1	2
9	Biokovo	195.5	1981-01-01	https://pp-biokovo.hr/en	info@pp-biokovo.hr	8	1	1
10	Dinara	630.52	2021-02-20	\N	\N	9	1	1
11	Kopački rit	177	1976-05-13	https://pp-kopacki-rit.hr/	prijemni.centar@pp-kopacki-rit.hr	10	1	1
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
1	Rimska vila u uvali Verige	Na zapadnoj obali Brijuna, u uvali Verige, smještena je raskošna rimska vila. Najveći sjaj vila je dosegla u 1. stoljeću poslije Krista, a pojedini dijelovi vile koristili su se do 6. stoljeća. Sastojala se od više građevina različitih namjena smještenih na pomno odabranim lokacijama u raznim dijelovima uvale.	1
2	Vidikovac na Ciprovcu	Najočuvaniji od tri Kupelwieserova vidikovca koji se zbog svoje konstrukcije izlagao na brojnim izložbama. Izrađeni su oko 1900. godine u željezari u Vitkovicama, u kojoj je do dolaska na Brijune radio Paul Kupelwieser. Nekoć dominantnu turističku atrakciju nadrasla je šuma. Drugi očuvani vidikovac nalazi se na brdu Saluga, iznad glavnog brijunskog kupališta.	1
3	Krune	Čuvene kornatske „krune“ (strmci ili litice) okrenute prema otvorenom moru, koje karakteriziraju većinu vanjskih otoka u pučinskom otočnom nizu, posebna su odlika i vrijednost ovog prostora. „Krune“ su posljedica pucanja i rasjedanja Zemljine kore uslijed podvlačenja Afričke tektonske ploče pod Euroazijsku.	2
4	Utvrda Tureta	Vrijeme Bizanta ostavilo je po mnogima najmarkantniju građevinu koju danas nalazimo na Kornatima - utvrdu Tureta na otoku Kornatu koja je izgrađena najvjerojatnije u 6. stoljeću (kasna antika/rani srednji vijek). Pretpostavlja se da je njezina vojna posada kontrolirala plovidbu kornatskim arhipelagom i čuvala krška polja Tarac i Željkovci od iznenadnih napada s mora.	2
5	Vidikovci	Vidikovac Metlina na otoku Kornatu najviši je i najimpresivniji vrh Nacionalnog parka Kornati (237 m), ali je do njega najteže doći.	2
6	Skradinski buk	Skradinski buk, najduži slap na rijeci Krki, jedna je od najpoznatijih prirodnih ljepota Hrvatske. Slap tvore sedrene barijere, otoci i jezera. Može ga se razgledati tijekom cijele godine zahvaljujući mreži staza i mostova koji omogućuju ugodnu i sigurnu šetnju. Na Skradinskom buku nalaze se obnovljeni mlinovi, valjavice i stupe, koje stoljećima koriste snagu vodenog toka.	3
7	Roški slap	Roškim slapom naziva se prostrano slapište koje čine 22,5 metra visoki glavni slapovi i bezbroj rukavaca, kaskada i sedrenih otoka. Roški slap smješten je oko 36 km nizvodno od izvora rijeke Krke. Početak barijere čini niz malih kaskada (u narodu zvanih „ogrlice“) nakon kojih slijede brojni rukavci i otočići. Od „ogrlica“ vodi 517 drvenih stepenica prema Oziđanoj pećini.	3
8	Odisejeva špilja	Na središnjem južnom dijelu mljetske obale nalazi se geomorfološki fenomen Jama (Odisejeva špilja) - krška šupljina čiji se strop odlomio pa uistinu izgleda kao jama ili široki bunar. U njezinom je dnu more jer je Jama prirodnim tunelom povezana s pučinom. Uz rub tunela privezano je nekoliko ribarskih čamaca čiji su vlasnici stanovnici obližnja Babina Polja, najvećeg naselja na Mljetu.	4
9	Špilja Manita peć	Manita peć jedina je špilja na prostoru parka koja je otvorena i uređena za posjet. Svojom prostranošću i ljepotom ukrasa oduševljava posjetitelje još od 1937. godine, kada je nakon uređenja staze započelo njeno posjećivanje. Ulaz u špilju nalazi se na 570 m nadmorske visine, a uspon od parkirališta u Velikoj Paklenici do nje traje oko sat i pol.	5
10	Kanjon Velike Paklenice	Dolina Velike Paklenice duga je 14,5 km. Zbog vodonepropusne litološke podloge od izvora Velike Paklenice, pa do njenog sutoka s Brezimenjačom, voda je u koritu Velike Paklenice prisutna tijekom cijele godine.	5
11	Špilja Šupljara	Procjeđivanjem vode kroz raspucalu površinu otapala se vapnenačka stijena. Pritom su se proširivale podzemne pukotine i stvarali kanali. Urezivanje kanjona Donjih jezera i povećanje podzemnih šupljina ispod jedne vrtače smještene na rubnom dijelu kanjona dovelo je do nestabilnosti i urušavanja dna vrtače, odnosno svoda spilje.	6
12	Izvor Kupe	Područje je proglašeno zaštićenim 12. prosinca 1963. godine na površini od 10 ha. Izvor rijeke Kupe, jedna od mnogih još uvijek neriješenih zagonetki krša, jedno od najjačih, najvećih i najdubljih hrvatskih vrela. Na nadmorskoj visini od 321 m, vodena je masa oblikovala jezero zelenoplave boje koje će vas očarati svojim izgledom. Do samoga dna izvora još se nije došlo, a zadnji uron bio je do 154 m.	7
13	Rodna kuća rijeke Kupe	Rodna kuća rijeke Kupe centar je za prihvat, educiranje i informiranje posjetitelja koji svojim imenom jasno kazuje kako je smješten u neposrednoj blizini izvora Kupe, koja tako postaje jedina hrvatska rijeka s „rodnom kućom“, a u svom prostoru interpretira bogatu bioraznolikost ove tekućice.	7
14	Poučna staza Leska	Godine 1993. u NP Risnjak otvorena je prva poučna staza unutar hrvatskih nacionalnih parkova - Leska. Staza je kružnog oblika, dužine 4200 metara i smještena je na nadmorskoj visini od 700 metara. Duž staze postavljene su ploče koje na hrvatskom i engleskom jeziku poučavaju posjetitelje o najznačajnijim objektima i pojavama karakterističnima kako za Risnjak, tako i za cijeli Gorski kotar.	7
15	Velebitski botanički vrt	U neposrednoj blizini Zavižana, petnaestak minuta hoda od planinarskog doma, nalazi se Velebitski botanički vrt osnovan 1967. godine, na inicijativu dr. Frana Kušana, profesora na Farmaceutsko-biokemijskom fakultetu u Zagrebu. Već 1969. godine vrt dobiva status spomenika parkovne arhitekture. Ideja koja je vodila osnivače botaničkog vrta aktualna je i danas - željeli su bogatstvo flore Velebita učiniti dostupnim ne samo znanstvenicima, istraživačima i zaljubljenicima u Velebit, nego i svim posjetiteljima koji dođu na Sjeverni Velebit. Nedugo nakon osnivanja vrta okolno je područje proglašeno posebnim botaničkim rezervatom Zavižan - Balinovac - Velika kosa.	8
16	Biokovski botanički vrt Kotišina	Smješten je na primorskim obroncima planine Biokovo iznad sela Kotišina, na nadmorskoj visini od 350 do 500 metara i dijelom je u Parku prirode Biokovo.	9
17	Kompleks dvoraca Tikveš	U srcu Baranje obuhvaćen Parkom prirode Kopački rit, smjestio se romantičarski arhitektonski sklop ladanjske arhitekture – kompleks dvoraca Tikveš. To je prostor šuma i perivoja unutar kojega su smješteni rezidencijalni objekti: novi dvorac s aneksom, stari dvorac, mali sakralni objekt (kapelica Papinog blagoslova), te prateći objekti s restoranom.	11
18	Šetnica bijelog lopoča	Nova šetnica kroz ovo jedinstveno zaštićeno područje duga je ukupno 2550 m. Šetnica povezuje prijemni centar i pristanište brodova preko jezera Mali Sakadaš. Posjetitelji tijekom šetnje mogu doživjeti Kopački rit u malom, uživati u bogatoj ritskoj vegetaciji, trski, šašu te mnoštvu lopoča i vrbe.	11
19	Petsto Horvatovih stuba	Petsto kamenih stuba mnogi smatraju najimpresivnijim i najljepšim lokalitetom izgrađenim ljudskom rukom na ovoj planini.	13
20	Stari grad Kaptol	U središtu mjesta Kaptol nalaze se u velikom opsegu sačuvani ostaci utvrde, crkve i stambenog trakta, te nedavno obnovljen crkveni zvonik. Kaptolska utvrda šesterokutni je kasnogotičko-renesansni kaštel s kružnim polukulama i četvrtastom ulaznom kulom.	14
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


CREATE TABLE Lokacija
(
  idLokacija INT NOT NULL,
  nazivLokacija VARCHAR(100) NOT NULL,
  PRIMARY KEY (idLokacija)
);

CREATE TABLE Drzava
(
  idDrzava INT NOT NULL,
  nazivDrzava VARCHAR(50) NOT NULL,
  PRIMARY KEY (idDrzava)
);

CREATE TABLE Vrsta
(
  idVrsta INT NOT NULL,
  nazivVrsta VARCHAR(100) NOT NULL,
  PRIMARY KEY (idVrsta)
);

CREATE TABLE Park
(
  idPark INT NOT NULL,
  naziv VARCHAR(100) NOT NULL,
  povrsina FLOAT NOT NULL,
  utemeljen DATE NOT NULL,
  sluzbenaStranica VARCHAR(100),
  email VARCHAR(100),
  idLokacija INT NOT NULL,
  idDrzava INT NOT NULL,
  idVrsta INT NOT NULL,
  PRIMARY KEY (idPark),
  FOREIGN KEY (idLokacija) REFERENCES Lokacija(idLokacija),
  FOREIGN KEY (idDrzava) REFERENCES Drzava(idDrzava),
  FOREIGN KEY (idVrsta) REFERENCES Vrsta(idVrsta)
);

CREATE TABLE Znamenitost
(
  idZnamenitost INT NOT NULL,
  nazivZnamenitosti VARCHAR(100) NOT NULL,
  opisZnamenitosti VARCHAR(1000) NOT NULL,
  idPark INT NOT NULL,
  PRIMARY KEY (idZnamenitost),
  FOREIGN KEY (idPark) REFERENCES Park(idPark)
);

CREATE TABLE MjestoProdajeUlaznice
(
  nazivProdajnogMjesta VARCHAR(100) NOT NULL,
  idPark INT NOT NULL,
  PRIMARY KEY (nazivProdajnogMjesta),
  FOREIGN KEY (idPark) REFERENCES Park(idPark)
);

CREATE TABLE Telefon
(
  tel VARCHAR(20) NOT NULL,
  idPark INT NOT NULL,
  PRIMARY KEY (tel),
  FOREIGN KEY (idPark) REFERENCES Park(idPark)
);

INSERT INTO Drzava VALUES (1, 'Hrvatska');
INSERT INTO Lokacija VALUES (1, 'Istarska županija');
INSERT INTO Lokacija VALUES (2, 'Jadransko more');
INSERT INTO Lokacija VALUES (3, 'Srednja Dalmacija');
INSERT INTO Lokacija VALUES (4, 'Otok Mljet');
INSERT INTO Lokacija VALUES (5, 'Velebit');
INSERT INTO Lokacija VALUES (6, 'Ličko-senjska i Karlovačka županija');
INSERT INTO Lokacija VALUES (7, 'Gorski kotar');
INSERT INTO Lokacija VALUES (8, 'Splitsko-dalmatinska županija');
INSERT INTO Lokacija VALUES (9, 'Splitsko-dalmatinska županija, Šibensko-kninska županija');
INSERT INTO Lokacija VALUES (10, 'Baranja');
INSERT INTO Lokacija VALUES (11, 'Lonsko Polje');
INSERT INTO Lokacija VALUES (12, 'Grad Zagreb');
INSERT INTO Lokacija VALUES (13, 'Virovitičko-podravska, Požeško-slavonska županija');

INSERT INTO Vrsta VALUES (1, 'Park Prirode');
INSERT INTO Vrsta VALUES (2, 'Nacionalni Park Prirode');

INSERT INTO Park VALUES (1, 'Brijuni', 33.9, '1983-10-27', 'https://www.np-brijuni.hr/hr', 'izleti@np-brijuni.hr', 1, 1, 2);
INSERT INTO Park VALUES (2, 'Kornati', 220, '1980-8-13', 'http://www.np-kornati.hr', 'turizam@np-kornati.hr', 2, 1, 2);
INSERT INTO Park VALUES (3, 'Krka', 109, '1985-1-24', 'https://www.npkrka.hr/hr/', 'info@npk.hr', 3, 1, 2);
INSERT INTO Park VALUES (4, 'Mljet', 53.75, '1960-11-11', 'https://www.np-mljet.hr', 'np-mljet@np-mljet.hr', 4, 1, 2);
INSERT INTO Park VALUES (5, 'Paklenica', 95, '1949-10-19', 'https://np-paklenica.hr/hr/', 'np-paklenica@paklenica.hr', 5, 1, 2);
INSERT INTO Park VALUES (6, 'Plitvička jezera', 296.8515, '1949-4-8', 'https://np-plitvicka-jezera.hr/', null, 6, 1, 2);
INSERT INTO Park VALUES (7, 'Risnjak', 63.5, '1953-9-15', 'https://www.risnjak.hr/', 'marketing@np-risnjak.hr', 7, 1, 2);
INSERT INTO Park VALUES (8, 'Sjeverni Velebit', 109, '1999-6-9', 'https://np-sjeverni-velebit.hr', 'promidzba@np-sjeverni-velebit.hr', 5, 1, 2);
INSERT INTO Park VALUES (9, 'Biokovo', 195.5, '1981-1-1', 'https://pp-biokovo.hr/en', 'info@pp-biokovo.hr', 8, 1, 1);
INSERT INTO Park VALUES (10, 'Dinara', 630.52, '2021-2-20', null, null, 9, 1, 1);
INSERT INTO Park VALUES (11, 'Kopački rit', 177, '1976-5-13', 'https://pp-kopacki-rit.hr/', 'prijemni.centar@pp-kopacki-rit.hr', 10, 1, 1);
INSERT INTO Park VALUES (12, 'Lonsko Polje', 506.5, '1993-2-3', 'http://www.pp-lonjsko-polje.hr', 'info@pp-lonjsko-polje.hr', 11, 1, 1);
INSERT INTO Park VALUES (13, 'Medvednica', 179.38, '1981-6-16', 'https://www.pp-medvednica.hr/', 'info@pp-medvednica.hr', 12, 1, 1);
INSERT INTO Park VALUES (14, 'Papuk', 336, '1999-4-23', 'https://www.pp-papuk.hr/', 'kontakt@pp-papuk.hr', 13, 1, 1);

INSERT INTO MjestoProdajeUlaznice VALUES ('Izletnička poslovnica NP Brijuni u Fažani, Brionska 10', 1);
INSERT INTO MjestoProdajeUlaznice VALUES ('Recepcija Aba, Butina 2, Murter', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Marina Šibenik d.o.o., Obala Jerka Šižgorića 1, Šibenik', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Danuvius marina d.o.o., Jurjevgradska 2, Tribunj', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Marina Kornati, Šetalište kneza Branimira 1, Biograd n/m', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Euronautic d.o.o., Marina Kornati, Biograd n/m', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Bimex Adria, Marina Dalmacija, Sukošan', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Albatros Yachting, I. Meštrovića 2, Marina Zadar', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Prosper Yachting d.o.o., Marina Tankerkomerc Zadar, Ivana Gundulića 1/B, Zadar', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Adamo Travel, Sali 112, Sali, Dugi otok', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('ACI marina Žut, otok Žut', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('ACI marina Jezera, Obala sv. Ivana 47 E, Jezera', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('ACI marina Vodice, Artina 13 A, Vodice', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('ACI marina Skradin, Obala bana Pavla Šubića 18, Skradin', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('T. A. Bisage, Put Zaratića 3, Jezera', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Makirina turist d.o.o., Trg Domovinskog rata 1, Pirovac', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Nautika Veli Rat, Šetalište Ivana Klarina 1, Veli Rat, Dugi Otok', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Nautički centa Trogir, Marina Baotić, Don Petra Špike 2A, Seget Donji', 2);
INSERT INTO MjestoProdajeUlaznice VALUES ('Lozovac', 3);
INSERT INTO MjestoProdajeUlaznice VALUES ('Skradin', 3);
INSERT INTO MjestoProdajeUlaznice VALUES ('Roški slap', 3);
INSERT INTO MjestoProdajeUlaznice VALUES ('Kistanje', 3);
INSERT INTO MjestoProdajeUlaznice VALUES ('Burnum', 3);
INSERT INTO MjestoProdajeUlaznice VALUES ('Pomena', 4);
INSERT INTO MjestoProdajeUlaznice VALUES ('Polače', 4);
INSERT INTO MjestoProdajeUlaznice VALUES ('Vrbovica', 4);
INSERT INTO MjestoProdajeUlaznice VALUES ('Infopunkt', 4);
INSERT INTO MjestoProdajeUlaznice VALUES ('Mali most', 4);
INSERT INTO MjestoProdajeUlaznice VALUES ('Ulaz 1 Velika Paklenica', 5);
INSERT INTO MjestoProdajeUlaznice VALUES ('Ulaz 2 Mala Paklenica', 5);
INSERT INTO MjestoProdajeUlaznice VALUES ('Ulaz 1', 6);
INSERT INTO MjestoProdajeUlaznice VALUES ('Ulaz 2', 6);
INSERT INTO MjestoProdajeUlaznice VALUES ('Flora', 6);
INSERT INTO MjestoProdajeUlaznice VALUES ('Bijela Vodica - infopunkt', 7);
INSERT INTO MjestoProdajeUlaznice VALUES ('Bijela Vodica - restoran', 7);
INSERT INTO MjestoProdajeUlaznice VALUES ('Kupari - infopunkt', 7);
INSERT INTO MjestoProdajeUlaznice VALUES ('Razloge - infopunkt', 7);
INSERT INTO MjestoProdajeUlaznice VALUES ('Risnjak - planinarski dom', 7);
INSERT INTO MjestoProdajeUlaznice VALUES ('Infocentar Krasno (Uprava NP Sjeverni Velebit), Krasno 96, Krasno', 8);
INSERT INTO MjestoProdajeUlaznice VALUES ('Ulazna recepcija Parka uz cestu D 512 Makarska - Vrgorac (8 km od smjera Makarske prema Vrgorcu)', 9);
INSERT INTO MjestoProdajeUlaznice VALUES ('Infocentar Marineta u Makarskoj, Marineta - Mala obala 16, 21 300 Makarska', 9);
INSERT INTO MjestoProdajeUlaznice VALUES ('Prijemni centar Kopačevo', 11);
INSERT INTO MjestoProdajeUlaznice VALUES ('Krapje 18, 44324 Jasenovac', 12);
INSERT INTO MjestoProdajeUlaznice VALUES ('Čigoč 26, 44203 Gušće', 12);
INSERT INTO MjestoProdajeUlaznice VALUES ('Špilja Veternica (Glavica bb)', 13);
INSERT INTO MjestoProdajeUlaznice VALUES ('Rudnik Zrinski (Malo Sljeme bb)', 13);
INSERT INTO MjestoProdajeUlaznice VALUES ('Srednjovjekovni grad Medvedgrad (Sljemenska cesta bb)', 13);
INSERT INTO MjestoProdajeUlaznice VALUES ('Velika, S. Radića 46 - Centar za posjetitelje', 14);
INSERT INTO MjestoProdajeUlaznice VALUES ('Jankovac - Ekotočka Jankovac', 14);

INSERT INTO Telefon VALUES ('00385 (0)52 525 882', 1);
INSERT INTO Telefon VALUES ('00385 (0)52 525 883', 1);
INSERT INTO Telefon VALUES ('00385 (0)22 435 740', 2);
INSERT INTO Telefon VALUES ('00385 (0)22 201 777', 3);
INSERT INTO Telefon VALUES ('00385 (0)20 744 041', 4);
INSERT INTO Telefon VALUES ('00385 (0)23 369 155', 5);
INSERT INTO Telefon VALUES ('00385 (0)23 369 202', 5);
INSERT INTO Telefon VALUES ('00385 (0)23 369 803', 5);
INSERT INTO Telefon VALUES ('00385 (0)53 751 026', 6);
INSERT INTO Telefon VALUES ('00385 (0)53 751 014', 6);
INSERT INTO Telefon VALUES ('00385 (0)53 751 015', 6);
INSERT INTO Telefon VALUES ('00385 (0)51 836 133', 7);
INSERT INTO Telefon VALUES ('00385 (0)51 836 261', 7);
INSERT INTO Telefon VALUES ('00385 (0)53 665 393', 8);
INSERT INTO Telefon VALUES ('00385 (0)31 445 445', 11);
INSERT INTO Telefon VALUES ('00385 (0)31 752 320', 11);
INSERT INTO Telefon VALUES ('00385 (0)31 752 322', 11);
INSERT INTO Telefon VALUES ('00385 (0)44 672 080', 12);
INSERT INTO Telefon VALUES ('00385 (0)44 611 190', 12);
INSERT INTO Telefon VALUES ('00385 (0)1 458 6317', 13);
INSERT INTO Telefon VALUES ('00385 (0)34 313 029', 14);
INSERT INTO Telefon VALUES ('00385 (0)34 313 030', 14);

--INSERT INTO Znamenitost VALUES (null, '', '', 1);
INSERT INTO Znamenitost VALUES (1, 'Rimska vila u uvali Verige', 'Na zapadnoj obali Brijuna, u uvali Verige, smještena je raskošna rimska vila. Najveći sjaj vila je dosegla u 1. stoljeću poslije Krista, a pojedini dijelovi vile koristili su se do 6. stoljeća. Sastojala se od više građevina različitih namjena smještenih na pomno odabranim lokacijama u raznim dijelovima uvale.', 1);
INSERT INTO Znamenitost VALUES (2, 'Vidikovac na Ciprovcu', 'Najočuvaniji od tri Kupelwieserova vidikovca koji se zbog svoje konstrukcije izlagao na brojnim izložbama. Izrađeni su oko 1900. godine u željezari u Vitkovicama, u kojoj je do dolaska na Brijune radio Paul Kupelwieser. Nekoć dominantnu turističku atrakciju nadrasla je šuma. Drugi očuvani vidikovac nalazi se na brdu Saluga, iznad glavnog brijunskog kupališta.', 1);
INSERT INTO Znamenitost VALUES (3, 'Krune', 'Čuvene kornatske „krune“ (strmci ili litice) okrenute prema otvorenom moru, koje karakteriziraju većinu vanjskih otoka u pučinskom otočnom nizu, posebna su odlika i vrijednost ovog prostora. „Krune“ su posljedica pucanja i rasjedanja Zemljine kore uslijed podvlačenja Afričke tektonske ploče pod Euroazijsku.', 2);
INSERT INTO Znamenitost VALUES (4, 'Utvrda Tureta', 'Vrijeme Bizanta ostavilo je po mnogima najmarkantniju građevinu koju danas nalazimo na Kornatima - utvrdu Tureta na otoku Kornatu koja je izgrađena najvjerojatnije u 6. stoljeću (kasna antika/rani srednji vijek). Pretpostavlja se da je njezina vojna posada kontrolirala plovidbu kornatskim arhipelagom i čuvala krška polja Tarac i Željkovci od iznenadnih napada s mora.', 2);
INSERT INTO Znamenitost VALUES (5, 'Vidikovci', 'Vidikovac Metlina na otoku Kornatu najviši je i najimpresivniji vrh Nacionalnog parka Kornati (237 m), ali je do njega najteže doći.', 2);
INSERT INTO Znamenitost VALUES (6, 'Skradinski buk', 'Skradinski buk, najduži slap na rijeci Krki, jedna je od najpoznatijih prirodnih ljepota Hrvatske. Slap tvore sedrene barijere, otoci i jezera. Može ga se razgledati tijekom cijele godine zahvaljujući mreži staza i mostova koji omogućuju ugodnu i sigurnu šetnju. Na Skradinskom buku nalaze se obnovljeni mlinovi, valjavice i stupe, koje stoljećima koriste snagu vodenog toka.', 3);
INSERT INTO Znamenitost VALUES (7, 'Roški slap', 'Roškim slapom naziva se prostrano slapište koje čine 22,5 metra visoki glavni slapovi i bezbroj rukavaca, kaskada i sedrenih otoka. Roški slap smješten je oko 36 km nizvodno od izvora rijeke Krke. Početak barijere čini niz malih kaskada (u narodu zvanih „ogrlice“) nakon kojih slijede brojni rukavci i otočići. Od „ogrlica“ vodi 517 drvenih stepenica prema Oziđanoj pećini.', 3);
INSERT INTO Znamenitost VALUES (8, 'Odisejeva špilja', 'Na središnjem južnom dijelu mljetske obale nalazi se geomorfološki fenomen Jama (Odisejeva špilja) - krška šupljina čiji se strop odlomio pa uistinu izgleda kao jama ili široki bunar. U njezinom je dnu more jer je Jama prirodnim tunelom povezana s pučinom. Uz rub tunela privezano je nekoliko ribarskih čamaca čiji su vlasnici stanovnici obližnja Babina Polja, najvećeg naselja na Mljetu.', 4);
INSERT INTO Znamenitost VALUES (9, 'Špilja Manita peć', 'Manita peć jedina je špilja na prostoru parka koja je otvorena i uređena za posjet. Svojom prostranošću i ljepotom ukrasa oduševljava posjetitelje još od 1937. godine, kada je nakon uređenja staze započelo njeno posjećivanje. Ulaz u špilju nalazi se na 570 m nadmorske visine, a uspon od parkirališta u Velikoj Paklenici do nje traje oko sat i pol.', 5);
INSERT INTO Znamenitost VALUES (10, 'Kanjon Velike Paklenice', 'Dolina Velike Paklenice duga je 14,5 km. Zbog vodonepropusne litološke podloge od izvora Velike Paklenice, pa do njenog sutoka s Brezimenjačom, voda je u koritu Velike Paklenice prisutna tijekom cijele godine.', 5);
INSERT INTO Znamenitost VALUES (11, 'Špilja Šupljara', 'Procjeđivanjem vode kroz raspucalu površinu otapala se vapnenačka stijena. Pritom su se proširivale podzemne pukotine i stvarali kanali. Urezivanje kanjona Donjih jezera i povećanje podzemnih šupljina ispod jedne vrtače smještene na rubnom dijelu kanjona dovelo je do nestabilnosti i urušavanja dna vrtače, odnosno svoda spilje.', 6);
INSERT INTO Znamenitost VALUES (12, 'Izvor Kupe', 'Područje je proglašeno zaštićenim 12. prosinca 1963. godine na površini od 10 ha. Izvor rijeke Kupe, jedna od mnogih još uvijek neriješenih zagonetki krša, jedno od najjačih, najvećih i najdubljih hrvatskih vrela. Na nadmorskoj visini od 321 m, vodena je masa oblikovala jezero zelenoplave boje koje će vas očarati svojim izgledom. Do samoga dna izvora još se nije došlo, a zadnji uron bio je do 154 m.', 7);
INSERT INTO Znamenitost VALUES (13, 'Rodna kuća rijeke Kupe', 'Rodna kuća rijeke Kupe centar je za prihvat, educiranje i informiranje posjetitelja koji svojim imenom jasno kazuje kako je smješten u neposrednoj blizini izvora Kupe, koja tako postaje jedina hrvatska rijeka s „rodnom kućom“, a u svom prostoru interpretira bogatu bioraznolikost ove tekućice.', 7);
INSERT INTO Znamenitost VALUES (14, 'Poučna staza Leska', 'Godine 1993. u NP Risnjak otvorena je prva poučna staza unutar hrvatskih nacionalnih parkova - Leska. Staza je kružnog oblika, dužine 4200 metara i smještena je na nadmorskoj visini od 700 metara. Duž staze postavljene su ploče koje na hrvatskom i engleskom jeziku poučavaju posjetitelje o najznačajnijim objektima i pojavama karakterističnima kako za Risnjak, tako i za cijeli Gorski kotar.', 7);
INSERT INTO Znamenitost VALUES (15, 'Velebitski botanički vrt', 'U neposrednoj blizini Zavižana, petnaestak minuta hoda od planinarskog doma, nalazi se Velebitski botanički vrt osnovan 1967. godine, na inicijativu dr. Frana Kušana, profesora na Farmaceutsko-biokemijskom fakultetu u Zagrebu. Već 1969. godine vrt dobiva status spomenika parkovne arhitekture. Ideja koja je vodila osnivače botaničkog vrta aktualna je i danas - željeli su bogatstvo flore Velebita učiniti dostupnim ne samo znanstvenicima, istraživačima i zaljubljenicima u Velebit, nego i svim posjetiteljima koji dođu na Sjeverni Velebit. Nedugo nakon osnivanja vrta okolno je područje proglašeno posebnim botaničkim rezervatom Zavižan - Balinovac - Velika kosa.', 8);
INSERT INTO Znamenitost VALUES (16, 'Biokovski botanički vrt Kotišina', 'Smješten je na primorskim obroncima planine Biokovo iznad sela Kotišina, na nadmorskoj visini od 350 do 500 metara i dijelom je u Parku prirode Biokovo.', 9);
INSERT INTO Znamenitost VALUES (17, 'Kompleks dvoraca Tikveš', 'U srcu Baranje obuhvaćen Parkom prirode Kopački rit, smjestio se romantičarski arhitektonski sklop ladanjske arhitekture – kompleks dvoraca Tikveš. To je prostor šuma i perivoja unutar kojega su smješteni rezidencijalni objekti: novi dvorac s aneksom, stari dvorac, mali sakralni objekt (kapelica Papinog blagoslova), te prateći objekti s restoranom.', 11);
INSERT INTO Znamenitost VALUES (18, 'Šetnica bijelog lopoča', 'Nova šetnica kroz ovo jedinstveno zaštićeno područje duga je ukupno 2550 m. Šetnica povezuje prijemni centar i pristanište brodova preko jezera Mali Sakadaš. Posjetitelji tijekom šetnje mogu doživjeti Kopački rit u malom, uživati u bogatoj ritskoj vegetaciji, trski, šašu te mnoštvu lopoča i vrbe.', 11);
INSERT INTO Znamenitost VALUES (19, 'Petsto Horvatovih stuba', 'Petsto kamenih stuba mnogi smatraju najimpresivnijim i najljepšim lokalitetom izgrađenim ljudskom rukom na ovoj planini.', 13);
INSERT INTO Znamenitost VALUES (20, 'Stari grad Kaptol', 'U središtu mjesta Kaptol nalaze se u velikom opsegu sačuvani ostaci utvrde, crkve i stambenog trakta, te nedavno obnovljen crkveni zvonik. Kaptolska utvrda šesterokutni je kasnogotičko-renesansni kaštel s kružnim polukulama i četvrtastom ulaznom kulom.', 14);

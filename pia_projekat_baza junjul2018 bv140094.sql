CREATE DATABASE  IF NOT EXISTS `pia_projekat_baza` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pia_projekat_baza`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pia_projekat_baza
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `donatorski_ugovor`
--

DROP TABLE IF EXISTS `donatorski_ugovor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donatorski_ugovor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idKomp` int(11) NOT NULL,
  `idPaket` int(11) NOT NULL,
  `proc_vred` float NOT NULL,
  `opis` varchar(1000) NOT NULL,
  `kolicina` int(11) DEFAULT NULL,
  `datum_ugovora` date NOT NULL,
  `idStatus` int(11) NOT NULL,
  `datum_isporuke` date NOT NULL,
  `komentar` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idKomp1_idx` (`idKomp`),
  KEY `idPaket1_idx` (`idPaket`),
  KEY `idStatus_idx` (`idStatus`),
  CONSTRAINT `idKomp1` FOREIGN KEY (`idKomp`) REFERENCES `kompanija` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `idPaket1` FOREIGN KEY (`idPaket`) REFERENCES `paket` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `idStatus1` FOREIGN KEY (`idStatus`) REFERENCES `status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donatorski_ugovor`
--

LOCK TABLES `donatorski_ugovor` WRITE;
/*!40000 ALTER TABLE `donatorski_ugovor` DISABLE KEYS */;
INSERT INTO `donatorski_ugovor` (`id`, `idKomp`, `idPaket`, `proc_vred`, `opis`, `kolicina`, `datum_ugovora`, `idStatus`, `datum_isporuke`, `komentar`) VALUES (1,2,1,8000,'Oprema - energetika.',5,'2018-01-18',5,'2018-02-24',NULL),(2,5,4,2300,'Video tehnologije.',3,'2018-02-02',5,'2018-03-10',NULL),(3,6,6,800,'Oprema.',7,'2017-12-12',5,'2017-12-17',NULL),(4,7,5,1750,'Oprema za automatiku.',10,'2018-03-05',5,'2018-03-20',NULL),(5,10,1,8500,'Računarska oprema.',15,'2016-08-04',5,'2016-08-17',NULL),(6,6,6,1050,'Kompovi za studentsku službu.',2,'2013-06-19',6,'2013-06-25','Valja biti efikasan.'),(7,10,1,7200,'Nedefinisana hrpa opreme.',NULL,'2014-05-07',6,'2014-07-13',NULL),(8,24,1,20000,'Opremljena laboratorija za RTI.',50,'2014-12-05',6,'2014-12-11','bez komentara'),(9,24,1,12000,'računari',30,'2015-01-11',6,'2015-01-15',NULL),(10,24,1,14444.4,'opet računari',37,'2017-01-25',5,'2017-01-31',NULL);
/*!40000 ALTER TABLE `donatorski_ugovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ima`
--

DROP TABLE IF EXISTS `ima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ima` (
  `idPaket` int(11) NOT NULL,
  `idStavka` int(11) NOT NULL,
  PRIMARY KEY (`idPaket`,`idStavka`),
  KEY `idStavka_idx` (`idStavka`),
  CONSTRAINT `idPaket` FOREIGN KEY (`idPaket`) REFERENCES `paket` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `idStavka` FOREIGN KEY (`idStavka`) REFERENCES `stavka` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ima`
--

LOCK TABLES `ima` WRITE;
/*!40000 ALTER TABLE `ima` DISABLE KEYS */;
INSERT INTO `ima` (`idPaket`, `idStavka`) VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(1,4),(2,4),(7,4),(1,5),(2,5),(1,6),(2,6),(3,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7);
/*!40000 ALTER TABLE `ima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kompanija`
--

DROP TABLE IF EXISTS `kompanija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kompanija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `adresa` varchar(45) NOT NULL,
  `grad` varchar(45) NOT NULL,
  `postanski_broj` int(11) NOT NULL,
  `zemlja` varchar(45) NOT NULL,
  `ziro_racun` varchar(45) NOT NULL,
  `valuta` varchar(3) NOT NULL,
  `pib` varchar(25) NOT NULL,
  `telefon1` varchar(25) NOT NULL,
  `telefon2` varchar(25) DEFAULT NULL,
  `telefon3` varchar(25) DEFAULT NULL,
  `telefon4` varchar(25) DEFAULT NULL,
  `telefon5` varchar(25) DEFAULT NULL,
  `email1` varchar(55) NOT NULL,
  `email2` varchar(55) DEFAULT NULL,
  `email3` varchar(55) DEFAULT NULL,
  `email4` varchar(55) DEFAULT NULL,
  `email5` varchar(55) DEFAULT NULL,
  `logo` varchar(260) DEFAULT NULL,
  `web` varchar(200) NOT NULL,
  `opis` varchar(1500) DEFAULT NULL,
  `kontakt_osoba` varchar(70) NOT NULL,
  `ko_telefon` varchar(25) NOT NULL,
  `ko_email` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kompanija`
--

LOCK TABLES `kompanija` WRITE;
/*!40000 ALTER TABLE `kompanija` DISABLE KEYS */;
INSERT INTO `kompanija` (`id`, `naziv`, `adresa`, `grad`, `postanski_broj`, `zemlja`, `ziro_racun`, `valuta`, `pib`, `telefon1`, `telefon2`, `telefon3`, `telefon4`, `telefon5`, `email1`, `email2`, `email3`, `email4`, `email5`, `logo`, `web`, `opis`, `kontakt_osoba`, `ko_telefon`, `ko_email`) VALUES (1,'Elektroprivreda Srbije','x','x',0,'Srbija','123','RSD','123','123',NULL,NULL,NULL,NULL,'eps@rs.com',NULL,NULL,NULL,NULL,'eps.png','http://eps.rs/','Elektroprivreda Srbije (EPS) je jedno od najvećih javnih preduzeća u Republici Srbiji čiji je prevashodna delatnost u oblasti energetike: proizvodnja, distribucija i snabdevanje električnom energijom, kao i proizvodnja uglja.\r\n\r\nMisija Elektroprivrede Srbije je sigurno snabdevanje kupaca električnom energijom, pod tržišno najpovoljnijim uslovima, uz stalno podizanje kvaliteta usluga, unapređenje brige o životnoj sredini i uvećanje dobrobiti zajednice.\r\n\r\nVizija Elektroprivrede Srbije je da bude društveno odgovorna, tržišno orijentisana i profitabilna kompanija, konkurentna na evropskom tržištu i sa značajnim uticajem u regionu, prepoznata kao pouzdan partner domaćim i međunarodnim kompanijama.\r\n\r\nVeć godinama unazad, EPS podržava i pomaže rad najvažnijih državnih ustanova, institucija i udruženja u oblasti nauke i obrazovanja: Univerziteta u Beogradu i fakulteta koji obrazuju stručnjake potrebne elektroprivredi, Srpske akademije nauka i umetnosti, Instituta Nikola Tesla, Instituta Mihajlo Pupin, Saveza inženjera i tehničara. EPS podržava i najvažnije strukovne skupove i sajmove: CIGRE, CIRED, Energetika, Rudarstvo, Vode i Sajam energetike. A kroz različite manifestacije koje su tematski okrenute nauci, kao što su Festival nauke, Tesla dani i Noć istraživača, EPS daje svoj doprinos afirmisanju nauke. Takođe, EPS podržava naučne i edukativne kampove za najmlađe - Dečiji kamp „Viminacijum“ i Eko kamp „Tara“.','A. B.','123','ab@gmail.com'),(2,'ABB','x','x',0,'x','123','EUR','123','123',NULL,NULL,NULL,NULL,'abb@bla.com',NULL,NULL,NULL,NULL,'abb.png','https://new.abb.com/','ABB (www.abb.com) je vodeća svetska kompanija u oblasti energetike i industrijske automatizacije koja svojim tehnologijama pomaže korisnicima iz javnog sektora, industrije, oblasti infrastrukture i transporta u unapređenju njihove produktivnosti uz smanjenje štetnog uticaja na životnu sredinu. ABB Grupa posluje u oko 100 zemalja i zapošljava oko 135.000 ljudi.','C. D.','456','cd@gmail.com'),(3,'HDL Design House','y','y',0,'Srbija','123','RSD','123','123',NULL,NULL,NULL,NULL,'hdl@rs.com',NULL,NULL,NULL,NULL,'hdl.jpg','https://www.hdl-dh.com/','HDL Design House se bavi pružanjem usluga u oblasti projektovanja i verifikacije SoC integrisanih kola, kao i razvojem IP cores i simulacionih modela koji se koriste u „System/Product Level“ simulacijama, poslujući u skladu sa međunarodno priznatim standardima kvaliteta ISO 9001:2008 upravljanja kvalitetom i ISO 27001:2013 upravljanja bezbednošću informacija. Preduzeće je osnovano 2001. i trenutno zapošljava 120 inženjera koji rade u razvojnim centrima u Beogradu i Ćupriji. Od svog osnivanja, HDL DH izuzetno uspešno učestvuje na R&D projektima sa kompanijama kao što su: NXP, Fujitsu, AMD, Infineon, CEVA, Cadence, Honeywell, Broadcom, Texas Instruments, Sensirion, uBlox, Siemens, Ericsson, Intel, i druge.','E. F.','789','ef@gmail.com'),(4,'Microsoft Development Center Serbia','x','Beograd',11000,'Srbija','123','RSD','123','123','456',NULL,NULL,NULL,'mdcs@bg.rs','mdcs@rs.com',NULL,NULL,NULL,'mdcs.png','https://www.microsoft.com/serbia/mdcs/','Microsoft Development Center Serbia - MDCS, otvoren je 2005. god. kao četvrti po redu razvojni centar kompanije Majkrosoft u svetu. Tim MDCS-a čini više od 200 perspektivnih mladih ljudi, vrhunskih stručnjaka iz oblasti kompjuterskih nauka i primenjene matematike. MDCS nastao je sa idejom da angažovanjem talenata iz Srbije i regiona, uzme aktivno učešće i doprinese razvoju novih Majkrosoft tehnologija.','G. H.','123','gh@gmail.com'),(5,'nVidia','x','x',0,'x','123','USD','123','123',NULL,NULL,NULL,NULL,'nvidia@gmail.com',NULL,NULL,NULL,NULL,'nvidia.png','http://www.nvidia.com/',NULL,'I. J.','456','ij@gmail.com'),(6,'Atos','z','z',0,'z','456','z','123','123',NULL,NULL,NULL,NULL,'atos@nesto.com',NULL,NULL,NULL,NULL,NULL,'http://rs.atos.net/',NULL,'K. L.','789','kl@gmail.com'),(7,'Danieli Systec','x','x',0,'x','123','x','123','123',NULL,NULL,NULL,NULL,'danieli@systec.com',NULL,NULL,NULL,NULL,'danieli.tif','http://www.danieli-systec.com/',NULL,'M. N.','123','mn@gmail.com'),(8,'ELSYS Eastern Europe','x','x',0,'x','123','x','123','123',NULL,NULL,NULL,NULL,'elsys@ee.com',NULL,NULL,NULL,NULL,'elsys.jpg','http://www.elsys-eastern.com/','ELSYS Eastern Europe je jedna od vodećih kompanija na evropskom tržištu koja se bavi razvojem kompleksnih integrisanih kola i elektronskih sistema i čiji inženjeri raspolažu ekspertizama iz različitih oblasti koja su potrebna za razvoj digitalnih, analognih i mixed-signal integrisanih kola. Takođe, razvoj sistemskih rešenja, kao i embedded softvera je deo našeg portfolia. Klijenti se nalaze u SAD, Francuskoj, Nemačkoj, Švajcarskoj, Izraelu, Japanu, itd. ELSYS je deo internacionalne ADVANS grupe koja je, sa svojih više od 1000 inženjera, specijalizovana u izradi kompleksnih projekata u oblasti aplikativnog softvera, elektronskih sistema i mehanike. Postije dva razvojna centra, u Beogradu i Novom Sadu.','O. P.','456','op@gmail.com'),(9,'levi9','x','x',0,'x','123','x','123','123',NULL,NULL,NULL,NULL,'levi9@official.com',NULL,NULL,NULL,NULL,'levi9.jpeg','https://www.levi9.com/',NULL,'Q. R','789','qr@gmail.com'),(10,'Comtrade','109 State Street, Suite 304','Boston, MA',2109,'SAD','123','USD','123','123',NULL,NULL,NULL,NULL,'info@comtradesoftware.com','info.ie@comtrade.com',NULL,NULL,NULL,'comtrade.png','https://www.comtrade.com/','Komtrejd je osnovan 1991. u Beogradu, kao distributer računarske opreme; danas prvenstveno izvozi znanje klijentima u Americi, zapadnoj Evropi, Aziji i Australiji. Od preko 2000 zaposlenih, većina razvija poslovni softver za najuspešnije svetske firme. Strateški partners Komtrejda su IKT giganti Microsoft, HP, Citrix, Oracle, F5, EMC i Nutanix, a među klijentima su i najveća evropska avio kompanija Ryanair, komunikacijska platforma Viber i CERN, Evropski institut za nuklearna istraživanja.','S. T.','123','st@gmail.com'),(11,'Logitech','x','Lozana',0,'Švajcarska','123','CHF','123','123',NULL,NULL,NULL,NULL,'logite@ch.com',NULL,NULL,NULL,NULL,'logitech.png','https://www.logitech.com/',NULL,'U. V.','123','uv@gmail.com'),(24,'Nordeus','165v Bulevar Mihajla Pupina','Beograd',11000,'Srbija','123','RSD','123','123','nordeus@hotmail.rs',NULL,NULL,NULL,'nordeus@gmail.com',NULL,NULL,NULL,NULL,'nordeus.png','https://nordeus.com/','Nordeus je nezavisna kompanija za razvoj video igara i tvorac igre “Top Eleven”, jedne od najpopularnijih sportskih onlajn igara, koju igra preko 140 miliona igrača širom sveta. Kompanija je osnovana 2010. u Beogradu od strane tri elektroinženjera Elektrotehničkog fakulteta u Beogradu, koji su napustili svoje korporativne karijere u inostranstvu i vratili se u Srbiju sa zajedničkom vizijom igre koju žele da prave. Ne samo da su bili odlučni da igrom izgrade globalni uspeh u industriji igara, već su se obavezali da će svojim radom uvek praviti pozitivne promene za svoje igrače, zaposlene i društvo u kome žive. To je i danas jedna od glavnih vrednosti kompanije Nordeus.\r\n\r\nNordeus čini tim od preko 160 kreativnih profesionalaca u Beogradu, Londonu i Dablinu. Kompanija izuzetno mnogo pažnje poklanja uslovima za rad, programima za usavršavanje i sveukupnoj dobrobiti svojih zaposlenih, zbog čega je više puta bila nagrađivana kao najbolji poslodavac u regionu. Nordeus je u stalnoj potrazi za globalnim stručnjacima i mladim talentima koji žele da postanu deo industrije igara.','N. N.','123123123','nn@nordeus.com'),(25,'K.L.A.IN. Robotics','Via Cacciamali, 67','Breša',25125,'Italija','123','EUR','0','123',NULL,NULL,NULL,NULL,'klain@brescia.com',NULL,NULL,NULL,NULL,'klain.jpg','https://www.klainrobotics.com/','K.L.A.IN.Robotics iz Breše je distributer robota za komponente u oblasti fabričke automatizacije i mehatronike koji pokriva Italiju i deo Švajcarske u kom se govori italijanski. Posao je podeljen u dva sektora: distribucija komponenta za fabričku automatizaciju specijalizovanim integratorima sistema koji konstruišu proizvodne trake i specijalne mašine za sisteme u oblastima kao što su kozmetika, zdravstvo, farmacija, hrana, elektronika, moda, optička pomagala, kontrolu kvaliteta, plastično modeliranje, itd. Drugi sektor je aktivna usluga, koja nudi kurseve obuke za korišćenje mehatroničkih proizvoda, kao i pomoć i podrška klijentima i potencijalnim klijentima u procesu izbora i razvijanja projekata, ili u pokretanju instaliranih proizvoda i testiranju ciklusa simulacijama u oblasti razvoja softvera.','parla italiano','11111','spaghetti@brescia.com');
/*!40000 ALTER TABLE `kompanija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnik` (
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `institucija` varchar(45) NOT NULL,
  `pol` char(1) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `slika` mediumblob,
  `linkedin` varchar(100) DEFAULT NULL,
  `tip` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` (`username`, `password`, `ime`, `prezime`, `email`, `institucija`, `pol`, `datum_rodjenja`, `slika`, `linkedin`, `tip`) VALUES ('admin','ZkgZ2MU0NnbJIlte0Apc3G86H/M=','Adminka','Adminković','admin@etf.rs','ETF','Z','1980-03-03',NULL,NULL,2),('clan','/w1hfSAeWxNNKn2YqHa6N5nUvjI=','Član','Članović','clan@etf.rs','ETF','M','1990-01-01',NULL,NULL,0),('clan2','435HxVCSYyBkqNok9rDYkNKUI2c=','Novi','Korisnik','nk@bla.com','ETF','M','1991-04-17',NULL,NULL,0),('clan3','l0UiFFmAkwL3mK2+3OjvP3tzNag=','Još','Jedan','nk2@bla.com','ETF','M','1955-05-15',NULL,'www.linkedin.stagod.com',-1),('itmen','Ja62B6CCp8CCRMb4oSLMJ54T5NU=','Menadžer','Menadžerović','itmen@etf.rs','ETF','M','1985-02-02',NULL,NULL,1);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novcani_ugovor`
--

DROP TABLE IF EXISTS `novcani_ugovor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novcani_ugovor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idKomp` int(11) NOT NULL,
  `idPaket` int(11) NOT NULL,
  `vrednost` float NOT NULL,
  `datum_ugovora` date NOT NULL,
  `idStatus` int(11) NOT NULL,
  `faktura_poslata` bit(1) NOT NULL,
  `uplata_izvrsena` bit(1) NOT NULL,
  `datum_uplate` date DEFAULT NULL,
  `komentar` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idKomp2_idx` (`idKomp`),
  KEY `idPaket2_idx` (`idPaket`),
  KEY `idStatus2_idx` (`idStatus`),
  CONSTRAINT `idKomp2` FOREIGN KEY (`idKomp`) REFERENCES `kompanija` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `idPaket2` FOREIGN KEY (`idPaket`) REFERENCES `paket` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `idStatus2` FOREIGN KEY (`idStatus`) REFERENCES `status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novcani_ugovor`
--

LOCK TABLES `novcani_ugovor` WRITE;
/*!40000 ALTER TABLE `novcani_ugovor` DISABLE KEYS */;
INSERT INTO `novcani_ugovor` (`id`, `idKomp`, `idPaket`, `vrednost`, `datum_ugovora`, `idStatus`, `faktura_poslata`, `uplata_izvrsena`, `datum_uplate`, `komentar`) VALUES (1,1,1,10000,'2017-06-05',5,'','','2017-06-10',NULL),(2,3,2,5000,'2017-10-10',5,'','','2017-10-20',NULL),(3,4,3,3500,'2017-09-15',5,'','','2017-09-18',NULL),(4,8,2,5500,'2018-02-22',5,'','','2018-02-26',NULL),(5,9,4,2000,'2017-11-11',5,'','','2017-12-03',NULL),(6,1,1,8500,'2015-03-29',6,'','','2015-04-04',NULL),(7,1,1,7800,'2013-02-01',6,'','','2013-02-12',NULL),(8,11,6,600,'2013-08-29',6,'','','2013-09-07',NULL),(9,11,6,755.55,'2014-10-01',6,'','','2014-10-08',NULL),(10,11,6,822,'2015-11-01',2,'\0','\0',NULL,'prop\'o ugovor'),(11,11,5,833,'2015-11-09',4,'\0','','2015-11-11','ispala'),(12,9,5,1870,'2016-06-13',6,'','','2016-06-20',NULL),(13,7,4,2222.22,'2012-04-01',6,'','','2012-04-01','šala mala'),(14,25,2,4848,'2016-09-17',5,'','','2016-09-22',NULL),(15,25,3,3002,'2011-08-18',6,'','','2011-08-27',NULL);
/*!40000 ALTER TABLE `novcani_ugovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oglas`
--

DROP TABLE IF EXISTS `oglas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oglas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(100) NOT NULL,
  `opis` varchar(400) NOT NULL,
  `praksa` bit(1) NOT NULL,
  `posao` bit(1) NOT NULL,
  `datum_i_vreme_unosenja` datetime NOT NULL,
  `fajl` mediumblob,
  `idKomp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idKomp3_idx` (`idKomp`),
  CONSTRAINT `idKomp3` FOREIGN KEY (`idKomp`) REFERENCES `kompanija` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oglas`
--

LOCK TABLES `oglas` WRITE;
/*!40000 ALTER TABLE `oglas` DISABLE KEYS */;
INSERT INTO `oglas` (`id`, `naslov`, `opis`, `praksa`, `posao`, `datum_i_vreme_unosenja`, `fajl`, `idKomp`) VALUES (1,'Junior Digital Design Engineer','Otvorene pozicije u razvojnom centru u Beogradu','\0','','2018-05-11 15:00:00',NULL,3),(2,'Embedded Software Engineer','Otvoreno 15 pozicija u Beogradu za letnju praksu i zaposlenje','','','2018-04-10 13:12:11',NULL,8),(3,'Stručna praksa','praxa','','\0','2018-07-08 02:44:33',NULL,5);
/*!40000 ALTER TABLE `oglas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paket`
--

DROP TABLE IF EXISTS `paket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(60) NOT NULL,
  `vrednost` float NOT NULL,
  `trajanje` int(11) NOT NULL,
  `maks_komp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paket`
--

LOCK TABLES `paket` WRITE;
/*!40000 ALTER TABLE `paket` DISABLE KEYS */;
INSERT INTO `paket` (`id`, `naziv`, `vrednost`, `trajanje`, `maks_komp`) VALUES (1,'Zlatni partneri',7000,2,3),(2,'Srebrni partneri',4500,2,5),(3,'Veliki partneri',3000,1,100),(4,'Partneri',2000,1,100),(5,'Partneri katedri',1500,1,100),(6,'Ostalo',500,1,100),(7,'Oglašavanje na ETF-u',400,1,100);
/*!40000 ALTER TABLE `paket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predavanje`
--

DROP TABLE IF EXISTS `predavanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predavanje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idKomp` int(11) NOT NULL,
  `naslov` varchar(100) NOT NULL,
  `naslov_en` varchar(100) DEFAULT NULL,
  `opis` varchar(1000) NOT NULL,
  `opis_en` varchar(1000) DEFAULT NULL,
  `datum` date NOT NULL,
  `vreme` time NOT NULL,
  `sala` varchar(45) NOT NULL,
  `predavac` varchar(70) NOT NULL,
  `biografija` varchar(1000) DEFAULT NULL,
  `fajl` mediumblob,
  `slika` mediumblob,
  PRIMARY KEY (`id`),
  KEY `idKomp4_idx` (`idKomp`),
  CONSTRAINT `idKomp4` FOREIGN KEY (`idKomp`) REFERENCES `kompanija` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predavanje`
--

LOCK TABLES `predavanje` WRITE;
/*!40000 ALTER TABLE `predavanje` DISABLE KEYS */;
INSERT INTO `predavanje` (`id`, `idKomp`, `naslov`, `naslov_en`, `opis`, `opis_en`, `datum`, `vreme`, `sala`, `predavac`, `biografija`, `fajl`, `slika`) VALUES (1,10,'Blockchain i kriptovalute','Blockchain and new cryptocurrency','Blockchain je jedna od najnovijih tehnologija današnjice.','Blockchain is one of the latest technologies.','2018-03-29','13:00:00','308','Srećko Miodragović (Comtrade)',NULL,NULL,NULL),(2,9,'Od Jave do TypeScripta','From Java to TypeScript','U ovom predavanju ćemo predstaviti specifičnosti JavaScript platforme i samog JavaScript programskog jezika komparirajući ga sa Java platformom i Java programskim jezikom. Pokazaćemo studentima koliko je TypeScript, kao superset JavaScript-a, sličan/različit u odnosu na Javu.','/','2018-03-31','11:00:00','61','Željko Turbić (levi9)',NULL,NULL,NULL),(3,3,'Dizajniranje integrisanih kola','Designing integrated circuits','Predavanje o dizajniranju integrisanih kola.','/','2018-07-13','15:30:00','62','Neki Lik (HDL Design House)','Veoma pametan lik.',NULL,NULL),(4,5,'Moć GPU','The power of GPU','Predavanje o mogućnostima korišćenja GPU za ubrzavanje proračuna.',NULL,'2018-10-15','12:00:00','70','Taj Itaj (nVidia)',NULL,NULL,NULL),(5,7,'Lepota automatike',NULL,'Predavanje o automatici.',NULL,'2018-09-30','11:45:00','55','Neko Nešto (Danieli Systec)',NULL,NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0,\0\0\0�\"\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0qIDATx^\�\�-|\�H\0��\�Jde%�D\"��Hd$�D\"��\�J$��DV޽\�\�fS>�d&\����kiwx23�\�\�?\0N!\��!\��!\��!\��!\��!\��!\��!\��!\��!\��!\��!\�\�����:\�l6�� FO���|K\�_\�\�Fc\�\�\�6�r\�?h�\��h\�(�L`a����\�\�A��lU��K&��\�j8\�7zy4�4�\\�?\������;=�\�5����^�\�z���\�\�Ǉ\r��7v½\�\�l%\�T\��Z�N��.\�n���\�\�`�6�#B\�d�\�齾Z��֟\�f��ȫ����=b���+9�N����L�\�~�*3�����J��ꦅ�!^�AFI�� (\�7��J�D+(u2�k~�BUi\Z�̌�S�\�@��\�p8\�q�fO�׳1ݔ/MT�\�PD\�\�\rM�\r�����6sH\�Fi�є�Ϝ\��:I#�\���Ȣ\�\�\�\�\�͆�d)&�ɟg\��:��E\�t:\�n\�T\�ib�I\��x��%Y.����_@Ki\�ҋA�߷/�u�\Z�\�cU�\�n�$��\��߄\�~\rm�e�ه�ȺNe�O=X#d#�k��]\n�}	��\r���v�d\�\�4\�\�46�:\�N\�ϣ^v)x^f\�#\�F2�;�`�=\�>x���\\\�@v`zB��}m\�\�\�뵾B��q<��\�f���T�07�\r{S|�\�žHoo���/�\�\�\�L\re�/\�\�`hv�0\���ցz�\�v\�P���%I�`\�^\�=p�\�6�Z\n:�Ҕ$�\\\�V5��$B��z\�q��i�\�m�[�d6��\'\�u�|>�\����\��\\.�S�<e�\�n��\�T%=P�\�4\�~#�\�qL�\���&�f�\n�˛.�F��k[R\"���\�\"j%p\�\�z�ԧ�4\\~7̍=\�DX!m��\0�qDA����\�Yi�ۻa�d\�j&��ܵc蚈\�f�8�9�\�Jww\�\�a9��}E7�+\�[z\0W\0�\�z���&�Em\�I\�q:�\�\��B�@�\�\�\�\r�G�/RZ׎.h�29�\�)\�o\�\�#\�\�$I�Ye~\�\�\�C\�o�W蠋���᣶\�m��\�\�x�\�\���\��\�\�s�\\.�\�ֵޛ\�f]\�\�(Dx�u\�\�4x}8\�\�\0J)P��\�ғ��D��Ye(D��Sf��\�\n��Y%(D���\��qvMD5\�H.�[�t7B�lqk\�\�o\�зZ�~�\�}J/P:a�$\�.h`\�\�mz\�\��JyJW\"\�\���\�BO�}\n�������\�h\�}qiR�\�6Gxc\�ih\�9�\�9�\Z�m�\�\�\�\�pX\����ޘp\Zڤ\�O�݇nRlZ�\��͙�ڥ\�\'oO��\'�\\Ѐg\�v�\�J��4>\�\�\�Ð}-x�\�:��\�{\�L[�\�78\��F#n�\�hJ�m�}\'����\�?͋�\�\�D�pA�^��p\�ezkew%L&�\Z\�NM����P͛�gMi��\r��^\�\Z�6E\\L�J��\�A-g\�8\�\�w\\L��i�9�}c�ϚҌ\�~�.>F��\�Xvql0��\\___ٝڸ;yw������P��A�*�\�?ȗ\�XvYlpF5�p�F���D�=Gx\�P�\�\\L�*hs_�A�ۜE\�q�P;C��\�� \����;B=Q\�70��R�\�)T_��y\�f�\�L����Cu�\�S���\�Nsm��D\�A�\�)Tm��s\�-\Z�FZ\�G\0�Y.��\�)TU��a\��yN�S.cG\r��˞\�\�\�>�BUE���z=\�y��^\�u�jL��\"\�zO��Z��V+\�tA\r4\�\�Єgh.�����\�\�\�1TM˿\�َ�j�Ք#^D�f�X�\�d2i\�]��M�_�\r�@\�E�h�\�.�\n!�\����\�˿BD�f0�]|n\��\�w��5t�W�\�\��>??}>�\�Du$?�\�N\�g!|\���\"�{�\�\� B8\�\��\"�3�\�>���A�p \�g7�3��ʟ�\�\��4#�\�\�$\"D}\�\�g(\�F��Y\n\"D�\�?MG=�\�Dm�\�\�/�T���\��:,�D�(��X��િ\�!ʔ$�b�\��Ҏ���C�(G\�g��骿\�!~k�\�A`��K��a\"B�n�ݎF#�\�_\��\�\�)D�Wl6��G�h<\�F^@�x\����j�����ZN�Sv����(\�wq\�Q�\�Ð���%\"\�}���)�1�\"����q�柋\�\"{\�AsQ>i�\\D��v�\�\�Gmj��\�Cy�4ϜN�6��\�h\�E!B\\�\�8��\�\�u���z!�I�\�ⲣ\�d\�\�Ϫ!,���\'^k0䪿z!\n�@p׉:a\�i\0\��\����\�\�~� \�\�\��\�\�ϻm.\"쨋0�/\�G�.D\�9�`j6�\�ǡ.D\�!�\�\�\�4\�\�\�C\�q�+D\�	��>Ë[���\��K\�a\�\�/�Kq�%Oa�i�i����/y�[(I�(�\n� ���o��U6�M�\�g\�\���\�%g���۠�㦍\�p\�0�#\�\�[�\���Ԟ�\��\�@�\r�\�\�\�\�O5\�\�s�y66\�\�\�\�\�m?��}66\�~���\�u�׋���gsac�\�db\�;\�|�v \�H�\�\�K��pȡ�\�k\Z\�\�0�8\�Z\�!7>k\"��2\�ڦV��k\"�\����z�\�_\�7�\�R[�/4\�i���\�\���\�~�:fN�\�\�m>�f���C{�37N�V�\��\�\"��\�\�?\�SQMG\�\�\�ADX�k{\\���;�+wm��9ٚ#~ ª�\�\"\��\�O!\�Ҙ\�\n�\�\�\"\�\�2\�\�U�=.x�\�F{\�q�S��9�\�\�f�x>��P\"���P\",@{��C{p�i�u7Bڃ\':!\��7]���ୖGx<\��9\��g\��t:�V�\�+hi�i[�qAPx-\��O-��p8hɧ\�ls�ˈ�c\'|\�\��$Ѵ��\�us��55\�\�fs�E\�\�\�\�b�\�S2\� \r�p�\�iiw�	\rb��,�\�D͈P#۵�&�\�c�^G�y��W�2��ehک,�v�<�PKM/�\�N}E\�Qn��6�+B�l�Ţ����͆i\'\�ǋO�����\'�h�\\.�W\'Z\�q�\�\��3\�\�\���q@{��\�\\Ӑ?�E�E<��\�o\\O�i\�j�bډ�#\�\�\��\�[\�\']Va�\\G<��ixJi\��\�FH{�/�!\�ey.B\�J�P��T\�V��Ԡ B\�\��/\�\�\��}r���%I�\\.\�A{@\rloY�\�Ɇ\'�^��\����\�d2\�\��+oܣ\Zp\�3f\0��\�Z\��x\\�\�\�\�4=ک\�W\�/5&\��~�Z���=\���\��\n�K^G����X,\�\�q�V\�O���_o\�$I\�8�\�\�7�K�����(��A\�\�x\�q�\�\�\�\ZR)<u.���1�L�\�\�Dq:���[�\Z9�	\�\�\�\�Չ0�\�\�\����DT�\�\�h4�@�����NT�ց\�\��ٳ\�j�v�\�\�\�%G�r��z0;T�N\�?\rw�\�\�7x�e��u\�!�%\� ��P\�\�q�\�4\�h\��K�R�Ki�ӟn�y\���\�,�Fx<ͬ2C��\���r�\�\������cλa8�S�RQo\Z\�4\�\�[|0\���z��~DC�Y\�\��l3m�7�h�7\rP\nf2�<>�Li�\�\�ǵS�u6��?2������\�4�M|�柪Tc\�r�To\Z�\�/pAclz\r�a\�t\���b�-Z��J��/Pr�/z��r+\04\�[�\�-�\�瓯\�_\��w�}\�@\0/��`}���\"��\�)1P�fD�!�\�PE�5\Z�z\�^T����\�jΙ=�m>�\�o\0m\�u���>{j�\"\�J�F����=ȡ���n6����ȡ���f\�kAȡ��wf��@\��a�@n���(B\nD7�!�����\�e\�#�@t�\��˥\�\�U.#\�^H�\�,gR `������)Ȫ;B\n.\�\Z!y�EH�@��\"\�x pMn�[\�9�Gx8һT��\�\\ �\�O�Sz�&�W\�yF�AOC�)�����\�\0�*�0CS�\�ql�\n৪\"\�^�E��*��J\"L�$�a\�d2�_P��Ӊh�\�gw(p[�f�A���]\�G�����~	�u%G\�0<�\��g�\�\�Ǉ��axP�\��{S`�׳_pO��\�+qlM�^�G���i��.eF��L��\�~	h�\�je޽\�\�\�5\�.3\���%\�\�F��N�twF��u)3B�� ����GM>�\�i:~H�\�x!�E�\�q��\�+]�\�\�}\\�*�0I�%�\Z��˥\Z�\�\�5Y�.�\�\�se�/a�\"\\Qr___�n�X�F�~�oޙy���\�\�\�O�Pf�٫x�� \rA��\�dWw\��3�ۭ�\�]+y��ٶ�\��\�R�\�fn�4�M�G���\�R�A\��pT�d\'J>E\�ӭq�p8\��c\�O�\�\Z\���Ӽ\��cf�Dh�(�\�j�b�\�Vf=&\n@T�z����\�^�]a��6B���GB�&�\�f�\�\��\�ҼF++���R�\�\��Z��\�\�(�X�H\��40jk�\�AMi���%5�\�t:i|[.�ڪ>��Ax\�\���R�\�ph_��Hڠ\�\�#\��E/�:%W8�)\�\���x��\�\�\�B_�˙�7\�aJ+�Bז\nz�\�\�c\�Q��\"\�\�*n>�\�\�/\\\�\�L=X?�V\�^\�,��z�NջA\�e�jY�l+6s[�C%�_ \\�G\��\�\��KX>�\�}�)�{zu�2\�\��\'��a굷�\�Mf��Lj)�g���dJ[@��~\�v�eVR�\"L�u��i3Jis�wI�\�1z��\Zz,\��\�3LQ쳐�\�Q8���Q\�\�b	W\'#L�\'�?r.��M���\�fkŬ\�9�#\�\�\�Eo�\�6��\'J�i��\�6���=Ύ�Vc\"L�\�NJC\�iY\�yb�OCG\�\�ph��2˳soa\'V\�4/B�e�p�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp�ǈp����\�K�D+zEN\0\0\0\0IEND�B`�'),(6,1,'Dalekovodi',NULL,'Sve što Vas je oduvek zanimalo o dalekovodima.',NULL,'2018-08-15','09:00:00','VMA','Strujo Mer (Elektroprivreda Srbije)',NULL,'PK\0\0\0\0\0!\0\���7f\0\0 \0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�T\�n\�0�W\�?D�V������8�H�`\�\rX�K����nDUA*\�)Y\�\�\�\�ă\�ښl	1i\�J\�/z,\'�\�nV��\�K~ϲ�\�)a���m �\���j0\�Hu�T�9bx\�<\�9X�\n�Q��\�\n�\�8\�A\�O1~\�\�\�q\��\�k6<A%�\�5}\�*�`\��k�����I)_:��%\�1\�ٜIs\�\r\�`� C]9N�\�{#k�V��E\�WaI_����rai��\�N_UZB\�_��\�%�D�[S�+�\�\�?�#\�\�@�[\�.z\�9�>$N{9�\�\�+P9Y ��vu\�GD�\�\�\�oR��w\�ͳ�\r\�Iʊ~���\Z8�\�W�Z\�\"V0}���\�������>����uQwHo\�\�\0\0\0��\0PK\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�JA�\�\�a\�}7\�\n\"\�\�\�H�w\"\���\�w̤ھ�� �P\�^\��\�\�O֛��\�;�<�aYՠ؛`G\�kxm��PY\�[��g\rGΰino\�/<���<�1��ⳆA$>\"f3��\\�ȾT��I	S��\������\��W���\�Y\rig\�@�\�X6_\�]7\Z~\nf\�\�ˉ\�ao\�.b*lI\�r�j)�,\Zl0\�%��b�\n6\�i�\��D�_���,	�	�\��|u�Z^t٢yǯ;!Y,}{�C��/h>\0\0��\0PK\0\0\0\0\0!\0\�d�Q�\0\0\01\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0��\�{-;���ȹ�@���\0�����$���~�\nCR��\�`Fh擴�\�wo\�\'\�U�%)���:\�(x/vw\� ����qH�\�oo6�h4\�C\�v�DL���e�k)�l�ה8�6\�\�.�������\�\r\�U�>\�0̀�\"S\�+a_݃(��\�vuݕ�\�\�c���T\�/<�!s�\�X\Zd3�� �����?\'g![�?��4\��\�%\�9����R�k6\��$C\�,�`&g\�!/=�\0\0��\0PK\0\0\0\0\0!\04y>\�\0\0�\0\0\0\0\0word/document.xml�S\�n\�0�\�?�\�z$q�r��pO���\0��$\"$� )�\�\�w)��\��ы�\�rfg_ۧJ&�N��H�\�H\�5�Z\�\"߿V�$q�\�Jм\"\'\�\�\�\�\�\�v,k`�\�\�\'H�]9���ޔi\�X\�uk0\\����GӶ����7+\�P/�B\nJ�,ې�*\�[].+%����F0�a��;#��\�)bj�D\r�]\'��l\�\�0\�.�%1(ߍ\�h��#�C\�Y��6wo���̘g\�^\n(Έk$�3*QT\�3M����n\�\Z��α\�@�;�\�g\��)�&K�\��kE�\�\�_\���������y\��\�	i\�\�p>�;8�\�4\�\�.����q\�_md���\r�����\�\'F܊��ý\��\��?�|��\�v1�\�&��\�)�G�p��-ys\�\�8�9�\�C�[6�\r��0\�\�O\���t�\�ʰ\�2��-�lE�)4��\�\�\�\�\�\�ħB\�5ƻ���_\0\0\0��\0PK\0\0\0\0\0!\0���\�\0\0P\0\0\0\0\0word/theme/theme1.xml\�YOo\�6�\�w toc\'v\Zu�ر�-M\�n�i��\�P�@\�I}\�\�úa�\�m�a[�إ�4\�:lЯ�GR�\�X^�6؊�>$�\�����\�\�\�!)O\�^�r\�C$�y@��\�\��/�yH*��񄴽)�޵��߻�\�UDb�`}\"\�qۋ�Jח��\�X^\�)I`n\�E���p)�\�\�li�V[]�1M<�\�\�\�\Z��O\�P��6r\�=���z�gb�Ig��u��S\�eb\���O���\��\�R�D۫����qu	�g��Z����o~ٺlAp�lx�pT0���+[}`j\�\����zA\�\0�V�2\�F�\�\�i�@�q�v�֬5\\|��ʜ̭N�\�le�X�ds��\�jcs\���\�7\���\�f��\�\�\r\�\�W\���+�Ն�7��\�\�`�\�\�g\�Ș�\�J�\Z�\�j|��h(�K��D-��\�\�\0\rdX\��iJ\�؇(\�\�x$(\��:��;\�˹!\�I_\�T��S1��\�����?E\��?�\��\�\�\�?ZBΪm��\�U/��\�\�\��?�~��\�\�xY\���\�\'���y5\�g&΋/���\�ɋ�>���G�M�Ge��\�D��\�\��3Vq%\'#q�\�\��\�$�8��K����\�)f�w9:ĵ\�\�\nx}r\�x����w�\�\�r\�:\\TZaG�*�y8I\�j\�bR\�\�c|XŻ�ǿ�I\nu3KG�nD1�NIB\�s���\n\�\�R\�\�u���K>V\�.EL+M2�#\'�f��i~�V\��vl�{u8�\�z��H\�\n\�*�\��:�(W�☕\r~��J\��T�e\\O*�tHG��HY�\�\0}KN\��P�*ݾ˦���TѼ�9/#��A7\�qZ�\�$*c?��\�qU\�\�n�\�w�N��%��O��i\�4=3ڗP��\n\�\�\�\�1�P�m\\\\9��\�\�\����\�Mؓ�2a�D�]�;Yt�\\��[x�\����\�]\�}Wr��|\�]�\�g-��\�\neW�\r�)6-r��CS\�j\�\�\ri�d	�DЇA�ΜIqbJ#x\�꺃6k�\�\�#��A�Sh�\�&ʌt(Q\�%\�\�p%m��&]\�caSl=�X\����\�\��\\P�1�Mh�9�M\�\�V�dDA\�\�aV\�B��[݈fJ�íP|8�\ZքA\�V^��f\r\�H�\�n�\�\�-\�\�\"\�d>\�z\���n��Ǌ�	�ة�>\�b���&�\�\�\�2�\�v��\�\�Kyϼ���D:����,AGm�\�\\nz\�\�i\�Ù\��.uχYC�6\�OMf�\�3o�r\�\�$�\�5����\�NH�T[XF64\�T,ќ��\�M0\�E)`#�5�XY�`�פ\0;��%\�1�U\�٥m;���R>QD�\��\�D\�cp�U\�\'��&LE\�/p���m�\�\�%]��\�\�\�8fi��r�S4\�d7y\\\�`\�J\�n��\�ί�I�R�\��3U�~7+���׸#��m�q�BiD���\��\�����i*�L6�9\��m\�Y\Z&�\����i���HE��=(K&�N!V\��.K�e�LD�ĕ�{D	\�\Z���vEꦚde�\�NƟ��e\�(\�MN9ߜ\ZR\�6�\�\�\�&3(\�\�a\�\�\��/D�\�U\�z�<\�{ˊ\�Y�\�ȳ����V���)\�9�Z[�\�4^n\�\�5���!J\�\�?��Q\�3�eBo�C����M\����m<�.�vp�����IY\�f���Z�Y_p�[�=al-\�Y�}Nc͙\�\�\�ŋ4vfa\�\�vl����\'S�\��A\�8\�|\�*u\�{\�\�-�ߟ0%M0�7%����<�\�\�ҍ�\0\0\0��\0PK\0\0\0\0\0!\0pP s�\0\0\0\0\0\0\0word/settings.xml�TmS�0�ޙ��\�=9�\�l�\�xګ\�h\�)��#c�\�$\���\�\"\�Z\�\�\'�\�\�}v�/�\�\�6d\��0����\�m\�\�lf\�\��X\"+\�A\�,\�S���}sܥ�Z�f&@	iR\�\�V\�Ԕ\r\�\�+5�\��B]����p�\�Y\�X�\�(\Z�@Q�j5hA�9\0��\�([A����|iʉńMÔ�j\�\�0T\�Ev/=b\'��\�\��K�\�s;\�Ճ\�k\�sJCI��\�\n><W&��\�\�\�y\�\nM���\�	�\���TQ]bA�\�G\�\��I\�\�\r)r\nMv�%�.�Ii�\�)1�s�V�v|{BiL~����6\�We\\w�	`���,\�l\�\�N\�\�\�\�\��\�9\�\�>\�$^/\�\r�0�H]�h\�`\��wND�	�\���H}�f\��\�a����-<9�\r���\rV\�\�����Q�\��5\�\�I�/�H��(�\�냚\�՟5�jP\�4Q_d��/����	���Ƚ�\�YxD����\�N0�\nԥח�\n]����rv�;\�.-�\�݊\�k���\�89\�66�j�V}\�_�m2rI\�\�\�q���\�eh=��pD��0a�;���\���\�r\�V[9�\�\��s&\�p��\�\�5p�.=��ACLCž�}���\�2�.���Y�b���U�\�ga2_�=\Z�9\�Ck�\�:%g���AE,�=\�[�Ĺ�?rq{\\2\�|/�i=\�\r�sflNn��O\�W�c�<�\�O~\0\0��\0PK\0\0\0\0\0!\0(՞\'�\0\0\0\0\0\0\0word/fontTable.xml��]o�0�\�\�?�\�O\n�S#��\�\�.�*i\�\�Se��(�ef\�b%x{��\�\�\�|��dp\��\�)��\\f+�.%�\��nBpLo�4��\�ȁ,�7�fV\Z\� ��\Zf6%�s�,���b005\�8W\Z��\�O�MY��?�b��vaL\�8�\\2�{C%j �[��\�\�mmM��Y%��bB�E\�]\�\�4S\��Z(�3o���/��6�#�90�\Z\�5�C:�	\�1�%$l���Y\�\�T�e^.��xRm\�\�\�\�\�\�I?0+\�Fr�\�\'���)YQJ\�U��D)\�P���{%Ʀ���\��\�1ac�OWyTЧ_E\�=CND2&\�Ɗ\�%��#\�I�>� �\0��אx�L\"N\����B\�m|&\�l\\G\�o��\�$�K\�䬴�@�?gb\�e\�L�\�\�;\0\0\0��\0PK\0\0\0\0\0!\0J؊��\0\0\0\0\0\0\0\0word/webSettings.xml�\��j\�0\��{a\�t_��0JHR(�/\��\\Gi�d$m\���5l�\�z���\�_im>Q42\r�m�A\n<E�\rpy?=\�Q�4��	�F�\���\�KW�zF���MUH;`1˝s\ZL^���\�6�$o���\�y�\�8|$$s��}u���Z�K\�\nZyD+,S�ZC\��\�%	\�\�\�\�b�?xb9\nEqc\����w\0\0\0��\0PK\0\0\0\0\0!\0E�}\0\0\�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�RMo\� �W\��|\�śCUE,Q�Q�CӬ�Nr�\�F��`���\�:\�8ꭜ潁Ǜ��}t\�+�l�\�֛uSW\�u0\��\������QW��p�\�>b��\�\�7�O!b\"��b	���@��\�z��۞;]H#\�ԋ\�uV\�M\�/#z�M�]\�;�7hVq�\'ūW�_Qt�\�cd\�J�8F�\�O�\�\�&\�(\�\�\�6�֎�\Z�g �\�cV)�B>�dNx*\�n��8?�\�(\�\�\�`՝\�)\�\�Qu��*ǥXn�\��K�t,&�P��~�1l+A� \�f$\Z\�xvՁ\�(\�\'!wa�\��\�\�������87\�=\��!�\�d���\\��di8D\�\�ڗ\�\ry\��\��4g�OB\��\�$W\�\�\�|�\�\�\�F��q��js�nx��;s�B��Q\0\0��\0PK\0\0\0\0\0!\0ó�4p\0\0\�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��QO\�0\�\�M�K߷v�,l$jx�\�D�Ʒ\�P\�ڦ-\�}{��>�ֻ�߯w�v6��\�\�\�\n%s�&E �\�Bns��Z\�SYG%�����,��73�3����86�$i3�s�sNg[���\�\�+�/n����\�bMٞn��\�8ʩ��ƺ\'�����\�\0�a(�\�,N�_�Le�l\�*W\�J�F��N\�^�9\�^�mE/�\�:�\�\�~�,�_�Uc![��b\�Y\�+��\�\�џ\�a�̅t�3@�2ő���s\�:���V�[\�5�|ˌ\�ο_`^]R\��A7�C�\�\�-���Ũ���.�uaD\��7#֝+\�\�ǧ\�#�Ncr�\�*g�IF\�g�͠�5\'$�\�\\�&���\�,~\0\0\0��\0PK\0\0\0\0\0!\02�0\0\0�9\0\0\0\0\0word/styles.xml��Qs�8\�\�o\�\�{\�\�n\�k�n\'M\�kf\�\\\Z;s\�2ȱ��|Hn�~��VX!``7Ч����]��$\�\���i�\�2[�\�\'a��H\�\"�]�7�\�/�\n�Y�Df|>p��\�o\�N�~H�\n��L�\�p��\�t4Rі�L��;��\�62O�6��\�Hn6\"\�e�Oy�G���\�(\�	\���b�\�\�\�\�ڝ\�\�].#���6M����,|g܋e��o\�>\�\�^\�WyqY\\��\�2\�*�;e*b�Dj\"�\�w��LY�o8S�L	�2Q��S�\��\�Y���rk?��\�E�_f\�O�,\�ɫ��sn]xr/a\�\�\�\�^\�,ˮ,Bk-b\�g��\�56�8?K�\�Do����\�\�\�hn2hb9����\�g��\�}bn���X٬��L�I�I�ҕ���o�\�\���\�|��en\�\\\\\�B\�B?,\�7o,\�\�\\�T|q\�mU�n�����[�\�(?\���j��\�}����9�A�\�O�\�\�\Z3�3f�xi$֬*q���x�\�ݨP\�\�\�\�\��(e˙]G�\�\n����AQ9\0�K�u\�\�ī�&^�7\�\�o.\���0\�\�7#�6JU�O���+��<Lߴ��Q��\���\�Q��\���\�Q��\���w��\�sD-��#\"\�U��)\�ja��N�\�*@\�RW��\��\�\�6g�m`;k\�\�6�\\\�\�\Z\�*\�\��\�r�s�\�v\�\�\�-�gk�t�eJ�W�������[\'<�;q\'\�+�ZL�\Zr��]%,\�[�\�<V�\�e�0�RK��\�\�\\ϴ~�[,�\�r;a��Io�	g��P0��i\�J�qTg\ru\�l��\�>=L\r\�md\����\�\n\\l��W6E�E\��M\0&\�.\�!�}����\�\�\�c�w�\����\��L�P\��%+\�G��P\�kN^�\�2��f�\�@�<\�\�+\�#p!�����9y?�\�\�,�\�on�:%\�\�QG	r:>rR*�7&DDNP�5!��i-D\�k�Sؿ<Q���\�\�\\\�ӆ0-��}/u�;��A󰔋\���D�\0G�6�<,��\'\�\�9\�\���~�\0\�\�\n	���h~\��=\�\�	,�,�.e�V\�9Y�=�\�ꛈ���\�\�\\�����T\�\n9;�^\��&�5X\�D�\Z�Fs�ʚJ	�\�7\� �&��h�F��oh�F���w7d8�F�\�\�\�5�,\�<B�U߃\�\�\0����]�7�C\�+\�\� \�\n9Au�FP\�\�io�TB�\��\ZF��a\�\ZF��a\�\ZF���\�\�\rN�,�6xM-�7D�*�7�P�\�xê�\�⍠�To�������T���\nˋ7��P��`AqS�\ZF�\r#\�\�0\�\0\r#\�P�\�\'\�Y���\�\"˃�\�\"k\�Q�\��\�\�A!\'�.\�\n9;A�:�`�Tay�F��^z�7�<D�h�FD4�x#@È7\�_��!É7�E\���e�F�\��\�Ae�F�\�\�pT�a��v�FP\�	��7�B\�NEP�x#X\�UX^\��a\��\�\�-\�<��\"J��oDDÈ7\�_��!É7�E\���e�F�\��\�Ae�F�\�\�`�ٚ��\�\�\�\"�\�38\�j@\'\rI\��\0���\�\�(\�\�\�x��@l(l���\�6vO\n�\�DH\�\��\0�tJ���΃/\�\0Lm�\�ӝ7\��P��O�����ag�\�\�;˭5s@\�\�*�\0�A�s �8\�c\�s>\�A8TU܆�\�T�l�ŇgNN>L\�^O�N`�\�D�5^D\�T�\�Vx�;	6\�W]j\�/n=\�88W\�|�r\�=ٽin�9l�[\�=\�->\��\�\�\��ﺃ\�\��\�\�\�oO\�u\����M�9��[s)�\�3k�?\�I���5-w͏&|�ݷ\�\�Sk��L�\�簍<9f�Lq\�wi�h��l��yn΁�\�����Ϋ=-\\�#֥ۯ<\�=\�5v\�};|R\��\0\0��\0PK-\0\0\0\0\0\0!\0\���7f\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0\�d�Q�\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\04y>\�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/document.xmlPK-\0\0\0\0\0\0!\0���\�\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\n\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0pP s�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0(՞\'�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0J؊��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0E�}\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0ó�4p\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\02�0\0\0�9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/styles.xmlPK\0\0\0\0\0\0�\0\0\�#\0\0\0\0',NULL),(7,25,'Mehatronika',NULL,'Predavanje o mehatronici.',NULL,'2018-07-27','13:15:00','308','Pasta Italiana (K.L.A.IN. Robotics)','oko za oko pasta za zube',NULL,NULL);
/*!40000 ALTER TABLE `predavanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `opis`) VALUES (1,'pripremljen'),(2,'poslat kompaniji'),(3,'potpisan od strane Fakulteta'),(4,'potpisan od strane kompanije'),(5,'potpisan sa obe strane'),(6,'predat arhivi Fakulteta');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavka`
--

DROP TABLE IF EXISTS `stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stavka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavka`
--

LOCK TABLES `stavka` WRITE;
/*!40000 ALTER TABLE `stavka` DISABLE KEYS */;
INSERT INTO `stavka` (`id`, `naziv`, `opis`) VALUES (1,'Logo - pano','Logo kompanije na reklamnom panou partnera Fakulteta'),(2,'Logo - brošura','Logo kompanije unutar brošure Fakulteta'),(3,'Baner - strana partneri','Baner kompanije na zvaničnom sajtu Fakulteta, na strani partneri'),(4,'Oglašavanje - događaji','Mogućnost oglašavanja događaja, takmičenja i drugih stručnih skupova'),(5,'Predavanja','Mogućnost organizacije stručnih predavanja 2 puta godišnje (jednom po semestru)'),(6,'Opis','Kratak opis kompanije na zvaničnom sajtu Fakulteta, na strani partneri'),(7,'Oglašavanje - posao','Mogućnost oglašavanja ponuda za izradu projektnih radova, stručnih praksi i zaposlenja na reklamnom panou partnera fakulteta, internet stranici fakulteta, listama elektronske pošte i društvenim mrežama');
/*!40000 ALTER TABLE `stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_kontaktu`
--

DROP TABLE IF EXISTS `u_kontaktu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_kontaktu` (
  `username` varchar(45) NOT NULL,
  `idKomp` int(11) NOT NULL,
  PRIMARY KEY (`username`,`idKomp`),
  KEY `username_idx` (`username`),
  KEY `idKomp_idx` (`idKomp`),
  CONSTRAINT `idKomp` FOREIGN KEY (`idKomp`) REFERENCES `kompanija` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `korisnik` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_kontaktu`
--

LOCK TABLES `u_kontaktu` WRITE;
/*!40000 ALTER TABLE `u_kontaktu` DISABLE KEYS */;
INSERT INTO `u_kontaktu` (`username`, `idKomp`) VALUES ('clan',1),('admin',2),('clan',3),('admin',4),('clan',5),('admin',6),('clan2',6),('clan',7),('clan2',8),('itmen',8),('clan2',9),('itmen',9),('itmen',10),('clan',11),('clan2',11),('admin',24),('itmen',25);
/*!40000 ALTER TABLE `u_kontaktu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-10 17:29:47

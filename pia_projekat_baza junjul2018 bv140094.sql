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
INSERT INTO `donatorski_ugovor` (`id`, `idKomp`, `idPaket`, `proc_vred`, `opis`, `kolicina`, `datum_ugovora`, `idStatus`, `datum_isporuke`, `komentar`) VALUES (1,2,1,8000,'Oprema - energetika.',5,'2018-01-18',5,'2018-02-24',NULL),(2,5,4,2300,'Video tehnologije.',3,'2018-02-02',5,'2018-03-10',NULL),(3,6,6,800,'Oprema.',7,'2017-12-12',5,'2017-12-17',NULL),(4,7,5,1750,'Oprema za automatiku.',10,'2018-03-05',5,'2018-03-20',NULL),(5,10,1,8500,'RaÄunarska oprema.',15,'2016-08-04',5,'2016-08-17',NULL),(6,6,6,1050,'Kompovi za studentsku sluÅ¾bu.',2,'2013-06-19',6,'2013-06-25','Valja biti efikasan.'),(7,10,1,7200,'Nedefinisana hrpa opreme.',NULL,'2014-05-07',6,'2014-07-13',NULL),(8,24,1,20000,'Opremljena laboratorija za RTI.',50,'2014-12-05',6,'2014-12-11','bez komentara'),(9,24,1,12000,'raÄunari',30,'2015-01-11',6,'2015-01-15',NULL),(10,24,1,14444.4,'opet raÄunari',37,'2017-01-25',5,'2017-01-31',NULL);
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
INSERT INTO `kompanija` (`id`, `naziv`, `adresa`, `grad`, `postanski_broj`, `zemlja`, `ziro_racun`, `valuta`, `pib`, `telefon1`, `telefon2`, `telefon3`, `telefon4`, `telefon5`, `email1`, `email2`, `email3`, `email4`, `email5`, `logo`, `web`, `opis`, `kontakt_osoba`, `ko_telefon`, `ko_email`) VALUES (1,'Elektroprivreda Srbije','x','x',0,'Srbija','123','RSD','123','123',NULL,NULL,NULL,NULL,'eps@rs.com',NULL,NULL,NULL,NULL,'eps.png','http://eps.rs/','Elektroprivreda Srbije (EPS) je jedno od najveÄ‡ih javnih preduzeÄ‡a u Republici Srbiji Äiji je prevashodna delatnost u oblasti energetike: proizvodnja, distribucija i snabdevanje elektriÄnom energijom, kao i proizvodnja uglja.\r\n\r\nMisija Elektroprivrede Srbije je sigurno snabdevanje kupaca elektriÄnom energijom, pod trÅ¾iÅ¡no najpovoljnijim uslovima, uz stalno podizanje kvaliteta usluga, unapreÄ‘enje brige o Å¾ivotnoj sredini i uveÄ‡anje dobrobiti zajednice.\r\n\r\nVizija Elektroprivrede Srbije je da bude druÅ¡tveno odgovorna, trÅ¾iÅ¡no orijentisana i profitabilna kompanija, konkurentna na evropskom trÅ¾iÅ¡tu i sa znaÄajnim uticajem u regionu, prepoznata kao pouzdan partner domaÄ‡im i meÄ‘unarodnim kompanijama.\r\n\r\nVeÄ‡ godinama unazad, EPS podrÅ¾ava i pomaÅ¾e rad najvaÅ¾nijih drÅ¾avnih ustanova, institucija i udruÅ¾enja u oblasti nauke i obrazovanja: Univerziteta u Beogradu i fakulteta koji obrazuju struÄnjake potrebne elektroprivredi, Srpske akademije nauka i umetnosti, Instituta Nikola Tesla, Instituta Mihajlo Pupin, Saveza inÅ¾enjera i tehniÄara. EPS podrÅ¾ava i najvaÅ¾nije strukovne skupove i sajmove: CIGRE, CIRED, Energetika, Rudarstvo, Vode i Sajam energetike. A kroz razliÄite manifestacije koje su tematski okrenute nauci, kao Å¡to su Festival nauke, Tesla dani i NoÄ‡ istraÅ¾ivaÄa, EPS daje svoj doprinos afirmisanju nauke. TakoÄ‘e, EPS podrÅ¾ava nauÄne i edukativne kampove za najmlaÄ‘e - DeÄiji kamp â€Viminacijumâ€œ i Eko kamp â€Taraâ€œ.','A. B.','123','ab@gmail.com'),(2,'ABB','x','x',0,'x','123','EUR','123','123',NULL,NULL,NULL,NULL,'abb@bla.com',NULL,NULL,NULL,NULL,'abb.png','https://new.abb.com/','ABB (www.abb.com) je vodeÄ‡a svetska kompanija u oblasti energetike i industrijske automatizacije koja svojim tehnologijama pomaÅ¾e korisnicima iz javnog sektora, industrije, oblasti infrastrukture i transporta u unapreÄ‘enju njihove produktivnosti uz smanjenje Å¡tetnog uticaja na Å¾ivotnu sredinu. ABB Grupa posluje u oko 100 zemalja i zapoÅ¡ljava oko 135.000 ljudi.','C. D.','456','cd@gmail.com'),(3,'HDL Design House','y','y',0,'Srbija','123','RSD','123','123',NULL,NULL,NULL,NULL,'hdl@rs.com',NULL,NULL,NULL,NULL,'hdl.jpg','https://www.hdl-dh.com/','HDL Design House se bavi pruÅ¾anjem usluga u oblasti projektovanja i verifikacije SoC integrisanih kola, kao i razvojem IP cores i simulacionih modela koji se koriste u â€System/Product Levelâ€œ simulacijama, poslujuÄ‡i u skladu sa meÄ‘unarodno priznatim standardima kvaliteta ISO 9001:2008 upravljanja kvalitetom i ISO 27001:2013 upravljanja bezbednoÅ¡Ä‡u informacija. PreduzeÄ‡e je osnovano 2001. i trenutno zapoÅ¡ljava 120 inÅ¾enjera koji rade u razvojnim centrima u Beogradu i Ä†upriji. Od svog osnivanja, HDL DH izuzetno uspeÅ¡no uÄestvuje na R&D projektima sa kompanijama kao Å¡to su: NXP, Fujitsu, AMD, Infineon, CEVA, Cadence, Honeywell, Broadcom, Texas Instruments, Sensirion, uBlox, Siemens, Ericsson, Intel, i druge.','E. F.','789','ef@gmail.com'),(4,'Microsoft Development Center Serbia','x','Beograd',11000,'Srbija','123','RSD','123','123','456',NULL,NULL,NULL,'mdcs@bg.rs','mdcs@rs.com',NULL,NULL,NULL,'mdcs.png','https://www.microsoft.com/serbia/mdcs/','Microsoft Development Center Serbia - MDCS, otvoren je 2005. god. kao Äetvrti po redu razvojni centar kompanije Majkrosoft u svetu. Tim MDCS-a Äini viÅ¡e od 200 perspektivnih mladih ljudi, vrhunskih struÄnjaka iz oblasti kompjuterskih nauka i primenjene matematike. MDCS nastao je sa idejom da angaÅ¾ovanjem talenata iz Srbije i regiona, uzme aktivno uÄeÅ¡Ä‡e i doprinese razvoju novih Majkrosoft tehnologija.','G. H.','123','gh@gmail.com'),(5,'nVidia','x','x',0,'x','123','USD','123','123',NULL,NULL,NULL,NULL,'nvidia@gmail.com',NULL,NULL,NULL,NULL,'nvidia.png','http://www.nvidia.com/',NULL,'I. J.','456','ij@gmail.com'),(6,'Atos','z','z',0,'z','456','z','123','123',NULL,NULL,NULL,NULL,'atos@nesto.com',NULL,NULL,NULL,NULL,NULL,'http://rs.atos.net/',NULL,'K. L.','789','kl@gmail.com'),(7,'Danieli Systec','x','x',0,'x','123','x','123','123',NULL,NULL,NULL,NULL,'danieli@systec.com',NULL,NULL,NULL,NULL,'danieli.tif','http://www.danieli-systec.com/',NULL,'M. N.','123','mn@gmail.com'),(8,'ELSYS Eastern Europe','x','x',0,'x','123','x','123','123',NULL,NULL,NULL,NULL,'elsys@ee.com',NULL,NULL,NULL,NULL,'elsys.jpg','http://www.elsys-eastern.com/','ELSYS Eastern Europe je jedna od vodeÄ‡ih kompanija na evropskom trÅ¾iÅ¡tu koja se bavi razvojem kompleksnih integrisanih kola i elektronskih sistema i Äiji inÅ¾enjeri raspolaÅ¾u ekspertizama iz razliÄitih oblasti koja su potrebna za razvoj digitalnih, analognih i mixed-signal integrisanih kola. TakoÄ‘e, razvoj sistemskih reÅ¡enja, kao i embedded softvera je deo naÅ¡eg portfolia. Klijenti se nalaze u SAD, Francuskoj, NemaÄkoj, Å vajcarskoj, Izraelu, Japanu, itd. ELSYS je deo internacionalne ADVANS grupe koja je, sa svojih viÅ¡e od 1000 inÅ¾enjera, specijalizovana u izradi kompleksnih projekata u oblasti aplikativnog softvera, elektronskih sistema i mehanike. Postije dva razvojna centra, u Beogradu i Novom Sadu.','O. P.','456','op@gmail.com'),(9,'levi9','x','x',0,'x','123','x','123','123',NULL,NULL,NULL,NULL,'levi9@official.com',NULL,NULL,NULL,NULL,'levi9.jpeg','https://www.levi9.com/',NULL,'Q. R','789','qr@gmail.com'),(10,'Comtrade','109 State Street, Suite 304','Boston, MA',2109,'SAD','123','USD','123','123',NULL,NULL,NULL,NULL,'info@comtradesoftware.com','info.ie@comtrade.com',NULL,NULL,NULL,'comtrade.png','https://www.comtrade.com/','Komtrejd je osnovan 1991. u Beogradu, kao distributer raÄunarske opreme; danas prvenstveno izvozi znanje klijentima u Americi, zapadnoj Evropi, Aziji i Australiji. Od preko 2000 zaposlenih, veÄ‡ina razvija poslovni softver za najuspeÅ¡nije svetske firme. StrateÅ¡ki partners Komtrejda su IKT giganti Microsoft, HP, Citrix, Oracle, F5, EMC i Nutanix, a meÄ‘u klijentima su i najveÄ‡a evropska avio kompanija Ryanair, komunikacijska platforma Viber i CERN, Evropski institut za nuklearna istraÅ¾ivanja.','S. T.','123','st@gmail.com'),(11,'Logitech','x','Lozana',0,'Å vajcarska','123','CHF','123','123',NULL,NULL,NULL,NULL,'logite@ch.com',NULL,NULL,NULL,NULL,'logitech.png','https://www.logitech.com/',NULL,'U. V.','123','uv@gmail.com'),(24,'Nordeus','165v Bulevar Mihajla Pupina','Beograd',11000,'Srbija','123','RSD','123','123','nordeus@hotmail.rs',NULL,NULL,NULL,'nordeus@gmail.com',NULL,NULL,NULL,NULL,'nordeus.png','https://nordeus.com/','Nordeus je nezavisna kompanija za razvoj video igara i tvorac igre â€œTop Elevenâ€, jedne od najpopularnijih sportskih onlajn igara, koju igra preko 140 miliona igraÄa Å¡irom sveta. Kompanija je osnovana 2010. u Beogradu od strane tri elektroinÅ¾enjera ElektrotehniÄkog fakulteta u Beogradu, koji su napustili svoje korporativne karijere u inostranstvu i vratili se u Srbiju sa zajedniÄkom vizijom igre koju Å¾ele da prave. Ne samo da su bili odluÄni da igrom izgrade globalni uspeh u industriji igara, veÄ‡ su se obavezali da Ä‡e svojim radom uvek praviti pozitivne promene za svoje igraÄe, zaposlene i druÅ¡tvo u kome Å¾ive. To je i danas jedna od glavnih vrednosti kompanije Nordeus.\r\n\r\nNordeus Äini tim od preko 160 kreativnih profesionalaca u Beogradu, Londonu i Dablinu. Kompanija izuzetno mnogo paÅ¾nje poklanja uslovima za rad, programima za usavrÅ¡avanje i sveukupnoj dobrobiti svojih zaposlenih, zbog Äega je viÅ¡e puta bila nagraÄ‘ivana kao najbolji poslodavac u regionu. Nordeus je u stalnoj potrazi za globalnim struÄnjacima i mladim talentima koji Å¾ele da postanu deo industrije igara.','N. N.','123123123','nn@nordeus.com'),(25,'K.L.A.IN. Robotics','Via Cacciamali, 67','BreÅ¡a',25125,'Italija','123','EUR','0','123',NULL,NULL,NULL,NULL,'klain@brescia.com',NULL,NULL,NULL,NULL,'klain.jpg','https://www.klainrobotics.com/','K.L.A.IN.Robotics iz BreÅ¡e je distributer robota za komponente u oblasti fabriÄke automatizacije i mehatronike koji pokriva Italiju i deo Å vajcarske u kom se govori italijanski. Posao je podeljen u dva sektora: distribucija komponenta za fabriÄku automatizaciju specijalizovanim integratorima sistema koji konstruiÅ¡u proizvodne trake i specijalne maÅ¡ine za sisteme u oblastima kao Å¡to su kozmetika, zdravstvo, farmacija, hrana, elektronika, moda, optiÄka pomagala, kontrolu kvaliteta, plastiÄno modeliranje, itd. Drugi sektor je aktivna usluga, koja nudi kurseve obuke za koriÅ¡Ä‡enje mehatroniÄkih proizvoda, kao i pomoÄ‡ i podrÅ¡ka klijentima i potencijalnim klijentima u procesu izbora i razvijanja projekata, ili u pokretanju instaliranih proizvoda i testiranju ciklusa simulacijama u oblasti razvoja softvera.','parla italiano','11111','spaghetti@brescia.com');
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
INSERT INTO `korisnik` (`username`, `password`, `ime`, `prezime`, `email`, `institucija`, `pol`, `datum_rodjenja`, `slika`, `linkedin`, `tip`) VALUES ('admin','ZkgZ2MU0NnbJIlte0Apc3G86H/M=','Adminka','AdminkoviÄ‡','admin@etf.rs','ETF','Z','1980-03-03',NULL,NULL,2),('clan','/w1hfSAeWxNNKn2YqHa6N5nUvjI=','ÄŒlan','ÄŒlanoviÄ‡','clan@etf.rs','ETF','M','1990-01-01',NULL,NULL,0),('clan2','435HxVCSYyBkqNok9rDYkNKUI2c=','Novi','Korisnik','nk@bla.com','ETF','M','1991-04-17',NULL,NULL,0),('clan3','l0UiFFmAkwL3mK2+3OjvP3tzNag=','JoÅ¡','Jedan','nk2@bla.com','ETF','M','1955-05-15',NULL,'www.linkedin.stagod.com',-1),('itmen','Ja62B6CCp8CCRMb4oSLMJ54T5NU=','MenadÅ¾er','MenadÅ¾eroviÄ‡','itmen@etf.rs','ETF','M','1985-02-02',NULL,NULL,1);
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
INSERT INTO `novcani_ugovor` (`id`, `idKomp`, `idPaket`, `vrednost`, `datum_ugovora`, `idStatus`, `faktura_poslata`, `uplata_izvrsena`, `datum_uplate`, `komentar`) VALUES (1,1,1,10000,'2017-06-05',5,'','','2017-06-10',NULL),(2,3,2,5000,'2017-10-10',5,'','','2017-10-20',NULL),(3,4,3,3500,'2017-09-15',5,'','','2017-09-18',NULL),(4,8,2,5500,'2018-02-22',5,'','','2018-02-26',NULL),(5,9,4,2000,'2017-11-11',5,'','','2017-12-03',NULL),(6,1,1,8500,'2015-03-29',6,'','','2015-04-04',NULL),(7,1,1,7800,'2013-02-01',6,'','','2013-02-12',NULL),(8,11,6,600,'2013-08-29',6,'','','2013-09-07',NULL),(9,11,6,755.55,'2014-10-01',6,'','','2014-10-08',NULL),(10,11,6,822,'2015-11-01',2,'\0','\0',NULL,'prop\'o ugovor'),(11,11,5,833,'2015-11-09',4,'\0','','2015-11-11','ispala'),(12,9,5,1870,'2016-06-13',6,'','','2016-06-20',NULL),(13,7,4,2222.22,'2012-04-01',6,'','','2012-04-01','Å¡ala mala'),(14,25,2,4848,'2016-09-17',5,'','','2016-09-22',NULL),(15,25,3,3002,'2011-08-18',6,'','','2011-08-27',NULL);
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
INSERT INTO `oglas` (`id`, `naslov`, `opis`, `praksa`, `posao`, `datum_i_vreme_unosenja`, `fajl`, `idKomp`) VALUES (1,'Junior Digital Design Engineer','Otvorene pozicije u razvojnom centru u Beogradu','\0','','2018-05-11 15:00:00',NULL,3),(2,'Embedded Software Engineer','Otvoreno 15 pozicija u Beogradu za letnju praksu i zaposlenje','','','2018-04-10 13:12:11',NULL,8),(3,'StruÄna praksa','praxa','','\0','2018-07-08 02:44:33',NULL,5);
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
INSERT INTO `paket` (`id`, `naziv`, `vrednost`, `trajanje`, `maks_komp`) VALUES (1,'Zlatni partneri',7000,2,3),(2,'Srebrni partneri',4500,2,5),(3,'Veliki partneri',3000,1,100),(4,'Partneri',2000,1,100),(5,'Partneri katedri',1500,1,100),(6,'Ostalo',500,1,100),(7,'OglaÅ¡avanje na ETF-u',400,1,100);
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
INSERT INTO `predavanje` (`id`, `idKomp`, `naslov`, `naslov_en`, `opis`, `opis_en`, `datum`, `vreme`, `sala`, `predavac`, `biografija`, `fajl`, `slika`) VALUES (1,10,'Blockchain i kriptovalute','Blockchain and new cryptocurrency','Blockchain je jedna od najnovijih tehnologija danaÅ¡njice.','Blockchain is one of the latest technologies.','2018-03-29','13:00:00','308','SreÄ‡ko MiodragoviÄ‡ (Comtrade)',NULL,NULL,NULL),(2,9,'Od Jave do TypeScripta','From Java to TypeScript','U ovom predavanju Ä‡emo predstaviti specifiÄnosti JavaScript platforme i samog JavaScript programskog jezika komparirajuÄ‡i ga sa Java platformom i Java programskim jezikom. PokazaÄ‡emo studentima koliko je TypeScript, kao superset JavaScript-a, sliÄan/razliÄit u odnosu na Javu.','/','2018-03-31','11:00:00','61','Å½eljko TurbiÄ‡ (levi9)',NULL,NULL,NULL),(3,3,'Dizajniranje integrisanih kola','Designing integrated circuits','Predavanje o dizajniranju integrisanih kola.','/','2018-07-13','15:30:00','62','Neki Lik (HDL Design House)','Veoma pametan lik.',NULL,NULL),(4,5,'MoÄ‡ GPU','The power of GPU','Predavanje o moguÄ‡nostima koriÅ¡Ä‡enja GPU za ubrzavanje proraÄuna.',NULL,'2018-10-15','12:00:00','70','Taj Itaj (nVidia)',NULL,NULL,NULL),(5,7,'Lepota automatike',NULL,'Predavanje o automatici.',NULL,'2018-09-30','11:45:00','55','Neko NeÅ¡to (Danieli Systec)',NULL,NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0,\0\0\0ö\"\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0qIDATx^\í\İ-|\âH\0†ñ\ÊJde%‰D\"‘‘Hd$‰D\"‘‘\ÈJ$‰ŒDVŞ½\Ë\ÌfS>›d&\Éó÷»kiwx23ù\â\í?\0N!\à!\à!\à!\à!\à!\à!\à!\à!\à!\à!\à!\à\Ïùşşş:\Ûl6‹³ FOúüü|K\Ù_\à\ìFc\ï\ï\ï6›r\Ù?h»\ãñh\ê’(ŠL`ašÀ¤ª\Æ\î²A ™lU™K&“‰\éj8\Ú7zy4“4¿\\›?\Îüöû½ı;=‰\á5½³õş^¯\×z¯§£\Ö\ÇÇ‡\r¢¥7vÂ½\Â\Òl%\ÑT\ÓüZ™N§¦.\Ùn·¦±\Ã\á`ÿ6µ#B\Ôd·\Ûé½¾Z­ôÖŸ\Íf¦›È«úı¾ù=b¢ı¦+9Nö÷¢Lù\Ò~¹*3™™¡†Jıòê¦…®!^¤AFI¨ (\í7ˆJ’D+(u2k~ŒBUi\ZõÌŒ±S¥\İ@„¸\êp8\Äq¬fO¯×³1İ”/MTû\ëPD\Ï\â\rMš\ršı“¹6sH\ÅFi¯Ñ”şÏœ\Âş:I#•\ÒÀõÈ¢\Î\ì\åŸ\Ï\ç›Í†™d)&“ÉŸg\Öş:ÀœE\Ñt:\ç²n\ÑT\Õib©I\éñx´¿%Y.—ö‰¶_@Ki\ÈÒ‹A¿ß·/ùuš\Z\ÇcU·\İn“$±¿\Ğşß„\ß~\rm¡e†Ù‡ùÈºNeªO=X#d#k·ƒ]\nş}	ˆ°\r‡ƒ–všd\Ş\î4\Õ\Ã46ª:\ÍN\íÏ£^v)x^f\ëµ#\ÂF2«;`š=\Ş>xğññ¡—\\\ë@v`zB¯…}m\Ş\Ş\Öëµ¾B„q<õš\Íf³»ûTô€07›\r{S|£\×Å¾Hooš’˜/¡\×\Ì\ÎL\re·/\Ş\Ñ`hv¨0\Éô–Öz\ìv\ŞP¦¯ú%I`\Ú^\Ş=p§\åŸ6¥Z\n:¼Ò”$»\\\×V5»­$B÷ôz\Äq¬¢îi\Úm·[öd6ˆ¦\'\Ùuû|>·\ßø‹\Ñ¶\\.³S”<e\Æn•†\ÒT%=P¤\Ñ4\Ç~#ƒ\ë¦qL³\Íƒ&¢f·\n‡Ë›.»F«úk[R\"¬ƒ–\Ú\"j%p\í\è¹zÁÔ§ı4\\~7Ì=\ÕDX!mù´\0¸qDA¯“¦š\ìYi™Û»aòˆ°d\Új&©…Üµcèšˆ\Îf³89–\ĞJww\Ã\äa9öû}E7+\è[z\0W\0µ\Ûz½¾»&Em\ê®I\×q:\ê•\àˆB¨@û\Â\ß\Ü\r“G„/RZ×.h¨29¨\Ğ)\Ùo\ï†\É#\Â\ç$I¢Ye~\è\Ó\ÜC\ëo½Wè ‹Ÿøá£¶\Ûmö™\Î\Ğxø\à\Ô­ô\Ë…\ï\Ğsº\\.ó\ÇÖµŞ›\Íf]\è¸\ß(Dx•u\Ó\é4x}8\ê©\ç\0J)Pˆğ’\êÒ“›¿D¡Ye(DøSfùƒ\ì\n’¡Y%(Dø‡\ÓüqvMD5\åH.”[ t7Blqk\è\Ëo\ĞĞ·Z­~ÿ\ä¢}J/P:a’$\×.h`\è\Ãmz\ç\Ø÷JyJW\"\Ü\ï÷‹\ÅBOœ}\núüüŒ¢ˆ¡\×h\Û}qiR‰\ï–6Gxc\Âih\Ú9Ÿ\Ï9©\Z·m·\Û\ì\îº\ápX\îöº…Ş˜p\ZÚ¤\éOİ‡nRlZ¡\Ø÷Í™¶Ú¥\ï\'oO„·\'œ\\Ğ€g\ív»\ìJó¦Šö4>\Â\Û\é‰Ã}-xŠ\Æ:½©\ì{\èL[ğ\ê78\ÂF#n\×hJ¥m·}\'¯¬ú\Ş?Í‹ğ\Ú\ÅDšpA°^¯™p\âezkew%L&“\Z\ŞNMŠ‹‰PÍ›²gMi›®\rºı^\Å\Z¡6E\\L„J©·\ìA-g\ê¼8\Û\ëw\\L„Ši¯9§}cÏšÒŒ\Ô~¯.>F¨º\ÔXvql0ô¡\\___ÙÚ¸;ywù¡‚Â‹‰úP®üAˆ*\Â?È—\ÕXvYlpF5ªp±Fƒ¡†Dû=Gx\íP»\æ¢\\L„*hs_ÿAˆÛœE\ÇqşP;Cª“\ß£ \í÷œª;B=Q\å70ô¡R\ìƒ)T_„šy\Îf³\ìLÀ‚€Cu¼\ÚS¨µ\ÊNsm‡D\ÑA¾\íƒ)Tm„šs\ç¯-\ZFZ\ÚG\0•Y.—¾\íƒ)TU„ša\æ÷yN§S.cG\rôöË\ì\á\Ï>˜BUE˜ôz=\ÍÂ™y¢š^\ìu÷jL¡ª\"\ÔzOÿÿZø­V+\ÎtA\r4\Õ\ÃĞ„gh.¦·Ÿı¶\Ç\ê\Ø1TMË¿\ìÙšjòÕ”#^Dˆf»Xş\Éd2i\Ö]¼ˆM•_ş\r@\ÜE„h\æ.ÿ\n!š\äûû»\ÑË¿BDˆf0ù]|n\Üò¯\Âw…ù5tùWˆ\á¯\Âü>??}>ı\åDu$?ƒ\á—N\åg!|\ÑÁü\"„{\Í\Ï B8\Ö\åü\"„3ù\Ó>»–ŸA„p \Úg7ó3ˆµÊŸö\Ù\ëõ4#µ\ß\î$\"D}\Û\Åg(\ÈFŸöY\n\"Dò\Ë?MG=¿\ëDmˆ\Õ\Ê/ÿT£š´\ß¢:,ÿD„(Ÿò»Xşµàª¿\ê!Ê”$‰b»\ØûÒ«şªC„(G\ág´éª¿\ê!~k¿\ßA`³ûKùña\"B¼n»İF#›\İ_\ãñ˜\Ñ\ï)DˆWl6›üGıh<\ä³F^@„x\Â÷÷÷jµúüù¯ZN§Sv½¼Œñ(\åwq\ÍQ¯\×Ãúù%\"\Ä}‡Ÿµ)ª1Š\"û•‚q‹æŸ‹\Å\"{\àAsQ>i«\\Dˆ«v»\İ\ÅGmjô³\ßCyˆ4ÏœN§6¾³\Ñh\ÄE!B\\Š\ã8»¦\×\ëuöš÷z!şI’\äâ²£\Éd\Â\ÎÏª!,­÷²\'^k0äª¿z!\n@p×‰:a\×i\0\Ì\è÷û»\İ\Î~µ \Â\î\Ê€\Ò\ÜÏ»m.\"ì¨‹0¥/\ÚG .D\Ø9…`j6›\ÙÇ¡.D\Ø!§\Ó\é\â4\ã\ã\ãC\íq +D\Ø	ûı>Ã‹[¿ˆ‚\äşK\Îa\Ë\å/ÿKqÿ%Oa›iòiƒû‰û/y…[(I’(Š\nÀ ¸ÿ’oˆ°U6›Mş\Æg\Ò\ï÷—\Ë%gú‰Û ğã¦\áp\È0#\Â\Æ[¯\×ùüÔ¾\Îõ\ï@„\r¦\Õ\İ\Å\ÂO5\Î\çsöy66\Ò\×\×\×\Åm?•§}66\Ì~¿¿¸\éu¯×‹¢ˆ™gsac‡\Édb\Ë;\ã|—v \ÂH’\ä\â¶K¢¯pÈ¡ˆ\Ğk\Z\å\Â0¼8\åZ\ã!7>k\"ô”2\ËÚ¦Vƒôk\"ô\Ë÷÷÷z½\Î_\ï7¸\íR[¡/4\Äi™—¿\Ø\ïóó“\Û~¶:fN¶\Î\Şm>Áf³±C{¡37N¶V–\ìù\ì\"¬›\Ù\ã’?\ÛSQMG\Ù\ï\ÒADX“k{\\„“­;+wm‹9Ùš#~ Âª°\Ç\"\Âò±\ÇO!\ÂÒ˜\Û\n²\Ç\Ï\"\Â\ß2\í\ŞU‰=.x¾\èF{\ìqÁSˆğ9·\Û\ãfòx>„öP\"¼…öP\",@{¨şC{p‚iu7BÚƒ\':!\íÁ7]‰öà­–Gx<\çó9\íÁg\íŒğt:­V«\Â+hi¾i[„qAPx-\íÁO-‰ğp8hÉ§\Òls™Ëˆ¸c\'|\Ö\ì“$Ñ´³ğ\êus–ÿ55\Â\ÍfsñE\Æ\ç\ç\çb±\àS2\Ñ \r‹p·\Ûiiwñ	\rb¦,ù\ĞDÍˆP#Ûµ›&\Çc®^G£y¡¹W§2³ÁehÚ©,™v¢<PKM/ó\ÓN}E\ÓQnš„6ñ+Bl‹Å¢ğ‡›Í†i\'\ÚÇ‹O§“¦…\'¸h¸\\.¹W\'Z\Ìq„\Û\í¶ğ3\í\Ü\ï÷öq@{¹‰\Ğ\\Ó?ÁE¸E<º¦\Öo\\O¤i\çjµbÚ‰ª#\Â\Û\×ò\é[\Ü\']Va„\\G<¢üixJi\Òğš\ßFH{À/½!\íey.B\ÚJ÷P„´T\çV„´Ô  B\Ú\êô/\Â\Ã\áÀ}rú½%I²\\.\ïA{@\rloY´\ÔÉ†\'½^û\äõû“\ßd2\á\Î€+oÜ£\Zp\ë¹3f\0”\ÇZ\áñx\\¯\×\Ó\é4=Ú©\ÑW\ì·/5&\Âı~¿Z­²=\èıı\İş\nÀK^GøõõµX,\Æ\ãqşV\ÜO±¿ğ’_o\Ğ$I\â8\Ï\ç…7¾KƒŠ¢(ûñA\Ø\ßx\Éq„\ß\ß\ß\Zî”R)<u.õññ1™Lô\È\ÛDq:²Ÿ[¨\Z9ş	\Ï\Õ\á\ãÕ‰0›\Í\Ö\ëõƒ÷DTŸ\Ù\ãh4¢@ø¯òŸªNTÖ\Û\íöÙ³\Ôjövú\Ó\é”\Ñ%G¨r”œz0;T©N\Ë?\rw«\Õ\ê7x¦e¤ıu\ç•!‡%\Ğ ¿ŠP\Ù\Äq¬\Ş4\ìh\Ë®K¡RªKi¸ÓŸnõy\Ëı¼\Ñ,Fx<Í¬2Cõö\ÔÁºr«\Ë\ÒÀ«¿ŒıcÎ»a8S¡RQo\Z\ß4\Ç\Ó[|0\Ø÷øz½~DC“Y\×\í«ül3m²7h¨7\rP\nf2™<>ŸLiˆ\Ó\êÇµS·u6 ¼?2Ÿ¬¦¿ƒı\Ğ4öM|—æŸªTc\ãr¹To\Z…\ì/pAclz\r»a\Ğt\æüƒb-Zª·J§”/Prö/zır+\04\İ[†\ê-\ãšç“¯\Ñ_\Õöwœ}\Û@\0/¨ü`}‰²‡\"ƒ\Û)1P–fD¨!ú\âŒPE 5\Z¡z\Ë^TÁ¡´Œ\ïjÎ™=÷m>Ÿ\Ûo\0m\áu„ûı>{j‡\"\ĞJşFøõõ•=È¡´•§n6›ôô¥È¡´˜f\ÇkAÈ¡´›wf‡Š@\ëùa¶@nƒğ(B\nD7ù!¢³¼ˆ\Ñe\î#¤@tœ\ã—Ë¥\í\ÑU.#\Ì^H\è,gR `¸‰”ƒ)Èª;B\n.\Ô\Z!yõEH@¡š\"\äx pMn·[\Û9•Gx8Ò»TŒø\è\\ §\ÚO§Sz§&ıW\èyF¨AOCŸ)ğııû\Ä\0…*Œ0CS \Äql¿\nà§ª\"\Ì^ E‘ı*€œJ\"L’$½a\ád2±_P¤’Ó‰h¿\ßgw(p[ùf‡A–‚À]\åG˜ƒƒÁÀ~	Àu%G\È0<«\äg•\á\ÇÇ‡‰axP™\î÷{S`¯×³_pO™¦\×+qlM´^¯G£‘şiÿ».eF¨öL„ª\Ñ~	hˆ\ÕjeŞ½\ï\ï\ï5\Ü.3\Âô’%\Î\ÕF³œN§twFö«u)3Bóÿ ö¿¿GM>§\Ói:~Hı\çx!ºE\Åq¬ğ\Ò+]³\Æ\ã±}\\*‰0Iû%À\Zô–Ë¥\Z³\ï\Ñ5Yÿ.£\Ì\Óseô/a’\"\\Qr___ªn±XŒF£~¿oŞ™yú®³\Û\í\ìOºPf„Ù«x…ñ \rA…“\ÃdWw\×½3·Û­ı\ã]+yı¦Ù¶ş\íÿ\ë™Rœ\Ífn·4ğMºG¤¬ö\îRœA\èõpT¨d\'J>E\ÑÓ­qÿp8\Ø¡c\êO„\æ™\Z\îô–Ó¼\Ôócf•Dh¦(ú\âjµbš\ÚVf=&\n@Tz¸†©\Î^ÿ]a„†6Bš¦GB³&“\Éf³\á\Òû\æÒ¼F++•¦—R¥\Ù\×õZ¤Œ\Ç\ã(ŠX§H\å¦40jk—\îAMi²®%5ú\ït:i|[.—Úª>•œAx\×\Ô¡¡Rƒ\áph_™½HÚ \ê»\Ü#\ØªE/‡:%W8—)\Ô\ï÷õx½”\ç\Ù\èB_¥Ë™Œ7\ÔaJ+½B×–\nzµ\Å\Õc\ì£Q±ó\"\î\Ï*n>Ÿ\ë\É/\\\Ì\ç©L=X?¥V\ß^\æ,Â”¶‘z¯NÕ»A\ßeŸjYôl+6s[“C%”_ \\£G\êñš‹\ê\ÇõKX>”\Å}„){zuõ2\Û\×ü\'™aêµ·\ÆMf¥™Lj)®gõñùdJ[@ı¬~\Ãv»eVR\"L™u£…i3Jis®wI–\Ş1zÿ¥\Zz,\Äş\í3LQì³ñ\ÚQ8ó³ú…Q\é\Ïb	W\'#L¥\'¼?r.¡ÁM±™£\ØfkÅ¬\Ò9¯#\Ì\Ò\ÛEo\×6ó¤\'J±iû¥\Ø6›=ÎğVc\"L™\ÕNJC\åŸiY\ÆybõOCG\Ñ\áphÿş2Ë³soa\'V\ã4/B eˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒÇˆpŒ§şû\ïK¡D+zEN\0\0\0\0IEND®B`‚'),(6,1,'Dalekovodi',NULL,'Sve Å¡to Vas je oduvek zanimalo o dalekovodima.',NULL,'2018-08-15','09:00:00','VMA','Strujo Mer (Elektroprivreda Srbije)',NULL,'PK\0\0\0\0\0!\0\İü•7f\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´T\Ën\Â0¼W\ê?D¾V‰¡‡ªªú8¶H¥`\ì\rXõKöòúûnDUA*\å)Y\ï\Ì\ì\ìÄƒ\ÑÚšl	1i\ïJ\Ö/z,\'½\ÒnV²\ÉK~Ï²„\Â)a¼ƒ’m ±\Ñğúj0\ÙHu»T²9bx\à<\É9X‘\nÀQ¥ò\Ñ\n¤\×8\ãA\ÈO1~\Û\ë\İq\é‚\Ãk6<A%³\ç5}\Ş*‰`\Ë·k®’‰Œ–I)_:õƒ%\ß1\ÔÙœIs\Ò\r\É`ü C]9N°\ë{#k¢VE\ÄWaI_ù¨¸òrai†¢\æ€N_UZB\Û_£…\è%¤D[S´+´\Û\ë?ª#\á\Æ@ú[\Ü.z\Ò9>$N{9›\ê\Í+P9Y ¢†vu\ÇGD²\ì\Ãï»\ÆoR€”w\àÍ³¶\r\ÌIÊŠ~‰‰˜\Z8›\ïWòZ\è“\"V0}¿˜û\ßÀ»„´ù“>şÁŒıuQwHo\î·\á\0\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·ó\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’\ÛJA†\ï\ßa\È}7\Û\n\"\Ò\Ù\ŞH¡w\"\ë„™\ìwÌ¤Ú¾½£ ºP\Û^\æô\ç\ËOÖ›ƒ›\Ô;§<¯aYÕ Ø›`G\ßkxm·‹PY\È[š‚g\rGÎ°ino\Ö/<‘”¡<Œ1«¢â³†A$>\"f3°£\\…È¾TºI	S‘\ÌõŒ«º¾\ÇôWš™¦\ÚY\rig\ï@µ\ÇX6_\Ö]7\Z~\nf\ï\ØË‰\Èao\Ù.b*lI\Ærj)õ,\Zl0\Ï%‘b¬\n6\ài¢\ÕõDÿ_‹…,	¡	‰\Ïó|uœZ^tÙ¢yÇ¯;!Y,}{ûCƒ³/h>\0\0ÿÿ\0PK\0\0\0\0\0!\0\Öd³Qú\0\0\01\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’\Íj\Ã0„ï…¾ƒ\Ø{-;ı¡„È¹”@®­û\0Š½ş¡²$´›¶~û\nCR‡÷\â‹`Fhæ“´›\íwo\Ä\'\êœU%)´¥«:\Û(x/vw\Ï ˆµ­´qH°\Íoo6¯h4\ÇC\ÔvDL±¤ eök)©l±×”86\î\Ô.ôš£ôºü\Ğ\r\ÊUš>\É0Í€ü\"S\ì+a_İƒ(›ÿ\Ïvuİ•ø\â\Êc–¯T\È/<¼!s¼\ÅX\Zd3‰´ ¯ƒ¬–¡?\'g![?óü4\ê¹ú\Ç%\ë9ş¶Rk6\Çğ°$C\í,ú`&g\ë!/=ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\04y>\Í\0\0ş\0\0\0\0\0word/document.xmlœS\Ën\Û0¼\È?¼\Ûz$qÁrÀpO‚¦ı\0š¢$\"$— )©\î\×w)‰®\ÛÑ‹¨\årfg_Û§J&·N€®H¾\ÎH\Â5ƒZ\è¶\"ß¿V$q\êšJĞ¼\"\'\î\È\Ó\î\æ\Óv,k`½\â\Ú\'H¡]9 ·óŞ”i\êX\Çuk0\\£³«¨GÓ¶©¢ö½7+\ÊP/B\nJ‹,Û…*\Ò[].+%˜šF0¾a¯‰;#÷‹\ä)bj¹D\r ]\'Œ‹l\ê\Ù0\Å.’%1(ß\æšhµ¥#öC\ÉYö¶6wo÷³óÌ˜g\Å^\n(Îˆk$ü3*QT\è3M˜¿ún\Ş\Z›—Î±\Ó@õ;¬\Åg\éõ)œ&Kœ\ÅúkE²\ì¥\È_\î¯ö¼¡½ôÁ³y\Î‡\ç	i\Ì\ïp>ù;8¸\Û4\Ø\á‹.üšğÀq\æ_mdú—ü\rı·“”ö\í\'FÜŠ¢¸Ã½\Ëÿ\ïñ?|¡\Òv1¿\Ë&¥¢\í)šGğp¤¢-ys\á\í8­9\ïC†[6–\r€¿0\Û\ŞO\ætø\ÈÊ°\Ò2©À-ülE)4¡\Ê\Û\Í\Â\ì\çÄ§B\Ì5Æ»¸¸»_\0\0\0ÿÿ\0PK\0\0\0\0\0!\0–µ­\â–\0\0P\0\0\0\0\0word/theme/theme1.xml\ìYOo\Û6¿\Øw toc\'v\ZuŠØ±›-M\Än‡i‰–\ØP¢@\ÒI}\Ú\ã€Ãºa‡\Øm‡a[Ø¥û4\Ù:lĞ¯°GR’\ÅX^’6ØŠ­>$ù\ãûÿ©«\×\î\Ç!)O\Ú^ır\ÍC$ñy@“°\í\İö/­yH*œ˜ñ„´½)‘Şµ÷ß»Š\×UDb‚`}\"\×qÛ‹”J×—–¤\ÃX^\æ)I`n\ÌEŒ¼Šp)ø\è\Æli¹V[]Š1M<”\à\È\Ş\Z©O\ĞP“ô6r\â=¯‰’zÀgb Ig…ÁuS\Ùeb\Öö€OÀ†\ä¾ò\ÃRÁDÛ«™Ÿ·´qu	¯g‹˜Z°¶´®o~ÙºlAp°lxŠpT0­÷­+[}`j\×\ëõº½zA\Ï\0°ïƒ¦V–2\ÍF­\Ş\Éi–@öqv·Ö¬5\\|‰şÊœÌ­N§\Óle²X¢dsøµ\Újcs\ÙÁ\Å7\çğ\Îf·»\ê\à\r\È\âW\çğı+­Õ†‹7 ˆ\Ñ\ä`­\Ú\ïg\ÔÈ˜³\íJø\ZÀ\×j|†‚h(¢K³óD-Šµ\ß\ã¢\0\rdX\Ñ©iJ\ÆØ‡(\î\âx$(\Öğ:Á¥;\äË¹!\ÍI_\ĞTµ½S1£÷\êù÷¯?E\Ç?ø\éø\á\Ã\ã?ZBÎªmœ„\åU/¿ı\ì\Ï\Ç£?~óò\Ñ\ÕxY\Æÿú\Ã\'¿üüy5\Òg&Î‹/Ÿüö\ìÉ‹¯>ıı»GğMGeø\ÆD¢›\ä\íó3Vq%\'#q¾\Ã\ÓòŠ\Í$”8ÁšKıŠô\Í)f™w9:Äµ\à\å£\nx}r\Ïx‰‰¢œw¢\Ø\îr\Î:\\TZaGó*™y8I\Âj\æbR\Æ\íc|XÅ»‹Ç¿½I\nu3KGñnD1÷NIB\Òsü€\n\í\îR\ê\Øu—ú‚K>V\è.EL+M2¤#\'šf‹¶i~™V\éşvl³{u8«\Òz‹ºH\È\n\Ì*„\æ˜ñ:(W‘â˜•\r~«¨J\ÈÁTøe\\O*ğtHG½€HYµ\æ–\0}KN\ßÁP±*İ¾Ë¦±‹ŠTÑ¼9/#·øA7\ÂqZ…\Ğ$*c?¢\íqU\ß\ån†\èwğNºû%»O¯·i\èˆ4=3Ú—Pª\n\Ó\ä\ï\Ê1£Pm\\\\9†ø\â\ë\Ç‘õ¶\âMØ“ª2aûDù]„;Yt»\\ôí¯¹[x’\ìóù\ç]\É}Wr½ÿ|\É]”\Ïg-´³\Ú\neW÷\r¶)6-r¼°CS\Æj\Ê\È\rišd	ûDĞ‡A½ÎœIqbJ#x\Ìêºƒ6k\à\ê#ª¢A„Sh°\ë&ÊŒt(Q\Ê%\ì\Ìp%m‡&]\ÙcaSl=X\íòÀ¯\è\áü\\P1»MhŸ9£M\à¬\ÌV®dDA\í\×aV\×B™[İˆfJÃ­P|8¯\ZÖ„A\ÛV^…ó¹f\r\ÌH \ín÷\Ş\Ü-\Æ\é\"\á€d>\Òz\Ïû¨nœ”ÇŠ¹	€Ø©ğ‘>\äbµ·–&û\Ü\Î\â¤2»\Æv¹÷\Ş\ÄKyÏ¼¤óöD:²¤œœ,AGm¯\Õ\\nz\È\Çi\ÛÃ™\ã¼.uÏ‡YC¾6\ìOMf“\å3o¶r\Å\Ü$¨\Ã5…µûœ\ÂNH…T[XF64\ÌT,Ñœ¬ü\ËM0\ëE)`#ı5¤XYƒ`ø×¤\0;º®%\ã1ñU\ÙÙ¥m;ûš•R>QD¢\à\ØD\ìcp¿U\Ğ\' ®&LE\Ğ/p¦­m¦\Ü\âœ%]ùö\Ê\à\ì8fi„³r«S4\Ïd7y\\\È`\ŞJ\ân•²\åÎ¯ŠIùR¥\Æÿ3Uô~7+ö€×¸#¯mq¨BiDı¾€\ÆÁ\Ôˆ¸‹…i*¸L6ÿ9\Ôÿm\ÎY\Z&­\áÀ§öiˆ…ıHE‚=(K&úN!V\Ïö.K’e„LD•Ä•©{D	\ê\Z¸ª÷vEê¦šdeÀ\àNÆŸûe\Ğ(\ÔMN9ßœ\ZR\ì½6ş\é\Î\Ç&3(\å\Öa\Ó\Ğ\äö/D¬\ØU\íz³<\ß{ËŠ\è‰Y›\ÕÈ³˜•¶‚V–ö¯)\Â9·Z[±\æ4^n\æÂ\ç5†Á¢!J\á¾\é?°ÿQ\á3ûeBo¨C¾µÁ‡M\Â¢ú’m<.vp“´Á¤IY\Óf­“¶Z¾Y_p§[ğ=al-\ÙYü}NcÍ™\Ë\Î\ÉÅ‹4vfa\Ç\Övl¡©Á³\'S†\ÆùA\Æ8\Æ|\Ò*u\â£{\à\è-¸ßŸ0%M0Á7%¡õ˜<€\ä·\ÍÒ¿\0\0\0ÿÿ\0PK\0\0\0\0\0!\0pP sµ\0\0\0\0\0\0\0word/settings.xmlœTmSœ0şŞ™ş†\Ï=9ğ\îl©\èxÚ«\íh\Û)ú„#c’\Í$\áğú\ë»\"\ÚZ\Ç\é\'’\ç\Ù}v³/Ÿ\Ş\ì¨6d\Æó0 ²„Š\Ém\Ş\Şlf\ï\ÃÀX\"+\ÂA\Ò,\ÜS¼}sÜ¥†Z‹f&@	iR\È\ÂV\ËÔ”\r\Ä\Ì+5¨\í¬‘B]³’Ÿpô\ĞY\ØX«\Ò(\Z@Q‰j5hA¬9\0½\Ï([A¥’ù|iÊ‰Å„MÃ”ñj\â\Õ0T\ãEv/=b\'¸·\ë\âùK–\ãs;\ĞÕƒ\Çk\ÒsJCIÁ\Ê\n><W&½Œ\á¯\Ñ\êy\Å\nMôş‘\È	¶\í€ºTQ]bA±\çG\Â\È­I\Ë\í\r)r\nMvƒ%ó.¢Ii©\Î)1»sV÷v|{BiL~ôÀ±½6\ÎWe\\wø	`½¶ó,\Şl\Î\ÇN\Ì\á\Ñ\ê\Óú\â9\æ\ß>\ë$^/\ç\rÁ0ªH]‹h\Ú`\æwND¡	®\İ —H}·f\Òó\Åa¤™¼-<9›\r„„ó\rV\Ç\Øÿ©˜Q´\î…ù5\Ñ\ÛI¹/«Hõ³(ö\âëƒš\ëÕŸ5´jP\í4Q_d…°/£“öŠ	›¶È½—\ÄYxDµ²ú¾\ÓN0š\nÔ¥×—º\n]¹õ½ rv›;\Ó.-¹\ÎİŠ\Ók¢š\Û89\Û66ñjñV}\×_Šm2rI\Ï\á\Íqı…”\îeh=œÁpD«ñ0a‡;œ°…\Ç¶ô\Ør\ÂV[9¬\Ù\ãğs&\ïp•ü\Ñ\á5p­.=˜…ACLCÅ¾º}Áƒ´\Æ2Á.¥÷¸Y´bÿŠU‚\Üga2_ö=\Z­9\ÙCkŸ\Ø:%g¬ AE,Á=\í[õÄ¹ò?rq{\\2\È|/Ši=\ß\r‰sflNn²O\îWüc¯<ı\ĞO~\0\0ÿÿ\0PK\0\0\0\0\0!\0(Õ\'†\0\0\0\0\0\0\0word/fontTable.xml¼“]o‚0†\ï—\ì?\ŞO\n¢S#š\É\å.÷*i\Ò\ÒSeşû(šef\îb%x{úö\ä\é\Ë|ù¦dp\à„\Ñ)‰”\\f+ô.%¯\ëünBpLo™4š§\äÈ,·7ófV\Z\í Àõ\Zf6%•sõ,¡¨¸b005\×8W\Z«˜\ÃO»MYŠ‚?™b¯¸vaL\é8´\\2‡{C%j ½[ó·\Æ\ØmmMÁ°Y%½ŸbB“E\ß]\Ğ\Ì4S\ØõZ(Á3o‚£˜/¨™6À#¬90™\Z\ã5¦C:¢	\Ş1¾%$lŠŠY\à\îT˜e^.™òxRm\ç\Û\Õ\×\Â\ÕI?0+\ØFr¿\Ä\'ö°¡)YQJ\ãU¯D)\ÉP¹ŸŒ{%Æ¦ü˜ö\Êğ¬\à1acOWyTĞ§_E\Û=CND2&\ÅÆŠ\Õ%‰¼#\ĞI>¯ \0ğõ×xøL\"N\îÿ‰„B\ìm|&\Úl\\G\âo™ \ã$üK\âä¬´™@¥?gb\Úe\ë›Lô\á€\Å;\0\0\0ÿÿ\0PK\0\0\0\0\0!\0JØŠ’»\0\0\0\0\0\0\0\0word/webSettings.xmlŒ\ÎÁj\Ã0\Æñ{a\ït_õ0JHR(£/\Ğõ\\Gi±d$m\Şöô5l—\İzŸøñ\ï_im>Q42\rğ²m¡A\n<Eº\rpy?=\ï¡Qó4ù•	øF…\Ãø´\éKWğzF³ú©MUH;`1Ës\ZL^·œ‘\ê6³$oõ”›\ãy\ß8|$$s»¶}u‚«·Z K\Ì\nZyD+,S¨ZC\Òú\ë%	\Æ\Ú\È\ÙbŠ?xb9\nEqc\ïşµw\0\0\0ÿÿ\0PK\0\0\0\0\0!\0E–}\0\0\Ö\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œRMo\Ü ½W\Ê°|\ßÅ›CUE,QµQ•CÓ¬´NrÁ\ØFÁ€`ò±ÿ¾\Ã:\ë8ê­œæ½Ç›òú}t\Õ+¦lƒ\ßÖ›uSW\èu0\Ö÷\Ûú¡ıµúQW™ÀpÁ\ã¶>b®¯\Õ\Å7¹O!b\"‹¹b	Ÿ·õ@¯„\ÈzÀòšÛ;]H#\ÃÔ‹\ĞuV\ãM\Ğ/#z—Mó]\à;¡7hVq¬\'Å«Wú_Qtñ—\Ûcd\ÃJ¶8F„\êO±\ã\Ö&\Ğ(\Å\Ì\Ê6¸Ö¨\Z¦g ÷\ĞcV)¦B>…dNx*\än€š8?µ\á“(\Æ\è¬\â`Õ\Õ)\ä\ĞQuŠ *Ç¥Xn‘\ËõK²t,&–Pş¶~²1l+AŸ \Şf$\Z\îxvÕ\Ë(\Å\'!waŒ\à\ê\ß­ö Ÿ¡ø87\Ê=\Ïù!¶\á¦dõ¡ğ•\\Œüdi8D\Ğ\ÅÚ—\á\ry\à„\Ğğ4g¹OB\Şò\ë$W\î\ä\à|\æ¼\ç\ßF‰óqú¦js¹nxò;süBóÿQ\0\0ÿÿ\0PK\0\0\0\0\0!\0Ã³ò4p\0\0\İ\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ’QO\Â0\Ç\ßMüKß·v”,l$jx’\ÄDŒÆ·\ÒP\ÙÚ¦-\Ì}{»‹>ùÖ»ûß¯wÿv6ÿ®\Ê\è\Æ\n%s”&E ™\âBnsô¶Z\ÄSYG%§¥’£,š·73¦3¦¼¥Á86ò$i3¦s´sNg[¶ƒŠ\Ú\Ä+¤/n”©¨ó¡\ÙbMÙn¹\Ã8Ê©£¸Æº\'¢’³©¦\ì\0œa(¡\é,N“_´Leÿl\è*W\ÊJ¸FûN\ã^³9\Å^ımE/¬\ë:©\Ç\İ~ş,Ÿ_»Uc![¯ b\ÆY\æ„+¡˜\á\ËÑŸ\ìaıÌ…tø3@2Å‘¯»–s\Ü:½‡¦V†[\ß5ˆ|ËŒ\ĞÎ¿_`^]R\ë–şA7øCğ¿\Ó\í-¢ıÅ¨»¦ı.uaD\à‘7#Ö+\ï\ãÇ§\Õ#’Ncr“\é*g“IF\Èg»Í ¿5\'$ª\Ó\\ÿ&Á˜\á‡,~\0\0\0ÿÿ\0PK\0\0\0\0\0!\02³0\0\0ù9\0\0\0\0\0word/styles.xml´›Qs›8\Ç\ßo\æ¾\Ã{\ë\Øn\ík¦n\'M\Ûkf\Ú\\\Z;s\Ï2È±¦€|Hn’~ú“VX!``7Ğ§Œö·«]ı—$\Ò\Û÷÷iü\ä¹2[„\ã—\'aÀ³H\Æ\"»]„7«\Ï/ş\n¥Y³Df|>p¾÷\ço\ïN•~H¸\nŒL\æ‹p«õ\ît4RÑ–§L½”;™\ï62O™6—ù\íHn6\"\âe´Oy¦G“““\Ù(\ç	\Ó®¶b§\Â\Â\Ú\ÆÚ\Ì\ã].#®”ñ6Mœ½”‰,|gÜ‹eô‘o\Ø>\Ñ\Ê^\æWyqY\\Á\Ï2\Ó*¸;e*b®Dj\"º\äwÁµLYšo8SúL	¶2Q™øS‘\Éü\ËY¦„ırk?©ú\í‘Eª_f\ÜO–,\ÂÉ«°¸sn]xr/a\Ù\í\á\Ï^\Ü,Ë®,Bk-b\Ãgù‹\å™56‚8?Kñ\îDo®À•‹\Ì\Ì\Ûhn2hb9‰°™\Ìg‡‹\ë}bn°½–XÙ¬¹¬L¹I¬IóÒ•‰ù–o¾\Ê\è—\Ú|±en\Ş\\\\\åB\æB?,\Â7o,\Ó\Ü\\òT|q\ÌmU÷n²­ˆù¿[\İ(?\Şÿşj¬°\É}¦û³9”A¢\âO÷\ß\Ù\Z3¦3f³xi$Ö¬*qÀ¡½xô\Æİ¨P\á\æ\ä\Ø\åğ(eË™]Gø\ß\n‚¨÷½AQ9\0°Kòu\Ú\ßÄ«ş&^÷7\Å\Ûo.\æı½0\ê\Ù7#®6JU‰Oª–‘+¾ò<Lß´”¬Q«¢\Îµ¢\éQ«‘\Îµ’\èQ«€\Îµ„w¨\å·sD-­#\"\ÂU­¢)\Ìja¯„N¸\ß*@\ãRW´š\àŠ\å\ì6g»m`;k\Õ\í6±\\\î\×\Z\ç*\È\éó\År©s™\İv\Î\È\Ä-ƒgkò§t·eJ˜Wš©Ÿôœú[\'<ø;q\'\êµ+¾ZLğ\Zr´…]%,\â[™\Ä<Vü\Şe”0şRK÷–\Ñ\é\\Ï´~·[,·\Ğr;a³†Io	gÿ«P0­‹i\ÖJ—qTg\ru\Ùlü\Å>=L\r\âmd\æôœ\æ\n\\lŸ¢W6EõE\Ü…M\0&\×.\è!€}„ÿ®¹\Ğ\í\Ûcüw­\è™öş»\ÆõLûP\íù%+\ÍG–ÿP\ËkN^»\ç2‘ùfŸ\Ö@§<\Ì\É+\Ø#p!±·‰9y?‘\Ï\à,Š\Ìon˜:%\ç\âQG	r:>rR*²7&DDNP…5!°úi-D\İkşSØ¿<Q›¨´\×\ì\\\ÎÓ†0-õı}/u÷;ô¤Aó°”‹\Ìü¹Dñ\0G›6¬<,­¨\'\×\ï9\î\×ø ~\0\ê\×\n	 †úh~\çñ=\é\ß	,²,û.e‡V\æ9Y™=ˆ\Öê›ˆ÷¯†\Õ\Û\\õ¾‰ T\ï›\n9;•^\æû&‚5X\ßD°\ZºFsÊšJ	Š\Ü7\Ë ÿ&€ˆhñF€†ohñF€ú‹w7d8ñF°\È\Ú\à5µ,\Ş<BùUßƒ\Ê\â\0‘µÁ©]ñ7£C\ß+\í¿\Ü \Ş\n9AuñFP\È\Ùio¡TB…\å¥Á\ZF¼ a\Ä\ZF¼ a\Ä\ZF¼ ş\â\İ\rN¼,²6xM-‹7D–*‹7P´\á¨xÃªÿ\íâ To…œŠ ú—T‹œ \nË‹7‚PŠ¡`AqS‚\ZF¼\r#\Ş\Ğ0\â\0\r#\ŞPñ\î†\'\ŞY¼¦–\Å\"Ëƒ•\Å\"k\ÃQñ†\Åø\Û\ÅA!\'¨.\Ş\n9;Aõ:‡`‘TayñF° ^z‹7<D‰hñFD4Œx#@Ãˆ7\Ô_¼»!Ã‰7‚E\Ö¯©eñF€\Èò\àAeñF€\È\ÚpT¼aüvñFP\È	ª‹7‚B\ÎNEP½x#X\äUX^\ê¬a\Ä‚\Â\ì-\Ş<ò¬\"Jš†oDDÃˆ7\Ô_¼»!Ã‰7‚E\Ö¯©eñF€\Èò\àAeñF€\È\Ú`÷Ùšı¢\è\í©\ã†\"À\î38\ìj@\'\rI\Â‹\0¯ù†\ç\æ(\ï\Ş\Òxˆ@l(lˆ¤ü\à6vO\n\ëDH\Ø\Òı\0»tJ¦ó–“«Îƒ/\î\0Lm”\ÔÓ7\æôPù¸O²‡ŒŸúag\ì\ì;Ë­5s@\È\ì*\0ÁA´s ¨8\Öc\Ûs>\æA8TUÜ†ÿ\ÛTøl½Å‡gNN>L\Æ^OŠN`²\îD´5^D\æ¬T‹\ÅVx¿;	6\ÂW]j\Ø/n=\Ö88W\ì›|»r\Ï=Ù½in™9lğ[\Û=\â->\Ãò\Ö\Ù\à—ïºƒ\æ\Ø¸\Ô\å¡\ßoO\ëu\â¢™™M…9÷ÿ[s)\ï™3k¾?\çIòÁ±5-wÍ&|£İ·\ã\è“Sk©µL›\Çç°<9fÀLq\ÙwiƒhûlŸ®ynÎµ\Ìÿ¥´ıÎ«=-\\·#Ö¥Û¯<\ã=\Ô5v\Ö};|R\ïş\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0\İü•7f\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·ó\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ\0\0_rels/.relsPK-\0\0\0\0\0\0!\0\Öd³Qú\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\04y>\Í\0\0ş\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\0\0word/document.xmlPK-\0\0\0\0\0\0!\0–µ­\â–\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0û\n\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0pP sµ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ä\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0(Õ\'†\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0JØŠ’»\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0E–}\0\0\Ö\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0Ã³ò4p\0\0\İ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ş\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\02³0\0\0ù9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¥\0\0word/styles.xmlPK\0\0\0\0\0\0Á\0\0\í#\0\0\0\0',NULL),(7,25,'Mehatronika',NULL,'Predavanje o mehatronici.',NULL,'2018-07-27','13:15:00','308','Pasta Italiana (K.L.A.IN. Robotics)','oko za oko pasta za zube',NULL,NULL);
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
INSERT INTO `stavka` (`id`, `naziv`, `opis`) VALUES (1,'Logo - pano','Logo kompanije na reklamnom panou partnera Fakulteta'),(2,'Logo - broÅ¡ura','Logo kompanije unutar broÅ¡ure Fakulteta'),(3,'Baner - strana partneri','Baner kompanije na zvaniÄnom sajtu Fakulteta, na strani partneri'),(4,'OglaÅ¡avanje - dogaÄ‘aji','MoguÄ‡nost oglaÅ¡avanja dogaÄ‘aja, takmiÄenja i drugih struÄnih skupova'),(5,'Predavanja','MoguÄ‡nost organizacije struÄnih predavanja 2 puta godiÅ¡nje (jednom po semestru)'),(6,'Opis','Kratak opis kompanije na zvaniÄnom sajtu Fakulteta, na strani partneri'),(7,'OglaÅ¡avanje - posao','MoguÄ‡nost oglaÅ¡avanja ponuda za izradu projektnih radova, struÄnih praksi i zaposlenja na reklamnom panou partnera fakulteta, internet stranici fakulteta, listama elektronske poÅ¡te i druÅ¡tvenim mreÅ¾ama');
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

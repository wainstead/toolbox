-- MySQL dump 10.10
--
-- Host: localhost    Database: mpa
-- ------------------------------------------------------
-- Server version	5.0.27-max-log

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
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(10) unsigned NOT NULL default '0',
  `firstname` varchar(30) NOT NULL default '',
  `lastname` varchar(30) NOT NULL default '',
  `gender` char(1) NOT NULL default '',
  `birthdate` date NOT NULL default '0000-00-00',
  `country` char(2) NOT NULL default '',
  `postalcode` varchar(10) NOT NULL default '',
  `income` tinyint(1) unsigned NOT NULL default '0',
  `sid` varchar(50) NOT NULL default '',
  `directorylist` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `userid` (`userid`),
  KEY `birthdate` (`birthdate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (142687,'SUPER','PICKLE','','1983-12-23','aq','99999',1,'',0);
INSERT INTO `userinfo` VALUES (142698,'asdfasdf','asdfasf','','1983-12-27','us','11372',0,'',0);
INSERT INTO `userinfo` VALUES (142700,'','','','0000-00-00','','',0,'',0);
INSERT INTO `userinfo` VALUES (142774,'Jessica','Hanley','F','1978-06-09','us','10001',0,'',0);
INSERT INTO `userinfo` VALUES (142804,'','','','0000-00-00','','',0,'',0);
INSERT INTO `userinfo` VALUES (142807,'Chris','fucker','M','1983-12-27','us','11211',0,'',0);
INSERT INTO `userinfo` VALUES (142821,'Dashon','Williford','M','1975-10-10','us','10128',0,'',0);
INSERT INTO `userinfo` VALUES (142825,'Trevor','Stow','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142837,'Jacob','OD','M','1983-12-27','','',0,'',0);
INSERT INTO `userinfo` VALUES (142862,'Trevor','Stow','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142863,'J','tre','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142875,'Test','Name','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142876,'J','Name','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142877,'J','Name','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142878,'Test','Name','F','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142879,'J','Name','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142880,'j','nam','M','1983-12-27','us','10001',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142894,'San Antonio','Legends','M','1983-12-27','us','78023',0,'www.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (142899,'Eric','Partington','M','1983-12-27','us','48360',0,'www.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (142900,'YK','Sun','F','1983-12-27','my','46000',0,'www.myphotoalbum.com',1);
INSERT INTO `userinfo` VALUES (142902,'Urvesh','Bhowan','M','1983-12-27','ie','3',0,'www.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (142903,'dave','y','M','1983-12-27','au','3023',0,'www.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (142904,'Juan','Gonzalez','M','1983-12-27','es','28000',0,'',0);
INSERT INTO `userinfo` VALUES (142907,'w','l','F','1983-12-27','am','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142908,'s','kl','F','1983-12-27','bh','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142913,'s','l','F','1983-12-27','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142914,'s','l','F','1983-12-27','at','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142919,'dfs','sdfsdfsd','M','1983-12-27','az','05544',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142920,'Jessy','Hanley','F','1983-12-27','us','10704',5,'admin.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142921,'j','m','F','1983-12-27','bh','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142943,'jdsfj','djfhsjf','M','1983-12-27','af','45465',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142944,'dkfhj','kdfghj','M','1983-12-27','au','45454',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142945,'whoops','whman','M','1983-12-27','az','45355',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142947,'Jacob','DF','M','1983-12-27','at','43235',4,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142948,'wham','wham','M','1983-12-27','at','04259',5,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142949,'wwho','whiwh','M','1983-12-27','bf','44554',3,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142950,'whammo','whammpo','M','1983-12-27','au','34545',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142951,'wham','wham','M','1983-12-27','az','34235',3,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142952,'wham','wham','M','1983-12-27','at','34234',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142953,'jdfs','fdg','M','1983-12-27','au','45635',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142954,'dfkjhs','djfshdkjf','M','1983-12-27','bh','345435',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142955,'jdfhg','dfhj','M','1983-12-27','bs','324342',2,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142957,'Jacob','ODonnell','M','1983-07-17','us','11211',0,'',0);
INSERT INTO `userinfo` VALUES (142958,'Geetha','Vincent','F','1983-12-27','my','47830',0,'geethz.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142959,'gold','heart','F','1983-12-27','bs','44444',3,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142960,'dfgsdfs','sdfsdfsdf','M','1983-12-27','er','53454',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142961,'boo','ya','M','1983-12-27','az','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142962,'Jessy','Hanley','F','1983-12-27','au','10704',1,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142963,'wank','wcwank','F','1983-12-27','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142964,'Super Duper hot 17actiongrrl','Kali in Azer By Johnny! woot','F','1983-12-27','az','2222',0,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142965,'fdg','dfgdfg','F','1983-12-27','aw','43545',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142966,'dfgfdg','dfgfg','M','1983-12-27','bs','435345',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142967,'Ed','King','M','1983-12-27','us','02809',0,'ejk002.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142975,'d','d','M','1983-12-27','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142977,'wank','wcwank','M','1983-12-27','bh','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142978,'woo','hoo','F','1983-12-27','bh','10001',3,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142979,'sdf','df','M','1983-12-27','az','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142980,'swanin','knknk','M','1983-12-27','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142981,'winin','ini','F','1983-12-27','az','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142982,'swain','stead','M','1983-12-27','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142983,'Wank','WcWank','F','1990-12-18','bs','54545',1,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142988,'wank','wcwank','M','1988-12-18','bh','',0,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142990,'Club','Member','F','1988-11-19','bh','2121',2,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142991,'First','Name','F','1989-12-19','bs','',2,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142992,'Wank','WcWank','M','1988-12-19','bs','1111',2,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142993,'Wank','WcWank','F','1921-10-19','az','21212',5,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142994,'Test','User','F','1988-12-19','bh','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142995,'Test','User','M','1989-12-18','az','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142996,'Test','User','F','1988-11-18','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142997,'Test','User','F','1988-12-19','ai','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (142998,'Jessssica','Hanley','F','1978-06-09','us','11223',4,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (142999,'Syntax error','in all.headers.default','M','1989-11-18','bs','23232',3,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143003,'no','albums here','M','1933-12-17','az','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143005,'some','username','F','1953-11-17','af','23132',4,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143011,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143013,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143014,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143017,'Fernando','Marte','M','1982-12-17','us','11372',0,'unknown',0);
INSERT INTO `userinfo` VALUES (143018,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143019,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143023,'Nathan','Butler','M','1980-10-04','us','11211',5,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143030,'asdf','gdfsf','M','1953-11-17','az','',0,'ksdjf.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143032,'Polgy','Olopo','F','1962-12-18','at','',0,'ksdjf.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143033,'asda','asdads','M','1971-11-16','bs','',0,'ksdjf.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143035,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143036,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143037,'Jessy','Testy','F','1978-07-06','us','10704',0,'us.f504.mail.yahoo.com',0);
INSERT INTO `userinfo` VALUES (143038,'MSX','FM','M','1970-01-01','aq','00000',1,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143039,'ima','test','F','1988-11-19','bs','32323',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143040,'bi','solnat','F','1988-11-19','az','12121',5,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143041,'oyri','pqtv','M','1988-12-17','bh','23232',5,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143042,'junglist','ADVENTURE','M','1988-12-18','au','12345',1,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143043,'i hate','copy and paste','M','1988-12-19','az','',3,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143044,'i want','cheese','F','1989-12-19','bs','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143045,'you have','no soul','F','1988-12-18','bh','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143046,'asd','asd','M','1981-02-02','as','4235',0,'ksdjf.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143047,'sdfs','sde','F','1988-11-18','bh','324234',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143049,'Poor','Ocklo','M','1992-12-18','az','',1,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143051,'dfs','gfsdg','M','1989-10-17','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143052,'s','sdf','F','1988-12-18','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143053,'s','df','F','1988-12-18','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143054,'dsa','wer','F','1988-12-19','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143055,'d','d','M','1989-12-19','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143056,'sdf','dfg','M','1988-02-02','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143058,'s','dfsgs','M','1988-12-18','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143059,'chris','ferry','M','1977-12-08','us','11211',1,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143060,'sdf','sdf','F','1988-12-19','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143061,'ads','dsfs','M','1988-12-18','bs','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143062,'Hoopy','Doop','F','1945-11-08','us','44129',2,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143063,'dsfgfsd','sdfsd','F','1988-10-18','bh','',0,'ksdjf.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143064,'aaaabbbb','aaaabbbb','M','1958-02-04','us','78701',0,'admin.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143065,'aaaabbbb','aaaabbbb','M','1960-04-07','us','78701',0,'admin.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143066,'aaaabbbb','aaaabbbb','M','1951-05-23','us','78701',0,'admin.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143067,'Badass','Beer','M','1978-03-31','ca','V4L 1X2',0,'search.sympatico.msn.ca',0);
INSERT INTO `userinfo` VALUES (143069,'Patrick','Healy','M','1985-09-13','us','61377',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143071,'Donna','Emmerson','F','1952-02-15','ca','V9N 6C7',0,'search.sympatico.msn.ca',1);
INSERT INTO `userinfo` VALUES (143072,'my guitar','gently weeps','F','1933-11-18','bs','32323',5,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143073,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143074,'a.','Brizzille','M','1984-06-26','us','75043',0,'search.msn.com',0);
INSERT INTO `userinfo` VALUES (143078,'Matt','Harris','M','1976-04-29','us','10011',0,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143080,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143081,'Mark','McDonald','M','1982-09-26','us','04259',0,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143082,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143085,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143086,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143087,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143088,'lenny','duque','M','1981-08-30','us','11364',5,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143089,'Wank','WcWank','F','1923-11-18','us','90210',5,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143090,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143091,'il','duce','F','1922-11-19','it','43434',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143095,'Jessy','Hanley','F','1978-06-09','us','12345',5,'contests.myphotoalbum.com',1);
INSERT INTO `userinfo` VALUES (143096,'Wank','WcWank','F','1954-02-16','az','23234',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143099,'aaaabbbb','aaaabbbb','M','1973-01-15','us','78701',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143104,'breanna','davison','F','1982-11-24','us','89433',1,'search.msn.com',0);
INSERT INTO `userinfo` VALUES (143107,'Slide','the Show','M','1978-07-18','us','11111',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143110,'adfgsafd','asdfsadf','M','1969-08-04','us','12345',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143111,'aaaabbbb','aaaabbbb','M','1967-02-02','us','78745',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143117,'Oh Look','it is Flash','M','1977-09-17','am','43432',2,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143119,'Jessy','Hanley','F','1989-05-09','us','12345',0,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143120,'Jessy','Hanely','F','1989-02-02','us','10704',0,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143121,'Taj','Mahal','F','1977-01-19','bs','21212',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143122,'Jessy','Hanely','F','1989-07-13','af','12345',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143123,'Jessica','Hanely','F','1989-08-14','us','10704',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143124,'Jessy','Hanely','F','1920-10-13','us','10407',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143125,'jes','hanler','M','1990-04-08','us','10407',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143126,'kathir','vel','M','1984-02-02','in','637409',2,'ragavraj.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143127,'Andre','Accelerator','M','1970-01-01','us','10001',3,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143128,'Coupon','Test','F','1934-01-16','au','323456',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143131,'The','Clash','M','1955-02-17','aq','',2,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143132,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143133,'We Are A Happy','Family','F','1992-01-16','am','22121',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143135,'Somebody put something in my','drink','M','1920-11-19','au','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143136,'Chinese','Rocks','F','1936-02-13','aw','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143137,'Goes To','Bitburg','M','1963-08-28','at','',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143139,'Walt','Kelly','M','1922-02-14','as','21212',1,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143145,'Jessy','Hanley','F','1978-06-09','us','10001',0,'whoozie.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (143146,'MyFirstName','hanley','F','1928-03-08','us','10001',0,'whoozie.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (143147,'FirstName','Hanley','F','1961-04-12','us','10001',0,'whoozie.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (143148,'FirstName','Hanlye','M','1949-06-12','us','10001',0,'whoozie.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (143151,'Fernando','Marte','M','1976-01-01','us','12345',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143152,'jing','Zou','F','1982-01-23','uk','TW20 0EX',1,'jingjingzou.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143154,'Kimberly','Richards','F','1970-07-02','us','46835',1,'highergroundsonline.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143156,'Signe','Varbhein','F','1974-12-07','ee','50704',1,'tupsuemme.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143157,'Suvini','de Silva','F','1987-11-04','lk','12000',0,'search.mywebsearch.com',0);
INSERT INTO `userinfo` VALUES (143158,'Ravi','Umbrey','M','1983-06-03','au','2077',0,'airumbrey.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143159,'Christen','James','F','1983-04-05','us','14613',0,'christen.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143160,'Barbara','Singer','F','1957-09-10','us','10002',0,'bsinger.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143162,'Amy','Heard','F','1973-09-22','us','76148',0,'heardfamily.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143163,'Mohammad','Malik','M','1981-02-19','us','77536',0,'mtashi.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143164,'sharon','davis','F','1978-01-05','us','29209',5,'jasmineanderson.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143165,'Cassandra','Lim','F','1986-09-23','sg','550537',1,'san86.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143166,'Hooha','Blippyland','F','1965-01-17','us','11111',0,'hooha.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143167,'India','Sucks','M','1978-08-17','us','23233',0,'hooha.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143171,'Fmarte','Marte','M','1949-01-19','us','12345',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143175,'Fernando','Marte','M','1981-01-01','us','12345',0,'fernando.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143177,'Christopher','Painter','M','1984-09-20','us','37849',1,'wiki.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (143178,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143179,'mpa','testing','F','1970-01-01','us','10001',1,'unknown',0);
INSERT INTO `userinfo` VALUES (143180,'uyen','le','F','1983-09-04','vn','',0,'search.msn.com',0);
INSERT INTO `userinfo` VALUES (143182,'chelsey','hillery','F','1988-12-05','us','76227',2,'www.google.com',0);
INSERT INTO `userinfo` VALUES (143183,'asdfsad','adsfsd','F','1974-06-13','us','12345',0,'www.myphotodevel.com',0);
INSERT INTO `userinfo` VALUES (143184,'jesere','asdfsfd','F','1967-05-03','au','',1,'www.myphotodevel.com',1);
INSERT INTO `userinfo` VALUES (143185,'taylor','wildgoose','F','1980-11-16','us','34234',0,'www.google.com',0);
INSERT INTO `userinfo` VALUES (143186,'Katherine','von Duyke','F','1959-06-15','us','19711',0,'wiki.myphotoalbum.com',0);
INSERT INTO `userinfo` VALUES (143187,'Sahida','OBrien','F','1988-05-28','us','32825',0,'www.google.com',0);
INSERT INTO `userinfo` VALUES (143188,'Ramon','Sobrino','M','1986-11-15','us','75007',1,'www.google.com',1);
INSERT INTO `userinfo` VALUES (143190,'Jessy','Hanley','F','1978-06-09','us','10704',0,'joinnow.myphotoalbum.com',1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-11-15 16:09:31

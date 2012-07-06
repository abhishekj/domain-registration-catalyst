/*
SQLyog Community v9.51 
MySQL - 5.5.16-log : Database - temp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminID` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `reseller` varchar(255) NOT NULL DEFAULT '',
  `dated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`adminID`,`password`,`reseller`,`dated`) values (2,'admin','43e9a4ab75570f5b','','0000-00-00 00:00:00');

/*Table structure for table `bank_details` */

DROP TABLE IF EXISTS `bank_details`;

CREATE TABLE `bank_details` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(225) NOT NULL,
  `bank` varchar(225) NOT NULL,
  `deposit_method` varchar(225) NOT NULL,
  `amount` float NOT NULL,
  `reference_no` varchar(225) NOT NULL,
  `deposit_at_branch` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bank_details` */

/*Table structure for table `domain_searches` */

DROP TABLE IF EXISTS `domain_searches`;

CREATE TABLE `domain_searches` (
  `ds_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ds_users_id` int(11) NOT NULL,
  `ds_search` varchar(255) NOT NULL,
  `ds_dated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) NOT NULL,
  PRIMARY KEY (`ds_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `domain_searches` */

/*Table structure for table `domains` */

DROP TABLE IF EXISTS `domains`;

CREATE TABLE `domains` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_users_id` int(11) NOT NULL,
  `d_order_id` int(11) NOT NULL,
  `d_domain` varchar(255) NOT NULL,
  `d_expires_on` datetime NOT NULL,
  `d_registered_on` datetime NOT NULL,
  `ns1` varchar(225) NOT NULL,
  `ns2` varchar(225) NOT NULL,
  `ns3` varchar(225) NOT NULL,
  `ns4` varchar(225) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `domains` */

/*Table structure for table `flagcode` */

DROP TABLE IF EXISTS `flagcode`;

CREATE TABLE `flagcode` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  `c2dcode` varchar(255) NOT NULL,
  `ccode` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;

/*Data for the table `flagcode` */

insert  into `flagcode`(`cid`,`cname`,`c2dcode`,`ccode`) values (1,' Afghanistan ','AF','93 '),(3,' Albania ','AL','355 '),(4,' Algeria ','DZ','213 '),(5,' American Samoa ','AS','684 '),(6,' Andorra ','AD','376 '),(7,' Angola ','AO','244 '),(8,' Anguilla ','AI','1'),(10,' Antigua and Barbuda ','AG','1'),(11,' Argentina ','AR','54 '),(12,' Armenia ','AM','374 '),(13,' Aruba ','AW','297 '),(14,' Australia ','AU','61 '),(15,' Austria ','AT','43 '),(16,' Azerbaijan ','AZ','994 '),(17,' Bahamas ','BS','1'),(18,' Bahrain ','BH','937'),(19,' Bangladesh ','BD','880 '),(20,' Barbados ','BB','246'),(21,' Belarus ','BY','375 '),(22,' Belgium ','BE','32 '),(23,' Belize ','BZ','501 '),(24,' Benin ','BJ','229 '),(25,' Bermuda ','BM','441'),(26,' Bhutan ','BT','975 '),(27,' Bolivia ','BO','591 '),(28,' Bosnia and Herzegovina ','BA','387 '),(29,' Botswana ','BW','267 '),(31,' Brazil ','BR','55 '),(32,' British Indian Ocean Territory ','IO','284'),(33,' Brunei Darussalam ','BN','673 '),(34,' Bulgaria ','BG','359 '),(35,' Burkina Faso ','BF','226 '),(36,' Burundi ','BI','257 '),(37,' Cambodia ','KH','855 '),(38,' Cameroon ','CM','237 '),(39,' Canada ','CA','1 '),(40,' Cape Verde ','CV','238 '),(41,'Cayman Islands ','KY','345'),(42,' Central African Republic ','CF','236 '),(43,' Chad ','TD','235 '),(44,' Chile ','CL','56 '),(45,' China ','CN','86'),(46,' Christmas Island ','CX','6724'),(47,' Cocos (Keeling) Islands ','CC','61 '),(48,' Colombia ','CO','57 '),(49,' Comoros ','KM','269'),(50,' Congo ','CG','242 '),(51,' Congo Democratic Republic of the ','CD','242'),(52,' Cook Islands ','CK','682 '),(53,' Costa Rica ','CR','506 '),(54,' Cote d\'Ivoire  C?te d\'Ivoire ','CI','225'),(55,' Croatia ','HR','385 '),(56,' Cuba ','CU','53 '),(57,' Cyprus ','CY','357 '),(58,' Czech Republic ','CZ','420 '),(59,' Denmark ','DK','45 '),(60,' Djibouti ','DJ','253 '),(61,' Dominica ','DM','767'),(62,' Dominican Republic ','DO','809'),(63,' Ecuador ','EC','593 '),(64,' Egypt ','EG','20 '),(65,' El Salvador ','SV','963'),(66,' Equatorial Guinea ','GQ','240 '),(67,' Eritrea ','ER','291 '),(68,' Estonia ','EE','372 '),(69,' Ethiopia ','ET','251 '),(70,' Falkland Islands (Malvinas) ','FK','500 '),(71,' Faroe Islands ','FO','298 '),(72,' Fiji ','FJ','679 '),(73,' Finland ','FI','358 '),(74,' France ','FR','33 '),(75,' French Guiana ','GF','594 '),(76,' French Polynesia ','PF','689 '),(77,' French Southern Territories ','TF','228'),(78,' Gabon ','GA','241 '),(79,' Gambia ','GM','220 '),(80,' Georgia ','GE','995 '),(81,' Germany ','DE','49 '),(82,' Ghana ','GH','233 '),(83,' Gibraltar ','GI','350 '),(84,' Greece ','GR','30 '),(85,' Greenland ','GL','299 '),(86,' Grenada ','GD','473'),(87,' Guadeloupe ','GP','590 '),(88,' Guam ','GU','671'),(89,' Guatemala ','GT','502 '),(91,' Guinea ','GN','224 '),(92,' Guinea-Bissau ','GW','245 '),(93,' Guyana ','GY','592 '),(94,' Haiti ','HT','509 '),(97,' Honduras ','HN','504 '),(98,' Hong Kong ','HK','852 '),(99,' Hungary ','HU','36 '),(100,' Iceland ','IS','354 '),(101,' India ','IN','91'),(102,' Indonesia ','ID','62 '),(103,' Iran','IR','98 '),(104,' Iraq ','IQ','964 '),(105,' Ireland ','IE','353 '),(107,' Israel ','IL','972 '),(108,' Italy ','IT','39 '),(109,' Jamaica ','JM','876'),(110,' Japan ','JP','81 '),(112,' Jordan ','JO','962'),(113,' Kazakhstan ','KZ','7 '),(114,' Kenya ','KE','254 '),(115,' Kiribati ','KI','686 '),(116,' Korea','KP','85'),(117,' Korea','KR','82'),(118,' Kuwait ','KW','965'),(120,' Lao People\'s Democratic Republic ','LA','856 '),(121,' Latvia ','LV','371 '),(122,' Lebanon ','LB','961 '),(123,' Lesotho ','LS','266 '),(124,' Liberia ','LR','231 '),(126,' Liechtenstein ','LI','41 '),(127,' Lithuania ','LT','370 '),(128,' Luxembourg ','LU','352 '),(131,' Madagascar ','MG','261 '),(132,' Malawi ','MW','265 '),(133,' Malaysia ','MY','60 '),(134,' Maldives ','MV','960 '),(135,' Mali ','ML','233'),(136,' Malta ','MT','356 '),(137,' Marshall Islands ','MH','692 '),(138,' Martinique ','MQ','596 '),(139,' Mauritania ','MR','222 '),(140,' Mauritius ','MU','230 '),(141,' Mayotte ','YT','269 '),(142,' Mexico ','MX','52 '),(143,' Micronesia','FM','691 '),(144,' Moldova','MD','373 '),(145,' Monaco ','MC','377 '),(146,' Mongolia ','MN','976 '),(148,' Montserrat ','MS','664'),(149,' Morocco ','MA','212 '),(150,' Mozambique ','MZ','258 '),(151,' Myanmar ','MM','95 '),(152,' Namibia ','NA','264 '),(153,' Nauru ','NR','674 '),(154,' Nepal ','NP','977 '),(155,' Netherlands ','NL','31 '),(156,' Netherlands Antilles ','AN','599 '),(158,' New Zealand ','NZ','64 '),(159,' Nicaragua ','NI','505 '),(161,' Nigeria ','NG','234'),(162,' Niue ','NU','683 '),(163,' Norfolk Island ','NF','672 '),(165,' Norway ','NO','47 '),(166,' Oman ','OM','968 '),(167,' Pakistan ','PK','92 '),(168,' Palau ','PW','680 '),(170,' Panama ','PA','507 '),(171,' Papua New Guinea ','PG','675 '),(172,' Paraguay ','PY','595 '),(173,' Peru ','PE','51 '),(174,' Philippines ','PH','63 '),(176,' Poland ','PL','48 '),(177,' Portugal ','PT','351 '),(178,' Puerto Rico ','PR','787'),(179,' Qatar ','QA','974 '),(181,' Romania ','RO','40 '),(183,' Rwanda ','RW','250 '),(184,' Saint Barth?lemy ','BL','590'),(185,' Saint Helena ','SH','290 '),(186,' Saint Kitts and Nevis ','KN','869'),(187,' Saint Lucia ','LC','758'),(189,' Saint Pierre and Miquelon ','PM','508 '),(190,' Saint Vincent and the Grenadines ','VC','784'),(191,' Samoa ','WS','685'),(192,' San Marino ','SM','221'),(193,' Sao Tome and Principe ','ST','503'),(194,' Saudi Arabia ','SA','966 '),(195,' Senegal ','SN','252'),(196,' Serbia ','RS','381 '),(197,' Seychelles ','SC','248 '),(198,' Sierra Leone ','SL','378'),(199,' Singapore ','SG','65 '),(200,' Slovakia ','SK','232'),(201,' Slovenia ','SI','386 '),(202,' Solomon Islands ','SB','677 '),(203,' Somalia ','SO','597'),(204,' South Africa ','ZA','27 '),(206,' Spain ','ES','34 '),(207,' Sri Lanka ','LK','94 '),(208,' Sudan ','SD','249 '),(209,' Suriname ','SR','239'),(211,' Swaziland ','SZ','809'),(212,' Sweden ','SE','46 '),(213,' Switzerland ','CH','41 '),(214,' Syrian Arab Republic ','SY','268'),(215,' Taiwan Province of China ','TW','886'),(216,' Tajikistan ','TJ','7 '),(217,' Tanzania United Republic of ','TZ','255 '),(218,' Thailand ','TH','66 '),(220,' Togo ','TG','266'),(221,' Tokelau ','TK','690 '),(222,' Tonga ','TO','676'),(223,' Trinidad and Tobago ','TT','868'),(224,' Tunisia ','TN','216 '),(225,' Turkey ','TR','90 '),(226,' Turkmenistan ','TM','7'),(227,' Turks and Caicos Islands ','TC','235'),(228,' Tuvalu ','TV','688 '),(229,' Uganda ','UG','256'),(230,' Ukraine ','UA','380 '),(231,' United Arab Emirates ','AE','971 '),(232,' United Kingdom ','GB','44'),(233,' United States ','US','1 '),(234,' United States Minor Outlying Islands ','UM','1'),(235,' Uruguay ','UY','598 '),(236,' Uzbekistan ','UZ','7'),(237,' Vanuatu ','VU','678 '),(238,' Venezuela Bolivarian Republic of ','VE','58 '),(239,' Viet Nam ','VN','84 '),(240,' Virgin Islands British ','VG','809'),(241,' Virgin Islands U.S. ','VI','1'),(242,' Wallis and Futuna ','WF','681 '),(244,' Yemen ','YE','967 '),(245,' Zambia ','ZM','260 '),(246,' Zimbabwe ','ZW','263 '),(247,'other','','');

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_users_id` int(11) NOT NULL,
  `h_type` int(11) NOT NULL,
  `h_comments` text NOT NULL,
  `h_dated` datetime NOT NULL,
  `h_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `history` */

/*Table structure for table `history_type` */

DROP TABLE IF EXISTS `history_type`;

CREATE TABLE `history_type` (
  `ht_id` int(11) NOT NULL AUTO_INCREMENT,
  `ht_explanation` varchar(255) NOT NULL,
  `ht_dated` datetime NOT NULL,
  PRIMARY KEY (`ht_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `history_type` */

insert  into `history_type`(`ht_id`,`ht_explanation`,`ht_dated`) values (1,'domain insertion ','2009-06-03 19:17:46'),(2,'transaction insertion ','2009-06-03 19:18:21');

/*Table structure for table `hosting_plan` */

DROP TABLE IF EXISTS `hosting_plan`;

CREATE TABLE `hosting_plan` (
  `hp_id` int(11) NOT NULL AUTO_INCREMENT,
  `hp_price` varchar(255) NOT NULL,
  `hp_active` varchar(255) NOT NULL DEFAULT 'enabled',
  `hp_flag` enum('l','w') NOT NULL DEFAULT 'l',
  `hp_description` text NOT NULL,
  `hp_name` varchar(225) NOT NULL,
  PRIMARY KEY (`hp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `hosting_plan` */

insert  into `hosting_plan`(`hp_id`,`hp_price`,`hp_active`,`hp_flag`,`hp_description`,`hp_name`) values (1,'250','enabled','l','hi \r\n   test test test','test1'),(2,'652','enabled','l','hi \r\n   test test test','test2');

/*Table structure for table `hostings` */

DROP TABLE IF EXISTS `hostings`;

CREATE TABLE `hostings` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_users_id` int(11) NOT NULL,
  `h_hp_id` int(11) NOT NULL,
  `h_domain` varchar(255) NOT NULL,
  `h_expires_on` datetime NOT NULL,
  `h_registered_on` datetime NOT NULL,
  `h_ftp_username` varchar(255) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `hostings` */

insert  into `hostings`(`h_id`,`h_users_id`,`h_hp_id`,`h_domain`,`h_expires_on`,`h_registered_on`,`h_ftp_username`) values (1,5159373,1,'www.om.com','2009-12-31 14:14:00','2009-05-27 14:14:05',''),(2,5159373,1,'www.omtest.com','2009-12-31 14:14:39','2009-05-26 14:14:45','');

/*Table structure for table `order_table` */

DROP TABLE IF EXISTS `order_table`;

CREATE TABLE `order_table` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_reseller` int(11) NOT NULL,
  `o_type` varchar(255) NOT NULL,
  `o_p_id` varchar(255) NOT NULL,
  `o_domain_name` varchar(255) NOT NULL,
  `o_years` varchar(255) NOT NULL,
  `o_active` varchar(255) NOT NULL DEFAULT 'enabled',
  `o_customer_id` varchar(255) NOT NULL,
  `o_contact_id` varchar(255) NOT NULL,
  `o_users_id` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `order_table` */

/*Table structure for table `payment_gateway` */

DROP TABLE IF EXISTS `payment_gateway`;

CREATE TABLE `payment_gateway` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_amount` varchar(255) NOT NULL,
  `p_user_id` varchar(255) NOT NULL,
  `p_gateway` varchar(255) NOT NULL,
  `p_currency` varchar(255) NOT NULL DEFAULT 'usd',
  `p_transaction_id` varchar(255) NOT NULL,
  `p_token` text,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `payment_gateway` */

/*Table structure for table `tld` */

DROP TABLE IF EXISTS `tld`;

CREATE TABLE `tld` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_category` varchar(255) NOT NULL,
  `t_price` varchar(255) NOT NULL,
  `t_tld` varchar(255) NOT NULL,
  `t_active` varchar(255) NOT NULL DEFAULT 'enabled',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tld` */

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `particulars` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `credit` float NOT NULL,
  `debit` float NOT NULL,
  `balance` float NOT NULL,
  `users_id` int(11) NOT NULL,
  `status` varchar(225) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_reseller` int(11) NOT NULL,
  `users_email` varchar(255) NOT NULL,
  `users_pass` varchar(255) NOT NULL,
  `users_customer_id` varchar(255) NOT NULL,
  `users_contact_id` varchar(255) DEFAULT NULL,
  `users_mobile_cc` varchar(20) NOT NULL,
  `users_mobile_no` varchar(20) NOT NULL,
  `users_balance_usd` float(5,2) NOT NULL DEFAULT '0.00',
  `users_dated` datetime NOT NULL,
  `modify_dated` datetime NOT NULL,
  `users_status` varchar(30) NOT NULL,
  `refer` varchar(255) NOT NULL,
  `users_name` varchar(200) DEFAULT NULL,
  `users_company` varchar(200) DEFAULT NULL,
  `users_address1` varchar(200) DEFAULT NULL,
  `users_city` varchar(200) DEFAULT NULL,
  `users_state` varchar(200) DEFAULT NULL,
  `users_country` varchar(200) DEFAULT NULL,
  `users_zip` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

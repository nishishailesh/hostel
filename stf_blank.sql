-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: hostel
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bed_allocation`
--

DROP TABLE IF EXISTS `bed_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_allocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bed_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date_of_allocation` date DEFAULT NULL,
  `date_of_deallocation` date DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  `recorded_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bed_id_student_id` (`bed_id`,`student_id`),
  UNIQUE KEY `student_id` (`student_id`),
  UNIQUE KEY `bed_id` (`bed_id`),
  CONSTRAINT `bed_allocation_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_allocation`
--

LOCK TABLES `bed_allocation` WRITE;
/*!40000 ALTER TABLE `bed_allocation` DISABLE KEYS */;
INSERT INTO `bed_allocation` VALUES (2,36,4,'2022-03-05',NULL,'2022-03-05 12:07:40',1),(4,35,NULL,NULL,NULL,'2022-03-05 12:10:44',1),(5,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bed_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel`
--

LOCK TABLES `hostel` WRITE;
/*!40000 ALTER TABLE `hostel` DISABLE KEYS */;
INSERT INTO `hostel` VALUES (1,'Physiotherapy Block 1'),(2,'Physiotherapy Block 2'),(3,'Physiotherapy Block 3');
/*!40000 ALTER TABLE `hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_beds`
--

DROP TABLE IF EXISTS `hostel_beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel_beds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel` varchar(50) DEFAULT NULL,
  `floor` varchar(20) DEFAULT NULL,
  `lobby` varchar(20) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `bed_number` varchar(10) DEFAULT NULL,
  `from_date_1` varchar(10) DEFAULT NULL,
  `to_date_1` varchar(10) DEFAULT NULL,
  `alloted_to` bigint(20) DEFAULT NULL,
  `items` varchar(100) DEFAULT NULL,
  `attachment` mediumblob DEFAULT NULL,
  `attachment_name` varchar(200) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  `recorded_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alloted_to` (`alloted_to`),
  UNIQUE KEY `hostel_floor_lobby_room_number_bed_number` (`hostel`,`floor`,`lobby`,`room_number`,`bed_number`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_beds`
--

LOCK TABLES `hostel_beds` WRITE;
/*!40000 ALTER TABLE `hostel_beds` DISABLE KEYS */;
INSERT INTO `hostel_beds` VALUES (36,'Physiotherapy Block 1','1','A','1','2',NULL,NULL,5,'Steel bed-1 , Wooden Chair-1, Wooden Table-1 Fan-1(common)','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0\n\Z\Z!.%+!&8&+/1555\Z$;@;4?.4514!!!14444444444444444444444441444444444441444414?4??4?ÿÀ\0\0¸\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0C\0	\0\0\0!1AQ\"2aq‘±¡#RrÁBbÑğ3‚’¢²4CSÒásÂñ$ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\'\0\0\0\0\0\0\0\0\0!1AQa\"2±‘ÿÚ\0\0\0?\0%ˆØ”¿I.x”ÛÄ‰F¯FrëJ½T€¹=ŞŞÚÔÖNÕ†ãxŸ¹,;kÑ›£‚ÆS×5\'Ó)zMnDÊO´jt¡é0JèÈÌ	ÓBy—Ó^SL]m+*V /bu°;íô‡ñ¡yDX’Ñ¨.\nx£ú\rD)G\Z¢¸¿\"l} <E°Õr« Lšè2}à‘­ä°§UÖÌtb*-‰6[6¼µ8ãX±Ó‹lF\Z‘¨ªe\"êŠPå$kbX@$Sk\nš~pSê.>\"9h96ó°^oPqpÚseÿ\02ÜB)UX]X0æ0táÓ†`‘2F2ÉŒi›,!\"))…aÜlEŒë6Mƒ±<,\"ÉxÏ²‹†SÍwÿ\0î>®){@ø¾§rÄÛ*ö›Û„Ø&ª6Ó1á¿ùË\"Š[_ÌtöİàöÈªÙi«‚,2”¶ãûÛ÷ğ…éPâÆşpÓ2DÃ7\"ÜûˆwïBJ”íºL¢ˆ©áTp×ÇY: ¢:…l@NÅx¡\0¢ŠñLaF4ti˜ÂŠr(yêo’8‘ÓßS|æ:•ĞùUj„}{¬wò<üŒ¶7zJõ$p&R¾ƒY4ksó‘ÊVÀâ´4ØëÀó‡¤¶£_iÕ5¹í`›T#‡kØ›Ú[€\Z™İ§„Àâñ­ºÕÎ‡rÙ­¨;çv÷‹ù„)µğTŸAj\"2‘V÷Q¾ÈDc#7ı•aIÍ†«Zàƒ/­Æo¬ˆèfÔÃ›Ğ«NºwSËúièÿ\0ØÊºÒ©Z™ş.£Éê=§E<Rnzu\0üji¹óeìÿ\0¦y[ô—†6Æa« âÅ ÿ\0ÓıP¦Ïé®\Z `	á{}\ZÇÚóEÓ|eFÀâiÔ ÊM&³«-D\'B=¦F®ÂÙÕ°•ªDª”Ã%‰¢ù…0{ºf×Îñ\\£dÕPÇS~ë©ğ=“ìdæbz-Ñ00Ô1f½FiÜÒ½•[˜;í¤½ö\\]=iº¸äİ“{ßMãw„GÜišpÀ	·j%…z/ÅFa¯å½ı„·OoĞm3ØêEˆóõ‰RĞSˆìàjM¦cit¾!ß_“ì Z{Gk`ğï”ÿ\0Ô»Aã®„y^4ËflÙã6ÊS–\Zq$ÓÛ‰\rö`ö¯d¸¶—ƒit›¯}¡ˆfz4Ö D !,*¤àdámğŸìç\rIpkåÜ¶óÁms»œ¢bäv+£ïUzÕÒù;<A><ÆøOgìÊtÅ© Q­ø±<I0¾Cvô¥OCë$…ÈÜuşcÿ\0Põ1`×w™ı!d’®Æ]	 ‘ˆñc¢>Fíá\0ø£oæ\0è§/xLvñ¤Å°â„WŠ( 1çÔ±Õ±”b¨uœ§I\"™YÆÿ\09hJÍÇÏõ–ÒìKğ@ÛÇq†ik”ùzé¸ÓÖ¤4O1úÎˆD¬Ÿßõ_˜WláR¥|:ÔPë÷º¥ì¶õßá;ş°¶×Â­J¸u¨.>ğï\"Ç(ÖâPšlµMiÔ¬œ‚ÔbƒüåŒ¶%E–²?ÿ\0\"e6ğ)aï9À­.+×Q»V5@\'u•´ƒ)mfÑ~Ğ¬yÔ¤QO‘C6é6Úd=-ÆÖ8<JT¥Ù4œfG\rÃyRŞÃT€Äºõ\"Ù”\\ZˆÔP—I«Tl%rQM\'í£Ü\r7å\"çÊğVÏ%°Íˆû,m¸QĞùü19K‘İ¢\nÀµÍ=Af+ÏE½…]4Öø;¡šìü/ä…HøıV:*:h4ƒñ{*“fv¦™ö°¹ó0Á]$u“³ê\"„Æl\r‹…\\C¿T]Ö¥L«bàË–Á»#¼xÍòT¬@\0%%ğ³··tyXÌÏEê33”I¯‰ï”Y”^ÃSºj\ní«Õk~û±oÍ¼9ièJìŠÂ!8³S3²ĞBÍìrÕ¹pİ¸J=\0ÿ\0’M-f­¥ê©M)ÚİJ^Í›µ–­îyî”zÿ\0%Oó?é\'KË4€h|ç{>‘ç»êgHø€Ãpï_ÑaE‚°½ÿ\0ëÂI\Zìyè” •+âÇœjcîe›…âçœ\r‚íçsAX¦ª@B›î+a¥ïy&h£œª÷p·+®ƒØ`	ãG^(NŞ+Èj×Eï²¯æ!~e\'Û4ìêÖŞì~“7€©o¤Í)ãßAæ`Çé**7\\¿V’¾-*.t7PxƒãÖPv´ÖI¿´ŒR…â‰–n@±®uŠÖ*›äŸEÉÁ•Îãçü¤ÒÎ[K±/ÁÇİëü¡Š{“ËùÀï¸ùÂÔ‰ısÑ\Z,á¼>¦Ø¢®Ie¹º1R;#ˆ‚©1HŞ>ÓÚxŠH5DK!åÊml¬m¥î4Å”é-4JÓÄTb\\\\3õ¶ßÀÌÖ­7LèAÜYJØù¯9`ìÀİ³Y”°Fí2K;‹wtMPj*Ğ|£M*/[¥ûb9Ë/:³+•1˜ŠËN¢[dpÁ\\İ<ÖYØ¸ªi€«NùOR©%‰ûv‹k+-:™…%Uz«Õ°^åˆ±mğfÈÃ«Ğ¨ì„2Ğì¥Ü’:£÷ÚièaœÈš•4×‡¡5Tà0Ê«f^#•á¦_ĞÌïì÷‰JƒVv7:è25Ò××I§{[ĞFÎI?¢4R:ãAù„™dy	a§¬&3½\ZÃ9©Rš³-«V&Ê\ZáŠ\\îß450´‡÷®Xÿ\0ÜúFÍDêu„.çV+½S‘×t,µpÃDT\'€U.ßQ)=®Ê5]\nbÍ2¹E$‘—Pµ/Ã_9Oö~¶Á&·œïñ–)ó¦-‚:ÚŠ2•:+ğå(ô-OÌà}  É§¿gúç:ß¯òœà?®\"pÄÜ7|ù(D:‡|ËÀÈßcÏEm²İh+da…rêÀ6\\„{o;ı%â)U\rb4kÚcémÜB1ÕµÊº›x™\n­µ–^e¹àÚTèİ0ã\"…½ï`mcÌÉ°» aÎpå‰ÒÜ-©3SiâÛ}FFÒ›¼ì}Z\Z×ôŒ´~ÏLûbÚu¢W«·ğÉ¾¢ûŞy±Á±ŞÆ8ìï?{Dı×è?·>Í.ÔÛ8W|õ6Rr€™ì=dx=§F¥Ò‚;eµíjYŸ]š¼¯ôKÜÛ~Q6êlf’Xğ[pû†<T¿ÀÙX#IœõtĞ2áf¾»Ø´6è%lBœËmÖ7÷ÓëŸ,E…àäS·Š\0ê\"u§(c„™RA¾W|äàÊ¼üÌ®—b__CaÎ‹é/vÃï¤èˆÑm¶|¿XiSgz!Ä±\"Ç¼‹»\\ï¡0Æúo±ùk‰èv6@ICT\r“¶¶&à››é”o)Ó­{ŒMî«Ûecœkjd¡ğÃ­{ .„òÈã¨ŞuÒ`kôohÓl†•K…Í•°vnÉÒAı™´t*˜“ŸAg{=‡\r{ZEİô6>ÍæÙÕU©¢¹ïG[`>ğ\\[H\'a;5BÂÿ\0s¥^ÙÈ:£jzi¯“+ŒÃí%Gz‹‰ÉLrÎÌ¨\r³¾î-Vz¥¯“&s“U)–à‘Årñ‡?AÇ¥t	¿ş\nVõï~¸¦ıFÓÒaÿ\0gOYh¹©ŸªºšY‡`Ş(yMGìû¬(VNdzHj=g]øZHª=ş±€ÃíK•©g[±$&v…ÔCØº÷µ:.G\"¹>m<¿hmìu<UeÂÓÈSÕš›Õ‚8Ú/øm6½MOğá­òL\n°²zÄ½JxætÈz„¸mÔ×M9Êk`)şwÿ\0ë0œv×!î1\n¥~ô\nhm˜eİbÚùÃŸ³\nµÚ•^°±¦z°ÖË{¶|¶ÿ\0ÙË0BfĞ\\c¯+-KéÊß2Ruõ…Šr|Ë×ƒ°í÷ä>aÉ_e\' VŞ[Ó>Ÿ3+FlyÍ^Ú?v}>fní9Ç©ÙÑ½!yÖ§¤¢N2é\0å|“¬’F8™\0,\'ÑÑ«ù¯Ä\ZD!±jÎOâ_ˆPqÌ­Xê?)ÿ\0p’»Êõ¿áùa\"àQK)¸y¦R‘×ŞHÆEK©y?‰ßå+só2re~~gæ<v%ø¡…ğÜ<‡Äš/a±Èó`åf¿•„¾“Âä§/‚ıabàH¸®\\c¶Í,OÚ0Ù«!%šÙiZİåK›Êtñ¡Â½µŞ<è¶6­WGû*v	+¢€t¶·{î•u>ÄIš}»B°¨\rJ‰¨^ÚPpXëd6}A‚úš¼YTÛ¶:šŸp2S·¿Ê	Äc6µVÌô(ŞÖÔ¥‡ˆÍŒp›TÛ³‡[qĞß‡k~h7£a–:CMÆ\Z¹grJ¢u«Ù»±.l}%N—8Z…\\43unÙH¤H§˜0Ì2,^ÄÚué½L8W`7ëmÇ.›¸J»ˆ(iÓq•l¬Ouì2ÚÖ×Np;Hy–ÍAı†™¾œR¤ÌM›Ğ	¥#Aéó1X}™^šdZ¡Lª‚ÃÆYLRñ5+§è.gÙ¬¨4õU<Û&¹µªâãÃÛI\ZxŒ=d-Ö=70q{Ow¿(SéaÖ¡Ä×³¢¯XûÓ1¾Tıâ<4…:›E.#T]?ÓTØ&¥G¬¸ŠôÙÚä#Ø.€Xà™:=‰Í£ˆ˜+üÃ¹†YÇàqq?{LE®Š.\n¹\0XiºEû2p€›[¬ki¨×[ó‘Tèö<‡Ú‡\\®´¢à)°ş#ï±öÑÂ\'W‡«†)›5^÷> Â©¦n\n›_MOëRe\'j©íRÃ:_@®P{‘sÎKı³·³î¼JWF°ò6‡rÑÑï·¤»xfmz¬‡Y(9ß&Rn4XÃw’§ÈòÛGîÏ˜ù™ÚÛsA¶Ïİ·§ÌÌáßïÎrêvtG@–ô’®²Ó¥’Ù.s)&äùÀŸñ$ğ¥şSÿ\0”­Ój·Æ? A¯ÖS:b\'(SİÃ5	ÒìIÿ\0µşVşraÒ¬AáKü§ÿ\0)–F“#ÊlŸBî¯g¨lÚÌôÑœÅA6Ğ_ÂÙ¨H [¾§_ìÁdAü#âØÛ›ó~“‘ğø.¹‹™CñçYŸ\0XNĞyˆ£énCâ(ÄÌZo÷sO|uI\"çXÈ×qó’ĞÈ‡9M>ÄÔ\Z7W€ä Ÿİ0¾è<£¢l´±¬ó€ÈêaA[Cù”+”3}¤fu¨…Ùò›Úät\'@c±t‹äe)¦òH¶„›Ê%ju‹R¥T!I²(\'x#M-œòøÎz\\…«mtc‘\'éã3{6“²;+ºØ¶ŠrÇ|JOZH–ä€ÿ\0’ÇG)6W§QYAopG	Úi\"ÉTKÏ–ÉÀ©R£;’·í9(9‹\ró[³Ù\nØ\0-À@6]1n­Ê‘ÈÛĞˆ])Ô°UAçšÃã|ë™Rz¦ØAªÕï¤¨0U÷E€$û˜ã€\'}WñÈ\0ı#`]Å|F	Ì£)åÀÊ”ªpäa_ìÄ¾¡ÛÅœÛçô5äQî”J”ú\n¢¥:’tx÷ÀvM½ì®7Xı\"9h|¢Pc„ƒ##x>ÑZfÉ2\r®r!µ©\ZHµ™M»]|Œu:¡åú‰•é;b3pe¹ô•Ñ™ºÚÎ‘©Zsº|\Z²á‘€ îİ¯™|¨C–¹¿p-Ï÷J5qnŠY5¿t5®8Ø$;?j\Z”¥d6¿il¦Ş#Hõğ.ÉGê_†ìuÙÛn^½W!®\\énñ”Uõkz_âzVõCæªwïŞ$Upénâ[ò‹[ÄZt/†ÒìæªFr‘æù90·=ß\"OBŸi{K©y‘=–À¢ã2á¨y¬ÿ\0´ÊIÑ3œ—² nÂ­É·ÎGÀœWJ[^QêiæåRé†ğÑåúZÙÓùŒÇí,cĞqNuÈ?h©?„XfŸdÕ¨Zj/®¯—\rÄƒ8Ú}+ĞY¤âäq²›xåªÜWØæù´¶ºcÌÛt4MÃÈE}©çc“3‰¿Ş9ã|‘÷É2ã\\éır‘“¿ÎHÛ‘>qã±låô0¶è< Rt0¾è<£¢LµxÇ:Eyâ™w|¬Ùm¼èwI:Í×· •±\'´Şf~?îÓQÃ´×İà$)6ø:\'äÒgÔê~ í«jHjSï)¾³=ˆÛ•Íìê<oõ1a±ÁF-§ïn†a¦™&k6_Ki½…e(Os-øîİ4x<z“zu”ƒ­ƒoó\0ŞyN í!–3\rÊn	CÏtèwSö\"ˆ®¸g·áö˜ıäÄkô0rÆÇ‘Òy>¤ø„¶f¼ˆ÷IéM T¢<ëÍqÓ%Z<öâ‹ê±É\0a«3#wYúB±Î½às\ZTòI¬²ÎŠ-ˆ“ió&ÄÕDRîl\0¹\'„ÌÉdƒ«œ4¦Ckôğ&”éú7$sËÂ­¶1ø8SáÕ¯¼çzÓœJm–ZŒÓIì^.=j:-¹‘¤Åô•”T ç*’¥†šé§ø+ş¬æõª[˜\Zÿ\0¨Éªa®™&Õ.noÂÆíòÖ?°TÆ1œÿ\0@ÄÚl‡-D$~%6> ËÔ6ÅÓ3??¥àüZi`/äu7°÷šwòáqöyzÚ?Ãú5«´èÿ\0Ü_fşQë´(>‹Pì=ÌÊ£Ş<¬ÒÂ%&Ó7½‡ÒjùZë¹|ˆú¬–ö–Ä«YÅJ,Ú(S‘í¨:n:ÊÇ´in¯ˆàK0ö2lNä@\ZÖ\\ÊA\"á†n¦ÒÂ×§”aªŒ€ß9a˜€NıóÏÔºu—äõô¢fTÏH»sh¦÷VğdYa:kŒNı\Zmå™L„ím æGñÓSîcOHêÔÁáÛòæCü(OÚ3ï0­ã•Çê&Ï\r‰ëj[.eîlEÀİ¿Yæõvş«fÁº6SİpÂü.İ=\n~í\0]ØpºŞPRúKÊtF)ĞN@ ±îu‘&ñæHè:íÙ>Ruo8ömÛ½ç\Z;\']½[,\'C¡@\0ÏâªåÏÀ—¨æ°”–% ›cO\0œ­[Ç÷½£‘2A‡¼qLİF7 ßyó0ˆÇxßÌÍÅ\\\0c®‡œK€ÆMÍg‚Š–92”ö(Èô“TÙ›(><& a$ƒ!™~X/Ã×ÙF­³ÈŞ\'£6\ryJXœ	Rg­CØ$xp–ií4¨¤şSEŠÙ\\„ˆÙüÄW*»E&êzeœ=—µEıÈš<Kê.•Xs“çÊa\0AÌ·˜Òu1µG‡=Æ&Úe•Uü‘ëØ-µ‡®¶Î¡îÖSé>ĞÊ”éÜK1×R\0ÔO;Ãc»¬ä{&¦îú1&ÀØ“{^-|ŠÆÚ_ì3ñáVéf¿f`°ôè­lAN±ÆnÕ¯®ª(İ§Ò\ZiÙB»µ·h]ÓÏ1›Thg#@Zärƒ±‡}E€ó´y§„¥cí’©•MÓÏÑ£Ú}*¨ÍjmoA~]•Š\"zÁgsq­´^fsÕ®kñ$\\^i° 5n·ûş¥9{³–„©W;q„ËkÕTî:Èö[ØÈ«l÷Ä‰Â‚ÇËõ‹	Š©M­‚ë¡7_c:£çµü–O7SôÄù—‚Ëà#+¾\0ò…(ír{è­â;&K[H©Ê¯šÛ­ï:WÊÒ¯£“ü-y|rÛÎAL\nÓ¤ùH0şÕÅUF[°ì&›Åò‹Ü+h\\9-ºÀ{B›hv¼•~òµësã£ÛøóµsÙO\r·jŠ©IÀş§é,Vûô™|T†»\'¬ã”ºû1<¤”åu†«²ğÕ’®RÊf±*¢ßr(öP/356uµw9¥mJ>\\5Ù²™iN‚)-=ÃÈEC;Hëë;Uµ‘Ó:úÅ]íËı$Ë’¶ïIKánNî2ÂWVì†¶ëƒ§bÑÂ[²5>|!”ò-2,íÖ7ŞPõ*Z	\0ò—©¬éS‚-äâ¤xHõê°€ƒ$è§&É%T˜ÅaNwª–‚ÄDÆ*õqJ\\Ë\ZÉ1Õ0ğ~#gƒÂd‘µ9Œd1;0ğƒ+à<&íğ÷”±\0xLl˜\Zû42öÅ¦Ê1$\\Zú0î#gkºSêrã#­üKè¿È”brñ>[âzJ7€O %úÎ€Xk¨¥‚\'œº’ËÂ\r9–ğ²Áu0ä‚°¶–Òiöu;PDü9~ªë9K§j[DM¿Êé\Z°§‚ymòÅ‹0>’u$ğúÂUğÅ¸J®–šVQ©©Cà}¤é@oúîev¦(ü-3\0İ™~oúJ2e½«P‹q0†×nÑü£ı¢ÄÖf,7ŒÚšÛ¶ÃOP¤\"ÆÆÜŞÀ™™ˆe\')â!¤Æş!o(ÓĞµÙ& v®ríCoañÔÄ#÷/™~±Ö%†BhÚ!‰w¥0”y/[Š}MWú/À§²ê7x»_xff¿¹›ÁRÂa€\"dÍàpšœªs;#‡¤Ò`©–³0 Ûâ\\¥@	8HªyÉe\rD´™$Y\"Çr¤xX—œp˜Ç-’*ñFûáÀ2EiÜ²RÀZqwCƒdfXÛIxN„€$œiIfÑ¥@ÖúxÀb¹IS’½N\n=Oé#ÎxÁ“`£ˆ^\0@A,Âş3XT	W³Qûëí§Ä­Ë%íyàpŠT/.®\rxKÂˆ[\04\ZZtR´Éa$fòÛ>GNˆác­ù{Â¥/¾GS\rŒt—‘^AÏM¼åz˜U>óÓqâ<7ûqR	ÓÖm¾Ÿ`zø#À{Hğ¸b7\"~Ğ(:™]ğYlTï¾œ!œã~¢j	Ô}L\'µ—¶ş6µ(° 2ÛQ¯\ròıl=İ˜î¾’z¾\niğ§‡°¾ ÉEV>p‰¥ ©Hr“VĞÍ&T5*?ˆ|‰ ÄÔ³4Ï¥Ú~qóbFg#™™ÖL–k~qH¾ÌyŸyÙ|’Ú9<SİæbŠ¨r(L8G¬QLbJKÂYUİ;d;0>¥Ï;E 8Lz$QL0²iŠ(3?/y[èbŠ#\n\ZRÑ9Ë„-x¢€#NøÎ( 0šäOOÖv(LDVûã_xõ\Zx¢…‘\ZN½Û0ñĞÿ\0#ôf,Àd#/=ßE™e6†Ò­ZT’¬®\rû,G“	Ø¢PòUûr+©tnMİôaúÉİ..5î5Êr)\"ˆ¬´ûkù‡Ì¾´ó17ÜOÌQE]†º\'êÛñÈ¢•ÿÙ','index.jpeg','2022-03-07 12:22:23','1'),(37,'Physiotherapy Block 2','1','B','1','2',NULL,NULL,6,NULL,NULL,NULL,'2022-03-07 16:05:22','1'),(39,'Physiotherapy Block 1','1','A','10','2',NULL,NULL,8,NULL,NULL,NULL,'2022-03-11 16:22:47','1'),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-03-17 12:38:43','1');
/*!40000 ALTER TABLE `hostel_beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_tables`
--

DROP TABLE IF EXISTS `record_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `recorded_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_tables`
--

LOCK TABLES `record_tables` WRITE;
/*!40000 ALTER TABLE `record_tables` DISABLE KEYS */;
INSERT INTO `record_tables` VALUES (2,'student',0,'2022-03-04 15:40:32','1'),(4,'hostel_beds',0,'2022-03-04 15:40:32','1');
/*!40000 ALTER TABLE `record_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll_number` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `identification` mediumblob DEFAULT NULL,
  `identification_name` varchar(100) DEFAULT NULL,
  `recording_time` datetime DEFAULT NULL,
  `recorded_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roll_number` (`roll_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (4,853045,'Nirajbhai Patel','9664555812','E2 Bharuch Surat ','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0\n\Z\Z\Z\Z!\Z ,$)  \Z&6%).0333\Z\"9>91=,2302)$)02284222222225442222222222022242222222222202222222ÿÀ\0d\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0E\0	\0\0\0\0!1AQa\"q2‘¡#Rr‚±ÁBbs¢Ñ’³%345“£²ÂğCScáñÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0(\0\0\0\0\0\0\0!1Aq2a\"Q¡BÁñÿÚ\0\0\0?\0¹¢\"\0\"\"\0\"\"\0\"\"\0\"\"\0\"\"\0bW›²¡v¥k\0.µ¯§®–¯v›Z í\\Ì¼Ÿ7Î>Î?‡ƒ¢\" \" \" \" \" \" \" %y³M¶Ç™®>dËWXCm°½Ş¸ş—2|ıÇßúø,hˆ”\"\"\0\"\"\0\"\"\0\"\"\0\"\"\0\"\"\0\"\"\0bW¿ß4ÿ\0›[ü—–<­éôÍ/æÖÿ\0&¤›QÜ}¡eà²b\"R0ˆˆ\0ˆˆ\0ˆˆ\0ˆˆ\0ˆˆ\0ˆˆ\0ˆˆ‰ZÓ?éš_Í­şUIeJ×şù§üÚÿ\0åÕ“j;±_‚Ëˆ‰HÂ\" \" \" \" \'•jT±àÎ„è;\rLùÃâ¢GŒ.¬¤Aæã\0=â\"\0\"\"\0bVx}±Kù¸úkK2Vû3mkı–®ßÔëúÉu(ûø,˜ˆ•\"\"\0\"\"\0\"\"\0\"\'›8\'@8PÃ‹JK¡Ê€€XğˆQ~‚ä÷;;h2ƒl=V–ş5£–VÌ4â£°¶öûo¢Ôi°¨X‹²êª†¶nÄ€,8ß¼hâÚª }B¨¦½r)	òÌ@ìŸ&TŸ¢ŒX›\\ôËÍØƒccn£ˆ’¦Üıí8vtÄ–dvö…À$­Cï5¸•nÜá©–ypuNTÄSÍöY²·øZÆi‘’àÊxåÉÙ‰‹ÌÍ>e{»bûR¡èµÿ\0Î’­¹µ ª«.@¾U7±×@XŒ¢ıç‡DsR\Z¹Ú÷|åIÌn}çS¯	6f·GéÙ¤p¹òM¢Gö^ÑcTRpú«0ÆR¼hÃ^äIŞ2RV…”\\]31Q<ªTU˜…\0\\’l\0É<ú&ÃYUïnó5vÈ‡êğ¯Û·ï¿nƒ×œÔ±áÍÒ$c}Ô]pàşG¸_Âºó6ò2µ6åJÇÆíSŸˆøİAáv¼å=BÆäŞ|È§–R.†Äúw,nMçÌDÈÔAfíœN\ZŞÆ« ¸|H{:|,eƒºÛõOÂp)V:\r|ğÀŸ²}	•|òÄSÌ;he”L²aŒ½—×r¯R¥³dpmØÓ@¿0Iø™æèÖÍR¦NvBGbÆå¼ôò‘ÛÛ1©ì‡´DÈåÁ>Ñğ“b<Bì[÷Ÿ8*VÆ¥\'fu½Eñ©@H6¿dšRöf¤ ’~‰>Ç®¿´©Vw­L7±Ñ®4àrsí%Ò\'³¨‹E3ù¹6Y*Ãñ0ÔVã1511Â¾%P]˜ÃÌô‰=„Õ;Y~ÃÛ®P>Dßå8ä—gT[é½øÇû<1@ljKbÌ|¬2ş)WìıŸSP­1Ü“î¨ïı¤·é®i„k…G$j,È5PlÔİÌ\0¡‡@l€w=Ø^Ç°\ZzI2½Ò,Â¶ÆÎVriõ•lª?SóŸ8½Ê¦EéÔe<³Y”ùØ<şS‰W‹ÚÕ\rDoe…„/›+\0}àƒßcÔØ„”nÆïÔÁgSˆ5i°B™B0æ¾#Ärì\"mF›™Çà*P¨R¢Ù‡¨#ªbyápÏQÅ:jY\0?óAŞY[É²†\"‰\0}bÈ{+äGÎÓ[t6P¥DT#ë*\0Ä!N¡G¥‰î{DÛÈû¸56nåÓP\rv.ßeIU¢Ì|ô\'İ|öVîïÿ\0TÜÛU+­8tW@¡ˆ\0\\êÆç[\rmÎAŸníLÅS-JúÜS+¯G§î=;GQÉ››ctM0^“>Ë~Wşò(èA ‹¡·pX¤­Ij!º:†èyãî$#|vpF\\§¸>éüÇÂ$¢<]‘ıßÄµ,e\"¦ÙÜS7àEC–ÍÛ6RO+^wjÓ¤Äø•F¸#Ä3S\nE‡rdKÅJ²èF ÷\Z‰ÔÄ›­b?÷= òrmú|bMş)şš&Ô*§ö‹Ss+¥t|JµÙ˜¡±P§N‡Ë,“Ê_q¶×ì˜°¬mJ½‘º+şã|tònÒèĞÅ$ãÁdÔ™ˆ‰©‘ÆbÅÚ«ë©D¯`»[1=-Òi¶ÒuÕéYzç×ú”œ÷Zweé»)À Qcë=q8QS.kØknıó¬Šm¶ÏB	$ˆ~ö:TzN¤e\nOİ¨.B3I­T¥O\nŸ\"- Ûß‡Zn¹x”cıIk÷ĞëĞI¾¸©M*ªÃñ\0bglm£’4vb,”©)g [İQ¢¢‹]‰\0\\k<öVÕaTQ­J­`J­U+sGRUû€n\'cgÔ§A+ã*›fb·µÈJlQQz’ùˆó“B¶ñPÆÓ¨Y*S²ËrixˆR¤ØÚàŒx‹Í6ERo–e¾NÚ\\.ÎÄ@7×®±358›om­Ä]½ÔEg¨äqŠ	6Òç¼ÓÀíåwöUR­2àø1­µÊYôÔÊv6;RÃQ©¬lÕO¼EÛÙ‚B\"\0.o«ØjKš{RÚ¸m¢¯@lÊlÊTøj)©·?1c5Ù|³’\\´¸G–ÇÙ‰†CN™ú¼ìè¿`>¥Gl×·œåo’EğßàÂv¶mBÔ¶kÑ”G¡pwÖ°ˆë”|XÈL¥öoÊßÀyş’k±we«\'´wËN¥4°ì|I×Eñf·‹$+Àyş’ÇÀ{s†¤EÅ5¦·U¸$\Zæ½ïÇNœD“TÂpRáš[GpÃ%©U9‡\0àXş%µ¾M7?i=l8Z·©eT97â[5ûÎm:/L««ClÀ’tkxµàGi¯†Ú\"ÕZw°ÄQ\nÃøé—(|òæ¢o‰Ó1Í¢w²2;·0íM¿hN³.{[ByXFkSÇ¡ãp}d¤‰Æîø¹jD(ã‘½ßÂFª;X–“äÆÛ´S‹*J¤VûÙö•ÚŞè²$\Zÿ\0Q”‘n>ÓLĞcâ§ª÷Byy‘‰rÎÄñ$ŸRn~dÏ¼)éTZ”Í™MÇO#Ô%òW\\}ğªÇf §«%B¬·Åzˆº[Ú¯yÀo\r|N5CPJgF¥7Èe,Òå…Á¹l }ã©“,&7\r‹F97aj”ôl×\0{Œ¨Òà_…ç¦b-M*aEÃeM3àHPKÄ)`.§t_$ûd•{şÉ­€¾èNBã(=¥Bı3ÔÏº\r¯ÚŞ“j†%òŒôß¶ã‘*¦àÛˆ·Y‘­mõÄ²áp!ÊË”KUU¦ª¤.¹Önó•±7•1;V‰¡‡j\nŠC¡°9•\\6`=İ]yÎK6†Ï£Y\n¡AlújQï|ÈAs~<øk8Û?aa°AÜT$¿¾æÊX#3@\'_\r‰ë4¸[o¾?£:$¾ı;%X*ÀR/SÏÚ;0·Ä„on?Ú8¦™»XAŒôÚ»ÌXd¥ \Zµ€<ú™\Zf¾¤Üõ3	ÊÙ¼#J<{h=It`{\ZkËÙ ş%/ˆBîq6QæÆ[K‡Ä\"Ÿª¨×T\0æÑ¢›\\!dÕòÎjª‹sÂÚí+æz´±T±¬,‘Ô³L†±®3zÖÚµªµE |%ÂorÀ²‚§¦‡•øñ’]¯²©âB¥EÌ—$‹‘ÈÂÇŒ¹9iÚ%ÀÏ©ËØX¬ôVì-ĞØ‹ø	Q~„yÓ—§jÏ=ªtf`ÌÌNœ??í$öUªQmÓÑI±õ>³ÊX;ó¹Ç‰§Z˜ÕÃ+Û“¥74Üö%Uá•¯¶ •pT‹©B¬	šÈ2cqg£‹\"’-\rÓÙF¨Ãëf$ñU:…:şS¿9˜<yöIPŒÔÊÎœ…¿yxú‹ğà&æN Ì•àAiìº_YUå~Kú~s§>\0,GïúØĞOŠØ¤^$y0ÎfÛÂ‚n§#°#2ÚàÌv•Î08¨Â¡%”I$ü/ÊO+c½©%,Ö9n=Å<lO3Ø|¯ ûj¨öïâ¾ _©\0Ã†·‰#DjÏKÙ|ô˜ÄU¶œÿ\0I«‰ªXéÀ~Wã9\rŸhäÔVSb0=2oò<^&¥Cš£µB\rîìZŞY¸zM;x>]}g½G\0j`ß„q%Ùn~ÅMŞb.Ê.½‹\0/çm\'Æ3láé6J•Q[¦¤½n²ŠŞêÏMiÓQLeU-r_@‡@¿œŒWblª3\05$“k¤›Û¹¤soì¸wuÕ«L†§ìí˜†ñó×?ÎJdwrö	Áá•Ş£ï­Àcû«Ø|É\'œ‘K¡ª™I)I´f\"#™Ÿ&A7³r’µeÄ¢’Z²)±e\"ŞÑ9g]	S£eë¡A)öv2qvˆFÆÙU°@Ğ¨Áèæ½:ƒKf>ã©÷MõPnEÆ‚F¶æçTZŞÛ	QéÓfÌè„İz”^NW–½ZaV\0ƒ¡+¼ôÀ….ù••	úË$reMrLÂpÛÊ*Ãİ?úF}º¨±¨×I¿¨·§‹ØqŒ½TKêÅ›!ü,|G¥¤ˆo~‹İ½Tßòœí¡¾‚ÄRBOS ø~R{Hô%šÕ(¤zíšôp8u§L\0«Íœó=O2ebk’Å7êLèí©]ı¥Gò\ZÙGaÊMv&ç¢SW¨ˆõ9Åí}B€E´»0vV¹É?§~æ}©âŸcn’ÃÚÛ¯IÅ‚\nOÈ¨°õB$„jU2U]T‹€m˜vk9ÛÒqª>V­F!EÉ:\0É=\0\Z“$T72° øŒIö*£Â¦Æ£³h¢ß¸Ç^:K7t¶~h­l-5×Ş:Ôî¬ÌI‚/m$sékİ†‰â{}¦\Zä¦ÿ\0Œt›<qŒw2ı%9mDÈ<¦ÖëƒûM\Zäèµé¨xØüù™ÍÅ¾–ëúI )SÃibV…Sæ÷²FÜVï´6ªn1¤]bf`LÏTˆDD\0DD\0Ä¬>•°™k±g¨ì´Ğd¦”Ár\0K7y7mlùÉÛÛ\n–1i­Qp*ÖÀ‚§±,ã¹PĞ–×eIî Ï¹í¶¶[à±AÁ+{£}¤>ë§‘îñS~Î”\\]œd¤­\0@|À3»‚Şzôì–Æ>~/êœ(œRhëI“ìöS¨-V»¡Ì<ÊŸô¼ñÛ›–2™jN¬W\Z”?eÇ;Dƒƒ6hc]`MÇ	<˜kwì]­tnnß¯€©R‘\\ÊÀİè~–µú‹[„ĞÅâİ‰$’I<I&ääÏLf8ÔbÍ«X%ì k­´:“ÈpU…çe6ÒG#›‘ªôÍJ‹Mx³-1æäÌÉÖùSì×€jTÇ¢%¿9ÜšJØÄ«Q‚Ó¢\rgfá¦Š<Ë²Øq63©¼YjVı¡d5C¨`W0¦UuEíç¬\\Š ¾Ú#Õ7&‘rÄˆî–ù.5Ú“R4ê(Íï¤v½›äGy.’i«F2‹‹¦f\"\'Nˆ€ˆ€ÿ\0¤-ˆ¸Œ8{xé]®8ä>øV\roà·9OÕÃÔ¦Ä\rmÌiú1Ôc¨:ZRûÍ³g¬émÙ~ãjv\Zyƒ&Ïò*ÓËüHÚbùÿ\0Sİ*)àfZ˜<@>rC»[¹…ÅSpÙÒ¢7~*ÜV¸ãq¤•$ÊÛhàD“b~êõX€z\nŠËóR)ÊÄî¶>Ÿş˜©÷OÈå?(lg7£iã‰\Zq\0wÏÅƒc‡«å¿è&Í\rØÅÕñ=3I9³İxô_xü‡x(³»‘ÅÃX½³pÖ×Ğ‘}mÚæv1êéÙ¿Äow`Œ*¥Jd°÷X›6½8¯ÃœÎÑ4×¢¨ù™{‰.o”WÙë»•©ÒÆRj€ågU¬ÊÈäÙX}Û›2›‚¥®\r„½Äüé‹K¡—¾íã|%\n¼ÚšæûÀY¿¨nV¨æ¦4Ó:Ñ)%\0\01 ŸI8­:£éú_ÉÇâ“¹Äß\nğu„\nŸğÈcò&Hî‹Cã–Ù&R³£°¶™ÃU8¯ºãªŸÔqôšÄ„Ï†Òy§¦X[O|hÓ¤=«Zú¨/Èµ½€=\r§¾Ø»ø)Ò·B®OÇ8‘Ğ ‹é{b\'½¾KWÁ^Èı*[Ì›si\'®CÓ%H ‹‚ Û]”¸g¤â¥6e`nMˆ?ÛÏN²Òİ­¶1xræÂ¢]jÂöÑ‡f\ZüG)¥Ú©œİ³…ö”*\'2¤¼º˜üy¹¦zªŸé2}+üA½:$}œ¿á¸“dí	~qf½_tùm}T¾Ï¦>ËÔ_ùŒYR×6SåùËWè¯ı€1ÿ\01+Óö\Z‰¤DKHDDÕÆâ’’3»U$şOnpfjâ6…\ZfÕ*ÓCÑWó2´Şğ«T•¦Z>H¦Ì{»©Óî©·[È›×cÎ×é§ÿ\0²yê|rQ\r<Ÿ|Íe:Ÿêê#ıÖSùÆQMéŸŞV_ñ?YA‡*s‚C	<ˆÔKOèãnÔÅaØU9›ÏÍ”‹©oââ”î<Ên¨\\˜\\ÙW×77êø<çWmĞT©Uy­F[tÜËå9R9*t_jÄ hŸÈŸş¢>Yn,yÍÍÒÇµAOİ¨¦™óÔ©øÜ~)©5±QÖ âoU ˆÑg$Xg)Qwçl«İ›Aıı$\'P@ºÔ*µñX‹uã=jW­´+Ó¦‚Å‘u*·Ô³y’{IvÑÙ.µRfö>ÉG =“iv:\\­˜ó»ÉÁ¸ßé¢|îÚ¯È.§-G[‚=5—ÑŠ[gÓ=^¡ÿ\0˜Ãô‘­ìØŒÈØ“—8÷ÕEÆN¤Ÿxzp¼èım’CàÚßV3¡şo>Lxÿ\0iF\ZR Ïn6Xq,\"1*ÍúÛÆ¥CI‚™*-ÍÆŒç­Ô~#ÎX[wì0õ**¾¼Şş¢%UîIüäú‰Ò¤S§ÇosğyT{X\0K`É$›\0\0Ô’ys&KöÑ¾*¢†«]h“®@…ÈìÄ:€|¯=¾6(©Uñn.)ŸgL­v0¹=%¤\\X“VÆË™§Q*ªŸEØ‹Ûö¤eêQÁÿ\0cùÉÖìnú`hû4bÄœÌäX³X€Àk;‘7Œ#R\'–IK†Êãéd­5Z¨¶Îî\\ñ%Û+K+éıåœi¨×„¾ö–+ÓjN.¬,z„Dee¾û0øjui5ÊG$\0\Z÷U¨@àääVäI½˜eÅor(Ãš–ÖE\'Õ1pËÌxÇ—ÿ\0lòØ[&¦.¯°GDr¥—9`­®¢ÀëkŸ%2M‡ú9Ç«ÏDXßßs~ÇÁÏ„Æ8äú6–X®ÈÜñÅ/‡Êmâh”r¤A\"Çˆ ØƒÜIáP\\ÚgÓ5íWÑ~Ç¤˜UÄ¯Š­LÊXuQÙr/Auzr°›Ô}µ² B¢à9$f÷ìÔñõš?D˜¬ØJ”ù¥SğuSo„émŒ\nÓgrµ=–\\Ç!%T‚Å®º‹[†‚ÆY5pMFU6™ô€j•;0 ­€\"ÇÂ/§rg\'t÷})bêÕ¦ÌSÙä˜ÌÊE›˜ğŸ”ØÙmûFtÃ*¢)Êîn\rÈ¾ ø˜ÛÓ¼•à0KEr/™<Éêbcƒ|ø.HÕ#v\"%d„Ké\"¶\\¾ÕD_…ÛşÙSKSé6ğŠ~ÍT?Ëù°•d‹Qóş´ßä¸÷)àhûËíR_õ’ÃÜÚ¡°8r9ST>tüæ\'rWŠ#ŸÉ™ˆˆÂ˜œı¹ğõi}¤`>õ®§Ñ¬}\'FbqòGç|>-¨V§ˆ_y_áÄz®aë?AÒ¨C)¸`=AP{vZ•“’U¨£Éj0)pn#>ÏÃß*{?ød§ı²|®%Z…iHˆ}\"ì¬•EU?}lâ2Ÿ0Ò.}ïÙæ¶‚®gB*(N]¤©k¶”åjyOn ò\"e+4ÓÎã_£­¸ûÊ˜¬*S¨êùm)±BÜs0ä~R\\ßH8zÿ\0R(WúÀiİ…0¾1mläóé+y˜«4’¡¥‚2vÉ®åíU¡ˆ¨¯pµi£h	³%ï ×™áÒYtª\0©pG1 [?dSztq(Õö`ër‡2j\n“ÃSÂÒY»õ•¨€IV“q>†÷Œ×Mim~	%‰Áhˆ•™óÁ\ZØ*è¢ì:­L‡ÖÖõ”ºµÀ#×ã?BGo.É8LSÒ·Õ±5)Yû£º›¯ ë%ÔÇ¦W¦Ÿq&ŸF;L©†cªŸhÕ¬&×ñÉô ön=ğõR­3âC{9©ìF’ëØÛR*’Õ¦t:x«*İşÇœ|¸×èÏ>=²¿éDDÜÀÄDãï6Ö\\3Õ¿ŠÙPuvÑG§ØÆéYÔ­ÑLíê«bpjµî\rF±øZYßEÿ\0îôìõ-ÿ\0æL¨±oe·_Ò]Û‘€404‹1OhÀñ\rP— ùf·¤—2l«QÄR;äHÖÛİ\Z‹°ú·:’¢êOVNî=ä–%M\'Ù,dâíö×ÜÜU°_hƒ÷’çN¥}áğ uœ]›³Ş½AM§‰ä£›Â_Vœ}©‚DZ•ÖÈÊ¥Ø€,á6qÏÎ÷“ÏíÃRú‘Ì¬1LYB®¶:NëS†nlÌIë”•íe7ƒÆ~z)O)Kgf ª‡¸y“¡ä8IÅ$\n\0À\08\0!_äº9›\"”RG´DJIŒHö÷nêãhå¾Z‹v¦ÿ\0eºá<¡å$18Òj™ÔÚvÏU©½7jUP¥E6e?§\";\'Kaíº¸7ÏLè}ô>ëÈô#‘\Zú\\Ky·V5<~\n€Y*(—±ûKØõÒÒ©Û{»ŒÁ“í)ç¤8TK²Û¿4?xz™$±Jâ[±È¶Èµ¶&öá± \0ÂNhäá<Ó^ Içç1ŠR5¨Ãa`î@ZßÑÔ?(Ii—†]ûcxğØP}«ŒÜ‘|N|”pó6åQ¼ÛÂø·Îş[„KÜç«¾|Å(à?A:ûuñXæAJ<ê0!mü÷Ï–H‰)Ë\'	\rqÇù6}nnÃln)s/Õ!ç•‡ócò^ NfÃØô°”…*BÊ5$ñf<Y3ù 9N8mTM’{İ™ˆ‰¡™‰ßLVL+/7!==æş•i •ßÒ)ªU§‡M[D‘z¤X%ür}D¶Á×oƒ£©ôq„+‡z¬5ªå‡Ü_ùæ>²a5vvhÒ§I}ÔPƒğ‹_Ìñ›SLpÛ¦b\"h\" bÓ1\08XıÓÀÖ%Ÿ\rO1âÊ21ó)b}g,ıìûûåíj{É„Ep‹ğ2œ—LìıÏÀÑ!“„C=ÜƒÔ&Ç¸’\0\"fu$º8Û}ˆˆ8\"\"\0kâñI\Z£*©cä¯÷KØ¬mLEA¥;±éí*^ÀŠ·‹:ŸH;OÙÓZ@ñúÆòSá­¯á}ÒÙ_³a‘}c}cı÷ÔAeü2Y~yRğ¹şEíÁ3*DD\0DD\0DD\0DD\0DD\0DD\0ÄDåo&(ÒÂÕ`lrå¡r‹²j)° ªmÚH©œÔ==/sĞ·\\Ë>WßG8PÕq­î…¤¿Ì>I,†•=›Ÿläz3“¢\" \" \" \" \" \" $kªÁ±nŸıb\"e—àı3£SèÓı‘›™¬×ş‘ùI„D0ü ]ˆ‰©ÓÿÙ','indexx.jpeg','2022-03-17 11:27:32','1'),(5,2022002,'Nikhil','9494949494','E O2 Co2',NULL,NULL,'2022-03-07 12:19:12','1'),(6,2022003,'akash','1111222233','ok tata',NULL,NULL,'2022-03-07 16:06:30','1'),(8,2022005,'Akashram','1100909990','lank record / existing rec',NULL,NULL,'2022-03-11 16:20:35','1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_field_specification`
--

DROP TABLE IF EXISTS `table_field_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_field_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `ftype` varchar(50) DEFAULT NULL,
  `table` varchar(50) DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `field_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tname_fname` (`tname`,`fname`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_field_specification`
--

LOCK TABLES `table_field_specification` WRITE;
/*!40000 ALTER TABLE `table_field_specification` DISABLE KEYS */;
INSERT INTO `table_field_specification` VALUES (59,'bed_allocation','bed_id','dtable','hostel_beds','id','hostel,floor,lobby,room_number,bed_number'),(60,'bed_allocation','student_id','dtable','student','id','fullname,phone'),(61,'bed_allocation','date_of_allocation','date','','',''),(62,'bed_allocation','date_of_deallocation','date','','',''),(63,'hostel_beds','alloted_to','dtable','student','id','fullname,roll_number,phone'),(64,'hostel_beds','hostel','table','hostel','name',''),(65,'hostel_beds','floor','table','floor','floor','');
/*!40000 ALTER TABLE `table_field_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `expirydate` date NOT NULL,
  `authorization` varchar(300) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Hostel Superintendent','r1zL568TSSnhw','2023-03-04','admin'),(2,'Hitesh Patel','r1zL568TSSnhw','2023-03-04','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-17 13:01:15

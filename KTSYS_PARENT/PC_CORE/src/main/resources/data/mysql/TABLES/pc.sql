-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: pc
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `longCode` varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(16,0) DEFAULT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(45) DEFAULT NULL,
  `lastUpdateVersion` varchar(45) DEFAULT NULL,
  `lastUpdateIp` varchar(45) DEFAULT NULL,
  `depth` char(1) DEFAULT NULL,
  `longName` varchar(500) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `sysData` varchar(32) DEFAULT '0',
  `status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('1','0','0,1','中国',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V0.0.1',NULL,NULL,'0','中国','10.216.70.159','1',NULL),('2','1','0,1,2','山东省',20,'110000','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V0.0.1',NULL,NULL,'1','中国,山东省','10.216.70.159','0',NULL),('3','2','0,1,2,3','济南市',30,'110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V0.0.1',NULL,NULL,'2','中国,山东省,济南市','10.216.70.159','0',NULL),('347c885ccc8845888d413fa7396e50fc','ada6d329899946599cc59da978876120','0,1,ada6d329899946599cc59da978876120,347c885ccc8845888d413fa7396e50fc','宝鸡市',0,'2222','3','1','2017-07-27 13:35:06',NULL,NULL,NULL,'V0.0.1',NULL,NULL,'2','中国,陕西省,宝鸡市','10.216.70.159','0',NULL),('4','3','0,1,2,3,4','历城区',40,'110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V0.0.1',NULL,NULL,'3','中国,山东省,济南市,历城市','10.216.70.159','0',NULL),('5','3','0,1,2,3,5','历下区',50,'110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V0.0.1',NULL,NULL,'3','中国,山东省,济南市,历下市','10.216.70.159','0',NULL),('6','3','0,1,2,3,6','高新区',60,'110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V0.0.1',NULL,NULL,'3','中国,山东省,济南市,高新区','10.216.70.159','0',NULL),('90c93da8d81d4a209dc1ff058a72265c','347c885ccc8845888d413fa7396e50fc','0,1,ada6d329899946599cc59da978876120,347c885ccc8845888d413fa7396e50fc,90c93da8d81d4a209dc1ff058a72265c','panxi',0,'33333','4','1','2017-07-27 14:27:05','1','2017-07-27 16:16:10',NULL,'V0.0.1',NULL,NULL,'0','中国,陕西省,宝鸡市,panxi','10.216.70.159','0',NULL),('ada6d329899946599cc59da978876120','1','0,1,ada6d329899946599cc59da978876120','陕西省',30,'0002','2','1','2015-06-08 11:51:55','1','2015-06-08 11:51:55','','V0.0.1',NULL,NULL,'1','中国,陕西省','10.216.70.159','0',NULL),('e64ed80c84f04dfdb6eeb6954d955b23','ada6d329899946599cc59da978876120','0,1,ada6d329899946599cc59da978876120,e64ed80c84f04dfdb6eeb6954d955b23','西安市',0,'123','2','1','2017-07-29 11:50:49','1','2017-07-29 11:51:06',NULL,'V0.0.1',NULL,NULL,'0','中国,陕西省,西安市','10.216.70.159','0',NULL);
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `createUser` varchar(64) NOT NULL COMMENT '创建者',
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) NOT NULL COMMENT '更新者',
  `lastUpdateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `lastUpdateVersion` varchar(45) DEFAULT NULL,
  `lastUpdateIp` varchar(45) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `sys_data` char(1) DEFAULT '0',
  `status` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('03c759c875cd4e53a23dcf2acbdd5ff5','zz','中专','education','中专',20,'0','1','2015-10-08 14:48:14','1','2015-10-08 14:48:14','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('058b60b446f842bc85617912eb38e81b','2','中级','st_level','级别',20,'0','1','2018-02-01 11:25:49','1','2018-02-01 11:25:49','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('17','1','国家','sys_area_type','区域类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('17b612b153e249109525c46d286eb66e','bs','博士','education','博士',60,'0','1','2015-10-08 14:50:51','1','2015-10-08 14:50:51','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('18','2','省份、直辖市','sys_area_type','区域类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('18d0e2f1febb4e6cbc20c19f4e81dfeb','1','男','GENDER','男',10,'0','1','2015-09-16 10:16:00','1','2018-02-01 14:19:23','','0','V1.0.1','10.216.70.159','V1.0.1','127.0.0.1','0','0'),('19','3','地市','sys_area_type','区域类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('20','4','区县','sys_area_type','区域类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('226a3eb6f5b44cb891b1360c25f2a3cd','ss','硕士','education','硕士',50,'0','1','2015-10-08 14:49:48','1','2015-10-08 14:53:49','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('3','1','显示','show_hide','显示/隐藏',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('32','1','所有数据','sys_data_scope','数据范围',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('33','2','所在公司及以下数据','sys_data_scope','数据范围',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('34','3','所在公司数据','sys_data_scope','数据范围',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('35','4','所在部门及以下数据','sys_data_scope','数据范围',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('36','5','所在部门数据','sys_data_scope','数据范围',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('37','8','仅本人数据','sys_data_scope','数据范围',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('38','9','按明细设置','sys_data_scope','数据范围',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('39','1','系统管理','sys_user_type','用户类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('4','0','隐藏','show_hide','显示/隐藏',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('40','2','部门经理','sys_user_type','用户类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('41','3','普通用户','sys_user_type','用户类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('57c0ccc1cd9c493b843e5c2337d316cf','3','高级','st_level','级别',30,'0','1','2018-02-01 11:26:04','1','2018-02-01 11:26:04','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('599b4eebb7fe490eb3b8b5590b18860f','1','初级','st_level','级别',10,'0','1','2018-02-01 11:25:33','1','2018-02-01 11:25:33','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('67','1','接入日志','sys_log_type','日志类型',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('68','2','异常日志','sys_log_type','日志类型',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('7812e394115e4ed4a3fc83e5ec113970','gz','高中','education','高中',10,'0','1','2015-10-08 14:47:43','1','2015-10-08 14:47:43','高中','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('a87865bf316344f3bad37567feba0f46','bk','大学本科','education','大学本科',40,'0','1','2015-10-08 14:49:01','1','2015-10-08 14:49:01','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('ba6fe7a580774928aa68d7c05e25624a','ssyjs','硕士研究生','education','硕士研究生',60,'0','1','2015-10-08 14:53:38','1','2015-10-08 14:53:38','','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0'),('d2deabe7067c4875803b62856e64e844','2','女','GENDER','女',20,'0','1','2015-09-16 10:16:18','1','2018-02-01 14:19:33','','0','V1.0.1','10.216.70.159','V1.0.1','127.0.0.1','0','0'),('d3adda3358db4e59a38b2ae1fb29970e','zk','大学专科','education','中专',30,'0','1','2015-10-08 14:48:41','1','2015-10-08 14:48:41','大学专科','0','V0.0.1','127.0.0.1','V1.0.1','127.0.0.1','0','0');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_item`
--

DROP TABLE IF EXISTS `sys_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_item` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `dictTypeId` varchar(100) DEFAULT NULL COMMENT '数据字典类型ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(16,0) DEFAULT '10000' COMMENT '排序',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `sysData` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典条目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_item`
--

LOCK TABLES `sys_dict_item` WRITE;
/*!40000 ALTER TABLE `sys_dict_item` DISABLE KEYS */;
INSERT INTO `sys_dict_item` VALUES ('0e0acb903a374b7e94aff42917a475af','833b3f51311d45df8536b1f4100a3c7f','列表',10,'1','2018-09-12 20:16:18','1','2018-09-12 20:16:18','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('116c5e1f29074d358925ff10c35328cc','1175690bc8364937a33afe2a53832ca1','初级',10,'1','2018-06-05 15:25:26','1','2018-06-05 15:25:26','初级','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','0'),('1b3e4bf736244a4086abd218e2a9c957','833b3f51311d45df8536b1f4100a3c7f','内部地址',40,'1','2018-09-25 16:14:51','1','2018-09-25 16:14:51','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('25b0005f9753483cbd1df7c5fcc3cabb','29575fdb43334a6ca1ea9f3b7ed03dad','删除',30,'1','2018-06-20 16:30:09','1','2018-06-20 16:30:09','假删除','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('2f93b74a205a41608efeb22eef547c33','e7288453ca35420e885f4e285e21ce59','否',20,'1','2018-06-05 17:39:57','1','2018-06-05 17:39:57','可以修改','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('32429c1cfd364098addb618e3c818a53','833b3f51311d45df8536b1f4100a3c7f','外部地址',50,'1','2018-09-25 16:14:42','1','2018-09-25 16:14:42','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('389e1a7f28ef4500bb68d9dba14207d4','833b3f51311d45df8536b1f4100a3c7f','内容',20,'1','2018-09-12 20:16:28','1','2018-09-12 20:16:28','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('458790ac1041415ab085c9ed02e4094c','e7288453ca35420e885f4e285e21ce59','是',10,'1','2018-06-05 17:39:40','1','2018-06-05 17:39:40','是系统数据，不允许修改','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('502fa94eb9b64516aaff1f254e71654f','833b3f51311d45df8536b1f4100a3c7f','栏目',30,'1','2018-09-12 20:16:53','1','2018-09-12 20:16:53','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('5762263ba6e0478bae930ecb43080d17','29575fdb43334a6ca1ea9f3b7ed03dad','启用',10,'1','2018-06-20 16:29:27','1','2018-06-20 16:29:27','启用','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('62dac6f108124f18b34bffcd98e0f74b','8254a21043b247479c599de5f2e09183','初中',10,'1','2018-05-31 19:27:32','1','2018-05-31 19:27:32','初级学历','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','0'),('d41612be8867407da80de6d135cbc7a2','1175690bc8364937a33afe2a53832ca1','中级',20,'1','2018-06-05 15:27:50','1','2018-06-05 15:27:50','中级','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','0'),('d7914abaa52f49c49faf15752192e5e4','8d70612c673d4edd91bb511fa6d4b7b7','男',10,'1','2018-05-29 14:35:48','1','2018-05-29 14:35:48','男','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('e541ad28f12943a6be6bb9b735cc4a31','8d70612c673d4edd91bb511fa6d4b7b7','女',20,'1','2018-05-31 19:35:19','1','2018-05-31 19:35:19','女性','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('e847e08083f4457b8a06c6a44f308fd8','29575fdb43334a6ca1ea9f3b7ed03dad','禁用',20,'1','2018-06-20 16:29:38','1','2018-06-20 16:29:38','禁用','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c');
/*!40000 ALTER TABLE `sys_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(16,0) DEFAULT '10000' COMMENT '排序',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `sysData` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES ('1175690bc8364937a33afe2a53832ca1','security','密级',50,'1','2018-05-30 19:22:12','1','2018-05-30 19:22:12','密级：初级、保密、绝密','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('29575fdb43334a6ca1ea9f3b7ed03dad','status','状态',30,'1','2018-06-05 15:37:34','1','2018-06-05 15:37:34','状态：启用，禁用','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('8254a21043b247479c599de5f2e09183','education','学历',20,'1','2018-05-29 14:26:36','1','2018-05-29 14:26:36','学历：初中、高中、大学、硕士、博士','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('833b3f51311d45df8536b1f4100a3c7f','columns_type','栏目类型',10,'1','2018-09-12 20:16:00','1','2018-09-12 20:16:00','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('8d70612c673d4edd91bb511fa6d4b7b7','sex','性别',10,'1','2018-05-29 14:20:30','1','2018-05-29 14:20:30','性别：男、女','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('e7288453ca35420e885f4e285e21ce59','sysdata','系统数据',40,'1','2018-06-05 15:38:30','1','2018-06-05 15:38:30','系统数据：是，否','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  `remoteArea` char(200) DEFAULT NULL COMMENT '所属地区',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建记录人ID',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '最后更新人ID',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `lastUpdateVersion` varchar(20) DEFAULT NULL COMMENT '最后更新版本号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `lastUpdateIp` varchar(20) DEFAULT NULL COMMENT '最后更新IP',
  `status` char(2) DEFAULT '0' COMMENT '状态。',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`createUser`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`createDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_history`
--

DROP TABLE IF EXISTS `sys_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_login_history` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `loginIp` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `loginDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建记录人ID',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '最后更新人ID',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `lastUpdateVersion` varchar(20) DEFAULT NULL COMMENT '最后更新版本号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `lastUpdateIp` varchar(20) DEFAULT NULL COMMENT '最后更新IP',
  `status` char(2) DEFAULT '0' COMMENT '状态：0、成功；1、失败。',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_history`
--

LOCK TABLES `sys_login_history` WRITE;
/*!40000 ALTER TABLE `sys_login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parentId` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `longCode` varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) DEFAULT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `createUser` varchar(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateUser` varchar(64) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(45) DEFAULT NULL,
  `lastUpdateVersion` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `lastUpdateIp` varchar(45) DEFAULT NULL,
  `longName` varchar(500) DEFAULT NULL,
  `depth` char(2) DEFAULT NULL,
  `sysData` varchar(32) DEFAULT '0',
  `status` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parentId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('0f961b7a2b0f461faa7399d8d451ab75','6c0aa7ae6a3347dea96d4cc6aa6ab492','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492,0f961b7a2b0f461faa7399d8d451ab75','栏目设置',30,'/cms/columns',NULL,'<i class=\"layui-icon layui-icon-template-1\"></i>','1','','1','2018-09-11 17:00:57',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,CMS,栏目设置',NULL,'0','0'),('1','0','0,1','功能菜单',0,NULL,NULL,'','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单','0','1','0'),('11e1f4fb9ff14df1b7d3d4de7f0e4722','94b5cdface3740bd8f944356f10e8607','0,1,94b5cdface3740bd8f944356f10e8607,11e1f4fb9ff14df1b7d3d4de7f0e4722','CXF服务',30,'/server/cxf/',NULL,'<i class=\"fa fa-support\"></i>','1','2','1','2018-06-28 15:27:16',NULL,NULL,'CXF服务相关','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,服务管理,CXF服务','2','0','0'),('17','3','0,1,2,3,17','机构管理',40,'/sys/office/','','<i class=\"fa fa-sitemap\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:26:06','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,机构管理','2','0','0'),('1a4d4372adba4bc68912efeea74a0349','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,1a4d4372adba4bc68912efeea74a0349','SQL规范',50,'/doc/sql',NULL,'<i class=\"fa fa-user\"></i>','1','sql','1','2018-07-02 11:30:09',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,SQL规范',NULL,'0','0'),('2','1','0,1,2','系统设置',70,'','','<i class=\"fa fa-gear\"></i>','1','','1','2013-05-27 08:00:00','1','2018-03-13 23:21:35','','V1.0.1','V1.0.1','10.216.70.159','192.168.1.4','功能菜单,系统设置','1','0','0'),('20','3','0,1,2,3,20','用户管理',30,'/sys/user/index','','<i class=\"fa fa-user\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:22:22','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,用户管理','2','0','0'),('24','1','0,1,24','官方首页',80,'/f','_blank','<i class=\"fa fa-home\"></i>','1','','1','2013-05-27 08:00:00','1','2018-03-09 14:16:20','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,官方首页','1','0','0'),('3','2','0,1,2,3','系统设置',20,NULL,NULL,'<i class=\"fa fa-gears\"></i>','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,系统设置','2','0','0'),('33925e1329f247dd9d5f15907ab9f215','d180bb8fd56541d3af9037b75102cb18','0,1,d180bb8fd56541d3af9037b75102cb18,33925e1329f247dd9d5f15907ab9f215','模型管理',30,'/act/modeler/',NULL,'<i class=\"fa fa-life-ring\"></i>','1','d','1','2018-07-06 14:03:48',NULL,NULL,'模型管理','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,流程管理,模型管理',NULL,'0','0'),('3661424b920d489192125cb281837fe1','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,3661424b920d489192125cb281837fe1','Java规范',30,'/doc/java',NULL,'<i class=\"fa fa-user\"></i>','1','java','1','2018-07-02 11:28:36',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,Java规范',NULL,'0','0'),('4','3','0,1,2,3,4','菜单管理',30,'/sys/menu/','','<i class=\"fa fa-pencil\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:27:03','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,菜单管理','2','0','0'),('51e1e81ad3224da9bc11908be20cda32','1','0,1,51e1e81ad3224da9bc11908be20cda32','使用文档',100,NULL,NULL,'<i class=\"fa fa-book\"></i>','1',NULL,'1','2013-05-27 08:00:00','1','2018-03-09 14:16:20',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,使用文档','1','0','0'),('51e1e81ad3224da9bc11908be20cda41','3','0,1,2,3,51e1e81ad3224da9bc11908be20cda41','数据字典',10,'/sys/dicttype/',NULL,'<i class=\"fa fa-building\"></i>','1','sss','1','2018-05-29 13:48:06','1','2018-01-26 13:27:03','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,数据字典','2','0','0'),('554131d60c554308b105dba8b665db9f','6c0aa7ae6a3347dea96d4cc6aa6ab492','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492,554131d60c554308b105dba8b665db9f','文章管理',30,'/cms/article/',NULL,'<i class=\"layui-icon layui-icon-read\"></i>','1','','1','2018-09-12 22:26:55',NULL,NULL,'','V1.0.1',NULL,'192.168.249.62',NULL,'功能菜单,CMS,文章管理',NULL,'0','0'),('5e0d097ed5a64dd9a0aeff648dfd5175','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,5e0d097ed5a64dd9a0aeff648dfd5175','前端文档',20,'/sys/doc/front/',NULL,'<i class=\"fa fa-user\"></i>','1','ss','1','2018-07-02 11:23:42',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,前端文档',NULL,'0','0'),('67','2','0,1,2,67','统计监控',30,NULL,NULL,'<i class=\"fa fa-line-chart\"></i>','1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,统计监控','1','0','0'),('68','67','0,1,2,67,68','日志查询',30,'/sys/log','','<i class=\"fa fa-navicon\"></i>','1','sys:log:view','1','2013-06-03 08:00:00','1','2018-01-26 13:28:17','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,统计监控,日志查询','2','0','0'),('6c0aa7ae6a3347dea96d4cc6aa6ab492','1','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492','CMS',30,'',NULL,'<i class=\"layui-icon layui-icon-form\"></i>','1','','1','2018-09-11 16:59:43',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,CMS',NULL,'0','0'),('7','3','0,1,2,3,7','角色管理',50,'/sys/role/','','<i class=\"fa fa-users\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:28:03','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,角色管理','2','0','0'),('84','67','0,1,2,67,84','连接池监视',40,'/../druid',NULL,'<i class=\"fa fa-plug\"></i>','1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,统计监控,连接池','2','0','0'),('94b5cdface3740bd8f944356f10e8607','1','0,1,94b5cdface3740bd8f944356f10e8607','服务管理',30,'/x/f',NULL,'<i class=\"fa fa-server\"></i>','1','x','1','2018-06-28 15:24:16',NULL,NULL,'cxf服务管理','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,服务管理','1','0','0'),('a685aec9d5bb4ec3a9a0b99f9c7d5b5d','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,a685aec9d5bb4ec3a9a0b99f9c7d5b5d','Scala规范',40,'/doc/scala',NULL,'<i class=\"fa fa-user\"></i>','1','scala','1','2018-07-02 11:29:44',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,Scala规范',NULL,'0','0'),('a6c5448e81894e3b802771b226f5d923','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,a6c5448e81894e3b802771b226f5d923','JS开发规范',60,'/doc/js',NULL,'<i class=\"fa fa-user\"></i>','1','js','1','2018-07-02 11:29:11',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,JS开发规范',NULL,'0','0'),('d180bb8fd56541d3af9037b75102cb18','1','0,1,d180bb8fd56541d3af9037b75102cb18','流程管理',30,'',NULL,'<i class=\"fa fa-industry\"></i>','1','flow','1','2018-07-06 13:59:10',NULL,NULL,'流程管理','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,流程管理','1','0','0'),('d3e12dbf9e4f41739298f04aebc644ba','6c0aa7ae6a3347dea96d4cc6aa6ab492','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492,d3e12dbf9e4f41739298f04aebc644ba','留言管理',30,'/cms/guestbook',NULL,'<i class=\"layui-icon layui-icon-tabs\"></i>','1','','1','2018-09-15 16:25:14',NULL,NULL,'','V1.0.1',NULL,'192.168.249.62',NULL,'功能菜单,CMS,留言管理',NULL,'0','0'),('ec1aa74b11e542b19e4f43e8a15afa99','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,ec1aa74b11e542b19e4f43e8a15afa99','后端文档',10,'/sys/doc/backend',NULL,'<i class=\"fa fa-user\"></i>','1','222','1','2018-07-02 11:24:30',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,后端文档',NULL,'0','0'),('f4d9d0382140445599f00bfd509573ea','51e1e81ad3224da9bc11908be20cda32','0,1,51e1e81ad3224da9bc11908be20cda32,f4d9d0382140445599f00bfd509573ea','CSS规范',70,'/doc/css',NULL,'<i class=\"fa fa-user\"></i>','1','css','1','2018-07-02 11:28:00',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,使用文档,CSS规范',NULL,'0','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级编号',
  `longCode` varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  `longName` varchar(500) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `abbreviation` varchar(64) DEFAULT NULL COMMENT '简称',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `depth` decimal(10,0) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL COMMENT '机构类型',
  `grade` varchar(32) DEFAULT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zipCode` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `sysData` varchar(32) DEFAULT '0',
  `status` varchar(32) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `createUser` varchar(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(45) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `lastUpdateUser` varchar(64) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `lastUpdateIp` varchar(45) DEFAULT NULL,
  `lastUpdateVersion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parentId`) USING BTREE,
  KEY `sys_office_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('0ead2f0cc5a441eeba3c07f9792f7a65','e4e090f9ecb64b798d59963af7fdf994','0,1,e4e090f9ecb64b798d59963af7fdf994,0ead2f0cc5a441eeba3c07f9792f7a65','省软考办,河北地区,巨鹿郡','巨鹿郡',50,NULL,'0005',NULL,'','',NULL,NULL,'0','0','','1','2018-06-29 17:21:58','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('1','0','0,1','大秦帝国','大秦帝国',10,'ada6d329899946599cc59da978876120','100000',1,'1','1','','','1','0','','1','2013-05-27 08:00:00','10.216.70.159','V1.0.1','1','2015-11-13 10:25:43','10.216.70.159','V1.0.1'),('102e3d2ab026453bbe7deaf4bcc960b9','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,102e3d2ab026453bbe7deaf4bcc960b9','省软考办,测试,云中郡','云中郡',60,NULL,'00036',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:23:44','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('14112e3451f1491694d1e5b21749348a','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,14112e3451f1491694d1e5b21749348a','省软考办,测试,新秦中郡','新秦中郡',80,NULL,'00038',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:24:11','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('271d55a2622345ce9e265bc1aae6ab17','1','0,1,271d55a2622345ce9e265bc1aae6ab17','省软考办,淮汉以南','淮汉以南',50,NULL,'0005',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:22:25','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('2bb12eee6dd64bdb9539c8579fc4cf68','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,2bb12eee6dd64bdb9539c8579fc4cf68','省软考办,测试,北地郡','北地郡',50,NULL,'00043',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:23:26','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('368ae91449a14f06ad986e17aa3b7048','1','0,1,368ae91449a14f06ad986e17aa3b7048','大秦帝国,关中地区','关中地区',20,'347c885ccc8845888d413fa7396e50fc','00001',2,'2','1',NULL,NULL,'0','0','','1','2018-04-24 10:10:11','10.216.70.159','V1.0.1','1','2015-11-13 10:25:43','10.216.70.159','V1.0.1'),('47e70768a4de4d368f2fdad411e0d4f8','1','0,1,47e70768a4de4d368f2fdad411e0d4f8','省软考办,河南地区','河南地区',30,NULL,'00003',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:21:47','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('5e26edecfef243c4b25aaf444f89059e','e4e090f9ecb64b798d59963af7fdf994','0,1,e4e090f9ecb64b798d59963af7fdf994,5e26edecfef243c4b25aaf444f89059e','省软考办,河北地区,带郡','带郡',70,NULL,'0005',NULL,'','',NULL,NULL,'0','0','','1','2018-07-02 09:16:14','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('65908955f13245d8b6f2d67547bc8d2e','e4e090f9ecb64b798d59963af7fdf994','0,1,e4e090f9ecb64b798d59963af7fdf994,65908955f13245d8b6f2d67547bc8d2e','省软考办,河北地区,云中郡','云中郡',20,NULL,'0004',NULL,'','',NULL,NULL,'0','0','','1','2018-06-29 17:11:51','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('7f0dd40f12e9470da5341ffa597c6089','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,7f0dd40f12e9470da5341ffa597c6089','省软考办,测试,陇西郡','陇西郡',10,NULL,'00021',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:22:57','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('95190b65385b49c3aace599af7d4de75','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,95190b65385b49c3aace599af7d4de75','省软考办,测试,上郡','上郡',30,NULL,'00034',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:23:13','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('9f11d054818d4b159029841c4922a58a','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,9f11d054818d4b159029841c4922a58a','省软考办,测试,九江郡','九江郡',80,NULL,'00008',NULL,'','',NULL,NULL,'0','0','','1','2018-07-02 09:19:23','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('a747f8d28c9042799cb0bea412b231ca','368ae91449a14f06ad986e17aa3b7048','0,1,368ae91449a14f06ad986e17aa3b7048,a747f8d28c9042799cb0bea412b231ca','省软考办,测试,九原郡','九原郡',70,NULL,'00037',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:23:58','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('c50cfca0f6fb48ebb60feeaa3f1a4fae','e4e090f9ecb64b798d59963af7fdf994','0,1,e4e090f9ecb64b798d59963af7fdf994,c50cfca0f6fb48ebb60feeaa3f1a4fae','省软考办,河北地区,雁门郡','雁门郡',60,NULL,'0006',NULL,'','',NULL,NULL,'0','0','','1','2018-06-29 17:22:35','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('dfe3b214c21d4dee9113ee8fca2eaafb','e4e090f9ecb64b798d59963af7fdf994','0,1,e4e090f9ecb64b798d59963af7fdf994,dfe3b214c21d4dee9113ee8fca2eaafb','省软考办,河北地区,邯郸郡','邯郸郡',40,NULL,'0004',NULL,'','',NULL,NULL,'0','0','','1','2018-06-29 17:14:14','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('e4e090f9ecb64b798d59963af7fdf994','1','0,1,e4e090f9ecb64b798d59963af7fdf994','省软考办,河北地区','河北地区',40,NULL,'0004',NULL,'','',NULL,NULL,'0','0','','1','2018-06-28 18:22:09','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL),('ff9e9692131649818182254610a7d2f5','e4e090f9ecb64b798d59963af7fdf994','0,1,e4e090f9ecb64b798d59963af7fdf994,ff9e9692131649818182254610a7d2f5','省软考办,河北地区,太原郡','太原郡',20,NULL,'0004',NULL,'','',NULL,NULL,'0','0','','1','2018-06-29 17:11:06','10.216.70.159','V1.0.1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `roletype` varchar(32) DEFAULT NULL COMMENT '角色类型',
  `datascope` varchar(32) DEFAULT NULL COMMENT '数据范围',
  `sysdata` varchar(32) DEFAULT NULL COMMENT '是否系统数据,1:是，0：不是',
  `createUser` varchar(64) NOT NULL COMMENT '创建者',
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) NOT NULL COMMENT '更新者',
  `lastUpdateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(45) DEFAULT NULL,
  `lastUpdateVersion` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `lastUpdateIp` varchar(45) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_role_enname` (`enname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1','系统管理员','dept','assignment','1','1','1','2013-05-27 08:00:00','1','2016-04-28 10:55:28','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0'),('6','普通用户','d','assignment','8','0','1','2013-05-27 08:00:00','1','2018-05-16 14:49:59','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('1','08d92c07ffea47018c28a4a37e6fc5f5'),('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','24'),('1','27'),('1','29'),('1','3'),('1','30'),('1','32e8366d1e194e8ebcb4d8943415630e'),('1','4'),('1','5'),('1','6'),('1','67'),('1','68'),('1','7'),('1','8'),('1','84'),('1','85'),('1','9'),('1','cf7c3ddc9ee249f2bed2a189b90dba54'),('1','fedc0cb9393e4295bb837763401a8032'),('6','1'),('6','10'),('6','13'),('6','17'),('6','2'),('6','20'),('6','24'),('6','3'),('6','4'),('6','67'),('6','68'),('6','7'),('6','84'),('c51a5dd4461f46499f1df2d11a4adc8a','1'),('c51a5dd4461f46499f1df2d11a4adc8a','13'),('c51a5dd4461f46499f1df2d11a4adc8a','17'),('c51a5dd4461f46499f1df2d11a4adc8a','2'),('c51a5dd4461f46499f1df2d11a4adc8a','20'),('c51a5dd4461f46499f1df2d11a4adc8a','24'),('c51a5dd4461f46499f1df2d11a4adc8a','3'),('c51a5dd4461f46499f1df2d11a4adc8a','4'),('c51a5dd4461f46499f1df2d11a4adc8a','51e1e81ad3224da9bc11908be20cda41'),('c51a5dd4461f46499f1df2d11a4adc8a','67'),('c51a5dd4461f46499f1df2d11a4adc8a','68'),('c51a5dd4461f46499f1df2d11a4adc8a','7'),('c51a5dd4461f46499f1df2d11a4adc8a','84');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_office`
--

LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
INSERT INTO `sys_role_office` VALUES ('1','1'),('1','2'),('1','3');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `loginname` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `usertype` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `loginflag` char(1) DEFAULT '1' COMMENT '是否允许登录：1、是；0、否',
  `gender` varchar(32) DEFAULT NULL COMMENT '性别',
  `idcard` char(18) DEFAULT NULL COMMENT '身份证号',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `nation` char(10) DEFAULT NULL COMMENT '民族',
  `qq` char(20) DEFAULT NULL COMMENT 'QQ',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `sysdata` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`) USING BTREE,
  KEY `sys_user_login_name` (`loginname`) USING BTREE,
  KEY `sys_user_company_id` (`company_id`) USING BTREE,
  KEY `sys_user_update_date` (`lastUpdateDate`) USING BTREE,
  KEY `sys_user_del_flag` (`loginflag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','1','1','admin','37195579386e11fbb01e978d7af066dde06ae665ec6a273aac25260b','410185198211183030','超级管理员','liangxiaofeng1989@hotmai.com','029-88380192','13571813566','','38e4e03a971d418eb4289194534168d0','1','2013-05-27 08:00:00','1','2017-07-19 17:23:36','','1','e541ad28f12943a6be6bb9b735cc4a31','34343434','2015-12-03 00:00:00','汉族','22121212','v1.0.0.0','v1.0.0.0','127.0.0.1','127.0.0.1','0','1'),('18fb8b3f4d704a23bc1197f9b5d0e18e','1','1','wuxiling','37195579386e11fbb01e978d7af066dde06ae665ec6a273aac25260b','','巫溪灵','','','','','38e4e03a971d418eb4289194534168d0','1','2016-07-27 16:14:46','1','2017-07-20 15:43:59','','1','e541ad28f12943a6be6bb9b735cc4a31','123456789012345678','1989-07-27 00:00:00','汉族','','v1.0.0.0','v1.0.0.0','127.0.0.1','127.0.0.1','0','0'),('366b0428f97248feab58d6b156776476','1','1','user1','37195579386e11fbb01e978d7af066dde06ae665ec6a273aac25260b','0001','用户1','','','','','38e4e03a971d418eb4289194534168d0','1','2018-01-26 12:48:19','1','2018-01-26 12:49:03','','1','e541ad28f12943a6be6bb9b735cc4a31','24234','1984-01-26 00:00:00','24234','','V0.0.1','V0.0.1','10.216.70.159','10.216.70.159','0','0'),('38f90c52d29b47a08ee3202cba6c9905','1','1','zhangsan','087ecfad3e044f1b634086048f65a3081ab43730ac5c5a9ab1b50787','00001','张三','2@1.com',NULL,'13589768906','','38e4e03a971d418eb4289194534168d0','1','2018-03-09 09:20:15','1','2018-04-24 10:14:00','测试','1','e541ad28f12943a6be6bb9b735cc4a31','123456197806121456','1975-03-09 00:00:00','','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('cf833c25e7854b73bd2ce6d9b2151c18','368ae91449a14f06ad986e17aa3b7048','368ae91449a14f06ad986e17aa3b7048','412412','37195579386e11fbb01e978d7af066dde06ae665ec6a273aac25260b','12412','124124','12412@123123.com',NULL,'13598709870','','38e4e03a971d418eb4289194534168d0','1','2018-04-25 14:36:41','1','2018-04-25 14:36:41','124124','1','e541ad28f12943a6be6bb9b735cc4a31','654786197809122341','2018-04-25 00:00:00','2','124124','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0'),('fc991105ee9c4fd6a29e91e33029095e','368ae91449a14f06ad986e17aa3b7048','368ae91449a14f06ad986e17aa3b7048','diaochan','86c2921b858455b9b042ecfb4ce9e0c130d06a9bd36b471e6dfd940d','0002','貂蝉','2@22.com',NULL,'15623425896','','8298c78996dd45b68a59a8c26a347098','1','2018-06-28 17:08:36','1','2018-06-28 17:08:36','22222','1','e541ad28f12943a6be6bb9b735cc4a31','610321198906159797','2018-06-28 08:00:00','0','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('1','1'),('1','6'),('18fb8b3f4d704a23bc1197f9b5d0e18e','1'),('18fb8b3f4d704a23bc1197f9b5d0e18e','6'),('366b0428f97248feab58d6b156776476','6'),('cf833c25e7854b73bd2ce6d9b2151c18','6');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cms_article`
--

DROP TABLE IF EXISTS `t_cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cms_article` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `columnsId` varchar(64) DEFAULT NULL COMMENT '栏目',
  `snippet` varchar(100) DEFAULT NULL COMMENT '摘要',
  `image` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `stick` decimal(15,0) DEFAULT '0' COMMENT '置顶',
  `content` text COMMENT '内容',
  `releaseDate` datetime DEFAULT NULL COMMENT '发布日期',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT '0' COMMENT '状态',
  `sysdata` varchar(32) DEFAULT '0',
  `hits` decimal(10,0) DEFAULT '0',
  `source` varchar(200) DEFAULT NULL,
  `releasetor` varchar(32) DEFAULT NULL COMMENT '发布者',
  `showTitle` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_article`
--

LOCK TABLES `t_cms_article` WRITE;
/*!40000 ALTER TABLE `t_cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cms_columns`
--

DROP TABLE IF EXISTS `t_cms_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cms_columns` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父ID',
  `parentIds` varchar(3300) DEFAULT NULL COMMENT '所有父级编号',
  `depth` decimal(10,0) DEFAULT NULL COMMENT '深度',
  `longName` varchar(500) NOT NULL COMMENT '全名称',
  `longCode` varchar(500) NOT NULL COMMENT '全编码',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序号',
  `sys_data` char(1) DEFAULT '0' COMMENT '系统初始化数据：1、是；0、否',
  `createUser` varchar(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `lastUpdateVersion` varchar(20) DEFAULT NULL COMMENT '最后更新版本号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `lastUpdateIp` varchar(20) DEFAULT NULL COMMENT '最后更新IP',
  `status` char(2) DEFAULT '0' COMMENT '状态',
  `image` varchar(255) DEFAULT NULL,
  `firstnav` varchar(5) DEFAULT 'off',
  `target` varchar(45) DEFAULT NULL,
  `linkAddress` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_columns`
--

LOCK TABLES `t_cms_columns` WRITE;
/*!40000 ALTER TABLE `t_cms_columns` DISABLE KEYS */;
INSERT INTO `t_cms_columns` VALUES ('06bcb807af8b4b409b4b3d0f8aaeaf32','0e0acb903a374b7e94aff42917a475af','0004','关于我们','1','0,1,0004',2,'根目录,关于我们','0001,null',10,'0','1','2018-09-15 23:26:57','1','2018-10-15 18:50:43',NULL,'V1.0.1','V1.0.1','192.168.249.62','10.216.70.159','0','bdd1d1603d3f46b9b033311312bfa0d9','on','_blank',''),('1','1','0001','根目录','0','0,1',1,'根目录','0001',10,'1','1','2018-09-12 20:14:48','','2018-09-12 20:14:48',NULL,'1',NULL,'127.0.0.1',NULL,'0',NULL,'',NULL,NULL),('1ee5992da87e4d429ba189c0be50e566','389e1a7f28ef4500bb68d9dba14207d4','34444','智能井盖监控云平台','5910e89a02a04df58dfc8d5306e8d63e',NULL,3,'根目录,产品中心,智能井盖监控云平台','0001,null,34444',50,'0','1','2018-10-16 17:39:12',NULL,'2018-10-16 17:39:11',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('2902674f9b784ab683cbaa51f521d7d5','0e0acb903a374b7e94aff42917a475af','5000','公司新闻','4e04bedf842d40ddaba5794bb5985928',NULL,3,'根目录,资讯中心,公司新闻','0001,null,5000',41,'0','1','2018-10-15 18:46:18',NULL,'2018-10-15 18:46:18',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('4e04bedf842d40ddaba5794bb5985928','0e0acb903a374b7e94aff42917a475af','0003','资讯中心','1','0,1,0003',2,'根目录,资讯中心','0001,null',30,'0','1','2018-09-12 21:44:11','1','2018-10-15 18:53:06',NULL,'V1.0.1','V1.0.1','192.168.249.62','10.216.70.159','0','1cda38cc532e48bfb8978e947193c13e','on','_blank',''),('57697b152cef4b72a2553346501a5dce','1b3e4bf736244a4086abd218e2a9c957','0000','首页','1',NULL,2,'根目录,首页','0001,null',5,'0','1','2018-09-16 01:06:42','1','2018-10-15 18:45:17',NULL,'V1.0.1','V1.0.1','192.168.249.62','10.216.70.159','0','622885d921d34f61b5dd21734d364888','on','_self','/'),('5910e89a02a04df58dfc8d5306e8d63e','0e0acb903a374b7e94aff42917a475af','0007','产品中心','1',NULL,2,'根目录,产品中心','0001,null',20,'0','1','2018-09-16 00:57:15','1','2018-10-15 18:49:10',NULL,'V1.0.1','V1.0.1','192.168.249.62','10.216.70.159','0','3cd3aa0a7e5d473cb2d13ff985529c8a','on','_blank',''),('5e792e8767bf40f6a125c63267571d02','389e1a7f28ef4500bb68d9dba14207d4','9000','荣誉资质','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,3,'根目录,关于我们,荣誉资质','0001,null,9000',36,'0','1','2018-10-15 18:48:10',NULL,'2018-10-15 18:48:09',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('6e38ad754af54845948e1f25d873f20c','0e0acb903a374b7e94aff42917a475af','008','合作伙伴','1',NULL,2,'根目录,合作伙伴','0001,null',15,'0','1','2018-09-16 00:58:28','1','2018-10-15 18:51:12',NULL,'V1.0.1','V1.0.1','192.168.249.62','10.216.70.159','0','cdec1cd77c9d4509a1c64732e75893f3','on','_blank',''),('745981edf2e744a082ed27b4c640483a','0e0acb903a374b7e94aff42917a475af','0009','人才招聘','1',NULL,2,'根目录,人才招聘','0001,null',40,'0','1','2018-09-16 00:58:52','1','2018-10-15 18:49:18',NULL,'V1.0.1','V1.0.1','192.168.249.62','10.216.70.159','0','c2ee2e3feadc4a858d7df7f1fdac9748','on','_blank',''),('7c0f820c1f5f41c3b64cf4bcb5b3f333','389e1a7f28ef4500bb68d9dba14207d4','6013','企业文化','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,3,'根目录,关于我们,企业文化','0001,null,6013',58,'0','1','2018-10-15 18:47:46',NULL,'2018-10-15 18:47:45',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('9cbc7544c1574f42850223f13406bc17','389e1a7f28ef4500bb68d9dba14207d4','7000','公司介绍','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,3,'根目录,关于我们,公司介绍','0001,null,7000',36,'0','1','2018-10-15 18:47:26',NULL,'2018-10-15 18:47:26',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('a567d45398b443a8ad9c583814ff34d6','0e0acb903a374b7e94aff42917a475af','8000','公司情怀','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,3,'根目录,关于我们,公司情怀','0001,null,8000',78,'0','1','2018-10-15 18:48:26',NULL,'2018-10-15 18:48:25',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('b7fab07a1f5f4714b77f0efe8e215d5f','389e1a7f28ef4500bb68d9dba14207d4','10000','联系我们','1',NULL,2,'根目录,联系我们','0001,null',100,'0','1','2018-10-15 18:52:01','1','2018-10-15 18:52:15',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','','on','_blank',''),('bda6f54cda4e4aa38aea24f233bac197','0e0acb903a374b7e94aff42917a475af','6000','行业资讯','4e04bedf842d40ddaba5794bb5985928',NULL,3,'根目录,资讯中心,行业资讯','0001,null,6000',43,'0','1','2018-10-15 18:46:38',NULL,'2018-10-15 18:46:37',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('c1ab79d14c1d4bd5a50ce41c28affe9d','389e1a7f28ef4500bb68d9dba14207d4','2451','智能数据分析平台','5910e89a02a04df58dfc8d5306e8d63e',NULL,3,'根目录,产品中心,智能数据分析平台','0001,null,2451',34,'0','1','2018-10-16 17:39:55',NULL,'2018-10-16 17:39:54',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank',''),('ebc2ddbaf7514cc1a368c2ec9639cabd','389e1a7f28ef4500bb68d9dba14207d4','1000','管道成像机器人','5910e89a02a04df58dfc8d5306e8d63e',NULL,3,'根目录,产品中心,管道成像机器人','0001,null,1000',70,'0','1','2018-10-16 17:39:32',NULL,'2018-10-16 17:39:31',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','',NULL,'_blank','');
/*!40000 ALTER TABLE `t_cms_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cms_guestbook`
--

DROP TABLE IF EXISTS `t_cms_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cms_guestbook` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `keyword` varchar(64) DEFAULT NULL COMMENT '标题',
  `kevalue` text COMMENT '内容',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT '0' COMMENT '状态',
  `sysdata` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_guestbook`
--

LOCK TABLES `t_cms_guestbook` WRITE;
/*!40000 ALTER TABLE `t_cms_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cms_keyvalue`
--

DROP TABLE IF EXISTS `t_cms_keyvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cms_keyvalue` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `keyword` varchar(64) DEFAULT NULL COMMENT '键',
  `kevalue` varchar(200) DEFAULT NULL COMMENT '值',
  `createUser` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(32) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT '0' COMMENT '状态',
  `sysdata` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='键值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_keyvalue`
--

LOCK TABLES `t_cms_keyvalue` WRITE;
/*!40000 ALTER TABLE `t_cms_keyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_keyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wxl_billrule`
--

DROP TABLE IF EXISTS `t_wxl_billrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_wxl_billrule` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `CLASSNAME` varchar(200) DEFAULT NULL COMMENT '类名',
  `MAX_VALUE` decimal(10,0) DEFAULT '0' COMMENT '最大值',
  `PREFIX` varchar(15) DEFAULT '' COMMENT '前缀',
  `YEARMONTH` varchar(15) DEFAULT '' COMMENT '年月',
  `ALLFORMATE` varchar(64) DEFAULT '' COMMENT '格式',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单据规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wxl_billrule`
--

LOCK TABLES `t_wxl_billrule` WRITE;
/*!40000 ALTER TABLE `t_wxl_billrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_wxl_billrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wxl_sign`
--

DROP TABLE IF EXISTS `t_wxl_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_wxl_sign` (
  `ID` varchar(45) NOT NULL,
  `PHRASE` varchar(500) DEFAULT NULL,
  `PRIORITY` varchar(45) DEFAULT NULL,
  `PERSONID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wxl_sign`
--

LOCK TABLES `t_wxl_sign` WRITE;
/*!40000 ALTER TABLE `t_wxl_sign` DISABLE KEYS */;
INSERT INTO `t_wxl_sign` VALUES ('03375c020b4a4eb094e5df641509f523','审批通过','1','1'),('2089f7e2112441ec971241a02e0c45ee','以后格式写正确在进行提交','2','1'),('568e8ca07464455e96d6f77ec7a514c6','金额不鞥超过1000','3','6'),('6648fb3031b8464897e2d9150bdd1fba','审批通过','1','6'),('a4ac89446d144515b23d59cc18bca459','天数错误','2','6');
/*!40000 ALTER TABLE `t_wxl_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wxl_signphoto`
--

DROP TABLE IF EXISTS `t_wxl_signphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_wxl_signphoto` (
  `ID` varchar(45) NOT NULL,
  `photo` longblob,
  `PERSONID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wxl_signphoto`
--

LOCK TABLES `t_wxl_signphoto` WRITE;
/*!40000 ALTER TABLE `t_wxl_signphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_wxl_signphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wxl_storge`
--

DROP TABLE IF EXISTS `t_wxl_storge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_wxl_storge` (
  `ID` varchar(60) NOT NULL,
  `logicalName` varchar(100) DEFAULT NULL,
  `physicalName` varchar(100) DEFAULT NULL,
  `fileSize` decimal(10,0) DEFAULT NULL,
  `fileType` varchar(45) DEFAULT NULL,
  `filePhysicalPath` varchar(300) DEFAULT NULL,
  `logicalModule` varchar(100) DEFAULT NULL,
  `delFlag` char(1) DEFAULT '0',
  `entityId` varchar(60) DEFAULT NULL,
  `sys` varchar(45) DEFAULT NULL COMMENT '系统',
  `type` varchar(45) DEFAULT NULL COMMENT '类别（模块）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wxl_storge`
--

LOCK TABLES `t_wxl_storge` WRITE;
/*!40000 ALTER TABLE `t_wxl_storge` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_wxl_storge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-23 18:45:34

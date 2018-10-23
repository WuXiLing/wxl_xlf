CREATE DATABASE  IF NOT EXISTS `ktsys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ktsys`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ktsys
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
INSERT INTO `sys_dict_item` VALUES ('0e0acb903a374b7e94aff42917a475af','833b3f51311d45df8536b1f4100a3c7f','列表',10,'1','2018-09-12 20:16:18','1','2018-09-12 20:16:18','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('116c5e1f29074d358925ff10c35328cc','1175690bc8364937a33afe2a53832ca1','初级',10,'1','2018-06-05 15:25:26','1','2018-06-05 15:25:26','初级','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','0'),('25b0005f9753483cbd1df7c5fcc3cabb','29575fdb43334a6ca1ea9f3b7ed03dad','删除',30,'1','2018-06-20 16:30:09','1','2018-06-20 16:30:09','假删除','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('2f93b74a205a41608efeb22eef547c33','e7288453ca35420e885f4e285e21ce59','否',20,'1','2018-06-05 17:39:57','1','2018-06-05 17:39:57','可以修改','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('389e1a7f28ef4500bb68d9dba14207d4','833b3f51311d45df8536b1f4100a3c7f','内容',20,'1','2018-09-12 20:16:28','1','2018-09-12 20:16:28','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('458790ac1041415ab085c9ed02e4094c','e7288453ca35420e885f4e285e21ce59','是',10,'1','2018-06-05 17:39:40','1','2018-06-05 17:39:40','是系统数据，不允许修改','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('502fa94eb9b64516aaff1f254e71654f','833b3f51311d45df8536b1f4100a3c7f','栏目',30,'1','2018-09-12 20:16:53','1','2018-09-12 20:16:53','','V1.0.1','V1.0.1','192.168.249.62','192.168.249.62','0','0'),('5762263ba6e0478bae930ecb43080d17','29575fdb43334a6ca1ea9f3b7ed03dad','启用',10,'1','2018-06-20 16:29:27','1','2018-06-20 16:29:27','启用','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('62dac6f108124f18b34bffcd98e0f74b','8254a21043b247479c599de5f2e09183','初中',10,'1','2018-05-31 19:27:32','1','2018-05-31 19:27:32','初级学历','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','0'),('d41612be8867407da80de6d135cbc7a2','1175690bc8364937a33afe2a53832ca1','中级',20,'1','2018-06-05 15:27:50','1','2018-06-05 15:27:50','中级','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','0'),('d7914abaa52f49c49faf15752192e5e4','8d70612c673d4edd91bb511fa6d4b7b7','男',10,'1','2018-05-29 14:35:48','1','2018-05-29 14:35:48','男','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('e541ad28f12943a6be6bb9b735cc4a31','8d70612c673d4edd91bb511fa6d4b7b7','女',20,'1','2018-05-31 19:35:19','1','2018-05-31 19:35:19','女性','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c'),('e847e08083f4457b8a06c6a44f308fd8','29575fdb43334a6ca1ea9f3b7ed03dad','禁用',20,'1','2018-06-20 16:29:38','1','2018-06-20 16:29:38','禁用','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','5762263ba6e0478bae930ecb43080d17','458790ac1041415ab085c9ed02e4094c');
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
INSERT INTO `sys_menu` VALUES ('0f961b7a2b0f461faa7399d8d451ab75','6c0aa7ae6a3347dea96d4cc6aa6ab492','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492,0f961b7a2b0f461faa7399d8d451ab75','栏目设置',30,'/cms/columns',NULL,'<i class=\"layui-icon layui-icon-template-1\"></i>','1','','1','2018-09-11 17:00:57',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,CMS,栏目设置',NULL,'0','0'),('1','0','0,1','功能菜单',0,NULL,NULL,'','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单','0','1','0'),('17','3','0,1,2,3,17','机构管理',40,'/sys/office/','','<i class=\"fa fa-sitemap\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:26:06','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,机构管理','2','0','0'),('2','1','0,1,2','系统设置',70,'','','<i class=\"fa fa-gear\"></i>','1','','1','2013-05-27 08:00:00','1','2018-03-13 23:21:35','','V1.0.1','V1.0.1','10.216.70.159','192.168.1.4','功能菜单,系统设置','1','0','0'),('20','3','0,1,2,3,20','用户管理',30,'/sys/user/index','','<i class=\"fa fa-user\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:22:22','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,用户管理','2','0','0'),('3','2','0,1,2,3','系统设置',20,NULL,NULL,'<i class=\"fa fa-gears\"></i>','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,系统设置','2','0','0'),('4','3','0,1,2,3,4','菜单管理',30,'/sys/menu/','','<i class=\"fa fa-pencil\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:27:03','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,菜单管理','2','0','0'),('51e1e81ad3224da9bc11908be20cda41','3','0,1,2,3,51e1e81ad3224da9bc11908be20cda41','数据字典',10,'/sys/dicttype/',NULL,'<i class=\"fa fa-building\"></i>','1','sss','1','2018-05-29 13:48:06','1','2018-01-26 13:27:03','','V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,数据字典','2','0','0'),('554131d60c554308b105dba8b665db9f','6c0aa7ae6a3347dea96d4cc6aa6ab492','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492,554131d60c554308b105dba8b665db9f','文章管理',30,'/cms/article/',NULL,'<i class=\"layui-icon layui-icon-read\"></i>','1','','1','2018-09-12 22:26:55',NULL,NULL,'','V1.0.1',NULL,'192.168.249.62',NULL,'功能菜单,CMS,文章管理',NULL,'0','0'),('67','2','0,1,2,67','统计监控',30,NULL,NULL,'<i class=\"fa fa-line-chart\"></i>','1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','功能菜单,统计监控','1','0','0'),('68','67','0,1,2,67,68','日志查询',30,'/sys/log','','<i class=\"fa fa-navicon\"></i>','1','sys:log:view','1','2013-06-03 08:00:00','1','2018-01-26 13:28:17','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,统计监控,日志查询','2','0','0'),('6c0aa7ae6a3347dea96d4cc6aa6ab492','1','0,1,6c0aa7ae6a3347dea96d4cc6aa6ab492','CMS',30,'',NULL,'<i class=\"layui-icon layui-icon-form\"></i>','1','','1','2018-09-11 16:59:43',NULL,NULL,'','V1.0.1',NULL,'10.216.70.159',NULL,'功能菜单,CMS',NULL,'0','0'),('7','3','0,1,2,3,7','角色管理',50,'/sys/role/','','<i class=\"fa fa-users\"></i>','1','','1','2013-05-27 08:00:00','1','2018-01-26 13:28:03','','V1.0.1','V0.0.1','10.216.70.159','10.216.70.159','功能菜单,系统设置,角色管理','2','0','0');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_article`
--

LOCK TABLES `t_cms_article` WRITE;
/*!40000 ALTER TABLE `t_cms_article` DISABLE KEYS */;
INSERT INTO `t_cms_article` VALUES ('08e57f548b024d72b8cfccfae4605bc9','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'2a6a1b3995a942af80741eb99169a369',24,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:32:33',NULL,'2018-09-13 11:32:33',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'124','1'),('10886bed83c54841a7f0221f0206bc8d','234234','5910e89a02a04df58dfc8d5306e8d63e',NULL,'',NULL,'<p>24234<br/></p>','2018-09-20 01:52:33','1','2018-09-19 10:06:19',NULL,'2018-09-19 10:06:19',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'','1'),('1b3117bc3301454aad3541ef2ae1613c','234','87ad7806570346b58f1405557f7248ee',NULL,'',NULL,'<p>234<br/></p>',NULL,'1','2018-09-19 10:05:54',NULL,'2018-09-19 10:05:54',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'',NULL),('26b9a47be43d4aa5b4b82f464a106cd6','123','4e04bedf842d40ddaba5794bb5985928',NULL,'fffb1a1f6e084bca8af4637783eb5b40',123,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:12:10',NULL,'2018-09-13 11:12:10',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'123','1'),('3ddf8b9ad1164bdebd945978ada46483','123','4e04bedf842d40ddaba5794bb5985928',NULL,'2572984e35404904b79d519b4371d5cf',123,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:10:12',NULL,'2018-09-13 11:10:12',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'123','1'),('4195435aa94745c89ccb2efea05ef054','2124','4e04bedf842d40ddaba5794bb5985928',NULL,'0cf0c928d07c4da49dc4a8f285ac2ca5',NULL,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:42:11',NULL,'2018-09-13 11:42:11',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,NULL,'1'),('4496cfbe4306416fa45c6b49d24d1657','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'5e5a505854744f6193210cb365ffaf9b',324,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:27:08',NULL,'2018-09-13 11:27:08',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'234','1'),('453d952a0d354d46b1bf28e795a44e7f','ddddddddddd','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,'',NULL,'<p>ddddddddddd</p>','2018-09-23 08:00:00','1','2018-09-23 22:13:03',NULL,'2018-09-23 22:13:03',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'1','0',0,'','1'),('49c6d7e2094d4301bbb593a965eca6e6','2124','4e04bedf842d40ddaba5794bb5985928',NULL,'0cf0c928d07c4da49dc4a8f285ac2ca5',NULL,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-15 14:01:32',NULL,'2018-09-15 14:01:32',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'1','0',0,NULL,'1'),('4e184108f79b43f68ecdd6fed340c1cb','334','4e04bedf842d40ddaba5794bb5985928',NULL,'ef2c785ca22a4be5927343123c081346',24,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:36:14',NULL,'2018-09-13 11:36:14',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'234','1'),('4fd60f1781cd4b668a381761e34a4ed8','222','4e04bedf842d40ddaba5794bb5985928',NULL,'42c26d02acd3493c84097a7140f88bb9',2,NULL,NULL,'1','2018-09-18 17:26:09',NULL,'2018-09-18 17:26:09',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'22',NULL),('5814e4d3f99c40ca8825e8c75798c716','41','4e04bedf842d40ddaba5794bb5985928',NULL,'491a539537ce403bb3eb3b51aab4d676',4124,'<p>tetwtwtwet<br/></p>',NULL,'1','2018-09-18 17:53:21','1','2018-09-18 17:53:21',NULL,'V1.0.1','V1.0.1','10.216.70.159','10.216.70.159','0','0',0,'124',NULL),('6214e641305b49f6b9fb6804521bddb3','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'0cf0c928d07c4da49dc4a8f285ac2ca5',NULL,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-15 14:00:42',NULL,'2018-09-15 14:00:42',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,NULL,'1'),('6facba2ee833418e8ad7daa087b9ee22','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'0cf0c928d07c4da49dc4a8f285ac2ca5',NULL,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 00:09:59',NULL,'2018-09-13 00:09:59',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',NULL,NULL,'1'),('7a4f08cb0b6e4116a62bdc51cf5305a4','2124','4e04bedf842d40ddaba5794bb5985928',NULL,'0cf0c928d07c4da49dc4a8f285ac2ca5',NULL,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-15 14:00:59',NULL,'2018-09-15 14:00:59',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'1','0',0,NULL,'1'),('7b9a6442fe21481d9af9e849cdd97152','234','745981edf2e744a082ed27b4c640483a',NULL,'',234,'<p>234<br/></p>',NULL,'1','2018-09-19 10:05:41',NULL,'2018-09-19 10:05:41',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'234','1'),('93fb239f101b480bb549928c816a3c23','124','4e04bedf842d40ddaba5794bb5985928',NULL,'fb07c80c888844fca05a3669d2da6972',124,'<p>124124<br/></p>',NULL,'1','2018-09-18 18:06:07',NULL,'2018-09-18 18:06:07',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'124',NULL),('96f3bcc9c3144c43bd9c5d8d9bacc68b','test','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,'',NULL,'<p>testtesttesttest</p>','2018-09-23 08:00:00','1','2018-09-23 22:07:02',NULL,'2018-09-23 22:07:02',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,'','1'),('9cbe1e4652b64bac92d1b6486784afbe','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'0cf0c928d07c4da49dc4a8f285ac2ca5',24,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:33:28',NULL,'2018-09-13 11:33:28',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'1241','1'),('a10d852cd1e24e249762ee39bd0233cf','test2','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,'',NULL,'<p>test2</p>','2018-09-23 08:00:00','1','2018-09-23 22:07:38',NULL,'2018-09-23 22:07:38',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,'','1'),('a17d86db4448459eb1bfea8acebb5f21','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'42970eab8fce4bfab0d097e2d31fafd4',23,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:11:38',NULL,'2018-09-13 11:11:38',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'213','1'),('a2ded051a45747bebc40cd53ffe8f98d','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'8f37020dd8ca44e39cdca5418e725c65',23,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:26:36',NULL,'2018-09-13 11:26:36',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'13','1'),('a4dc03a8c79c44029e564190ffb33645','test','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,'',999,'<p>测试<br/></p>','2018-09-23 21:54:18','1','2018-09-23 21:54:07',NULL,'2018-09-23 21:54:07',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'1','0',0,'测试','1'),('a99cff702ee04109a09e47222946345f','24','4e04bedf842d40ddaba5794bb5985928',NULL,'b54294dd5b0147908a63e35b6d98d80b',24,'<p>24124124124214<br/></p>',NULL,'1','2018-09-18 17:56:43',NULL,'2018-09-18 17:56:43',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'124','1'),('ab421158abca43b088fcef2d7f379796','空间飞行器项目已','4e04bedf842d40ddaba5794bb5985928',NULL,'0806a267e78b40f1ba0385715b6d7a59',23,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-27 08:00:00','1','2018-09-13 11:08:05',NULL,'2018-09-13 11:08:05',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'23','1'),('abaa8f60285e4efbb3425f537651781d','test','5910e89a02a04df58dfc8d5306e8d63e',NULL,'a9a2718775fd4102871247f935993985',23,NULL,NULL,'1','2018-09-16 13:07:06',NULL,'2018-09-16 13:07:06',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'1','0',0,'14','1'),('ad648518e4ab4f0eaedffeeb1f2b8bcd','4324','87ad7806570346b58f1405557f7248ee',NULL,'',NULL,'<p>235<br/></p>',NULL,'1','2018-09-19 10:06:05',NULL,'2018-09-19 10:06:05',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'',NULL),('b75594f163d540d584cdbdf18074fd0d','123','5910e89a02a04df58dfc8d5306e8d63e',NULL,'7732a4f82c464e80b1a87547382982e2',123,NULL,'2018-09-16 08:00:00','1','2018-09-16 13:05:19',NULL,'2018-09-16 13:05:19',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,'123',NULL),('c67a0e1b7e1440d99fa5b534ddf96717','34','4e04bedf842d40ddaba5794bb5985928',NULL,'172c70c089524e1f96b6954c6bc72f56',14,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 00:13:17',NULL,'2018-09-13 00:13:17',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,'14','1'),('cc7505f1d3344284945d2514b8c4cfa8','4234','138c6ab118c7467e8e592d273dffed2a',NULL,'fd61e3dab36c487e9b048b0cef3988bc',234,'<p>242223525<br/></p>',NULL,'1','2018-09-18 18:04:47',NULL,'2018-09-18 18:04:47',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'0','0',0,'234',NULL),('dd554f82148849f3a7f3d93ee95f6075','12412','745981edf2e744a082ed27b4c640483a',NULL,'41ddc72344194df7b92481a3c1c09c6c',24,NULL,NULL,'1','2018-09-18 17:48:29',NULL,'2018-09-18 17:48:29',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'124','1'),('eadf626715c34218840a98439855d14a','空间飞行器项目已','87ad7806570346b58f1405557f7248ee',NULL,'874f3d7a4e8a43c28e63415aa2db7017',124,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:27:53',NULL,'2018-09-13 11:27:53',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'wr','1'),('ebd31e3ba6ce49dfa9a2183328f0e557','空间飞行器项目已','87ad7806570346b58f1405557f7248ee',NULL,'d09bb5bd89ee4c2d9e410495f65a4894',1412,'在很长一段时期里，我都是早早就躺下了。有时候，蜡烛才灭，我的眼皮儿随即合上，都来不及咕哝一句：‘我要睡着了。’半小时之后，我才想到应该睡觉；这一想，我反倒清醒过来。我打算把自以为还捏在手里的书放好，吹灭灯火。睡着的那会儿，我一直在思考刚才读的那本书，只是思路','2018-09-13 08:00:00','1','2018-09-13 11:28:12',NULL,'2018-09-13 11:28:12',NULL,'V1.0.1',NULL,'10.216.70.159',NULL,'1','0',0,'124','1'),('f3064fa7d3104b00bd19d550b290e96f','cccccc','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,'',NULL,'<p>cccccc</p>','2018-09-23 08:00:00','1','2018-09-23 22:11:03',NULL,'2018-09-23 22:11:03',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,'','1'),('fdbaecd9559f4046bd4ae0fe358480d8','c','06bcb807af8b4b409b4b3d0f8aaeaf32',NULL,'',NULL,'<p>test2</p>','2018-09-23 08:00:00','1','2018-09-23 22:09:17',NULL,'2018-09-23 22:09:17',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0',0,'','1');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_columns`
--

LOCK TABLES `t_cms_columns` WRITE;
/*!40000 ALTER TABLE `t_cms_columns` DISABLE KEYS */;
INSERT INTO `t_cms_columns` VALUES ('06bcb807af8b4b409b4b3d0f8aaeaf32','0e0acb903a374b7e94aff42917a475af','0004','通知公告','1','0,1,0004',2,'根目录,通知公告','0001,0004',40,'0','1','2018-09-15 23:26:57',NULL,'2018-09-15 23:26:56',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','bdd1d1603d3f46b9b033311312bfa0d9','on','_blank'),('1','1','0001','根目录','0','0,1',1,'根目录','0001',10,'1','1','2018-09-12 20:14:48','','2018-09-12 20:14:48',NULL,'1',NULL,'127.0.0.1',NULL,'0',NULL,'',NULL),('138c6ab118c7467e8e592d273dffed2a','389e1a7f28ef4500bb68d9dba14207d4','0012','实验室简介','70eafa82a3cb4e46a9240da2a9bcf8de',NULL,3,'根目录,实验室概况,实验室简介','0001,0011,0012',120,'0','1','2018-09-16 01:00:29',NULL,'2018-09-16 01:00:29',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0851869af35a4802ab8a3311df250a8a','',''),('46b1a8048cd4425488fd76b749ec50dc','0e0acb903a374b7e94aff42917a475af','0010','文件下载','1',NULL,2,'根目录,文件下载','0001,0010',50,'0','1','2018-09-16 00:59:23',NULL,'2018-09-16 00:59:22',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','95ed2cd4209c4f19bc316097bfb18b6f','on','_blank'),('4e04bedf842d40ddaba5794bb5985928','0e0acb903a374b7e94aff42917a475af','0003','新闻动态','1','0,1,0003',2,'根目录,新闻动态','0001,0003',30,'0','1','2018-09-12 21:44:11',NULL,'2018-09-12 21:44:11',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','1cda38cc532e48bfb8978e947193c13e','','_blank'),('57697b152cef4b72a2553346501a5dce','0e0acb903a374b7e94aff42917a475af','0000','网站首页','1',NULL,2,'根目录,网站首页','0001,0000',5,'0','1','2018-09-16 01:06:42',NULL,'2018-09-16 01:06:42',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','622885d921d34f61b5dd21734d364888','on','_blank'),('5910e89a02a04df58dfc8d5306e8d63e','0e0acb903a374b7e94aff42917a475af','0007','科研人员','1',NULL,2,'根目录,科研人员','0001,0007',20,'0','1','2018-09-16 00:57:15',NULL,'2018-09-16 00:57:15',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','3cd3aa0a7e5d473cb2d13ff985529c8a','on','_blank'),('6e38ad754af54845948e1f25d873f20c','0e0acb903a374b7e94aff42917a475af','008','合作交流','1',NULL,2,'根目录,合作交流','0001,0008',30,'0','1','2018-09-16 00:58:28',NULL,'2018-09-16 00:58:27',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','cdec1cd77c9d4509a1c64732e75893f3','on','_blank'),('70eafa82a3cb4e46a9240da2a9bcf8de','0e0acb903a374b7e94aff42917a475af','0011','实验室概况','1',NULL,2,'根目录,实验室概况','0001,0011',10,'0','1','2018-09-16 00:59:54',NULL,'2018-09-16 00:59:54',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','0c10e47a6d0d4b0e825f45c0633041ac','on','_blank'),('745981edf2e744a082ed27b4c640483a','0e0acb903a374b7e94aff42917a475af','0009','招生招聘','1',NULL,2,'根目录,招生招聘','0001,0009',40,'0','1','2018-09-16 00:58:52',NULL,'2018-09-16 00:58:51',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','c2ee2e3feadc4a858d7df7f1fdac9748','on','_blank'),('87ad7806570346b58f1405557f7248ee','0e0acb903a374b7e94aff42917a475af','0005','学术研究','1','0,1,0005',2,'根目录,学术研究','0001,0005',50,'0','1','2018-09-15 23:27:59',NULL,'2018-09-15 23:27:58',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','3352f22d219344428fc7b0f22e91e23f','on','_blank'),('9297519ebfc64429b5c2712aab189696','0e0acb903a374b7e94aff42917a475af','14','学术委员会','70eafa82a3cb4e46a9240da2a9bcf8de',NULL,3,'根目录,实验室概况,学术委员会','0001,0011,14',140,'0','1','2018-09-16 01:01:18',NULL,'2018-09-16 01:01:18',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','f81cfd3835664b7a90bdf55305bc41d8','',''),('c5dc64a8a0e64b00944c10fde42858c2','0e0acb903a374b7e94aff42917a475af','0013','组织结构','70eafa82a3cb4e46a9240da2a9bcf8de',NULL,3,'根目录,实验室概况,组织结构','0001,0011,0013',130,'0','1','2018-09-16 01:00:59',NULL,'2018-09-16 01:00:58',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','b01cb73f74bc4c5dbdb09ec8d5619be2','',''),('f7b3dc3ab4e94274b8053d95da0aaf95','389e1a7f28ef4500bb68d9dba14207d4','0006','LOGO动态图','1','0,1,0006',2,'根目录,LOGO动态图','0001,0006',60,'0','1','2018-09-16 00:48:01',NULL,'2018-09-16 00:48:00',NULL,'V1.0.1',NULL,'192.168.249.62',NULL,'0','553ccc2ab2594adeae939bae2b146c18','','');
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
INSERT INTO `t_wxl_storge` VALUES ('012415bd665e41278fe5f5c57fce5d9d','ykvPfkNC6zwYFAIi8PHt5HXDsHAXqpjAyg6K3bGKNashdXi1Y575KrI7QqbU6aUI','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\ykvPfkNC6zwYFAIi8PHt5HXDsHAXqpjAyg6K3bGKNashdXi1Y575KrI7QqbU6aUI.jpg',NULL,'0',NULL,'cms','columns'),('0806a267e78b40f1ba0385715b6d7a59','0H1ci4bh4dOysQpTK7zaFc67FtvppXKwK76eiG17TZ2NnbA4jpWbvut2JBcoziCr','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\0H1ci4bh4dOysQpTK7zaFc67FtvppXKwK76eiG17TZ2NnbA4jpWbvut2JBcoziCr.jpg',NULL,'0',NULL,'cms','article'),('0851869af35a4802ab8a3311df250a8a','IDU0EaCFHKIHOnkww2rS1pW80BptW6pEDsv6H3Hc9F2M5tfme5Y5udZyugZ15CzV','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\IDU0EaCFHKIHOnkww2rS1pW80BptW6pEDsv6H3Hc9F2M5tfme5Y5udZyugZ15CzV.jpg',NULL,'0',NULL,'cms','columns'),('0ac6db557c9c42a7b3ec69f05f739fac','ddl1AjYZrB0NKEj804mOZ7HVwEoZzkXpu1xQ71nZXvzjltshofzXRRDYFsmXJ6PA','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\ddl1AjYZrB0NKEj804mOZ7HVwEoZzkXpu1xQ71nZXvzjltshofzXRRDYFsmXJ6PA.jpg',NULL,'0',NULL,'cms','columns'),('0c10e47a6d0d4b0e825f45c0633041ac','CAu8ce81pvbC1FpNhXStcwzmnmqAqv9g4sK1UPQCsJezWF33GYQVh1BVvmDOY00y','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\CAu8ce81pvbC1FpNhXStcwzmnmqAqv9g4sK1UPQCsJezWF33GYQVh1BVvmDOY00y.jpg',NULL,'0',NULL,'cms','columns'),('0cf0c928d07c4da49dc4a8f285ac2ca5','sF8pe7i5TWYRjZqIXtzmoRiYgnoSgH1hQzkKIKSVqEW1E0MyAFJwzpS2bL4R1UYW','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\sF8pe7i5TWYRjZqIXtzmoRiYgnoSgH1hQzkKIKSVqEW1E0MyAFJwzpS2bL4R1UYW.jpg',NULL,'0',NULL,'cms','article'),('15da5f34af6049ad800b8f11b83c3551','o0bCvjhUkSEyzZb7UMCvLM5G34A7jZTujH53nM7PPmB8SbRzOnFxo4adXJpl0WkQ','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\o0bCvjhUkSEyzZb7UMCvLM5G34A7jZTujH53nM7PPmB8SbRzOnFxo4adXJpl0WkQ.jpg',NULL,'0',NULL,'cms','article'),('172c70c089524e1f96b6954c6bc72f56','Mf6D4KKFA0C4yk3WviOfpQjYHTc58jnSBKCpt1son5WsnajlpU2u4mMLB47G6N8g','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\Mf6D4KKFA0C4yk3WviOfpQjYHTc58jnSBKCpt1son5WsnajlpU2u4mMLB47G6N8g.jpg',NULL,'0',NULL,'cms','article'),('19646721b8a5495b9ce490812b1380d7','xqpy3i2fj2PZhSRTc3mr6rfXgGSda2qZmE4zafAvJ1Je9M5Ia9tNRzILXalw5LeO','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\23\\xqpy3i2fj2PZhSRTc3mr6rfXgGSda2qZmE4zafAvJ1Je9M5Ia9tNRzILXalw5LeO.jpg',NULL,'0',NULL,'cms','article'),('19efe11c9ed649d68e9114933790c500','vJ6Z6DNel8mEgIyiXcX8lY6vq4yeUyYV6UuJ5PyXkVVZ9l3BsQyFxuUnqZRGP6ZH','a9.jpg',15909,'jpg','\\admin\\user\\2018\\4\\25\\vJ6Z6DNel8mEgIyiXcX8lY6vq4yeUyYV6UuJ5PyXkVVZ9l3BsQyFxuUnqZRGP6ZH.jpg',NULL,'0',NULL,'admin','user'),('1cda38cc532e48bfb8978e947193c13e','JhMk9DpSk0gzoDgARKyDQk09T1JaOgfov5TMUCeAK5ORjKtqrMkDBF1K9AsqMhM9','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\JhMk9DpSk0gzoDgARKyDQk09T1JaOgfov5TMUCeAK5ORjKtqrMkDBF1K9AsqMhM9.jpg',NULL,'0',NULL,'cms','columns'),('1d12d7fa9c8045ca8b4eb7b50a1478b9','937aWEBU4XoxrRyIO5aCJi8DNEbcySMsxm2DyYVgDC2i5YYMB0R1Ge5tuBkQB2xz','17.jpg',60714,'jpg','\\admin\\user\\2018\\4\\24\\937aWEBU4XoxrRyIO5aCJi8DNEbcySMsxm2DyYVgDC2i5YYMB0R1Ge5tuBkQB2xz.jpg',NULL,'0',NULL,'admin','user'),('1f05eca611ab441384455eec07db64f7','4zLeuHNQ1ne4JTx75nKcsHYCHrJK0NBv44327D8HwjYwsfgP80WuF6tw7Q0GCvta','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\4zLeuHNQ1ne4JTx75nKcsHYCHrJK0NBv44327D8HwjYwsfgP80WuF6tw7Q0GCvta.jpg',NULL,'0',NULL,'cms','article'),('250ff69bcbd54186b78e85c68e7db8dd','TlYxYqr6ciD1tewZa2rks28isiaxFz1hHdFjFd5WfOKD5vpqRW6ZdrBhR6LBu8DZ','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\TlYxYqr6ciD1tewZa2rks28isiaxFz1hHdFjFd5WfOKD5vpqRW6ZdrBhR6LBu8DZ.jpg',NULL,'0',NULL,'cms','article'),('2572984e35404904b79d519b4371d5cf','KnplmV22jETj46DSWeKElFSyLvwEMYh1dVzD6JOcxojnpmeDfCzjgxk5h4KOM0Fk','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\KnplmV22jETj46DSWeKElFSyLvwEMYh1dVzD6JOcxojnpmeDfCzjgxk5h4KOM0Fk.jpg',NULL,'0',NULL,'cms','article'),('261cd99049dd4d15aba0f6faa0496e0b','0lyE1WAKWOX7eurZgMmSws9iANvw1ZEx9mLnFGao4k8N4Mm6KtU00UGUvRsyBDUn','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\0lyE1WAKWOX7eurZgMmSws9iANvw1ZEx9mLnFGao4k8N4Mm6KtU00UGUvRsyBDUn.jpg',NULL,'0',NULL,'cms','columns'),('2a6a1b3995a942af80741eb99169a369','m6U68jyUkZ7YfFhn3QNwUScZc5zmI4AiZ37QC12VJRWaHCtVZUqg581234NaThY2','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\m6U68jyUkZ7YfFhn3QNwUScZc5zmI4AiZ37QC12VJRWaHCtVZUqg581234NaThY2.jpg',NULL,'0',NULL,'cms','article'),('33228b450a834a9295d8fcfd2a8dabae','7ItLyKN2Ikz6Osy3TVj5VCvjdaE6QZnWuR8zCCM0sJr6M1IjL1rm0EaAJv7SfcqQ','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\7ItLyKN2Ikz6Osy3TVj5VCvjdaE6QZnWuR8zCCM0sJr6M1IjL1rm0EaAJv7SfcqQ.jpg',NULL,'0',NULL,'cms','article'),('3352f22d219344428fc7b0f22e91e23f','hJ3QhCtxcGqMVkb77ilUNCNmSbsPMIZbqkhIese1iFl0kKk9aA65KfpNce3bzkz8','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\15\\hJ3QhCtxcGqMVkb77ilUNCNmSbsPMIZbqkhIese1iFl0kKk9aA65KfpNce3bzkz8.jpg',NULL,'0',NULL,'cms','columns'),('3431252cbf0a46818ec2e0363862811a','sB239KC1jnQpnqgI7xziWHhb4nbZwV36gmJjCuqfBSUX4yTH6YF8rATF2tm4o79G','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\sB239KC1jnQpnqgI7xziWHhb4nbZwV36gmJjCuqfBSUX4yTH6YF8rATF2tm4o79G.jpg',NULL,'0',NULL,'cms','article'),('345be43671a243559c4eb4f358154280','hTvna8wMeKx5ws4j1JtuRru8HfVOcFdPhdW90wS187pup41MDpzdHwqKOKTkmrRJ','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\hTvna8wMeKx5ws4j1JtuRru8HfVOcFdPhdW90wS187pup41MDpzdHwqKOKTkmrRJ.jpg',NULL,'0',NULL,'cms','columns'),('38e4e03a971d418eb4289194534168d0','LJfAYz3EiybmstpXj83lWyUUkrRMTe0WjMT46FGSa64DgaCdwnHm55LdOgVAodkA','a9.jpg',15909,'jpg','\\admin\\user\\2018\\4\\25\\LJfAYz3EiybmstpXj83lWyUUkrRMTe0WjMT46FGSa64DgaCdwnHm55LdOgVAodkA.jpg',NULL,'0',NULL,'admin','user'),('3cd3aa0a7e5d473cb2d13ff985529c8a','xDrgkDEzhGZ5udgH2hi7EHAXEcRs94JKFCwGks2e0ek2TgLQ6vuf5wClO2Leykm4','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\xDrgkDEzhGZ5udgH2hi7EHAXEcRs94JKFCwGks2e0ek2TgLQ6vuf5wClO2Leykm4.jpg',NULL,'0',NULL,'cms','columns'),('41ddc72344194df7b92481a3c1c09c6c','kmhjHl0GCCfhWp4L4Dhqu50uXmZKpO8CJdmiu2hn64hmzmVxVaEK0LwRuistu8Z5','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\18\\kmhjHl0GCCfhWp4L4Dhqu50uXmZKpO8CJdmiu2hn64hmzmVxVaEK0LwRuistu8Z5.jpg',NULL,'0',NULL,'cms','article'),('42970eab8fce4bfab0d097e2d31fafd4','qJHDEZlbkL5U1rWUdjQ39HMWolUG0dDF2u8BxMpcgAylVqJFy0AYJKIIcwARq0S4','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\qJHDEZlbkL5U1rWUdjQ39HMWolUG0dDF2u8BxMpcgAylVqJFy0AYJKIIcwARq0S4.jpg',NULL,'0',NULL,'cms','article'),('42c26d02acd3493c84097a7140f88bb9','rKb353IAgg36JpMyzfye98om1PLuUUi0fJ1aQOoLeH2beWyfV5jiI3McirzvqbJ0','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\18\\rKb353IAgg36JpMyzfye98om1PLuUUi0fJ1aQOoLeH2beWyfV5jiI3McirzvqbJ0.jpg',NULL,'0',NULL,'cms','article'),('491a539537ce403bb3eb3b51aab4d676','Af7faO5Jl4201KkpWAYQSqEQLlCjkkIZ7UtpMbOBGX2cqR5sEgjtNgNKUWld9Bvo','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\18\\Af7faO5Jl4201KkpWAYQSqEQLlCjkkIZ7UtpMbOBGX2cqR5sEgjtNgNKUWld9Bvo.jpg',NULL,'0',NULL,'cms','article'),('4a9bce0c945840d6bbdd40dfab3b1a89','vZ2wvjScLjom99seMrCgL4xkrKs9GeurXbxkP5RH2VpqB7FQYxyEKQH8qEmOrcjQ','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\vZ2wvjScLjom99seMrCgL4xkrKs9GeurXbxkP5RH2VpqB7FQYxyEKQH8qEmOrcjQ.jpg',NULL,'0',NULL,'cms','article'),('4c7e5ff29ae74828bdf5cc532ef5fe08','QyVyYBdyQ4pn8uj60st8cM33UNO95sSQdS1kG5iVCLWqz6PvTUmmobk0kkp8AV4u','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\QyVyYBdyQ4pn8uj60st8cM33UNO95sSQdS1kG5iVCLWqz6PvTUmmobk0kkp8AV4u.jpg',NULL,'0',NULL,'cms','columns'),('50cb925ddf6840a9a025646c64209fd6','LDZteFTec0Ekbj1NPMA6sSucvMMdKb72cwNtiA1kHmrrN2z1ODJK2RKhJRv2OqXN','19.jpg',43422,'jpg','\\admin\\user\\2018\\4\\25\\LDZteFTec0Ekbj1NPMA6sSucvMMdKb72cwNtiA1kHmrrN2z1ODJK2RKhJRv2OqXN.jpg',NULL,'0',NULL,'admin','user'),('512150b1c83c460e908987d8c9187d95','IkmRrmbGU6BK5U9h0DJjSlXQgiy4RxNVQwMLpKTxwDkPLlACSGk5SppLyxUPSmDg','ChMkJ1rLMseISCNrAARavE1XatUAAnh3AOXnMMABFrU160.jpg',285372,'jpg','\\admin\\user\\2018\\4\\24\\IkmRrmbGU6BK5U9h0DJjSlXQgiy4RxNVQwMLpKTxwDkPLlACSGk5SppLyxUPSmDg.jpg',NULL,'0',NULL,'admin','user'),('553ccc2ab2594adeae939bae2b146c18','3iAPulLXjCuVS507eDpNE37i6K4ql5hWVkKMTEdxFFA81mzVAj6fkGhwcUjzu0MN','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\3iAPulLXjCuVS507eDpNE37i6K4ql5hWVkKMTEdxFFA81mzVAj6fkGhwcUjzu0MN.jpg',NULL,'0',NULL,'cms','columns'),('57042a55ff394ec7af727075012786f8','toM00jsW6mLhvsPrbvZYlur0tKRjIhuJlDKgBqXHxybl3SL3GoJMKRAtWHDSedKn','a9.jpg',15909,'jpg','\\admin\\user\\2018\\4\\25\\toM00jsW6mLhvsPrbvZYlur0tKRjIhuJlDKgBqXHxybl3SL3GoJMKRAtWHDSedKn.jpg',NULL,'0',NULL,'admin','user'),('5c4dcee411a845da8456e65d35100e0e','6zE5DD60CPATXfQC8Yp2pZpqcXat5bzMD4yE69Ti1Yz1NTwwi4uujqNqhe2q04m1','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\6zE5DD60CPATXfQC8Yp2pZpqcXat5bzMD4yE69Ti1Yz1NTwwi4uujqNqhe2q04m1.jpg',NULL,'0',NULL,'cms','article'),('5e57e455cbf24d6aaf67cad77e5f552d','XPA4AZaVDXcTtx0rs6t5kgXy5bsJ3gWkAaimWq1Got1jQOZdUWPrglFrEueJhB2R','a9.jpg',15909,'jpg','\\admin\\user\\2018\\4\\25\\XPA4AZaVDXcTtx0rs6t5kgXy5bsJ3gWkAaimWq1Got1jQOZdUWPrglFrEueJhB2R.jpg',NULL,'0',NULL,'admin','user'),('5e5a505854744f6193210cb365ffaf9b','GYbgcb4CwUUIIwdJ4rIMM3eaGR67NLCbHA2a1SOlHvDfvGcR6PJYdIzhaScfBcc2','微信图片_20180510173427.jpg',48624,'jpg','\\cms\\article\\2018\\9\\13\\GYbgcb4CwUUIIwdJ4rIMM3eaGR67NLCbHA2a1SOlHvDfvGcR6PJYdIzhaScfBcc2.jpg',NULL,'0',NULL,'cms','article'),('622885d921d34f61b5dd21734d364888','oYzGapgyehwEm0N5lwtx2mwkQpFMXSFp9XCE4vaF4APMV3TyPQSTaKSlU4M4yDTh','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\oYzGapgyehwEm0N5lwtx2mwkQpFMXSFp9XCE4vaF4APMV3TyPQSTaKSlU4M4yDTh.jpg',NULL,'0',NULL,'cms','columns'),('64dca9355cd24bfe9ac84dd6fa44e5b5','9v13Id2lNoey734sfihFdmw5c2sh1WeO6QET8UpZQrIHsKH5lPMwShVb69Exf41t','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\9v13Id2lNoey734sfihFdmw5c2sh1WeO6QET8UpZQrIHsKH5lPMwShVb69Exf41t.jpg',NULL,'0',NULL,'cms','article'),('694b1cc12b904d36bd46358161465bd8','MEHmBQnHW2v4xykZNnGoZ04GxAfG4Urxx2hTlRcJ8BbfbS37UPRBSakjUDObdCRs','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\MEHmBQnHW2v4xykZNnGoZ04GxAfG4Urxx2hTlRcJ8BbfbS37UPRBSakjUDObdCRs.jpg',NULL,'0',NULL,'cms','article'),('729a1185b01e4aeaae616c09e3b94842','NXyzNq2y5rKn1p9jNOVuLZOPl5eeJXwwEQbCeRosrqCIHYKIudnP6xjhfuXJcJil','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\NXyzNq2y5rKn1p9jNOVuLZOPl5eeJXwwEQbCeRosrqCIHYKIudnP6xjhfuXJcJil.jpg',NULL,'0',NULL,'cms','article'),('75c1b263964a46fcb41df8a08cfb60e4','7wCEtRhHP6KtxHA94NJi3PrWXHYrsqmPAAkmS0k57Cx9yGU2aN6RO38NcNoEx1YY','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\15\\7wCEtRhHP6KtxHA94NJi3PrWXHYrsqmPAAkmS0k57Cx9yGU2aN6RO38NcNoEx1YY.jpg',NULL,'0',NULL,'cms','columns'),('76294573f6694883ac6a04e40dcb90a3','6np0Je892zU28KGqzk0A5W1Gxq0rCtcOc0BFXGBTDLXDEAsssYhiMys16naN7Uha','19.jpg',43422,'jpg','\\admin\\user\\2018\\4\\24\\6np0Je892zU28KGqzk0A5W1Gxq0rCtcOc0BFXGBTDLXDEAsssYhiMys16naN7Uha.jpg',NULL,'0',NULL,'admin','user'),('7732a4f82c464e80b1a87547382982e2','LhzEZNVf1KtlJWvOxiE51MSqXI1W8ckhtlieKd2k6j2aOAmVf6Vfo0cwLRfqZKXa','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\LhzEZNVf1KtlJWvOxiE51MSqXI1W8ckhtlieKd2k6j2aOAmVf6Vfo0cwLRfqZKXa.jpg',NULL,'0',NULL,'cms','article'),('8298c78996dd45b68a59a8c26a347098','BiFW2v83CxgbuodfjGr0aH0nY5zPE27qp0dGam70yV0ETLZPkwSgq6eIZJcKHFE2','favicon.png',3088,'png','\\admin\\user\\2018\\6\\28\\BiFW2v83CxgbuodfjGr0aH0nY5zPE27qp0dGam70yV0ETLZPkwSgq6eIZJcKHFE2.png',NULL,'0',NULL,'admin','user'),('84d38fcff1814de78337e01a2c1f50c9','Ntn42biwy6ENWv6g9lWOIUyHsLDN6yK6XMQRJpOJ8md13nu1A7XulFBjuQgaYCwU','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\Ntn42biwy6ENWv6g9lWOIUyHsLDN6yK6XMQRJpOJ8md13nu1A7XulFBjuQgaYCwU.jpg',NULL,'0',NULL,'cms','columns'),('874f3d7a4e8a43c28e63415aa2db7017','7I3lkbKz3EBRqZQizLilD2nVj8OrbwRbV26F3AAqnMm9R1CSwZUU9F4ef06FmHEm','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\7I3lkbKz3EBRqZQizLilD2nVj8OrbwRbV26F3AAqnMm9R1CSwZUU9F4ef06FmHEm.jpg',NULL,'0',NULL,'cms','article'),('8bada9562e92411c840f9af648f20604','wF4OMI7cPuC53LiEEvJS2zGrtZxxQpQ7Mw7Jz5Pesf0w3nyitcr1TcKdhCxGa4Dw','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\wF4OMI7cPuC53LiEEvJS2zGrtZxxQpQ7Mw7Jz5Pesf0w3nyitcr1TcKdhCxGa4Dw.jpg',NULL,'0',NULL,'cms','columns'),('8dd744e4d2bd4c8eaed844cbe06bbf1a','mM68LY3V4BcEUKhIcHPxFzPkWYiqxe6T2KNUnIwgQCnlhhNdAU3SKhAtkGq3a60s','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\mM68LY3V4BcEUKhIcHPxFzPkWYiqxe6T2KNUnIwgQCnlhhNdAU3SKhAtkGq3a60s.jpg',NULL,'0',NULL,'cms','columns'),('8ee61fbe7e2449fd8a5cd7a792d380cd','VuQ8Gx1ecGdbD6N0BNcwhxcAPs1d7lMvYIr13BduDx0S0qhye1JTncTAj96kIGXt','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\VuQ8Gx1ecGdbD6N0BNcwhxcAPs1d7lMvYIr13BduDx0S0qhye1JTncTAj96kIGXt.jpg',NULL,'0',NULL,'cms','columns'),('8f37020dd8ca44e39cdca5418e725c65','DzepQGu754OhVWE7EczrpX3Hc6etZpdGg7W8Lvis8DiLfiwRMqgDYrqFgrRV3uww','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\DzepQGu754OhVWE7EczrpX3Hc6etZpdGg7W8Lvis8DiLfiwRMqgDYrqFgrRV3uww.jpg',NULL,'0',NULL,'cms','article'),('9126dad86b944dc2b888f339a930eb50','CyMhNA3LqpkEKVaOj2r7bFpkVZ4sRqjz6MAaAXoPtWCpsHxboJiLcuMvWAlB2E37','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\CyMhNA3LqpkEKVaOj2r7bFpkVZ4sRqjz6MAaAXoPtWCpsHxboJiLcuMvWAlB2E37.jpg',NULL,'0',NULL,'cms','columns'),('95ed2cd4209c4f19bc316097bfb18b6f','SgRpbb26u5b8QjNJpd8aSk7DwbB5QIvCYgZXPArH0IPnzYF8tkfstQNSxYOQvpM7','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\SgRpbb26u5b8QjNJpd8aSk7DwbB5QIvCYgZXPArH0IPnzYF8tkfstQNSxYOQvpM7.jpg',NULL,'0',NULL,'cms','columns'),('9ed34501965f4775a59deb0c8365ddd9','Fh1xNf6wMEyN0nKzQeWeON2bynm0LmvqgpDyZhE7uOlI9jSOlulVdEwoj5ayU9t0','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\Fh1xNf6wMEyN0nKzQeWeON2bynm0LmvqgpDyZhE7uOlI9jSOlulVdEwoj5ayU9t0.jpg',NULL,'0',NULL,'cms','article'),('9fc06795cd02465fa90c3b1236ed13bc','lPIUi0mm16TE25zIyVkvAVUH3CuiPRcc7TH2V42I5s9HMGVyM6YjcvJnTCNMcGg4','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\lPIUi0mm16TE25zIyVkvAVUH3CuiPRcc7TH2V42I5s9HMGVyM6YjcvJnTCNMcGg4.jpg',NULL,'0',NULL,'cms','columns'),('a8e0584da17b4777a422a9d17a2c94d9','mQbnKZxYVNm3L6yG28bEJ9tEHZNywvGZfbk9IkQalPimPxGVGffXTRtEIOmlCDCP','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\mQbnKZxYVNm3L6yG28bEJ9tEHZNywvGZfbk9IkQalPimPxGVGffXTRtEIOmlCDCP.jpg',NULL,'0',NULL,'cms','article'),('a9a2718775fd4102871247f935993985','mWoEEyanY4sZfWTIUVQXvyr6rwSYIma1JNVqB7lz7zX6HEy1QyvBV1ZuPvGf1iga','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\mWoEEyanY4sZfWTIUVQXvyr6rwSYIma1JNVqB7lz7zX6HEy1QyvBV1ZuPvGf1iga.jpg',NULL,'0',NULL,'cms','article'),('b01cb73f74bc4c5dbdb09ec8d5619be2','o95gbLIbBskQkesTVU0hJVwwwQVHWWItDq1pqG5PRPZM9WZtBcDdwGQZt6fgKZ9j','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\o95gbLIbBskQkesTVU0hJVwwwQVHWWItDq1pqG5PRPZM9WZtBcDdwGQZt6fgKZ9j.jpg',NULL,'0',NULL,'cms','columns'),('b54294dd5b0147908a63e35b6d98d80b','YTkO0CadJ6q06ZAka0a8Dj7fK0NCavVPJkNIMK98ce5MXwlIv82DpgqXWkMwUVw3','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\18\\YTkO0CadJ6q06ZAka0a8Dj7fK0NCavVPJkNIMK98ce5MXwlIv82DpgqXWkMwUVw3.jpg',NULL,'0',NULL,'cms','article'),('bab1f79cb8c54315aab1008a4b241d5f','7pc3Ofnuc7VLst81BxkJtV4Ec66k08U2Z5EbIpKwT7mEfooGxw4N6jJoafZikbfL','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\7pc3Ofnuc7VLst81BxkJtV4Ec66k08U2Z5EbIpKwT7mEfooGxw4N6jJoafZikbfL.jpg',NULL,'0',NULL,'cms','columns'),('bdd1d1603d3f46b9b033311312bfa0d9','5xx4d5UKtRZkjotWkpIfQzEgMX6bRTV7D0rW9vJAMEL961r921s40VHpkObVXWhl','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\15\\5xx4d5UKtRZkjotWkpIfQzEgMX6bRTV7D0rW9vJAMEL961r921s40VHpkObVXWhl.jpg',NULL,'0',NULL,'cms','columns'),('c109f427c1634743addb867d32c7a39c','i2tZPgQtgV1OiUfYByAetpxp0oQoEso22tGDs58DMiTzeoliJZCEmiKd5VX2kNyv','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\i2tZPgQtgV1OiUfYByAetpxp0oQoEso22tGDs58DMiTzeoliJZCEmiKd5VX2kNyv.jpg',NULL,'0',NULL,'cms','article'),('c2ee2e3feadc4a858d7df7f1fdac9748','4XbgfyC8UPQyyF4kgtLiRON5B3lxD8w3Qt7RDmRWXtq77fe27vWCgbF62ipBn63J','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\4XbgfyC8UPQyyF4kgtLiRON5B3lxD8w3Qt7RDmRWXtq77fe27vWCgbF62ipBn63J.jpg',NULL,'0',NULL,'cms','columns'),('cb7d52feedd3491c9da8b3127b2c0b50','oOd5WwAVMn6ECJjCmzlM6f9urUbBieBuawhI2OktP1AcJMYgvX6awO7tDbJpu0AP','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\oOd5WwAVMn6ECJjCmzlM6f9urUbBieBuawhI2OktP1AcJMYgvX6awO7tDbJpu0AP.jpg',NULL,'0',NULL,'cms','columns'),('cdec1cd77c9d4509a1c64732e75893f3','704ZDP1ABB7ZRlGYzeXNTlomdloMwRCmIQiFRdiMRcXJpgdRTEWahj7dWIA54Oif','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\704ZDP1ABB7ZRlGYzeXNTlomdloMwRCmIQiFRdiMRcXJpgdRTEWahj7dWIA54Oif.jpg',NULL,'0',NULL,'cms','columns'),('d03ab23b672447d4a367a7ad5c837223','urDJKaQiRdvlnKK1f2ubMy4zFM76zAKzs8soGfeo3wjnj6kFDInB0TymBIIV6Uma','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\16\\urDJKaQiRdvlnKK1f2ubMy4zFM76zAKzs8soGfeo3wjnj6kFDInB0TymBIIV6Uma.jpg',NULL,'0',NULL,'cms','article'),('d09bb5bd89ee4c2d9e410495f65a4894','UK7T8r4DKaC7r2MCcAE0Pkz95MzW44QOy6f9L5xsH7yz81MJyCQyByK44BEkGg2k','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\UK7T8r4DKaC7r2MCcAE0Pkz95MzW44QOy6f9L5xsH7yz81MJyCQyByK44BEkGg2k.jpg',NULL,'0',NULL,'cms','article'),('d5fa516109194dc08ae50d7cddb78785','yp7iZJXSjmZVsa3tLOZU04PZUBRV8aHU94SNl9GqCYbtqI7Z4j1epbn4rDfe4Y5f','favicon.png',3088,'png','\\admin\\user\\2018\\6\\28\\yp7iZJXSjmZVsa3tLOZU04PZUBRV8aHU94SNl9GqCYbtqI7Z4j1epbn4rDfe4Y5f.png',NULL,'0',NULL,'admin','user'),('d9d136df6a294f8d9560e2a9cdf4768b','QKyvRngx5nGmBcWpjBPa19k1IlG0HXwG4h37UVC40P7jLs9GbEiOXMcCyGhaRsZd','20.jpg',731680,'jpg','\\cms\\article\\2018\\9\\23\\QKyvRngx5nGmBcWpjBPa19k1IlG0HXwG4h37UVC40P7jLs9GbEiOXMcCyGhaRsZd.jpg',NULL,'0',NULL,'cms','article'),('dbe8250315f34025a6dc8570274830f4','FOj30hmIbs6U3Q2z8O05nX3UvWcoYqkv8uwnHcdAWyFctl6XoQcMRbfrJ91mn6m0','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\FOj30hmIbs6U3Q2z8O05nX3UvWcoYqkv8uwnHcdAWyFctl6XoQcMRbfrJ91mn6m0.jpg',NULL,'0',NULL,'cms','article'),('e0709f323af44a70b0a87cb1068a9a4f','mXEWXf4TAJ1ZDwuoD7X5scTgZsgUEK8w0iSwRvQcK5lCQtMz3gUAb6fxDeGLjPs7','favicon.png',3088,'png','\\admin\\user\\2018\\6\\28\\mXEWXf4TAJ1ZDwuoD7X5scTgZsgUEK8w0iSwRvQcK5lCQtMz3gUAb6fxDeGLjPs7.png',NULL,'0',NULL,'admin','user'),('e4db79bef59b42d9ad7676f2899fa82f','UugtS82q7KQffg6jkruW0pIjP3v2NFOBnLwwl8GHH9GXyRJxq7WZpPXmgn9KegXP','favicon.png',3088,'png','\\admin\\user\\2018\\6\\28\\UugtS82q7KQffg6jkruW0pIjP3v2NFOBnLwwl8GHH9GXyRJxq7WZpPXmgn9KegXP.png',NULL,'0',NULL,'admin','user'),('ed9e4ef6055b4b1c956b6c1b8f11932b','UlxQ9hRG48kCuv419yeHCNcbjtc3nhvXp4L48oixukurTDLQMEH1gliKZXiND89F','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\12\\UlxQ9hRG48kCuv419yeHCNcbjtc3nhvXp4L48oixukurTDLQMEH1gliKZXiND89F.jpg',NULL,'0',NULL,'cms','columns'),('ef2c785ca22a4be5927343123c081346','7FH2xbxUDFEZtzkGagpWTrKNU9h7AG2oos3fm8OUvarR0my1j23Rdn41lYD8o344','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\7FH2xbxUDFEZtzkGagpWTrKNU9h7AG2oos3fm8OUvarR0my1j23Rdn41lYD8o344.jpg',NULL,'0',NULL,'cms','article'),('f676c41ae59742dc9f9595e8fc996884','O5CFLocMdRIRTEzZ78AGIC0KMgxHYghr9hc6zo8vW5IWKB2hV74rHxPPLTmKNwtn','19.jpg',43422,'jpg','\\admin\\user\\2018\\4\\24\\O5CFLocMdRIRTEzZ78AGIC0KMgxHYghr9hc6zo8vW5IWKB2hV74rHxPPLTmKNwtn.jpg',NULL,'0',NULL,'admin','user'),('f81cfd3835664b7a90bdf55305bc41d8','TyoHj1TFdElAtP2OTv5yjyJnWjEvDtqDj9CykhybHMNxSktlGpI64Ovn7eArEEEi','19.jpg',43422,'jpg','\\cms\\columns\\2018\\9\\16\\TyoHj1TFdElAtP2OTv5yjyJnWjEvDtqDj9CykhybHMNxSktlGpI64Ovn7eArEEEi.jpg',NULL,'0',NULL,'cms','columns'),('fb07c80c888844fca05a3669d2da6972','Mzb08vskYm3wmAvjCoTHiJctUXQ4coHDszdzTdJltRy3Efp5zI2mlUQec18dysm9','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\18\\Mzb08vskYm3wmAvjCoTHiJctUXQ4coHDszdzTdJltRy3Efp5zI2mlUQec18dysm9.jpg',NULL,'0',NULL,'cms','article'),('fd61e3dab36c487e9b048b0cef3988bc','00t4wED21flKqXskok6PgTY0Rkiai6TEGmMKFZXDBHRsQi0vy9dwdzWkGJe8x39t','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\18\\00t4wED21flKqXskok6PgTY0Rkiai6TEGmMKFZXDBHRsQi0vy9dwdzWkGJe8x39t.jpg',NULL,'0',NULL,'cms','article'),('fffb1a1f6e084bca8af4637783eb5b40','Xn01IKbv2E7DxeHRlJni0IPyH2A7teChNt0cqV3GNsvuPUhMrS1WZfBW8gzvUI3m','19.jpg',43422,'jpg','\\cms\\article\\2018\\9\\13\\Xn01IKbv2E7DxeHRlJni0IPyH2A7teChNt0cqV3GNsvuPUhMrS1WZfBW8gzvUI3m.jpg',NULL,'0',NULL,'cms','article');
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

-- Dump completed on 2018-09-24  1:05:22

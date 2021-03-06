CREATE TABLE `T_CMS_COLUMNS` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父ID',
  `parentIds` varchar(3300) DEFAULT NULL COMMENT '所有父级编号',
  `depth` DECIMAL(10,0) DEFAULT NULL COMMENT '深度',
  `longName` varchar(500) NOT NULL COMMENT '全名称',
  `longCode` varchar(500) NOT NULL COMMENT '全编码',
  `queueNumber` DECIMAL(10,0) DEFAULT NULL COMMENT '排序号',
  `sys_data` char(1) DEFAULT '0' COMMENT '系统初始化数据：1、是；0、否',
  `createUser` varchar(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` VARCHAR(20) NULL COMMENT '版本号',
  `lastUpdateVersion` VARCHAR(20) NULL COMMENT '最后更新版本号',
  `ip` VARCHAR(20) NULL COMMENT 'IP',
  `lastUpdateIp` VARCHAR(20) NULL COMMENT '最后更新IP',
  `status` char(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

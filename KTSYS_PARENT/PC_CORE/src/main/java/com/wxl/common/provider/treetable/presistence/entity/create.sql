CREATE TABLE `t_wxl_demo_tree` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键',
  `parentCode` VARCHAR(50) NULL COMMENT '父编码',
  `code` VARCHAR(50) NULL COMMENT '编码',
  `name` VARCHAR(50) NULL COMMENT '名称',
  `depth` DECIMAL(2,0) NULL COMMENT '深度',
  `longName` VARCHAR(500) NULL COMMENT '全名称',
  `longCode` VARCHAR(500) NULL COMMENT '全编码',
  `queueNumber` DECIMAL(10,0) NULL COMMENT '排序号',
  `createDate` DATETIME NULL COMMENT '创建日期',
  `createUser` VARCHAR(32) NULL COMMENT '创建人',
  `lastUpdateDate` DATETIME NULL COMMENT '最后修改日期',
  `lastUpdateUser` VARCHAR(32) NULL COMMENT '最后修改人',
  `version` VARCHAR(50) NULL COMMENT '版本',
  `lastUpdateVersion` VARCHAR(50) NULL COMMENT '最后修改版本',
  `ip` VARCHAR(50) NULL COMMENT 'ip',
  `lastUpdateIp` VARCHAR(50) NULL COMMENT '最后修改IP',
  `status` DECIMAL(2,0) NULL COMMENT '状态',
  PRIMARY KEY (`id`))
COMMENT = 'treetable demo';

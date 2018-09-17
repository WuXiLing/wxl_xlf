CREATE TABLE `sys_login_history` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键',
  `user_id` VARCHAR(32) NULL COMMENT '用户ID',
  `loginIp` VARCHAR(20) NULL COMMENT '登录IP',
  `loginDate` DATETIME NULL DEFAULT current_timestamp() COMMENT '登录时间',
  `createDate` DATETIME NULL DEFAULT current_timestamp() COMMENT '创建记录时间',
  `createUser` VARCHAR(32) NULL COMMENT '创建记录人ID',
  `lastUpdateDate` DATETIME NULL DEFAULT current_timestamp() COMMENT '最后更新时间',
  `lastUpdateUser` VARCHAR(32) NULL COMMENT '最后更新人ID',
  `version` VARCHAR(20) NULL COMMENT '版本号',
  `lastUpdateVersion` VARCHAR(20) NULL COMMENT '最后更新版本号',
  `ip` VARCHAR(20) NULL COMMENT 'IP',
  `lastUpdateIp` VARCHAR(20) NULL COMMENT '最后更新IP',
  `status` CHAR(2) NULL DEFAULT 0 COMMENT '状态：0、登录；1、退出。',
  `remarks` VARCHAR(500) NULL COMMENT '备注',
  PRIMARY KEY (`id`));

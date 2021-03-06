CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `sys_data` char(1) DEFAULT '0' COMMENT '系统初始化数据：1、是；0、否',
  `createUser` varchar(64) NOT NULL COMMENT '创建者',
  `createDate` datetime NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) NOT NULL COMMENT '更新者',
  `lastUpdateDate` datetime NOT NULL default CURRENT_TIMESTAMP COMMENT '最新更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `lastUpdateVersion` varchar(45) DEFAULT NULL COMMENT '删除标记',
  `lastUpdateIp` varchar(45) DEFAULT NULL COMMENT '删除标记',
  `version` varchar(45) DEFAULT NULL COMMENT '删除标记',
  `ip` varchar(45) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

CREATE TABLE `sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(16,0) default 10000 COMMENT '排序',
  `createUser` varchar(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` char(2) DEFAULT NULL COMMENT '状态',
  `sysData` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典类型表';

CREATE TABLE `sys_dict_item` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dictTypeId` varchar(100) DEFAULT NULL COMMENT '数据字典类型ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(16,0) default 10000 COMMENT '排序',
  `createUser` varchar(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastUpdateUser` varchar(64) DEFAULT NULL COMMENT '更新者',
  `lastUpdateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `version` varchar(20) DEFAULT NULL,
  `lastUpdateVersion` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lastUpdateIp` varchar(20) DEFAULT NULL,
  `status` char(2) DEFAULT NULL COMMENT '状态',
  `sysData` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典条目表';
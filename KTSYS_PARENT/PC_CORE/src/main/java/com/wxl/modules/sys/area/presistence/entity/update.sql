ALTER TABLE `wxl_sign`.`sys_area` 
CHANGE COLUMN `sort` `queueNumber` DECIMAL(10,0) NOT NULL COMMENT '排序' ,
CHANGE COLUMN `create_by` `createUser` VARCHAR(64) NOT NULL COMMENT '创建者' ,
CHANGE COLUMN `create_date` `createDate` DATETIME NOT NULL COMMENT '创建时间' ,
CHANGE COLUMN `update_date` `lastUpdateDate` DATETIME NOT NULL COMMENT '更新时间' ,
ADD COLUMN `version` VARCHAR(45) NULL AFTER `del_flag`,
ADD COLUMN `lastUpdateVersion` VARCHAR(45) NULL AFTER `version`,
ADD COLUMN `lastUpdateIp` VARCHAR(45) NULL AFTER `lastUpdateVersion`,
ADD COLUMN `depth` CHAR(1) NULL AFTER `lastUpdateIp`,
ADD COLUMN `longName` VARCHAR(500) NULL AFTER `depth`,
ADD COLUMN `longCode` VARCHAR(500) NULL AFTER `longName`;

ALTER TABLE `wxl_sign`.`sys_area` 
DROP COLUMN `longCode`,
CHANGE COLUMN `parent_id` `parentId` VARCHAR(64) NOT NULL COMMENT '父级编号' ,
CHANGE COLUMN `parent_ids` `longCode` VARCHAR(2000) NOT NULL COMMENT '所有父级编号' ;

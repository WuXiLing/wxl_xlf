package com.wxl.modules.sys.storge.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 文件存储
 * 
 * @author wxl
 *
 */
public class StorgeEntity extends SingleTableEntity {

	private static final long serialVersionUID = -6881108072437058205L;

	/** 逻辑名 **/
	private String logicalName;

	/** 物理名 **/
	private String physicalName;

	/** 大小 **/
	private long fileSize;

	/** 类型 **/
	private String fileType;

	/** 物理路径 **/
	private String filePhysicalPath;

	/** 逻辑模块地址 **/
	private String logicalModule;

	/** 业务主键 **/
	private String entityId;

	/** 系统 */
	private String sys;

	/** 类型 */
	private String type;

	public String getLogicalName() {
		return logicalName;
	}

	public void setLogicalName(String logicalName) {
		this.logicalName = logicalName;
	}

	public String getPhysicalName() {
		return physicalName;
	}

	public void setPhysicalName(String physicalName) {
		this.physicalName = physicalName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long l) {
		this.fileSize = l;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFilePhysicalPath() {
		return filePhysicalPath;
	}

	public void setFilePhysicalPath(String filePhysicalPath) {
		this.filePhysicalPath = filePhysicalPath;
	}

	public String getLogicalModule() {
		return logicalModule;
	}

	public void setLogicalModule(String logicalModule) {
		this.logicalModule = logicalModule;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public String getSys() {
		return sys;
	}

	public void setSys(String sys) {
		this.sys = sys;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}

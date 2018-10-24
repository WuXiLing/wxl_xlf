package com.wxl.common.provider.base.presistence.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;

import com.wxl.modules.sys.user.presistence.entity.User;

import io.swagger.annotations.ApiModelProperty;

/**
 * @author liangxf
 *
 */
public class BaseEntity extends ProviderEntity {

	private static final long serialVersionUID = -25358647898658102L;

	/** 系统参数 */
	@ApiModelProperty(value = "系统参数", name = "sysData", hidden = true)
	protected boolean sysData;

	/** 创建时间 **/
	@ApiModelProperty(value = "创建时间", name = "createDate", hidden = true)
	protected Date createDate;

	/** 创建人 **/
	@ApiModelProperty(value = "创建人", name = "createUser", hidden = true)
	protected User createUser;

	/** 最后修改时间 **/
	@ApiModelProperty(value = "最后修改时间", name = "lastUpdateDate", hidden = true)
	protected Date lastUpdateDate;

	/** 最后修改人 **/
	@ApiModelProperty(value = "最后修改人", name = "lastUpdateUser", hidden = true)
	protected User lastUpdateUser;

	/** 版本号 **/
	@ApiModelProperty(value = "版本号", name = "version", hidden = true)
	protected String version;

	/** 最后修改版本号 **/
	@ApiModelProperty(value = "最后修改版本号", name = "lastUpdateVersion", hidden = true)
	protected String lastUpdateVersion;

	/** 修改IP **/
	@ApiModelProperty(value = "修改IP", name = "ip", hidden = true)
	protected String ip;

	/** 最后修改IP **/
	@ApiModelProperty(value = "最后修改IP", name = "lastUpdateIp", hidden = true)
	protected String lastUpdateIp;

	/** 状态 **/
	@ApiModelProperty(value = "状态", name = "status", hidden = true)
	protected String status;

	/** 备注 **/
	@ApiModelProperty(value = "备注", name = "remarks", hidden = true)
	protected String remarks;

	/** 其他参数集合 */
	@ApiModelProperty(value = "备注", name = "remarks", hidden = true)
	protected Map<String, Object> params = new HashMap<String, Object>();

	@Value("#{JDBC_PROP['jdbc.type']}")
	@ApiModelProperty(value = "数据库", name = "dbType", hidden = true)
	protected static String dbType;

	/** 行号 */
	@ApiModelProperty(value = "行号", name = "rowNum", hidden = true)
	protected Integer rowNum;

	/**
	 * 构造函数
	 */
	public BaseEntity() {
		super();
	}

	/**
	 * 构造函数
	 * 
	 * @param id
	 */
	public BaseEntity(String id) {
		super(id);
	}

	/**
	 * @return the sysData
	 */
	public boolean isSysData() {
		return sysData;
	}

	/**
	 * @param sysData
	 *            the sysData to set
	 */
	public void setSysData(boolean sysData) {
		this.sysData = sysData;
	}

	/**
	 * @return the params
	 */
	public Map<String, Object> getParams() {
		return params;
	}

	/**
	 * @param params
	 *            the params to set
	 */
	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	/**
	 * @return createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            要设置的 createDate
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return createUser
	 */
	public User getCreateUser() {
		return createUser;
	}

	/**
	 * @param createUser
	 *            要设置的 createUser
	 */
	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	/**
	 * @return lastUpdateDate
	 */
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	/**
	 * @param lastUpdateDate
	 *            要设置的 lastUpdateDate
	 */
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	/**
	 * @return lastUpdateUser
	 */
	public User getLastUpdateUser() {
		return lastUpdateUser;
	}

	/**
	 * @param lastUpdateUser
	 *            要设置的 lastUpdateUser
	 */
	public void setLastUpdateUser(User lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	/**
	 * @return version
	 */
	public String getVersion() {
		return version;
	}

	/**
	 * @param version
	 *            要设置的 version
	 */
	public void setVersion(String version) {
		this.version = version;
	}

	/**
	 * @return lastUpdateVersion
	 */
	public String getLastUpdateVersion() {
		return lastUpdateVersion;
	}

	/**
	 * @param lastUpdateVersion
	 *            要设置的 lastUpdateVersion
	 */
	public void setLastUpdateVersion(String lastUpdateVersion) {
		this.lastUpdateVersion = lastUpdateVersion;
	}

	/**
	 * @return ip
	 */
	public String getIp() {
		return ip;
	}

	/**
	 * @param ip
	 *            要设置的 ip
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}

	/**
	 * @return lastUpdateIp
	 */
	public String getLastUpdateIp() {
		return lastUpdateIp;
	}

	/**
	 * @param lastUpdateIp
	 *            要设置的 lastUpdateIp
	 */
	public void setLastUpdateIp(String lastUpdateIp) {
		this.lastUpdateIp = lastUpdateIp;
	}

	/**
	 * @return status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            要设置的 status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return remarks
	 */
	public String getRemarks() {
		return remarks;
	}

	/**
	 * @param remarks
	 *            要设置的 remarks
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	/**
	 * @return the rowNum
	 */
	public Integer getRowNum() {
		return rowNum;
	}

	/**
	 * @param rowNum
	 *            the rowNum to set
	 */
	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}

	public void setRn(Integer rowNum) {
		this.rowNum = rowNum;
	}

	/**
	 * 添加参数
	 * 
	 * @param key
	 * @param value
	 *
	 */
	public void addParam(String key, Object value) {
		this.params.put(key, value);
	}

	/**
	 * 获取参数
	 * 
	 * @param key
	 * @return
	 *
	 */
	public Object getParam(String key) {
		if (this.params.containsKey(key)) {
			return this.params.get(key);
		}
		return null;
	}

	/**
	 * @return the dbType
	 */
	public static String getDbType() {
		return dbType;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((createUser == null) ? 0 : createUser.hashCode());
		result = prime * result + ((ip == null) ? 0 : ip.hashCode());
		result = prime * result + ((lastUpdateDate == null) ? 0 : lastUpdateDate.hashCode());
		result = prime * result + ((lastUpdateIp == null) ? 0 : lastUpdateIp.hashCode());
		result = prime * result + ((lastUpdateUser == null) ? 0 : lastUpdateUser.hashCode());
		result = prime * result + ((lastUpdateVersion == null) ? 0 : lastUpdateVersion.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((version == null) ? 0 : version.hashCode());
		result = prime * result + ((remarks == null) ? 0 : remarks.hashCode());
		return result;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		BaseEntity other = (BaseEntity) obj;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (createUser == null) {
			if (other.createUser != null)
				return false;
		} else if (!createUser.equals(other.createUser))
			return false;
		if (ip == null) {
			if (other.ip != null)
				return false;
		} else if (!ip.equals(other.ip))
			return false;
		if (lastUpdateDate == null) {
			if (other.lastUpdateDate != null)
				return false;
		} else if (!lastUpdateDate.equals(other.lastUpdateDate))
			return false;
		if (lastUpdateIp == null) {
			if (other.lastUpdateIp != null)
				return false;
		} else if (!lastUpdateIp.equals(other.lastUpdateIp))
			return false;
		if (lastUpdateUser == null) {
			if (other.lastUpdateUser != null)
				return false;
		} else if (!lastUpdateUser.equals(other.lastUpdateUser))
			return false;
		if (lastUpdateVersion == null) {
			if (other.lastUpdateVersion != null)
				return false;
		} else if (!lastUpdateVersion.equals(other.lastUpdateVersion))
			return false;
		if (status != other.status)
			return false;
		if (version == null) {
			if (other.version != null)
				return false;
		} else if (!version.equals(other.version))
			return false;
		if (remarks == null) {
			if (other.remarks != null)
				return false;
		} else if (!remarks.equals(other.remarks))
			return false;
		return true;
	}
}

package com.wxl.modules.sys.office.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 角色、单位关系
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午3:27:15
 */
public class OfficeRole extends SingleTableEntity {

	private static final long serialVersionUID = -8114823945374760720L;

	/** 用户 */
	private String officeId;

	/** 角色 */
	private String roleId;

	public OfficeRole(String officeId, String roleId) {
		super();
		this.officeId = officeId;
		this.roleId = roleId;
	}

	/**
	 * @return officeId
	 */
	public String getOfficeId() {
		return officeId;
	}

	/**
	 * @param officeId
	 *            要设置的 officeId
	 */
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	/**
	 * @return roleId
	 */
	public String getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId
	 *            要设置的 roleId
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
}

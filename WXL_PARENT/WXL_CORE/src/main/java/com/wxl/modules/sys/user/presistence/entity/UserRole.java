package com.wxl.modules.sys.user.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 角色、用户关系
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午3:27:15
 */
public class UserRole extends SingleTableEntity {

	private static final long serialVersionUID = -8114823945374760720L;

	/** 用户 */
	private String userId;

	/** 角色 */
	private String roleId;
	
	public UserRole(String userId, String roleId) {
		super();
		this.userId = userId;
		this.roleId = roleId;
	}

	/**
	 * @return userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            要设置的 userId
	 */
	public void setUserId(String userId) {
		this.userId = userId;
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

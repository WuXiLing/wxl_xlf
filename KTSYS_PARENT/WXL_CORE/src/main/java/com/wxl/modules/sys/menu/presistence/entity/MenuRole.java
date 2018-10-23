package com.wxl.modules.sys.menu.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 角色、菜单关系
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午3:27:15
 */
public class MenuRole extends SingleTableEntity {

	private static final long serialVersionUID = -8114823945374760720L;

	/** 菜单 */
	private String menuId;

	/** 角色 */
	private String roleId;
	
	public MenuRole() {
		super();
	}

	public MenuRole(String menuId, String roleId) {
		super();
		this.menuId = menuId;
		this.roleId = roleId;
	}

	/**
	 * @return menuId
	 */
	public String getMenuId() {
		return menuId;
	}

	/**
	 * @param menuId
	 *            要设置的 menuId
	 */
	public void setMenuId(String menuId) {
		this.menuId = menuId;
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

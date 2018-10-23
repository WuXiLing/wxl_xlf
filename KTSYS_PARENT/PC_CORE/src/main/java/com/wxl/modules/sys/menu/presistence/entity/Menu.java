package com.wxl.modules.sys.menu.presistence.entity;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

/**
 * 菜单Entity
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午5:12:36
 */
public class Menu extends TreeTableEntity<Menu> {

	private static final long	serialVersionUID	= 1L;

	private String				parentIds;					// 所有父级编号

	private String				name;						// 名称

	private String				href;						// 链接

	private String				target;						// 目标（
															// mainFrame、_blank、_self、_parent、_top）

	private String				icon;						// 图标

	private String				isShow;						// 是否在菜单中显示（1：显示；0：不显示）

	private String				permission;					// 权限标识

	private String				userId;
	
	public Menu() {

		super();
		this.sort = 30;
		this.isShow = "1";
	}

	public String getParentIds() {

		return parentIds;
	}

	public void setParentIds(String parentIds) {

		this.parentIds = parentIds;
	}

	public String getName() {

		return name;
	}

	public void setName(String name) {

		this.name = name;
	}

	public String getHref() {

		return href;
	}

	public void setHref(String href) {

		this.href = StringUtils.isNoneBlank(href) ? href.trim() :"";
	}

	public String getTarget() {

		return target;
	}

	public void setTarget(String target) {

		this.target = StringUtils.isNoneBlank(target) ? target.trim() :"";
	}

	public String getIcon() {

		return icon;
	}

	public void setIcon(String icon) {

		this.icon = icon;
	}

	public String getIsShow() {

		return isShow;
	}

	public void setIsShow(String isShow) {

		this.isShow = isShow;
	}

	public String getPermission() {

		return permission;
	}

	public void setPermission(String permission) {

		this.permission = permission;
	}

	@JsonIgnore
	public static String getRootId() {

		return "1";
	}

	public String getUserId() {

		return userId;
	}

	public void setUserId(String userId) {

		this.userId = userId;
	}

	@Override
	public String toString() {

		return name;
	}

	@Override
	public Menu initParent() {
		return new Menu();
	}
}
package com.wxl.modules.sys.role.presistence.entity;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.wxl.common.config.Global;
import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
import com.wxl.modules.sys.office.presistence.entity.Office;
import com.wxl.modules.sys.user.presistence.entity.User;

/**
 * 角色Entity
 * 
 * @author wxl
 *
 */
public class Role extends SingleTableEntity {

	private static final long serialVersionUID = -6871321280300587770L;

	/** 归属机构 **/
	private Office office;

	/** 角色名称 **/
	private String name;

	/** 英文名称 **/
	private String enname;

	/** 权限类型 **/
	private String roleType;

	/** 数据范围 **/
	private String dataScope;

	/** 是否是系统数据 **/
	// private String sysData;

	/** 是否是可用 **/
	private String useable;

	/** 拥有用户列表 */
	private List<User> userList = new ArrayList<>();

	/** 拥有菜单列表 **/
	private List<Menu> menuList = new ArrayList<>();

	/** 按明细设置数据范围 **/
	private List<Office> officeList = new ArrayList<>();

	// 数据范围（1：所有数据；2：所在公司及以下数据；3：所在公司数据；4：所在部门及以下数据；5：所在部门数据；8：仅本人数据；9：按明细设置）
	public static final String DATA_SCOPE_ALL = "1";

	public static final String DATA_SCOPE_COMPANY_AND_CHILD = "2";

	public static final String DATA_SCOPE_COMPANY = "3";

	public static final String DATA_SCOPE_OFFICE_AND_CHILD = "4";

	public static final String DATA_SCOPE_OFFICE = "5";

	public static final String DATA_SCOPE_SELF = "8";

	public static final String DATA_SCOPE_CUSTOM = "9";

	/** 首页地址 **/
	private String homeAddress;

	public Role() {
		super();
		this.dataScope = DATA_SCOPE_SELF;
		this.useable = Global.YES;
	}

	public Role(String id) {
		this.id = id;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getUseable() {
		return useable;
	}

	public void setUseable(String useable) {
		this.useable = useable;
	}

	// public String getSysData() {
	// return sysData;
	// }
	//
	// public void setSysData(String sysData) {
	// this.sysData = sysData;
	// }

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnname() {
		return enname;
	}

	public void setEnname(String enname) {
		this.enname = enname;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getDataScope() {
		return dataScope;
	}

	public void setDataScope(String dataScope) {
		this.dataScope = dataScope;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<String> getUserIdList() {
		List<String> nameIdList = new ArrayList<>();
		for (User user : userList) {
			nameIdList.add(user.getId());
		}
		return nameIdList;
	}

	public String getUserIds() {
		return StringUtils.join(getUserIdList(), ",");
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public List<String> getMenuIdList() {
		List<String> menuIdList = new ArrayList<>();
		for (Menu menu : menuList) {
			menuIdList.add(menu.getId());
		}
		return menuIdList;
	}

	public void setMenuIdList(List<String> menuIdList) {
		menuList = new ArrayList<>();
		for (String menuId : menuIdList) {
			Menu menu = new Menu();
			menu.setId(menuId);
			menuList.add(menu);
		}
	}

	public String getMenuIds() {
		return StringUtils.join(getMenuIdList(), ",");
	}

	public void setMenuIds(String menuIds) {
		menuList = new ArrayList<>();
		if (menuIds != null) {
			String[] ids = StringUtils.split(menuIds, ",");
			setMenuIdList(new ArrayList<String>() {
				private static final long serialVersionUID = -2467260590924059891L;

				{
					for (String x : ids) {
						add(x);
					}
				}
			});
		}
	}

	public List<Office> getOfficeList() {
		return officeList;
	}

	public void setOfficeList(List<Office> officeList) {
		this.officeList = officeList;
	}

	public List<String> getOfficeIdList() {
		List<String> officeIdList = new ArrayList<>();
		for (Office office : officeList) {
			officeIdList.add(office.getId());
		}
		return officeIdList;
	}

	public void setOfficeIdList(List<String> officeIdList) {
		officeList = new ArrayList<>();
		for (String officeId : officeIdList) {
			Office office = new Office();
			office.setId(officeId);
			officeList.add(office);
		}
	}

	public String getOfficeIds() {
		return StringUtils.join(getOfficeIdList(), ",");
	}

	public void setOfficeIds(String officeIds) {
		officeList = new ArrayList<>();
		if (officeIds != null) {
			String[] ids = StringUtils.split(officeIds, ",");
			setOfficeIdList(new ArrayList<String>() {
				private static final long serialVersionUID = -2467260590924059891L;

				{
					for (String x : ids) {
						add(x);
					}
				}
			});
		}
	}

	/**
	 * 获取权限字符串列表
	 */
	public List<String> getPermissions() {
		List<String> permissions = new ArrayList<>();
		for (Menu menu : menuList) {
			if (menu.getPermission() != null && !"".equals(menu.getPermission())) {
				permissions.add(menu.getPermission());
			}
		}
		return permissions;
	}
}

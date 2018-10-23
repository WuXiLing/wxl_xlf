package com.wxl.modules.sys.utils;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.utils.SpringContextHolder;
import com.wxl.modules.sys.menu.service.MenuRoleService;
import com.wxl.modules.sys.user.service.UserRoleService;

/**
 * 角色工具类
 * 
 * @author wxl
 * 
 * @date 2017年7月29日 上午9:48:46
 */
public class RoleUtils {

	/** 用户角色 */
	private static UserRoleService userRoleService = SpringContextHolder.getBean(UserRoleService.class);

	/** 菜单角色 */
	private static MenuRoleService menuRoleService = SpringContextHolder.getBean(MenuRoleService.class);


	/**
	 * 删除角色用户关联
	 * 
	 * @param roleId
	 *            角色ID
	 */
	public static void deleteRoleAliseUser(@Param("roleId") String roleId) {
		userRoleService.deleteByRoleId(roleId);
	}

	/**
	 * 添加用户角色关联
	 * 
	 * @param userIds
	 *            用户ID集合
	 * @param roleId
	 *            角色ID
	 */
	public static void addUserToRole(@Param("userIds") String[] userIds, @Param("roleId") String roleId) {
		userRoleService.addUserToRole(userIds, roleId);
	}

	/**
	 * 添加菜单角色关联
	 * 
	 * @param userIds
	 *            用户ID集合
	 * @param roleId
	 *            角色ID
	 */
	public static void addMenuToRole(@Param("menuIds") String[] menuIds, @Param("roleId") String roleId) {
		menuRoleService.addMenuToRole(menuIds, roleId);
	}
}

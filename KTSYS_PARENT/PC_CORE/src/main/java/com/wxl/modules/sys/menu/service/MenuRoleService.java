package com.wxl.modules.sys.menu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.menu.presistence.entity.MenuRole;

/**
 * 菜单角色Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:38:26
 */
public interface MenuRoleService extends SingleTableService<MenuRole> {

	/**
	 * 根据菜单ID查询
	 * 
	 * @param menuId
	 * @return
	 */
	List<MenuRole> findByMenuId(@Param("menuId") String menuId);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 * @return
	 */
	List<MenuRole> findByRoleId(@Param("roleId") String roleId);

	/**
	 * 根据菜单ID删除
	 * 
	 * @param menuId
	 * @return
	 */
	int deleteByMenuId(@Param("menuId") String menuId);

	/**
	 * 根据角色ID删除
	 * 
	 * @param roleId
	 * @return
	 */
	int deleteByRoleId(@Param("roleId") String roleId);

	/**
	 * 添加菜单、角色关联
	 * 
	 * @param menuId
	 *            菜单ID
	 * @param roleId
	 *            角色ID
	 */
	void addMenuToRole(@Param("menuIds") String[] menuIds, @Param("roleId") String roleId);

	/**
	 * 删除菜单、角色关联
	 * 
	 * @param menuId
	 *            菜单ID
	 * @param roleId
	 *            角色ID
	 */
	void removeMenuFromRole(@Param("menuId") String menuId, @Param("roleId") String roleId);
}

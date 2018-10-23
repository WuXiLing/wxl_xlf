package com.wxl.modules.sys.role.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.modules.sys.role.presistence.entity.Role;

/**
 * 角色service
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:16:12
 */
public interface RoleServiceI extends SingleTableService<Role> {

	/**
	 * 根据用户ID查询角色集合
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	public List<Role> findRoloByUserId(@Param("userId") String userId);

	/**
	 * 根据菜单ID查询角色集合
	 * 
	 * @param menuId
	 *            菜单ID
	 * @return
	 */
	public List<Role> findRoloByMenuId(@Param("menuId") String menuId);

	/**
	 * 根据机构ID查询角色集合
	 * 
	 * @param officeId
	 *            菜单ID
	 * @return
	 */
	public List<Role> findRoloByOfficeId(@Param("officeId") String officeId);

	public void selectUserLayuiPageList(LayuiPage page);
}

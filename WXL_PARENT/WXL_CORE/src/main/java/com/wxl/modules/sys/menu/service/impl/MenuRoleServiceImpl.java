package com.wxl.modules.sys.menu.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.menu.presistence.entity.MenuRole;
import com.wxl.modules.sys.menu.presistence.mapper.MenuRoleMapper;
import com.wxl.modules.sys.menu.service.MenuRoleService;

/**
 * 菜单角色Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:40:02
 */
@Service
@Transactional(readOnly = true)
public class MenuRoleServiceImpl extends SingleTableServiceImpl<MenuRole, MenuRoleMapper> implements MenuRoleService {

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.MenuRoleService#findByMenuId(java.lang.String)
	 */
	@Override
	public List<MenuRole> findByMenuId(@Param("menuId")String menuId) {
		return mapper.findByMenuId(menuId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.MenuRoleService#findByRoleId(java.lang.String)
	 */
	@Override
	public List<MenuRole> findByRoleId(@Param("roleId")String roleId) {
		return mapper.findByRoleId(roleId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.MenuRoleService#deleteByMenuId(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = false)
	public int deleteByMenuId(@Param("menuId")String menuId) {
		return mapper.deleteByMenuId(menuId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.MenuRoleService#deleteByRoleId(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = false)
	public int deleteByRoleId(@Param("roleId")String roleId) {
		return mapper.deleteByRoleId(roleId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.MenuRoleService#addMenuToRole()
	 */
	@Override
	@Transactional(readOnly = false)
	public void addMenuToRole(@Param("menuIds")String[] menuIds,String roleId) {
		this.deleteByRoleId(roleId);
		for(String menuId : menuIds){
			this.insert(new MenuRole(menuId, roleId));
		}
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.MenuRoleService#removeMenuFromRole()
	 */
	@Override
	@Transactional(readOnly = false)
	public void removeMenuFromRole(@Param("menuId")String menuId,String roleId) {
		mapper.removeMenuFromRole(menuId, roleId);
	}
}

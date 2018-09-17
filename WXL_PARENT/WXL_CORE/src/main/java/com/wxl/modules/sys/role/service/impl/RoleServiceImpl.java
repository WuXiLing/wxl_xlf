package com.wxl.modules.sys.role.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.modules.sys.role.presistence.entity.Role;
import com.wxl.modules.sys.role.presistence.mapper.RoleMapper;
import com.wxl.modules.sys.role.service.RoleServiceI;
import com.wxl.modules.sys.utils.RoleUtils;

/**
 * 角色service实现
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:15:10
 */
@Service
@Transactional(readOnly = false)
@CacheEnable(cacheNames = "WXL_ROLE_KEY")
public class RoleServiceImpl extends SingleTableServiceImpl<Role, RoleMapper> implements RoleServiceI {
	
	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#deleteBefore(java.lang.
	 * String)
	 */
	@Override
	public void deleteBefore(String id) {
		RoleUtils.deleteRoleAliseUser(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#saveAfter(java.lang.
	 * Object)
	 */
	public void saveAfter(Role entity) {
		// 更新角色与菜单关联
		if (entity.getMenuList().size() > 0) {
			RoleUtils.addMenuToRole(StringUtils.split(entity.getMenuIds(), ","), entity.getId());
		}

		super.saveAfter(entity);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.modules.sys.role.service.RoleServiceI#findRoloByUserId(java.lang.
	 * String)
	 */
	@Override
	public List<Role> findRoloByUserId(String userId) {
		return mapper.findRoloByUserId(userId);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.modules.sys.role.service.RoleServiceI#findRoloByMenuId(java.lang.
	 * String)
	 */
	@Override
	public List<Role> findRoloByMenuId(String menuId) {
		return mapper.findRoloByMenuId(menuId);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.modules.sys.role.service.RoleServiceI#findRoloByOfficeId(java.
	 * lang.String)
	 */
	@Override
	public List<Role> findRoloByOfficeId(String officeId) {
		return mapper.findRoloByOfficeId(officeId);
	}

	@Override
	public void selectUserLayuiPageList(LayuiPage page) {
		mapper.selectUserLayuiPageList(page);
	}
}

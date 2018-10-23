package com.wxl.modules.sys.role.presistence.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.modules.sys.role.presistence.entity.Role;

/**
 * 角色DAO接口
 * 
 * @author wxl
 *
 */
@MyBatisDao
public interface RoleMapper extends SingleTableMapper<Role> {

	/**
	 * 根据名称查询
	 * 
	 * @param name
	 *            名称
	 * @return
	 */
	public Role findByName(String name);

	/**
	 * 根据英文名称查询
	 * 
	 * @param ename
	 *            英文名称
	 * @return
	 */
	public Role findByEnname(String enname);

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
	 *            机构ID
	 * @return
	 */
	public List<Role> findRoloByOfficeId(@Param("officeId") String officeId);

	public Object selectUserLayuiPageList(LayuiPage page);
}

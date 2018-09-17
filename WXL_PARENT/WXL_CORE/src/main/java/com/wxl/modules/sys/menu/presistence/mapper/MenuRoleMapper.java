package com.wxl.modules.sys.menu.presistence.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.menu.presistence.entity.MenuRole;

/**
 * 菜单角色DAO接口
 * 
 * @author liangxf
 *
 */
@MyBatisDao
public interface MenuRoleMapper extends SingleTableMapper<MenuRole> {

	static final String DB_NAME = "sys_role_menu";

	/**
	 * 根据菜单ID查询
	 * 
	 * @param menuId
	 * @return
	 */
	@Select("select * from " + DB_NAME + " where menu_id = #{menuId}")
	List<MenuRole> findByMenuId(@Param("menuId") String menuId);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 * @return
	 */
	@Select("select * from " + DB_NAME + " where role_id = #{roleId}")
	List<MenuRole> findByRoleId(@Param("roleId") String roleId);

	@Insert("insert into " + DB_NAME + " (role_id,menu_id) values(#{roleId},#{menuId}) ")
	void insert(MenuRole entity);

	/**
	 * 根据菜单ID删除
	 * 
	 * @param menuId
	 * @return
	 */
	@Delete("delete from " + DB_NAME + " where menu_id = #{menuId}")
	int deleteByMenuId(@Param("menuId") String menuId);

	/**
	 * 根据角色ID删除
	 * 
	 * @param roleId
	 * @return
	 */
	@Delete("delete from " + DB_NAME + " where role_id = #{roleId}")
	int deleteByRoleId(@Param("roleId") String roleId);

	/**
	 * 删除菜单、角色关联
	 * 
	 * @param menuId
	 *            菜单ID
	 * @param roleId
	 *            角色ID
	 */
	@Delete("delete from " + DB_NAME + " where role_id = #{roleId} and menu_id = #{menuId}")
	void removeMenuFromRole(@Param("menuId") String menuId, String roleId);

}

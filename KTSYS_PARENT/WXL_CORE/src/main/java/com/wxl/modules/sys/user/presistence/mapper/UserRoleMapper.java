package com.wxl.modules.sys.user.presistence.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.user.presistence.entity.UserRole;

/**
 * 用户角色DAO接口
 * 
 * @author liangxf
 *
 */
@MyBatisDao
public interface UserRoleMapper extends SingleTableMapper<UserRole> {
	
	static final String DB_NAME = "sys_user_role";
	
	/**
	 * 根据用户ID查询
	 * 
	 * @param userId
	 * @return
	 */
	@Select("select * from " + DB_NAME + " where user_id = #{userId}")
	List<UserRole> findByUserId(@Param("userId") String userId);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 * @return
	 */
	@Select("select * from " + DB_NAME + " where role_id = #{roleId}")
	List<UserRole> findByRoleId(@Param("roleId") String roleId);

	@Insert("insert into " + DB_NAME + " (role_id,user_id) values(#{roleId},#{userId}) ")
	void insert(UserRole entity);

	/**
	 * 根据用户ID删除
	 * 
	 * @param userId
	 * @return
	 */
	@Delete("delete from " + DB_NAME + " where user_id = #{userId}")
	int deleteByUserId(@Param("userId") String userId);

	/**
	 * 根据角色ID删除
	 * 
	 * @param roleId
	 * @return
	 */
	@Delete("delete from " + DB_NAME + " where role_id = #{roleId}")
	int deleteByRoleId(@Param("roleId") String roleId);

	/**
	 * 删除用户、角色关联
	 * 
	 * @param userId
	 *            用户ID
	 * @param roleId
	 *            角色ID
	 */
	@Delete("delete from " + DB_NAME + " where role_id = #{roleId} and user_id = #{userId}")
	void removeUserFromRole(@Param("userId") String userId, @Param("roleId")String roleId);

}

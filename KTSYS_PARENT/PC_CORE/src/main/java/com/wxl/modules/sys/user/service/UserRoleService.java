package com.wxl.modules.sys.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.user.presistence.entity.UserRole;

/**
 * 用户角色Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:38:26
 */
public interface UserRoleService extends SingleTableService<UserRole> {

	/**
	 * 根据用户ID查询
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	List<UserRole> findByUserId(@Param("userId") String userId);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	List<UserRole> findByRoleId(@Param("roleId") String roleId);

	/**
	 * 根据用户ID删除
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	int deleteByUserId(@Param("userId") String userId);

	/**
	 * 根据角色ID删除
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	int deleteByRoleId(@Param("roleId") String roleId);

	/**
	 * 添加用户、角色关联
	 * 
	 * @param userIds
	 *            用户ID集合
	 * @param roleId
	 *            角色ID
	 */
	void addUserToRole(@Param("userIds") String[] userIds, @Param("roleId") String roleId);

	/**
	 * 添加角色、用户关联
	 * 
	 * @param roleIds
	 *            角色ID集合
	 * @param userId
	 *            用户ID
	 */
	void addRoleToUser(@Param("roleIds") String[] roleIds, @Param("userId") String userId);

	/**
	 * 删除用户、角色关联
	 * 
	 * @param userId
	 *            用户ID
	 * @param roleId
	 *            角色ID
	 */
	void removeUserFromRole(@Param("userId") String userId, @Param("roleId") String roleId);
}

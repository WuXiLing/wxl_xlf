package com.wxl.modules.sys.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.user.presistence.entity.UserRole;
import com.wxl.modules.sys.user.presistence.mapper.UserRoleMapper;
import com.wxl.modules.sys.user.service.UserRoleService;

/**
 * 用户角色Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:40:02
 */
@Service
@Transactional(readOnly = false)
public class UserRoleServiceImpl extends SingleTableServiceImpl<UserRole, UserRoleMapper> implements UserRoleService {

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#findByUserId(java.lang.String)
	 */
	@Override
	public List<UserRole> findByUserId(@Param("userId")String userId) {
		return mapper.findByUserId(userId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#findByRoleId(java.lang.String)
	 */
	@Override
	public List<UserRole> findByRoleId(@Param("roleId")String roleId) {
		return mapper.findByRoleId(roleId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#deleteByUserId(java.lang.String)
	 */
	@Override
	public int deleteByUserId(@Param("userId")String userId) {
		return mapper.deleteByUserId(userId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#deleteByRoleId(java.lang.String)
	 */
	@Override
	public int deleteByRoleId(@Param("roleId")String roleId) {
		return mapper.deleteByRoleId(roleId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#addUserToRole()
	 */
	@Override
	public void addUserToRole(@Param("userIds")String[] userIds,String roleId) {
		for(String userId : userIds){
			this.insert(new UserRole(userId, roleId));
		}
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#removeUserFromRole()
	 */
	@Override
	public void removeUserFromRole(@Param("userId")String userId,String roleId) {
		mapper.removeUserFromRole(userId, roleId);
	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.UserRoleService#addRoleToUser(java.lang.String[], java.lang.String)
	 */
	@Override
	public void addRoleToUser(String[] roleIds, String userId) {
		for(String roleId : roleIds){
			this.insert(new UserRole(userId, roleId));
		}
	}
}

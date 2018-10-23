package com.wxl.modules.sys.user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.common.utils.PwdUtils;
import com.wxl.common.utils.StringUtils;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;
import com.wxl.modules.sys.storge.service.StorgeEntityService;
import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.presistence.mapper.UserMapper;
import com.wxl.modules.sys.user.service.UserService;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 用户Service
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:40:02
 */
@Service
@CacheConfig(cacheNames = "sys_user")
public class UserServiceImpl extends SingleTableServiceImpl<User, UserMapper> implements UserService {

	/** 文件存储Service */
	@Autowired
	private StorgeEntityService storgeEntityService;

	/**
	 * 根据登录名查询用户
	 * 
	 * @param loginName
	 * @return
	 */
	public User findUserByLoginName(@Param("loginName") String loginName) {

		return mapper.findUserByLoginName(loginName);
	}

	/**
	 * 通过机构id获取用户列表
	 * 
	 * @param officeId
	 *            机构ID
	 * @return
	 */
	public List<User> findByOfficeId(@Param("officeId") String officeId) {

		return mapper.findByOfficeId(officeId);
	}

	/**
	 * 通过角色id获取用户列表
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	public List<User> findByRoleId(@Param("roleId") String roleId) {

		return mapper.findByRoleId(roleId);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.base.service.ProviderService#saveBefore(java.
	 * lang.Object)
	 */
	public void saveBefore(User entity) {

		entity.setPassword(PwdUtils.entryptPassword(initialPassword));
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.base.service.ProviderService#insertAfter(java.
	 * lang.Object)
	 */
	public void saveAfter(User entity) {

		UserUtils.deleteUserAliseRole(entity.getId());
		// 更新用户与角色关联
		if (entity.getRoleList() != null && !entity.getRoleList().isEmpty()) {
			UserUtils.addUserToRole(StringUtils.split(entity.getRoleIds(), ","), entity.getId());
		}
		// 清除用户缓存
		UserUtils.clearCache(entity);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.base.service.ProviderService#deleteAfter(java.
	 * lang.String)
	 */
	@Override
	public void deleteAfter(String id) {

		User entity = this.get(id);
		// 删除用户、角色关联
		UserUtils.deleteUserAliseRole(id);
		// 清除用户缓存
		UserUtils.clearCache(entity);
	}

	/**
	 * 修改密码
	 * 
	 * @param id
	 * @param pwd
	 */
	@Transactional(readOnly = false)
	public void updatePasswordById(String id, String pwd) {

		mapper.updatePassword(id, PwdUtils.entryptPassword(pwd));
		// 清除用户缓存
	}

	/**
	 * 校验身份证号
	 * 
	 * @return
	 */
	public Integer checkIdCard(String idcard) {

		return mapper.checkIdCard(idcard);
	}

	/**
	 * 头像设置
	 * 
	 * @param userId
	 *            用户ID
	 * @param screenShot
	 * @param fils
	 *            文件
	 */
	
	@Transactional(readOnly = false)
	public String saveUserAvatar(String userId, String screenShot, Map<String, MultipartFile> fils) {

		UserUtils.clearCache(this.get(userId));
		List<StorgeEntity> ids = storgeEntityService.multiUpload(fils, "admin", "user");
		if (ids != null && !ids.isEmpty()) {
			mapper.updateUserAvatar(userId, screenShot, ids.get(0).getId());
			return ids.get(0).getId();
		}
		return "";
	}

	final static String initialPassword = "8888";

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.modules.sys.user.service.UserService#pwdReset()
	 */
	@Transactional(readOnly = false)
	@Override
	public void pwdReset() {

		mapper.pwdReset(PwdUtils.entryptPassword(initialPassword));
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.modules.sys.user.service.UserService#pwdUserReset(java.lang.
	 * String)
	 */
	@Transactional(readOnly = false)
	@Override
	public void pwdUserReset(String userId) {

		mapper.pwdUserReset(PwdUtils.entryptPassword(initialPassword), userId);
	}
}

package com.wxl.modules.sys.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.user.presistence.entity.User;

/**
 * 用户Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:38:26
 */
public interface UserService extends SingleTableService<User> {

	/**
	 * 更新用户密码
	 * 
	 * @param userId
	 *            用户ID
	 * @param pwd
	 *            明文密码
	 */
	public void updatePasswordById(String userId, String pwd);

	/**
	 * 头像设置
	 * 
	 * @param userId
	 *            用户ID
	 * @param screenShot
	 * @param fils
	 *            文件
	 * @return
	 */
	public String saveUserAvatar(String userId, String screenShot, Map<String, MultipartFile> fils);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	public List<User> findByRoleId(@Param("roleId") String roleId);

	/**
	 * 根据机构ID查询
	 * 
	 * @param officeId
	 *            机构ID
	 * @return
	 */
	public List<User> findByOfficeId(@Param("officeId") String officeId);

	/**
	 * 根据登录名查询用户
	 * 
	 * @param loginName
	 * @return
	 */
	public User findUserByLoginName(@Param("loginName") String loginName);

	/**
	 * 初始化所有密码
	 * 
	 * @return
	 */
	public void pwdReset();

	/**
	 * 初始化指定用户密码
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	public void pwdUserReset(@Param("userId") String userId);
}

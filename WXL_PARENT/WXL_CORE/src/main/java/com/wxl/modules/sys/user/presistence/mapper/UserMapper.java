package com.wxl.modules.sys.user.presistence.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.user.presistence.entity.User;

/**
 * 用户DAO接口
 * 
 * @author liangxf
 *
 */
@MyBatisDao
public interface UserMapper extends SingleTableMapper<User> {

	/**
	 * 根据登录名查询用户
	 * 
	 * @param loginName
	 * @return
	 */
	public User findUserByLoginName(@Param("loginName") String loginName);

	/**
	 * 通过机构ID获取用户列表
	 * 
	 * @param officeId
	 *            机构ID
	 * @return
	 */
	public List<User> findByOfficeId(@Param("officeId") String officeId);

	/**
	 * 通过角色ID获取用户列表
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	public List<User> findByRoleId(@Param("roleId") String roleId);

	/**
	 * 修改密码
	 * 
	 * @param userId
	 *            用户ID
	 * @param pwd
	 *            密文密码
	 */
	void updatePassword(@Param("userId") String userId, @Param("pwd") String pwd);

	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * 
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(User user);

	/**
	 * 更新用户信息
	 * 
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);

	/**
	 * 根据属性值查找用户
	 * 
	 * @param loginName
	 * @return
	 */
	public List<User> findByPorpertie(User user);

	/**
	 * 校验身份证号
	 * 
	 * @return
	 */
	public Integer checkIdCard(String idcard);

	public void updateUserAvatar(@Param("userId") String userId, @Param("screenShot") String screenShot,
			@Param("storgeId") String storgeId);

	/**
	 * 初始化密码
	 * 
	 * @param entryptPassword
	 *            初始密码密文
	 */
	public void pwdReset(@Param("entryptPassword") String entryptPassword);

	/**
	 * 初始化指定用户密码
	 * 
	 * @param entryptPassword
	 *            初始密码密文
	 * @param userId
	 *            用户ID
	 */
	public void pwdUserReset(@Param("entryptPassword") String entryptPassword, @Param("userId") String userId);
}

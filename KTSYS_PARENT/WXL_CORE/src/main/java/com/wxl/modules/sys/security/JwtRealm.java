package com.wxl.modules.sys.security;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wxl.common.jwt.JWTToken;
import com.wxl.common.jwt.JWTUtil;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
import com.wxl.modules.sys.menu.service.MenuService;
import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.presistence.entity.UserRole;
import com.wxl.modules.sys.user.service.UserRoleService;
import com.wxl.modules.sys.user.service.UserService;

/**
 * jwt认证
 * 
 * @author Liang
 *
 */
@Component
public class JwtRealm extends AuthorizingRealm {

	protected Logger logger = LoggerFactory.getLogger(JwtRealm.class);

	@Autowired
	private UserService userService;

	@Autowired
	private UserRoleService userToRoleService;

	@Autowired
	private MenuService menuService;

	/**
	 * 大坑！，必须重写此方法，不然Shiro会报错
	 */
	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof JWTToken;
	}

	/**
	 * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		String username = JWTUtil.getUsername(principals.toString());
		User user = userService.findUserByLoginName(username);
		List<UserRole> userRoleList = userToRoleService.findByUserId(user.getId());
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		List<String> pers = new ArrayList<String>();
		for (UserRole userRole : userRoleList) {
			List<Menu> menuList = menuService.findByRoleId(userRole.getRoleId());
			for (Menu menu : menuList) {
				pers.add(menu.getId());
			}
		}
		Set<String> permission = new HashSet<>(pers);
		simpleAuthorizationInfo.addStringPermissions(permission);
		return simpleAuthorizationInfo;
	}

	/**
	 * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws UnauthorizedException {

		String token = (String) auth.getCredentials();

		// 解密获得username，用于和数据库进行对比
		String username = JWTUtil.getUsername(token);
		if (username == null) {
			throw new UnauthorizedException("token invalid");
		}

		User userBean = userService.findUserByLoginName(username);
		if (userBean == null) {
			throw new UnauthorizedException("User didn't existed!");
		}
		if (!JWTUtil.verify(token, username, userBean.getPassword())) {
			throw new UnauthorizedException("Username or password error");
		}
		return new SimpleAuthenticationInfo(token, token, this.getName());
	}
}

package com.wxl.modules.sys.utils;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.wxl.common.utils.CacheUtils;
import com.wxl.common.utils.SpringContextHolder;
import com.wxl.modules.sys.area.presistence.entity.Area;
import com.wxl.modules.sys.area.service.AreaServiceI;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
import com.wxl.modules.sys.menu.service.MenuService;
import com.wxl.modules.sys.office.presistence.entity.Office;
import com.wxl.modules.sys.office.service.OfficeService;
import com.wxl.modules.sys.role.presistence.entity.Role;
import com.wxl.modules.sys.role.service.RoleServiceI;
import com.wxl.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.presistence.mapper.UserMapper;
import com.wxl.modules.sys.user.service.UserRoleService;

/**
 * 用户工具类
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月29日 下午2:37:24
 */
public class UserUtils {

	private static UserMapper userMapper = SpringContextHolder.getBean(UserMapper.class);

	private static MenuService menuService = SpringContextHolder.getBean(MenuService.class);

	private static AreaServiceI areaService = SpringContextHolder.getBean(AreaServiceI.class);

	private static OfficeService officeService = SpringContextHolder.getBean(OfficeService.class);

	private static RoleServiceI roleService = SpringContextHolder.getBean(RoleServiceI.class);

	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "wxl_user_id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

//	public static final String CACHE_ROLE_LIST = "roleList";
//	public static final String CACHE_MENU_LIST = "menuList";
//	public static final String CACHE_AREA_LIST = "areaList";
//	public static final String CACHE_DICT_LIST = "dictList";
//	public static final String CACHE_OFFICE_LIST = "officeList";
//	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";

	/**
	 * 根据ID获取用户
	 * 
	 * @param id
	 * @return 取不到返回null
	 */
	public static User get(String id) {
		User user = (User) CacheUtils.get(USER_CACHE_ID_ + id);
		if (user == null) {
			user = userMapper.get(id);
			if (user == null) {
				return null;
			}

			user.setRoleList(roleService.findRoloByUserId(user.getId()));
			CacheUtils.put(USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}

	/**
	 * 根据登录名获取用户
	 * 
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getByLoginName(String loginName) {
		User user = (User) CacheUtils.get(USER_CACHE_LOGIN_NAME_ + loginName);
		if (user == null) {
			user = userMapper.findUserByLoginName(loginName);
			if (user == null) {
				return null;
			}
			user.setRoleList(roleService.findRoloByUserId(user.getId()));
			CacheUtils.put(USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}

	/**
	 * 清除当前用户缓存
	 */
	public static void clearCache() {
//		removeCache(CACHE_ROLE_LIST);
//		removeCache(CACHE_MENU_LIST);
//		removeCache(CACHE_AREA_LIST);
//		removeCache(CACHE_OFFICE_LIST);
//		removeCache(CACHE_OFFICE_ALL_LIST);
		UserUtils.clearCache(getUser());
	}

	/**
	 * 清除指定用户缓存
	 * 
	 * @param user
	 */
	public static void clearCache(User user) {
		CacheUtils.remove(USER_CACHE_ID_ + user.getId());
		CacheUtils.remove(USER_CACHE_LOGIN_NAME_ + user.getLoginName());
		if (user.getOffice() != null && user.getOffice().getId() != null) {
			CacheUtils.remove(USER_CACHE_LIST_BY_OFFICE_ID_ + user.getOffice().getId());
		}
	}

	/**
	 * 获取当前用户
	 * 
	 * @return 取不到返回 new User()
	 */
	public static User getUser() {
		Principal principal = getPrincipal();
		if (principal != null) {
			User user = get(principal.getId());
			if (user != null) {
				return user;
			}
		}
		userMapper.findByRoleId("73d3befcac664e759f98f29ec15042db");
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
	}

	/**
	 * 获取当前用户角色列表
	 * 
	 * @return
	 */
	public static List<Role> getRoleList() {

		User user = getUser();
//		@SuppressWarnings("unchecked")
//		List<Role> roleList = (List<Role>) getCache(CACHE_ROLE_LIST + "-" + user.getId());
//		if (roleList == null) {
//			roleList = user.isAdmin() ? roleService.selectAll(null) : roleService.findRoloByUserId(user.getId());
//			putCache(CACHE_ROLE_LIST + "-" + user.getId(), roleList);
//		}
		List<Role> roleList = user.isAdmin() ? roleService.selectAll(null) : roleService.findRoloByUserId(user.getId());
		return roleList;
	}

	/**
	 * 获取当前用户授权菜单
	 * 
	 * @return
	 */
	public static List<Menu> getMenuList() {
		User user = getUser();
		
		List<Menu> menuList = user.isAdmin() ? menuService.selectAll(null) : menuService.findByUserId(user.getId());
		if (menuList == null) {
			
		}
		return menuList;
	}

	/**
	 * 获取当前用户授权的区域
	 * 
	 * @return
	 */
	public static List<Area> getAreaList() {
		List<Area> areaList = areaService.selectAll(null);
		if (areaList == null) {
			areaList = areaService.selectAll(null);
//			putCache(CACHE_AREA_LIST, areaList);
		}
		return areaList;
	}
	
	/**
	 * 获取当前用户有权限访问的部门
	 * 
	 * @return
	 */
	public static List<Office> getOfficeList() {
		User user = getUser();
//		@SuppressWarnings("unchecked")
//		List<Office> officeList = user.isAdmin() ? officeService.selectAll(null) : officeService.findByUserId(user.getId());
//		if (officeList == null) {
//
//			putCache(CACHE_OFFICE_LIST + "-" + user.getId(), officeList);
//		}
		List<Office> officeList = officeService.selectAll(null);
		return officeList;
	}

	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal() {
		try {
			Principal principal = null;
			Subject subject = getSubject();
			if(subject.getPrincipal() instanceof String) {
				principal = new Principal(getByLoginName(String.valueOf(subject.getPrincipal())),false);
			} else if(subject.getPrincipal() instanceof Principal) {
				principal = (Principal) subject.getPrincipal();
			}
			if (principal != null) {
				return principal;
			}
			// subject.logout();
		} catch (UnavailableSecurityManagerException e) {

		} catch (InvalidSessionException e) {

		}
		return null;
	}

	public static Session getSession() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null) {
				session = subject.getSession();
			}
			if (session != null) {
				return session;
			}
			// subject.logout();
		} catch (InvalidSessionException e) {

		}
		return null;
	}

	// ============== User Cache ==============

	public static Object getCache(String key) {
		return getCache(key, null);
	}

	public static Object getCache(String key, Object defaultValue) {
		// Object obj = getCacheMap().get(key);
		Object obj = getSession().getAttribute(key);
		return obj == null ? defaultValue : obj;
	}

	public static void putCache(String key, Object value) {
		// getCacheMap().put(key, value);
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
		// getCacheMap().remove(key);
		getSession().removeAttribute(key);
	}

	/** 用户角色 */
	private static UserRoleService userRoleService = SpringContextHolder.getBean(UserRoleService.class);

	/**
	 * 删除角色用户关联
	 * 
	 * @param userId
	 *            用户ID
	 */
	public static void deleteUserAliseRole(@Param("userId") String userId) {
		userRoleService.deleteByUserId(userId);
	}

	/**
	 * 添加用户角色关联
	 * 
	 * @param roleIds
	 *            角色ID集合
	 * @param userId
	 *            用户ID
	 */
	public static void addUserToRole(@Param("roleIds") String[] roleIds, @Param("userId") String userId) {
		userRoleService.addRoleToUser(roleIds, userId);
	}
}

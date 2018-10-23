package com.wxl.modules.sys.utils;

<<<<<<< HEAD
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wxl.common.config.Global;
import com.wxl.common.utils.AddressUtils;
import com.wxl.common.utils.RequestUtils;
=======
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.method.HandlerMethod;

import com.wxl.common.config.Global;
import com.wxl.common.utils.AddressUtils;
import com.wxl.common.utils.CacheUtils;
import com.wxl.common.utils.Exceptions;
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
import com.wxl.common.utils.SpringContextHolder;
import com.wxl.common.utils.StringUtils;
import com.wxl.modules.sys.log.presistence.entity.Log;
import com.wxl.modules.sys.log.service.LogService;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
<<<<<<< HEAD
import com.wxl.modules.sys.user.presistence.entity.User;

import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

=======
import com.wxl.modules.sys.menu.presistence.mapper.MenuMapper;
import com.wxl.modules.sys.user.presistence.entity.User;

>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
/**
 * 字典工具类
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:39:38
 */
public class LogUtils {
<<<<<<< HEAD

	public static final String CACHE_MENU_NAME_PATH_MAP = "menuNamePathMap";

	private static LogService logService = SpringContextHolder.getBean(LogService.class);

	public static void saveLog(HttpServletRequest request, Object handler, Exception ex, long timeDuration) {

		String uri = request.getRequestURI();
		
		if (StringUtils.isBlank(uri)) {
			return;
		}
		
		if (StringUtils.isNoneBlank(request.getContextPath())) {
			String adminPath = request.getContextPath() + Global.getAdminPath();
			String frontPath = request.getContextPath() + Global.getAdminPath();
			if(uri.startsWith(adminPath)) {
				uri = uri.replace(adminPath, "");
			} else if(uri.startsWith(frontPath)) {
				uri = uri.replace(frontPath, "");
			}
		}
		String title = "";
		
		if(StringUtils.isBlank(uri) || uri.contains("/login")) {
			title = "系统登录";
		} else if(uri.contains("/logout")) {
			title = "系统登出";
		} else {
			title = getMenuNamePath(uri);
		}
		Log log = new Log();
		log.setTitle(title);
		log.setType(ex == null ? Log.TYPE_ACCESS : Log.TYPE_EXCEPTION);
		log.setRemoteAddr(StringUtils.getRemoteAddr(request));
		log.setUserAgent(request.getHeader("user-agent"));
		log.setRequestUri(uri);
		log.setParams(request.getParameterMap());
		log.setMethod(request.getMethod());
		UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
		if (userAgent != null) {
			log.setBrowser(userAgent.getBrowser().getName());
			log.setBrowserVersion(userAgent.getBrowserVersion() != null ? userAgent.getBrowserVersion().getVersion() : "");
			OperatingSystem operatingSystem = userAgent.getOperatingSystem();
			if (operatingSystem != null) {
				log.setTerminal(operatingSystem.getName());
				log.setTerminalType(operatingSystem.getDeviceType().getName());
			}
		}
		log.setTimeDuration(timeDuration);
		log.setRemoteArea(AddressUtils.getUtf8Address(log.getRemoteAddr()));
		log.setTerminal(RequestUtils.getOsInfo(request));
		new SaveLogThread(log).start();

	}

	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, Object handler, Exception ex, String title) {
		User user = UserUtils.getUser();
		if (user != null && user.getId() != null) {
=======
	
	public static final String CACHE_MENU_NAME_PATH_MAP = "menuNamePathMap";
	
	private static LogService logService = SpringContextHolder.getBean(LogService.class);
	
	private static MenuMapper menuMapper = SpringContextHolder.getBean(MenuMapper.class);
	
	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, String title){
		saveLog(request, null, null, title);
	}
	
	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, Object handler, Exception ex, String title){
		User user = UserUtils.getUser();
		if (user != null && user.getId() != null){
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
			Log log = new Log();
			log.setTitle(title);
			log.setType(ex == null ? Log.TYPE_ACCESS : Log.TYPE_EXCEPTION);
			log.setRemoteAddr(StringUtils.getRemoteAddr(request));
			log.setUserAgent(request.getHeader("user-agent"));
			log.setRequestUri(request.getRequestURI());
			log.setParams(request.getParameterMap());
			log.setMethod(request.getMethod());
<<<<<<< HEAD
			// log.setBrowser(request.get);
=======
//			log.setBrowser(request.get);
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
			try {
				log.setRemoteArea(AddressUtils.getUtf8Address(log.getRemoteAddr()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 异步保存日志
<<<<<<< HEAD
			// new SaveLogThread(log, handler, ex).start();
=======
			new SaveLogThread(log, handler, ex).start();
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
		}
	}

	/**
	 * 保存日志线程
	 */
<<<<<<< HEAD
	public static class SaveLogThread extends Thread {

		private Log log;

		public SaveLogThread(Log log, Object handler, Exception ex) {
			super(SaveLogThread.class.getSimpleName());
		}

		public SaveLogThread(Log log) {
			super(SaveLogThread.class.getSimpleName());
			this.log = log;
		}

		@Override
		public void run() {

=======
	public static class SaveLogThread extends Thread{
		
		private Log log;
		private Object handler;
		private Exception ex;
		
		public SaveLogThread(Log log, Object handler, Exception ex){
			super(SaveLogThread.class.getSimpleName());
			this.log = log;
			this.handler = handler;
			this.ex = ex;
		}
		
		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(log.getTitle())){
				String permission = "";
				if (handler instanceof HandlerMethod){
					Method m = ((HandlerMethod)handler).getMethod();
					RequiresPermissions rp = m.getAnnotation(RequiresPermissions.class);
					permission = (rp != null ? StringUtils.join(rp.value(), ",") : "");
				}
//				log.setTitle(getMenuNamePath(log.getRequestUri(), permission));
			}
			// 如果有异常，设置异常信息
			log.setException(Exceptions.getStackTraceAsString(ex));
			// 如果无标题并无异常日志，则不保存信息
			if (StringUtils.isBlank(log.getTitle()) && StringUtils.isBlank(log.getException())){
				return;
			}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
			// 保存日志信息
			logService.save(log);
		}
	}

	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
<<<<<<< HEAD
	public static String getMenuNamePath(String requestUri) {

		List<Menu> menuList = UserUtils.getMenuList();
		for (Menu menu : menuList) {
			if (StringUtils.isNoneBlank(menu.getHref()) && requestUri.startsWith(menu.getHref())) {
				return menu.getLongName();
			}
		}
		return "";
	}

=======
	public static String getMenuNamePath(String requestUri, String permission){
		String href = StringUtils.substringAfter(requestUri, Global.getAdminPath());
		@SuppressWarnings("unchecked")
		Map<String, String> menuMap = (Map<String, String>)CacheUtils.get(CACHE_MENU_NAME_PATH_MAP);
		if (menuMap == null){
			menuMap = new HashMap<>();
			List<Menu> menuList = menuMapper.selectAll(null);
			for (Menu menu : menuList){
				// 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
				String namePath = "";
				if (menu.getParentIds() != null){
					List<String> namePathList = new ArrayList<>();
					for (String id : StringUtils.split(menu.getParentIds(), ",")){
						if (Menu.getRootId().equals(id)){
							continue; // 过滤跟节点
						}
						for (Menu m : menuList){
							if (m.getId().equals(id)){
								namePathList.add(m.getName());
								break;
							}
						}
					}
					namePathList.add(menu.getName());
					namePath = StringUtils.join(namePathList, "-");
				}
				// 设置菜单名称路径
				if (StringUtils.isNotBlank(menu.getHref())){
					menuMap.put(menu.getHref(), namePath);
				}else if (StringUtils.isNotBlank(menu.getPermission())){
					for (String p : StringUtils.split(menu.getPermission())){
						menuMap.put(p, namePath);
					}
				}
				
			}
//			CacheUtils.put(CACHE_MENU_NAME_PATH_MAP, menuMap);
		}
		String menuNamePath = menuMap.get(href);
		if (menuNamePath == null){
			for (String p : StringUtils.split(permission)){
				menuNamePath = menuMap.get(p);
				if (StringUtils.isNotBlank(menuNamePath)){
					break;
				}
			}
			if (menuNamePath == null){
				return "";
			}
		}
		return menuNamePath;
	}

	
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
}

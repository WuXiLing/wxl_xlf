package com.wxl.modules.sys.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wxl.common.config.Global;
import com.wxl.common.utils.AddressUtils;
import com.wxl.common.utils.RequestUtils;
import com.wxl.common.utils.SpringContextHolder;
import com.wxl.common.utils.StringUtils;
import com.wxl.modules.sys.log.presistence.entity.Log;
import com.wxl.modules.sys.log.service.LogService;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
import com.wxl.modules.sys.user.presistence.entity.User;

import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * 字典工具类
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:39:38
 */
public class LogUtils {

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
		if(uri.contains("/login")) {
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
			Log log = new Log();
			log.setTitle(title);
			log.setType(ex == null ? Log.TYPE_ACCESS : Log.TYPE_EXCEPTION);
			log.setRemoteAddr(StringUtils.getRemoteAddr(request));
			log.setUserAgent(request.getHeader("user-agent"));
			log.setRequestUri(request.getRequestURI());
			log.setParams(request.getParameterMap());
			log.setMethod(request.getMethod());
			// log.setBrowser(request.get);
			try {
				log.setRemoteArea(AddressUtils.getUtf8Address(log.getRemoteAddr()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 异步保存日志
			// new SaveLogThread(log, handler, ex).start();
		}
	}

	/**
	 * 保存日志线程
	 */
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

			// 保存日志信息
			logService.save(log);
		}
	}

	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
	public static String getMenuNamePath(String requestUri) {

		List<Menu> menuList = UserUtils.getMenuList();
		for (Menu menu : menuList) {
			if (StringUtils.isNoneBlank(menu.getHref()) && requestUri.startsWith(menu.getHref())) {
				return menu.getLongName();
			}
		}
		return "";
	}

}

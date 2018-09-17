package com.wxl.common.listener;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.ClassUtils;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import com.wxl.common.banner.Banner;
import com.wxl.common.banner.WxlApplicationBannerPrinter;
import com.wxl.common.config.Global;

import init.InitData;

/**
 * 程序启动时监听
 * 
 * @author Liang
 *
 */
public class WebContextListener extends ContextLoaderListener {

	/** 日志对象 */
	protected static Logger logger = LoggerFactory.getLogger(WebContextListener.class);

	private static Banner.Mode bannerMode = Banner.Mode.CONSOLE;

	private static Banner banner;

	private static Class<?> mainApplicationClass;

	private static ResourceLoader resourceLoader;

	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {

		initDbData();
		printBanner();
		return super.initWebApplicationContext(servletContext);
	}

	private static void initDbData() {
		if (Global.getDBInit()) {
			InitData initData = new InitData();
			initData.eecutor();
		}
	}
	
	private static Banner printBanner() {
		if (bannerMode == Banner.Mode.OFF) {
			return null;
		}
		ResourceLoader resourceLoader = new DefaultResourceLoader(getClassLoader());
		WxlApplicationBannerPrinter bannerPrinter = new WxlApplicationBannerPrinter(resourceLoader, banner);
		return bannerPrinter.print(mainApplicationClass, System.out);
	}

	public static ClassLoader getClassLoader() {
		if (resourceLoader != null) {
			return resourceLoader.getClassLoader();
		}
		return ClassUtils.getDefaultClassLoader();
	}

}

package com.wxl.modules.sys.utils;

import org.apache.commons.lang3.StringUtils;

import com.wxl.common.config.Global;
import com.wxl.common.utils.CacheUtils;

/**
 * 系统信息工具类
 * 
 * @author WuXiling
 *
 */
public class AppUtils {

	public final static String APP_NAME_KEY = "app_name";

	public static String getAppName() {

		Object s = CacheUtils.get(APP_NAME_KEY);
		if (s != null && StringUtils.isNoneBlank(s.toString())) {
			return s.toString();
		}
		String app_Name = Global.getConfig(APP_NAME_KEY);
		if(StringUtils.isBlank(app_Name)) {
			app_Name = "巫溪灵";
		}
		CacheUtils.put(APP_NAME_KEY, app_Name);
		return app_Name;
	}
}

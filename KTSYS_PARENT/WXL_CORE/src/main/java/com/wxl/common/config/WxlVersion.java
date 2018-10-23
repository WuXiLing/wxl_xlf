package com.wxl.common.config;

/**
 * 获取版本信息
 * 
 * @author Liang
 *
 */
public final class WxlVersion {
	
	private WxlVersion() {
		
	}

	public static String getVersion() {
		Package pkg = WxlVersion.class.getPackage();
		return (pkg != null ? pkg.getImplementationVersion() : null);
	}
}

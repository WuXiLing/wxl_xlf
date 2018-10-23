package com.wxl.common.json;

import com.fasterxml.jackson.databind.PropertyNamingStrategy.PropertyNamingStrategyBase;

/**
 * 转json属性名称策略
 * 
 * @author Liang
 *
 */
public class WxlJsonPropertyNamingStrategy extends PropertyNamingStrategyBase{

	private static final long serialVersionUID = -486090300401192152L;

	@Override
	public String translate(String propertyName) {

		return propertyName;
	}
}

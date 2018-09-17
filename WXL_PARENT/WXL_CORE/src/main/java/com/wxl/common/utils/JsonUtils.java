package com.wxl.common.utils;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

public class JsonUtils {

	public static String toJSONString(Object o) {
		return com.alibaba.druid.support.json.JSONUtils.toJSONString(o);
	}

	public static Object parse(String text) {
		return com.alibaba.druid.support.json.JSONUtils.toJSONString(text);
	}

//	public static <T> T toObject(String text, T VO) {
//		return JSON.parseObject(text, VO.getClass());
//	}

	public static List<T> toList(String text, T VO) {
		return JSON.parseObject(text, new TypeReference<List<T>>() {
		});
	}
}

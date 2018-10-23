package com.wxl.common.utils;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.wxl.common.cache.RedisCacheUtil;

/**
 * Cache工具类
 * 
 * @author liangxf
 *
 */

public class CacheUtils {

	protected static final Log logger = LogFactory.getLog(CacheUtils.class);

	private static RedisCacheUtil cacheManager = ((RedisCacheUtil) SpringContextHolder.getBean("redisCacheUtil"));

	/**
	 * 获取缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Object get(String key) {
		logger.debug("get string：" + key);
		Object obj = cacheManager.getCacheObject(key);
		return obj;
	}

	/**
	 * 写入缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void put(String key, Object value) {
		logger.debug("add string：" + key);
		cacheManager.setCacheObject(key, value);
	}
	public static void put(String key, Object value,long time) {
		logger.debug("add string：" + key);
		cacheManager.setCacheObject(key, value,time);
	}
	

	/**
	 * 获取Map缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Map<String, Object> getMap(String key) {
		logger.debug("get Map：" + key);
		return cacheManager.getCacheMap(key);
	}

	/**
	 * 写入Map缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putMap(String key, Map<String, Object> value) {
		logger.debug("add Map：" + key);
		cacheManager.setCacheMap(key, value);
	}
	public static void putMap(String key, Map<String, Object> value,long time) {
		logger.debug("add Map：" + key);
		cacheManager.setCacheMap(key, value,time);
	}

	/**
	 * 获取List缓存
	 * 
	 * @param key
	 * @return
	 */
	public static List<Object> getList(String key) {
		logger.debug("get List：" + key);
		return cacheManager.getCacheList(key);
	}

	/**
	 * 写入List缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putList(String key, List value) {
		logger.debug("add List：" + key);
		cacheManager.setCacheList(key, value);
	}
	public static void putList(String key, List value,long time) {
		logger.debug("add List：" + key);
		cacheManager.setCacheList(key, value,time);
	}

	/**
	 * 获取Set缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Set<Object> getSet(String key) {
		logger.debug("get Set：" + key);
		return cacheManager.getCacheSet(key);
	}

	/**
	 * 写入Set缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putSet(String key, Set value) {
		logger.debug("add Set：" + key);
		cacheManager.setCacheSet(key, value);
	}

	public static void putSet(String key, Set value,long time) {
		logger.debug("add Set：" + key);
		cacheManager.setCacheSet(key, value,time);
	}
	/**
	 * 从缓存中移除
	 * 
	 * @param key
	 * @return
	 */
	public static void remove(String key) {
		logger.debug("del cache：" + key);
		cacheManager.deleteCacheObject(key);
	}

	/**
	 * 清除缓存信息
	 * 
	 */
	public static void flushAll() {
		logger.debug("flushall cache");
		cacheManager.flushAll();
	}
}

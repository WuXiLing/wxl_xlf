package com.wxl.common.utils;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.wxl.common.cache.RedisCacheUtil;

import redis.clients.jedis.Jedis;

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
		logger.debug("获取缓存：" + key);
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
		logger.debug("添加缓存：" + key);
		cacheManager.setCacheObject(key, value);
	}

	/**
	 * 获取Map缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Map<String, Object> getMap(String key) {
		logger.debug("获取缓存（Map）：" + key);
		return cacheManager.getCacheMap(key);
	}

	/**
	 * 写入Map缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putMap(String key, Map<String, Object> value) {
		logger.debug("添加缓存（Map）：" + key);
		cacheManager.setCacheMap(key, value);
	}

	/**
	 * 获取List缓存
	 * 
	 * @param key
	 * @return
	 */
	public static List<Object> getList(String key) {
		logger.debug("获取缓存（List）：" + key);
		return cacheManager.getCacheList(key);
	}

	/**
	 * 写入List缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putList(String key, List value) {
		logger.debug("添加缓存（List）：" + key);
		cacheManager.setCacheList(key, value);
	}

	/**
	 * 获取Set缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Set<Object> getSet(String key) {
		logger.debug("获取缓存（Set）：" + key);
		return cacheManager.getCacheSet(key);
	}

	/**
	 * 写入Set缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putSet(String key, Set<Object> value) {
		logger.debug("添加缓存（Set）：" + key);
		cacheManager.setCacheSet(key, value);
	}

	/**
	 * 从缓存中移除
	 * 
	 * @param key
	 * @return
	 */
	public static void remove(String key) {
		logger.debug("删除缓存：" + key);
		cacheManager.deleteCacheObject(key);
	}
}

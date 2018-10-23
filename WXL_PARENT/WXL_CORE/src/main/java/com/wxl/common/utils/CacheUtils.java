package com.wxl.common.utils;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.wxl.common.cache.RedisCacheUtil;

<<<<<<< HEAD
=======
import redis.clients.jedis.Jedis;

>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
/**
 * Cache工具类
 * 
 * @author liangxf
 *
 */

public class CacheUtils {
<<<<<<< HEAD

=======
	
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	protected static final Log logger = LogFactory.getLog(CacheUtils.class);

	private static RedisCacheUtil cacheManager = ((RedisCacheUtil) SpringContextHolder.getBean("redisCacheUtil"));

	/**
	 * 获取缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Object get(String key) {
<<<<<<< HEAD
		logger.debug("get string：" + key);
=======
		logger.debug("获取缓存：" + key);
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
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
<<<<<<< HEAD
		logger.debug("add string：" + key);
		cacheManager.setCacheObject(key, value);
	}
	public static void put(String key, Object value,long time) {
		logger.debug("add string：" + key);
		cacheManager.setCacheObject(key, value,time);
	}
	
=======
		logger.debug("添加缓存：" + key);
		cacheManager.setCacheObject(key, value);
	}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502

	/**
	 * 获取Map缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Map<String, Object> getMap(String key) {
<<<<<<< HEAD
		logger.debug("get Map：" + key);
=======
		logger.debug("获取缓存（Map）：" + key);
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
		return cacheManager.getCacheMap(key);
	}

	/**
	 * 写入Map缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putMap(String key, Map<String, Object> value) {
<<<<<<< HEAD
		logger.debug("add Map：" + key);
		cacheManager.setCacheMap(key, value);
	}
	public static void putMap(String key, Map<String, Object> value,long time) {
		logger.debug("add Map：" + key);
		cacheManager.setCacheMap(key, value,time);
	}
=======
		logger.debug("添加缓存（Map）：" + key);
		cacheManager.setCacheMap(key, value);
	}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502

	/**
	 * 获取List缓存
	 * 
	 * @param key
	 * @return
	 */
	public static List<Object> getList(String key) {
<<<<<<< HEAD
		logger.debug("get List：" + key);
=======
		logger.debug("获取缓存（List）：" + key);
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
		return cacheManager.getCacheList(key);
	}

	/**
	 * 写入List缓存
	 * 
	 * @param key
	 * @return
	 */
	public static void putList(String key, List value) {
<<<<<<< HEAD
		logger.debug("add List：" + key);
		cacheManager.setCacheList(key, value);
	}
	public static void putList(String key, List value,long time) {
		logger.debug("add List：" + key);
		cacheManager.setCacheList(key, value,time);
	}
=======
		logger.debug("添加缓存（List）：" + key);
		cacheManager.setCacheList(key, value);
	}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502

	/**
	 * 获取Set缓存
	 * 
	 * @param key
	 * @return
	 */
	public static Set<Object> getSet(String key) {
<<<<<<< HEAD
		logger.debug("get Set：" + key);
=======
		logger.debug("获取缓存（Set）：" + key);
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
		return cacheManager.getCacheSet(key);
	}

	/**
	 * 写入Set缓存
	 * 
	 * @param key
	 * @return
	 */
<<<<<<< HEAD
	public static void putSet(String key, Set value) {
		logger.debug("add Set：" + key);
		cacheManager.setCacheSet(key, value);
	}

	public static void putSet(String key, Set value,long time) {
		logger.debug("add Set：" + key);
		cacheManager.setCacheSet(key, value,time);
	}
=======
	public static void putSet(String key, Set<Object> value) {
		logger.debug("添加缓存（Set）：" + key);
		cacheManager.setCacheSet(key, value);
	}

>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	/**
	 * 从缓存中移除
	 * 
	 * @param key
	 * @return
	 */
	public static void remove(String key) {
<<<<<<< HEAD
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
=======
		logger.debug("删除缓存：" + key);
		cacheManager.deleteCacheObject(key);
	}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
}

package com.wxl.common.cache;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.BoundSetOperations;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Service;

/**
 * redis缓存工具类
 * 
 * @author Liang
 *
 */
@Service
public class RedisCacheUtil {

	@Autowired
	@Qualifier("redisTemplate")
	public RedisTemplate<String, Object> redisTemplate;

	/**
	 * 缓存基本的对象，Integer、String、实体类等
	 * 
	 * @param key
	 *            缓存的键值
	 * @param value
	 *            缓存的值
	 * @return 缓存的对象
	 */
	public void setCacheObject(String key, Object value) {
		redisTemplate.opsForHash().put("sys", key, value);
	}

	/**
	 * 获得缓存的基本对象。
	 * 
	 * @param key
	 *            缓存键值
	 * @param operation
	 * @return 缓存键值对应的数据
	 */
	public Object getCacheObject(String key) {
		return redisTemplate.opsForHash().get("sys", key);
	}

	/**
	 * 删除缓存的基本对象。
	 * 
	 * @param key
	 *            缓存键值
	 * @param operation
	 * @return
	 */
	public void deleteCacheObject(String key) {
		redisTemplate.delete(key);
	}

	/**
	 * 缓存List数据
	 * 
	 * @param key
	 *            缓存的键值
	 * @param dataList
	 *            待缓存的List数据
	 * @return 缓存的对象
	 */
	public ListOperations<String, Object> setCacheList(String key, List<Object> dataList) {
		ListOperations<String, Object> listOperation = redisTemplate.opsForList();
		if (null != dataList) {
			int size = dataList.size();
			for (int i = 0; i < size; i++) {
				listOperation.rightPush(key, dataList.get(i));
			}
		}

		return listOperation;
	}

	/**
	 * 获得缓存的list对象
	 * 
	 * @param key
	 *            缓存的键值
	 * @return 缓存键值对应的数据
	 */
	public List<Object> getCacheList(String key) {
		List<Object> dataList = new ArrayList<Object>();
		ListOperations<String, Object> listOperation = redisTemplate.opsForList();
		Long size = listOperation.size(key);

		for (int i = 0; i < size; i++) {
			dataList.add((Object) listOperation.leftPop(key));
		}

		return dataList;
	}

	/**
	 * 缓存Set
	 * 
	 * @param key
	 *            缓存键值
	 * @param dataSet
	 *            缓存的数据
	 * @return 缓存数据的对象
	 */
	public BoundSetOperations<String, Object> setCacheSet(String key, Set<Object> dataSet) {
		BoundSetOperations<String, Object> setOperation = redisTemplate.boundSetOps(key);
		/*
		 * T[] t = (T[]) dataSet.toArray(); setOperation.add(t);
		 */

		Iterator<Object> it = dataSet.iterator();
		while (it.hasNext()) {
			setOperation.add(it.next());
		}

		return setOperation;
	}

	/**
	 * 获得缓存的set
	 * 
	 * @param key
	 * @param operation
	 * @return
	 */
	public Set<Object> getCacheSet(String key) {
		Set<Object> dataSet = new HashSet<Object>();
		BoundSetOperations<String, Object> operation = redisTemplate.boundSetOps(key);

		Long size = operation.size();
		for (int i = 0; i < size; i++) {
			dataSet.add(operation.pop());
		}
		return dataSet;
	}

	/**
	 * 缓存Map
	 * 
	 * @param key
	 * @param dataMap
	 * @return
	 */
	public HashOperations<String, Object, Object> setCacheMap(String key, Map<String, Object> dataMap) {

		HashOperations<String, Object, Object> hashOperations = redisTemplate.opsForHash();
		if (null != dataMap) {

			for (Map.Entry<String, Object> entry : dataMap.entrySet()) {

				/*
				 * System.out.println("Key = " + entry.getKey() + ", Value = " +
				 * entry.getValue());
				 */
				hashOperations.put(key, entry.getKey(), entry.getValue());
			}

		}

		return hashOperations;
	}

	/**
	 * 获得缓存的Map
	 * 
	 * @param key
	 * @param hashOperation
	 * @return
	 */
	public Map<String, Object> getCacheMap(String key) {
		Map<String, Object> map = null;
		/* Map<String, T> map = hashOperation.entries(key); */
		return map;
	}

	protected RedisSerializer<String> getRedisSerializer() {

		return redisTemplate.getStringSerializer();
	}
}

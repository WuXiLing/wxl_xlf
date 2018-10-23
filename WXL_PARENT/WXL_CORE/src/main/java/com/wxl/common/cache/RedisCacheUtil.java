package com.wxl.common.cache;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.BoundSetOperations;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Service;

import com.wxl.common.exception.RedisExpireOutOfRangeException;

/**
 * redis缓存工具类
 * 
 * @author Liang
 *
 */
@Service
public class RedisCacheUtil {

	public final static long REDIS_EXPIRE_ALWAYS = -1;
	
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

	public void setCacheObject(String key, Object value, long time) {
		setCacheObject(key, value);
		setExpire(key, time);
	}

	private void setExpire(String key, long time) {
		if (time != REDIS_EXPIRE_ALWAYS && time <= 0) {
			new RedisExpireOutOfRangeException(time + " is not a reasonable number,It has to be greater than 0 or -1");
		}
		if (time == REDIS_EXPIRE_ALWAYS) {
			redisTemplate.expire(key, time, TimeUnit.MILLISECONDS);
		}
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
	public void setCacheList(String key, List<Object> value, long time) {
		setCacheList(key, value);
		setExpire(key, time);
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
	
	public void setCacheSet(String key, Set<Object> value, long time) {
		setCacheSet(key, value);
		setExpire(key, time);
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
	public void setCacheMap(String key, Map<String, Object> value, long time) {
		setCacheMap(key, value);
		setExpire(key, time);
	}

	/**
	 * 获得缓存的Map
	 * 
	 * @param key
	 * @param hashOperation
	 * @return
	 */
	public Map<String, Object> getCacheMap(String key) {
		BoundHashOperations<String, String, Object> hashOperations = redisTemplate.boundHashOps(key);
		return hashOperations.entries();
	}

	/**
	 * 清除redis缓存
	 * 
	 */
	public void flushAll() {
		redisTemplate.execute(new RedisCallback<Object>() {

			@Override
			public Object doInRedis(RedisConnection connection) throws DataAccessException {
				connection.flushDb();
				return null;
			}
		});
	}

	protected RedisSerializer<String> getRedisSerializer() {

		return redisTemplate.getStringSerializer();
	}
}

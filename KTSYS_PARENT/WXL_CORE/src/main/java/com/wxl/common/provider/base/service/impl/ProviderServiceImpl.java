package com.wxl.common.provider.base.service.impl;

import java.util.Collection;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.aop.OperLog;
import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.base.presistence.entity.ProviderEntity;
import com.wxl.common.provider.base.presistence.mapper.ProviderMapper;
import com.wxl.common.provider.base.service.ProviderService;
import com.wxl.common.utils.CacheUtils;

/**
 * 
 * @author wxl
 * 
 * @date 2017年6月28日 下午5:11:48
 */
@CacheConfig(cacheNames = "wxl")
public abstract class ProviderServiceImpl<T extends ProviderEntity, D extends ProviderMapper<T>>
		implements ProviderService<T> {

	protected static final Log logger = LogFactory.getLog(ProviderServiceImpl.class);

	protected static final String DELIMITER = "_";
	
	@Autowired
	protected D mapper;

	/**
	 * 保存操作
	 * 
	 * @param entity
	 */

	public T save(T entity) {

		saveBefore(entity);
		if (StringUtils.isNotBlank(entity.getId())) {
			
			this.update(entity);
			
		} else {
			
			this.insert(entity);
			
		}
		saveAfter(entity);
		return entity;
	}

	/**
	 * 保存后操作
	 * 
	 * @param entity
	 */
	public void saveAfter(T entity) {

	}

	/**
	 * 保存前操作
	 * 
	 * @param entity
	 */
	public void saveBefore(T entity) {

	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#insert(java.lang.Object)
	 */
	@Override
	@OperLog(operType="新增")
	public T insert(T entity) {
		insertBefore(entity);
		mapper.insert(entity);
		insertAfter(entity);
		return entity;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchInsert(java.util.
	 * Collection)
	 */
	@Override
	public void batchInsert(Collection<T> ts) {

		for (T entity : ts) {
			this.insert(entity);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchInsert(java.lang.
	 * Object[])
	 */
	@Override
	public void batchInsert(T[] ts) {

		for (T entity : ts) {
			this.insert(entity);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#update(java.lang.Object)
	 */
	@Override
	@OperLog(operType="修改")
	public T update(T entity) {

		updateBefore(entity);
		mapper.update(entity);
		updateAfter(entity);
		return entity;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchUpdate(java.util.
	 * Collection)
	 */
	@Override
	public void batchUpdate(Collection<T> ts) {

		for (T entity : ts) {
			this.update(entity);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchUpdate(java.lang.
	 * Object[])
	 */
	@Override
	public void batchUpdate(T[] ts) {

		for (T entity : ts) {
			this.update(entity);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#delete(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = false)
	@OperLog(operType="删除")
	public void delete(String id) {

		deleteBefore(id);
		mapper.delete(id);
		deleteAfter(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#delete(java.lang.Object)
	 */
	@Override
	public void delete(T entity) {

		this.delete(entity.getId());
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#deletes(java.lang.String[ ])
	 */
	@Override
	public void delete(String[] ids) {

		for (String id : ids) {
			this.delete(id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#fakeDelete(java.lang.
	 * String)
	 */
	@Override
	@Transactional(readOnly = false)
	@OperLog(operType="假删除")
	public void fakeDelete(String id) {

		mapper.fakeDelete(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#fakeDelete(java.lang.
	 * Object)
	 */
	@Override
	public void fakeDelete(T entity) {

		this.fakeDelete(entity.getId());
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#fakeDeletes(java.lang.
	 * String[])
	 */
	@Override
	public void fakeDeletes(String[] ids) {

		for (String id : ids) {
			this.fakeDelete(id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#fakeDelete(java.util.
	 * Collection)
	 */
	@Override
	public void fakeDelete(Collection<T> ts) {

		for (T entity : ts) {
			this.fakeDelete(entity.getId());
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#fakeDelete(java.lang.
	 * Object[])
	 */
	@Override
	public void fakeDelete(T[] ts) {

		for (T entity : ts) {
			this.fakeDelete(entity.getId());
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#get(java.lang.String)
	 */
	@Override
	@OperLog(operType="查询(get)")
	public T get(String id) {

		if (StringUtils.isBlank(id)) {
			return null;
		}
		T t = null;
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			Object obj = CacheUtils.get(cacheEnable.cacheNames() + DELIMITER + id);
			if (obj == null) {
				t = mapper.get(id);
				if (t != null) {
					CacheUtils.put(cacheEnable.cacheNames() + DELIMITER + id, t);
				}
			} else {
				t = (T) obj;
			}
		} else {
			t = mapper.get(id);
		}
		return t;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#get(java.lang.Object)
	 */
	@Override
	public T get(T entity) {

		if (entity != null) {
			return this.get(entity.getId());
		}
		return null;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#start(java.lang.String)
	 */
	@Override
//	@CacheEvict(key = "#id")
	@OperLog(operType="启用")
	public void start(String id) {

		mapper.start(id);
		this.startAfter(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#start(java.lang.Object)
	 */
	@Override
	public void start(T entity) {

		this.start(entity.getId());
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchStart(java.lang.
	 * String[])
	 */
	@Override
	public void batchStart(String[] ids) {

		for (String id : ids) {
			this.start(id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchStart(java.util.
	 * Collection)
	 */
	@Override
	public void batchStart(Collection<T> ts) {

		for (T entity : ts) {
			this.start(entity.getId());
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#stop(java.lang.String)
	 */
	@Override
//	@CacheEvict(key = "#id")
	@OperLog(operType="禁用")
	public void stop(String id) {

		mapper.stop(id);
		this.stopAfter(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#stop(java.lang.Object)
	 */
	@Override
	public void stop(T entity) {

		this.stop(entity.getId());
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchStop(java.lang.
	 * String[])
	 */
	@Override
	public void batchStop(String[] ids) {

		for (String id : ids) {
			this.start(id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchStop(java.util.
	 * Collection)
	 */
	@Override
	public void batchStop(Collection<T> ts) {

		for (T entity : ts) {
			this.stop(entity.getId());
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#pass(java.lang.String)
	 */
	@Override
//	@CacheEvict(key = "#id")
	@OperLog(operType="通过")
	public void pass(String id) {

		mapper.pass(id);
		this.passAfter(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#pass(java.lang.Object)
	 */
	@Override
	public void pass(T entity) {

		this.pass(entity.getId());
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchPass(java.lang.
	 * String[])
	 */
	@Override
	public void batchPass(String[] ids) {

		for (String id : ids) {
			this.pass(id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchPass(java.util.
	 * Collection)
	 */
	@Override
	public void batchPass(Collection<T> ts) {

		for (T entity : ts) {
			this.pass(entity.getId());
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#denial(java.lang.String)
	 */
	@Override
//	@CacheEvict(key = "#id")
	@OperLog(operType="返回")
	public void denial(String id) {

		mapper.denial(id);
		this.deleteAfter(id);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#denial(java.lang.Object)
	 */
	@Override
	public void denial(T entity) {

		this.denial(entity.getId());
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchDenial(java.lang.
	 * String[])
	 */
	@Override
	public void batchDenial(String[] ids) {

		for (String id : ids) {
			this.denial(id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#batchDenial(java.util.
	 * Collection)
	 */
	@Override
	public void batchDenial(Collection<T> ts) {

		for (T entity : ts) {
			this.denial(entity.getId());
		}
	}
}

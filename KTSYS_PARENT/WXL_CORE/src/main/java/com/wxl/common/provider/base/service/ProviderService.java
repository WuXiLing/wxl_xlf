package com.wxl.common.provider.base.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.utils.BasePage;

/**
 * 
 * @author wxl
 * 
 * @date 2017年6月28日 下午5:11:24
 */
public interface ProviderService<T> {

	
	T save(T entity);
	/**
	 * 新增
	 * 
	 * @param entity
	 */
	T insert(T entity);

	/**
	 * 批量新增
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchInsert(Collection<T> ts);

	/**
	 * 批量新增
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchInsert(T[] ts);

	/**
	 * 修改
	 * 
	 * @param entity
	 */
	T update(T entity);

	/**
	 * 批量修改
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchUpdate(Collection<T> ts);

	/**
	 * 批量修改
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchUpdate(T[] ts);

	/**
	 * 删除前操作
	 * 
	 * @param id
	 */
	void deleteBefore(String id);

	/**
	 * 删除后操作
	 * 
	 * @param id
	 */
	void deleteAfter(String id);

	/**
	 * 删除
	 * 
	 * @param entity
	 */
	void delete(T entity);

	/**
	 * 删除
	 * 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 *            id集合
	 */
	void delete(String[] ids);

	/**
	 * 假删除
	 * 
	 * @param id
	 */
	void fakeDelete(String id);

	/**
	 * 假删除
	 * 
	 * @param entity
	 */
	void fakeDelete(T entity);

	/**
	 * 批量假删除
	 * 
	 * @param ids
	 *            id集合
	 */
	void fakeDeletes(String[] ids);

	/**
	 * 批量假删除
	 * 
	 * @param ts
	 *            数据集合
	 */
	void fakeDelete(Collection<T> ts);

	/**
	 * 批量假删除
	 * 
	 * @param ts
	 *            数据集合
	 */
	void fakeDelete(T[] ts);

	/**
	 * 查询单条数据
	 * 
	 * @param id
	 * @return
	 */
	T get(String id);

	/**
	 * 查询单条数据
	 * 
	 * @param T
	 * @return
	 */
	T get(T id);

	/**
	 * 启用
	 * 
	 * @param id
	 */
	void start(String id);

	/**
	 * 启用
	 * 
	 * @param entity
	 */
	void start(T entity);

	/**
	 * 启用后
	 * 
	 * @param id
	 */
	void startAfter(String id); 
	
	/**
	 * 启用
	 * 
	 * @param ids
	 *            id集合
	 */
	void batchStart(String[] ids);

	/**
	 * 启用
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchStart(Collection<T> ts);

	/**
	 * 禁用
	 * 
	 * @param id
	 */
	void stop(String id);

	/**
	 * 禁用
	 * 
	 * @param entity
	 */
	void stop(T entity);

	/**
	 * 禁用后
	 * 
	 * @param id
	 */
	void stopAfter(String id); 
	
	/**
	 * 禁用
	 * 
	 * @param ids
	 *            id集合
	 */
	void batchStop(String[] ids);

	/**
	 * 禁用
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchStop(Collection<T> ts);
	
	
	/**
	 * 通过
	 * 
	 * @param id
	 */
	void pass(String id);

	/**
	 * 通过
	 * 
	 * @param entity
	 */
	void pass(T entity);

	/**
	 * 通过后
	 * 
	 * @param id
	 */
	void passAfter(String id); 
	
	/**
	 * 通过
	 * 
	 * @param ids
	 *            id集合
	 */
	void batchPass(String[] ids);

	/**
	 * 通过
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchPass(Collection<T> ts);
	
	/**
	 * 退回
	 * 
	 * @param id
	 */
	void denial(String id);

	/**
	 * 退回
	 * 
	 * @param entity
	 */
	void denial(T entity);

	/**
	 * 退回后
	 * 
	 * @param id
	 */
	void denialAfter(String id); 
	
	/**
	 * 退回
	 * 
	 * @param ids
	 *            id集合
	 */
	void batchDenial(String[] ids);

	/**
	 * 退回
	 * 
	 * @param ts
	 *            数据集合
	 */
	void batchDenial(Collection<T> ts);

	/**
	 * 新增前操作
	 * 
	 * @param entity
	 */
	void insertBefore(T entity);

	/**
	 * 新增后操作
	 * 
	 * @param entity
	 */
	void insertAfter(T entity);

	/**
	 * 修改前操作
	 * 
	 * @param entity
	 */
	void updateBefore(T entity);

	/**
	 * 修改后操作
	 * 
	 * @param entity
	 */
	void updateAfter(T entity);

	/**
	 * 查询分页数据集合
	 * 
	 * @param page
	 *            分页信息
	 * @param parms
	 *            参数信息
	 */
	void selectPageList(BasePage page);
	
	/**
	 * 查询分页数据集合
	 * 
	 * @param page
	 *            分页信息
	 * @param parms
	 *            参数信息
	 */
	void selectJqgridPageList(BasePage page);

	/**
	 * 查询分页数据集合
	 * 
	 * @param page
	 *            分页信息
	 * @param parms
	 *            参数信息
	 */
	void selectLayuiPageList(BasePage page);
	
	/**
	 * 查询数据集合
	 * 
	 * @param parms
	 *            参数信息
	 */
	List<T> selectList(@Param("cm") Map<String, Object> parms);

	/**
	 * 查询所有数据集合
	 * 
	 * @param parms
	 *            参数信息
	 */
	List<T> selectAll(@Param("cm") Map<String, Object> parms);
}

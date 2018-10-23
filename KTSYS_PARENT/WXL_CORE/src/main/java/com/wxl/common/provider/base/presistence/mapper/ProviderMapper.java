package com.wxl.common.provider.base.presistence.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.base.presistence.entity.ProviderEntity;
import com.wxl.common.provider.utils.BasePage;

/**
 * 
 * @author wxl
 * 
 * @date 2017年6月28日 下午4:57:30
 */
public interface ProviderMapper<T extends ProviderEntity> {

	/**
	 * 新增
	 * 
	 * @param entity
	 */
	void insert(T entity);

	/**
	 * 修改
	 * 
	 * @param entity
	 */
	void update(T entity);

	/**
	 * 删除
	 * 
	 * @param id
	 */
	void delete(@Param("id") String id);

	/**
	 * 假删除
	 * 
	 * @param id
	 */
	void fakeDelete(@Param("id") String id);

	/**
	 * 查询单表数据
	 * 
	 * @param id
	 * @return
	 */
	T get(@Param("id") String id);

	/**
	 * 验证数据
	 * 
	 * @param parms
	 * @return
	 */
	List<T> verify(@Param("cm") Map<String, Object> parms);
	
	/**
	 * 启用
	 * 
	 * @param id
	 */
	void start(@Param("id") String id);

	/**
	 * 禁用
	 * 
	 * @param id
	 */
	void stop(@Param("id") String id);

	/**
	 * 通过
	 * 
	 * @param id
	 */
	void pass(@Param("id") String id);

	/**
	 * 退回
	 * 
	 * @param id
	 */
	void denial(@Param("id") String id);

	/**
	 * 查询分页数据集合
	 * 
	 * @param page
	 *            分页信息
	 * @param parms
	 *            参数集合
	 */
	List<T> selectPageList(BasePage page);

	/**
	 * 查询分页数据集合
	 * 
	 * @param page
	 *            分页信息
	 * @param parms
	 *            参数集合
	 */
	List<T> selectJqgridPageList(BasePage page);

	/**
	 * 查询分页数据集合
	 * 
	 * @param page
	 *            分页信息
	 * @param parms
	 *            参数集合
	 */
	List<T> selectLayuiPageList(BasePage page);

	/**
	 * 查询数据集合
	 * 
	 * @param parms
	 *            参数集合
	 */
	List<T> selectList(@Param("cm") Map<String, Object> parms);

	/**
	 * 查询所有数据集合
	 * 
	 * @param parms
	 *            参数集合
	 */
	List<T> selectAll(@Param("cm") Map<String, Object> parms);
	
	/**
	 * 查询数据集合
	 * 
	 * @param parms
	 *            参数集合
	 */
	List<T> checkUnique(@Param("cm") Map<String, Object> parms);

	
}

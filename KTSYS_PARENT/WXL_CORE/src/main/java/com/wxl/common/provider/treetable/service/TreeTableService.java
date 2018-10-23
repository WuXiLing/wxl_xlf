package com.wxl.common.provider.treetable.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.base.service.BaseService;
import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

/**
 * 树基类
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public interface TreeTableService<T extends TreeTableEntity<T>> extends BaseService<T> {

	/**
	 * 根据用户ID查询数据
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	List<T> findByUserId(@Param("userId") String userId);

	/**
	 * 根据角色ID查询数据
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	List<T> findByRoleId(@Param("roleId") String roleId);
	
	/**
	 * 根据父ID查询数据
	 * 
	 * @param parentId
	 *            父ID
	 * @return
	 */
	List<T> findByParentId(@Param("parentId") String parentId);

	/**
	 * 更新排序号
	 * 
	 * @param params
	 */
	void updateSort(@Param("params") Map<String, String> params);
}

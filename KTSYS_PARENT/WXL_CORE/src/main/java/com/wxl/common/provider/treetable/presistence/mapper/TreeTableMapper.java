package com.wxl.common.provider.treetable.presistence.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.base.presistence.mapper.BaseMapper;
import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

/**
 * 树基类
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:25:42
 */
public interface TreeTableMapper<T extends TreeTableEntity<T>> extends BaseMapper<T> {

	void updateChildrenLongCode(@Param(value = "oldLongCode") String oldLongCode, @Param(value = "newLongCode") String newLongCode);

	void updateChildrenLongName(@Param(value = "oldLongName") String oldLongName, @Param(value = "newLongName") String newLongName);

	void updateChildrenDepth(@Param(value = "oldLongCode") String oldLongCode, @Param(value = "new_depth") int new_depth);

	T getMaxChildren(@Param(value = "parentCode") String parentCode);

	/**
	 * 根据父ID查询数据
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	List<T> findByParentId(@Param(value = "parentId") String parentId);

	/**
	 * 根据用户ID查询数据
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	List<T> findByUserId(@Param(value = "userId") String userId);

	/**
	 * 根据角色ID查询数据
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	List<T> findByRoleId(@Param(value = "roleId") String roleId);

	/**
	 * 更新排序号
	 * 
	 * @param params
	 */
	void updateSort(@Param("params") Map<String, String> params);
}

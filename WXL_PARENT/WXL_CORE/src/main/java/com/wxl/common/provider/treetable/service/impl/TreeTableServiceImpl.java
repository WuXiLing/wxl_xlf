package com.wxl.common.provider.treetable.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.base.service.impl.BaseServiceImpl;
import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;
import com.wxl.common.provider.treetable.presistence.mapper.TreeTableMapper;
import com.wxl.common.provider.treetable.service.TreeTableService;
import com.wxl.common.provider.utils.BasePage;

/**
 * 树基类
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public abstract class TreeTableServiceImpl<T extends TreeTableEntity<T>, D extends TreeTableMapper<T>> extends BaseServiceImpl<T, D> implements TreeTableService<T> {

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#selectPageList(com.wxl.
	 * common.provider.utils.BasePage, java.util.Map)
	 */
	@Override
	public void selectJqgridPageList(BasePage page) {

		T temp = this.get("1");
		if (temp != null) {
			page.setSj(parseAll(temp));
		}
	}

	private List<T> parseAll(T entity) {

		List<T> tempList = new ArrayList<>();
		tempList.add(entity);
		if (entity.getChildrens() != null && !entity.getChildrens().isEmpty()) {
			for (T temp : entity.getChildrens()) {
				tempList.addAll(parseAll(temp));
			}
		}
		return tempList;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#selectList(java.util.Map)
	 */
	@Override
	public List<T> selectList(@Param("cm") Map<String, Object> parms) {

		T temp = this.get("1");
		if (temp != null) {
			return parseAll(temp);
		}
		return new ArrayList<>();
	}

	public void saveBefore(T entity) {

		super.saveBefore(entity);
//		entity.setParentId(entity.getParent().getId());
	}

	/**
	 * 更新前置操作 更新子全码，子全名称，子深度
	 */
	@Override
	public void insertBefore(T entity) {

		super.insertBefore(entity);
		// 查询父
		T maxEntity = this.get(entity.getParent().getId());
		if (maxEntity != null) {
			entity.setDepth(maxEntity.getDepth() + 1);
			entity.setLongCode(maxEntity.getLongCode() + "," + entity.getCode());
			entity.setLongName(maxEntity.getLongName() + "," + entity.getName());
		} else {
			entity.setLongCode(entity.getCode());
			entity.setLongName(entity.getName());
		}
	}

	/**
	 * 更新前置操作 更新子全码，子全名称，子深度
	 */
	@Override
	public void updateBefore(T entity) {

		super.updateBefore(entity);
		T old = this.get(entity);

		String old_longCode = "";
		String old_longName = "";
		String new_longCode = "";
		String new_longName = "";
		if (old != null) {
			old_longCode = old.getLongCode();
			old_longName = old.getLongName();
			T maxEntity = this.get(entity.getParent().getId());
			if (maxEntity != null) {
				new_longCode = maxEntity.getLongCode() + "," + entity.getLongCode();
				new_longName = maxEntity.getLongName() + "," + entity.getName();
				// new_depth = maxEntity.getDepth();
				// updateChildrenDepth(old_longCode, new_depth);
				updateChildrenLongCode(old_longCode, new_longCode);
				updateChildrenLongName(old_longName, new_longName);
				entity.setDepth(maxEntity.getDepth() + 1);
			}

		}
		entity.setLongCode(new_longCode);
		entity.setLongName(new_longName);
	}

	protected T getMaxChildren(String parentCode) {

		return mapper.getMaxChildren(parentCode);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.base.service.ProviderService#deleteBefore(java.
	 * lang.Object)
	 */
	@Override
	public void deleteBefore(@Param("parentId") String parentId) {

		List<T> tempList = mapper.findByParentId(parentId);
		if (tempList != null && !tempList.isEmpty()) {
			for (T t : tempList) {
				this.delete(t);
			}
		}
	}

	/**
	 * 更新子全码
	 * 
	 * @param entity
	 */
	protected void updateChildrenLongCode(String oldLongCode, String newLongCode) {

		mapper.updateChildrenLongCode(oldLongCode, newLongCode);
	}

	/**
	 * 更新子全名称
	 * 
	 * @param entity
	 */
	protected void updateChildrenLongName(String oldLongName, String newLongName) {

		mapper.updateChildrenLongName(oldLongName, newLongName);
	}

	/**
	 * 更新子深度
	 * 
	 * @param entity
	 */
	protected void updateChildrenDepth(String oldLongCode, int new_depth) {

		mapper.updateChildrenDepth(oldLongCode, new_depth);
	}

	/**
	 * 根据用户ID查询数据
	 * 
	 * @param userId
	 *            用户ID
	 * @return
	 */
	public List<T> findByUserId(@Param("userId") String userId) {

		return mapper.findByUserId(userId);
	};

	/**
	 * 根据角色ID查询数据
	 * 
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	public List<T> findByRoleId(@Param("roleId") String roleId) {

		return mapper.findByRoleId(roleId);
	};
	
	/**
	 * 根据父ID查询数据
	 * 
	 * @param parentId
	 *            父ID
	 * @return
	 */
	public List<T> findByParentId(@Param("parentId") String parentId) {

		return mapper.findByParentId(parentId);
	};
	
	/**
	 * 更新排序号
	 * 
	 * @param params
	 */
	@Override
	@Transactional(readOnly = false)
	public void updateSort(Map<String, String> params) {

		mapper.updateSort(params);
	}
}

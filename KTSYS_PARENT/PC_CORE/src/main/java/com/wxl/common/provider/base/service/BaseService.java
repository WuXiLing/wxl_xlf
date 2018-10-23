package com.wxl.common.provider.base.service;

import java.util.List;

import com.wxl.common.provider.base.presistence.entity.BaseEntity;

/**
 * 
 * @author wxl
 * 
 * @date 2017年6月28日 下午5:26:06
 */
public interface BaseService<T extends BaseEntity> extends ProviderService<T> {

	public void importInfo(List<T> list);

	public void importListBefore(List<T> list);

	public void importListAfter(List<T> list);

	public void importBefore(T entity);

	public void importAfter(T entity);
}

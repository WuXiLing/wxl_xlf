package com.wxl.common.provider.utils;

import java.util.List;

import com.wxl.common.provider.base.presistence.entity.ProviderEntity;

/**
 * 分页基类
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 下午1:49:16
 */
public abstract class BasePage {

	/** 获取总数 */
	public abstract long getZs();

	/** 获取每页个数 */
	public abstract long getMygs();

	/** 获取当前页 */
	public abstract long getDqy();

	/** 获取总页数 */
	public abstract long getZys();

	/** 获取总数 */
	public abstract void setZs(long zs);

	/** 设置每页个数 */
	public abstract void setMygs(long mygs);

	/** 设置数据 */
	public abstract void setSj(List<?> results);

	/** 设置当前页 */
	public abstract void setDqy(long dqy);

	/** 设置总页数 */
	public abstract void setZys(long zys);
}

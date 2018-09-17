package com.wxl.common.interceptor.dialect;

import java.util.List;

import com.wxl.common.provider.base.presistence.entity.ProviderEntity;
import com.wxl.common.provider.utils.BasePage;

/**
 * 数据库方言<br>
 * 添加一种数据库，需实现此接口
 *
 * @author wxl
 * @date 2018年1月20日 上午2:22:29
 */
public interface DbDialect {

	/**
	 * 查询总数SQL
	 * 
	 * @param page
	 *            分页信息
	 * @param sql
	 *            源sql
	 * @return
	 */
	public String totalSql(BasePage page, String sql);

	/**
	 * 构建分页SQL
	 * 
	 * @param page
	 *            分页信息
	 * @param sql
	 *            源sql
	 * @return
	 */
	public String buildPageSql(BasePage page, String sql);

	/**
	 * 构建行号SQL
	 * 
	 * @param sql
	 *            源sql
	 * @return
	 */
	public String buildRowNumSql(String sql);
	
	/**
	 * 设置总数
	 * 
	 * @param page
	 *            分页信息
	 * @param zs
	 *            总数
	 */
	public void setZs(BasePage page, long zs);

	/**
	 * 设置每页个数
	 * 
	 * @param page
	 *            分页信息
	 * @param mygs
	 *            每页个数
	 */
	public void setMygS(BasePage page, long mygs);

	/**
	 * 设置数据
	 * 
	 * @param page
	 *            分页信息
	 * @param sj
	 *            数据
	 */
	public void setSj(BasePage page, List<? extends ProviderEntity> sj);

	/**
	 * 设置当前页
	 * 
	 * @param page
	 *            分页信息
	 * @param dqy
	 *            当前页
	 */
	public void setDqy(BasePage page, long dqy);

	/**
	 * 设置总页数
	 * 
	 * @param page
	 *            分页信息
	 * @param zys
	 *            总页数
	 */
	public void setZys(BasePage page, long zys);

	/**
	 * 解析分页对象
	 * 
	 * @param obj
	 *            分页信息对象
	 * @return
	 */
	public BasePage parsePageObject(Object obj);
}

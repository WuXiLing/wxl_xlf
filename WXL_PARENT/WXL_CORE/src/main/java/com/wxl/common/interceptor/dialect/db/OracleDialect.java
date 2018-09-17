package com.wxl.common.interceptor.dialect.db;

import com.wxl.common.provider.utils.BasePage;

/**
 * Oracle方言
 *
 * @author wxl
 * @date 2018年1月20日 上午2:33:11
 */
public class OracleDialect extends AbstractDbDialect {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#buildPageSql(com.wxl.common.
	 * provider .utils.BasePage, java.lang.String)
	 */
	@Override
	public String buildPageSql(BasePage page, String sql) {
		// 计算第一条记录的位置，Oracle分页是通过rownum进行的，而rownum是从1开始的
		long offset = (page.getDqy() - 1) * page.getMygs() + 1;
		StringBuilder sb = new StringBuilder(sql);
		sb.insert(0, "select u.*, rownum rn from (").append(") u where rownum < ").append(offset + page.getMygs());
		sb.insert(0, "select * from (").append(") where rn >= ").append(offset);
		return sb.toString();
	}
}

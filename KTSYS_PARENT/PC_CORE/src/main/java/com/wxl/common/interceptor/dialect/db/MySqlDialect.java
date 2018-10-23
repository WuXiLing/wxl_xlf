package com.wxl.common.interceptor.dialect.db;

import com.wxl.common.provider.utils.BasePage;

/**
 * MySql方言
 *
 * @author wxl
 * @date 2018年1月20日 上午2:33:11
 */
public class MySqlDialect extends AbstractDbDialect {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#buildPageSql(com.wxl.common.provider
	 * .utils.BasePage, java.lang.String)
	 */
	@Override
	public String buildPageSql(BasePage page, String sql) {

		long offset = (page.getDqy() - 1) * page.getMygs();
		return new StringBuilder(sql).append(" limit ").append(offset).append(",").append(page.getMygs())
				.toString();
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#buildRowNumSql(java.lang.String)
	 */
	@Override
	public String buildRowNumSql(String sql) {
		return sql;

//		return "SELECT @rowno:=@rowno + 1 AS rn,t_wxl_row_data.* from (" + sql + ") t_wxl_row_data,(SELECT @rowno:=0) t_wxl_row_no";
	}
}

package com.wxl.common.interceptor.dialect.db;

import com.wxl.common.provider.utils.BasePage;

/**
 * Derby数据库方言
 *
 * @author wxl
 * @date 2018年1月20日 上午2:37:20
 * @version 1.0
 * @since JDK 1.8
 */
public class DerbyDialect extends AbstractDbDialect {

	/**
	 * 将sql变成分页sql语句,提供将offset及limit使用占位符号(placeholder)替换.
	 * 
	 * <pre>
	 * 如mysql
	 * dialect.getLimitString("select * from user", 12, ":offset",0,":limit") 将返回
	 * select * from user limit :offset,:limit
	 * </pre>
	 *
	 * @param sql
	 *            实际SQL语句
	 * @param offset
	 *            分页开始纪录条数
	 * @param offsetPlaceholder
	 *            分页开始纪录条数－占位符号
	 * @param limit
	 *            分页每页显示纪录条数
	 * @param limitPlaceholder
	 *            分页纪录条数占位符号
	 * @return 包含占位符的分页sql
	 */
	public String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder) {
		throw new UnsupportedOperationException("paged queries not supported");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#buildPageSql(com.wxl.common.
	 * provider.utils.BasePage, java.lang.String)
	 */
	@Override
	public String buildPageSql(BasePage page, String sql) {
		// TODO Auto-generated method stub
		return null;
	}

}

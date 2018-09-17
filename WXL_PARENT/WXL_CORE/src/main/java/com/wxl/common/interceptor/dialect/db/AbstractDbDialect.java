package com.wxl.common.interceptor.dialect.db;

import java.util.List;
import java.util.Map;

import com.wxl.common.interceptor.dialect.DbDialect;
import com.wxl.common.provider.base.presistence.entity.ProviderEntity;
import com.wxl.common.provider.utils.BasePage;

/**
 * 数据库方言抽象实现
 *
 * @author wxl
 * @date 2018年1月20日 上午2:23:39
 */
public abstract class AbstractDbDialect implements DbDialect {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#totalSql(com.wxl.common.provider
	 * .utils.BasePage, java.lang.String)
	 */
	@Override
	public String totalSql(BasePage page, String sql) {
		int index = sql.toLowerCase().indexOf("from");
		return "select count(*) " + sql.substring(index);
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
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#totalSql(com.wxl.common.provider
	 * .utils.BasePage, java.lang.String)
	 */
	@Override
	public BasePage parsePageObject(Object parameterObj) {
		if (parameterObj instanceof BasePage) {
			return (BasePage) parameterObj;
		} else if (parameterObj instanceof Map) {
			for (Object val : ((Map<?, ?>) parameterObj).values()) {
				if (val instanceof BasePage) {
					return (BasePage) val;
				}
			}
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#setZs(com.wxl.common.provider.
	 * utils.BasePage, long)
	 */
	@Override
	public void setZs(BasePage page, long zs) {
		page.setZs(zs);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#setMygS(com.wxl.common.provider.
	 * utils.BasePage, long)
	 */
	@Override
	public void setMygS(BasePage page, long mygs) {
		page.setMygs(mygs);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#setSj(com.wxl.common.provider.
	 * utils.BasePage, java.util.List)
	 */
	@Override
	public void setSj(BasePage page, List<? extends ProviderEntity> sj) {
		page.setSj(sj);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#setDqy(com.wxl.common.provider.
	 * utils.BasePage, long)
	 */
	@Override
	public void setDqy(BasePage page, long dqy) {
		page.setDqy(dqy);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.wxl.common.interceptor.dialect.DbDialect#setZys(com.wxl.common.provider.
	 * utils.BasePage, long)
	 */
	@Override
	public void setZys(BasePage page, long zys) {
		page.setZys(zys);
	}
}

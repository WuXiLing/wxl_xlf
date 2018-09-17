package com.wxl.common.interceptor;

import java.sql.Statement;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 编辑数据拦截器
 *
 * @author wxl
 * @date 2018年1月20日 上午2:18:10
 */
@Intercepts({ @Signature(method = "update", type = StatementHandler.class, args = { Statement.class }),
		@Signature(method = "update", type = Executor.class, args = { MappedStatement.class, Object.class }) })
public class MybatisInsertInterceptor implements Interceptor {

	private static final Logger logger = LoggerFactory.getLogger(MybatisInsertInterceptor.class);

	public static final String MYSQL = "mysql";

	public static final String ORACLE = "oracle";

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		String databaseType = properties.getProperty("databaseType");
		if (databaseType != null) {
			
		}
	}

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		logger.debug("新增、或修改。");
		if (invocation.getTarget() instanceof StatementHandler) { // 控制SQL和查询总数的地方

			return invocation.proceed();
		} else { // 查询结果的地方

			return invocation.proceed();

		}
	}
}

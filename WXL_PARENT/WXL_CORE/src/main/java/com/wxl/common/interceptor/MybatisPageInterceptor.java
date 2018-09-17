package com.wxl.common.interceptor;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wxl.common.interceptor.dialect.AutomaticDetectionDbType;
import com.wxl.common.interceptor.dialect.DbDialect;
import com.wxl.common.provider.utils.BasePage;

/**
 * 通用数据分页拦截器<br>
 * 可适用多种分页情况。
 * <ol>
 * <li>分页对象继承<{@link BasePage}</li>
 * <li>指定数据库实现<{@link DbDialect}</li>
 * </ol>
 *
 * @author wxl
 * @date 2018年1月20日 上午2:18:32
 */
@Intercepts({ @Signature(method = "prepare", type = StatementHandler.class, args = { Connection.class }),
		@Signature(method = "query", type = Executor.class, args = { MappedStatement.class, Object.class,
				RowBounds.class, ResultHandler.class }) })
public class MybatisPageInterceptor implements Interceptor {

	private static final Logger log = LoggerFactory.getLogger(MybatisPageInterceptor.class);

	private static DbDialect dbDialect;

	protected ThreadLocal<BasePage> pageThreadLocal = new ThreadLocal<BasePage>();

	{
		dbDialect = AutomaticDetectionDbType.parseDbType();
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {

	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object intercept(Invocation invocation) throws Throwable {
		if (invocation.getTarget() instanceof StatementHandler) { // 控制SQL和查询总数的地方
			BasePage page = pageThreadLocal.get();
			if (!(invocation.getTarget() instanceof RoutingStatementHandler)) {
				return invocation.proceed();
			}
			RoutingStatementHandler handler = (RoutingStatementHandler) invocation.getTarget();
			StatementHandler delegate = (StatementHandler) ReflectUtil.getFieldValue(handler, "delegate");
			BoundSql boundSql = delegate.getBoundSql();

			Connection connection = (Connection) invocation.getArgs()[0];
			Object parameterObj = boundSql.getParameterObject();
			MappedStatement mappedStatement = (MappedStatement) ReflectUtil.getFieldValue(delegate, "mappedStatement");
			if(mappedStatement.getSqlCommandType() == SqlCommandType.SELECT) {
				String pageSql = boundSql.getSql();
				if (page != null) { // 不是分页查询
					queryTotalRecord(page, parameterObj, mappedStatement, connection);
					pageSql = dbDialect.buildPageSql(page, pageSql);
					if (log.isDebugEnabled()) {
						log.debug("分页查询SQL: ");
						log.debug(pageSql);
					}
				} else {
					
				}
					
				pageSql = dbDialect.buildRowNumSql(pageSql);
				if (log.isDebugEnabled()) {
					log.debug("查询语句SQL: ");
					log.debug(pageSql);
				}
				ReflectUtil.setFieldValue(boundSql, "sql", pageSql);
			}

			return invocation.proceed();
		} else { // 查询结果的地方
			// 获取是否有分页Page对象
			Object object = dbDialect.parsePageObject(invocation.getArgs()[1]);
			BasePage page = null;
			if (object != null) {
				if (object instanceof BasePage) {
					page = (BasePage) object;
				}
			} else {
				if (log.isTraceEnabled()) {
					log.trace("没有BasePage对象作为参数, 不是分页查询.");
				}
				return invocation.proceed();
			}
			// 设置真正的parameterObj
			invocation.getArgs()[1] = extractRealParameterObject(invocation.getArgs()[1]);

			pageThreadLocal.set(page);
			try {
				Object resultObj = invocation.proceed(); // Executor.query(..)
				if (resultObj instanceof List) {
					dbDialect.setSj(page, (List) resultObj);
				}
				return invocation.proceed();
			} finally {
				pageThreadLocal.remove();
			}
		}
	}

	/**
	 * <pre>
	 *  
	 * 把真正的参数对象解析出来 
	 * Spring会自动封装对个参数对象为Map<String, Object>对象 
	 * 对于通过@Param指定key值参数我们不做处理，因为XML文件需要该KEY值 
	 * 而对于没有@Param指定时，Spring会使用0,1作为主键 
	 * 对于没有@Param指定名称的参数,一般XML文件会直接对真正的参数对象解析， 
	 * 此时解析出真正的参数作为根对象
	 * </pre>
	 * 
	 * @param parameterObj
	 * @return
	 */
	protected Object extractRealParameterObject(Object parameterObj) {
		if (parameterObj instanceof Map<?, ?>) {
			Map<?, ?> parameterMap = (Map<?, ?>) parameterObj;
			if (parameterMap.size() == 2) {
				boolean springMapWithNoParamName = true;
				for (Object key : parameterMap.keySet()) {
					if (!(key instanceof String)) {
						springMapWithNoParamName = false;
						break;
					}
					String keyStr = (String) key;
					if (!"0".equals(keyStr) && !"1".equals(keyStr)) {
						springMapWithNoParamName = false;
						break;
					}
				}
				if (springMapWithNoParamName) {
					for (Object value : parameterMap.values()) {
						if (!(value instanceof BasePage)) {
							return value;
						}
					}
				}
			}
		}
		return parameterObj;
	}

	// protected void prepareAndCheckDatabaseType(Connection connection) throws
	// SQLException {
	// if (databaseType == null) {
	// String productName = connection.getMetaData().getDatabaseProductName();
	// if (log.isTraceEnabled()) {
	// log.trace("Database productName: " + productName);
	// }
	// productName = productName.toLowerCase();
	// if (productName.indexOf(MYSQL) != -1) {
	// databaseType = MYSQL;
	// } else if (productName.indexOf(ORACLE) != -1) {
	// databaseType = ORACLE;
	// } else {
	// throw new PageNotSupportException(
	// "Page not support for the type of database, database product name [" +
	// productName + "]");
	// }
	// if (log.isInfoEnabled()) {
	// log.info("自动检测到的数据库类型为: " + databaseType);
	// }
	// }
	// }

	/**
	 * <pre>
	 * 
	 * 查询总数
	 * </pre>
	 * 
	 * @param page
	 * @param parameterObject
	 * @param mappedStatement
	 * @param connection
	 * @throws SQLException
	 */
	protected void queryTotalRecord(BasePage page, Object parameterObject, MappedStatement mappedStatement,
			Connection connection) throws SQLException {
		BoundSql boundSql = mappedStatement.getBoundSql(page);
		String sql = boundSql.getSql();
		String countSql = dbDialect.totalSql(page, sql);
		if (log.isDebugEnabled()) {
			log.debug("分页时, 生成countSql: " + countSql);
		}

		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql, parameterMappings,
				parameterObject);
		ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject,
				countBoundSql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(countSql);
			parameterHandler.setParameters(pstmt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				long totalRecord = rs.getLong(1);
				dbDialect.setZs(page, totalRecord);
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
					if (log.isWarnEnabled()) {
						log.warn("关闭ResultSet时异常.", e);
					}
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
					if (log.isWarnEnabled()) {
						log.warn("关闭PreparedStatement时异常.", e);
					}
				}
		}
	}

	/**
	 * 根据原Sql语句获取对应的查询总记录数的Sql语句
	 * 
	 * @param sql
	 * @return
	 */
	// protected String buildCountSql(String sql) {
	// int index = sql.toLowerCase().indexOf("from");
	// return "select count(*) " + sql.substring(index);
	// }

	/**
	 * 利用反射进行操作的一个工具类
	 * 
	 */
	private static class ReflectUtil {
		/**
		 * 利用反射获取指定对象的指定属性
		 * 
		 * @param obj
		 *            目标对象
		 * @param fieldName
		 *            目标属性
		 * @return 目标属性的值
		 */
		public static Object getFieldValue(Object obj, String fieldName) {
			Object result = null;
			Field field = ReflectUtil.getField(obj, fieldName);
			if (field != null) {
				field.setAccessible(true);
				try {
					result = field.get(obj);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return result;
		}

		/**
		 * 利用反射获取指定对象里面的指定属性
		 * 
		 * @param obj
		 *            目标对象
		 * @param fieldName
		 *            目标属性
		 * @return 目标字段
		 */
		private static Field getField(Object obj, String fieldName) {
			Field field = null;
			for (Class<?> clazz = obj.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
				try {
					field = clazz.getDeclaredField(fieldName);
					break;
				} catch (NoSuchFieldException e) {
					// 这里不用做处理，子类没有该字段可能对应的父类有，都没有就返回null。
				}
			}
			return field;
		}

		/**
		 * 利用反射设置指定对象的指定属性为指定的值
		 * 
		 * @param obj
		 *            目标对象
		 * @param fieldName
		 *            目标属性
		 * @param fieldValue
		 *            目标值
		 */
		public static void setFieldValue(Object obj, String fieldName, String fieldValue) {
			Field field = ReflectUtil.getField(obj, fieldName);
			if (field != null) {
				try {
					field.setAccessible(true);
					field.set(obj, fieldValue);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public static class PageNotSupportException extends RuntimeException {

		/** serialVersionUID */
		private static final long serialVersionUID = 1L;

		public PageNotSupportException() {
			super();
		}

		public PageNotSupportException(String message, Throwable cause) {
			super(message, cause);
		}

		public PageNotSupportException(String message) {
			super(message);
		}

		public PageNotSupportException(Throwable cause) {
			super(cause);
		}
	}

}

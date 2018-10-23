package com.wxl.common.interceptor.dialect;

import com.wxl.common.config.Global;
import com.wxl.common.interceptor.dialect.db.MySqlDialect;
import com.wxl.common.interceptor.dialect.db.OracleDialect;

/**
 * 自动检测数据库类型
 *
 * @author wxl
 * @date 2018年1月20日 上午1:49:21
 */
public class AutomaticDetectionDbType {

	public static DbDialect parseDbType() {
		String dbType = Global.getConfig("jdbc.type");
		DbDialect dbDialect = null;
		switch (dbType) {
		case "mysql":
			dbDialect = new MySqlDialect();
			break;
		case "oracle":
			dbDialect = new OracleDialect();
			break;
		case "db2":

			break;
		case "dm":

			break;
		default:
			break;
		}
		return dbDialect;

	}
}

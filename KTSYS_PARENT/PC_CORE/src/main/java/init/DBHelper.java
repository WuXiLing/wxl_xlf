package init;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.wxl.common.utils.PropertiesLoader;

public class DBHelper {
	private static final String url;
	private static final String name;
	private static final String user;
	private static final String password;
	private static PropertiesLoader loader;
	private static Connection conn = null;

	static {
		loader = new PropertiesLoader("jdbc.properties");
		name = loader.getProperty("jdbc.driver");
		url = loader.getProperty("jdbc.url");
		user = loader.getProperty("jdbc.username");
		password = loader.getProperty("jdbc.password");
	}

	private DBHelper() {
		try {
			Class.forName(name);// 指定连接类型
			conn = DriverManager.getConnection(url, user, password);// 获取连接
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		new DBHelper();
		return conn;
	}
	
	public static void rollback() {
		try {
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit() {
		try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close() {
		try {
			DBHelper.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

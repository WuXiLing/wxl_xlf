package init;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;

/**
 * mybatis执行sql文件
 * 
 * @author Liang
 *
 */
public class SqlFileExecutor {

	private static Connection conn;

	private static ScriptRunner runner;

	static {
		conn = DBHelper.getConnection();
		runner = new ScriptRunner(conn);
	}

	public static void executor(String... resourcesPaths) {
		runner.setErrorLogWriter(new PrintWriter(System.out));
		runner.setLogWriter(new PrintWriter(System.out));
		try {
			for (String str : resourcesPaths) {
				runner.runScript(Resources.getResourceAsReader(str));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void executor(File... resourcesPaths) {

		runner.setErrorLogWriter(new PrintWriter(System.out));
		runner.setLogWriter(new PrintWriter(System.out));

		try {
			for (File str : resourcesPaths) {
				runner.runScript(new InputStreamReader(new FileInputStream(str)));
			}
		} catch (IOException e) {
			// e.printStackTrace();
		}
	}

	public static void executor(InputStream... resourcesPaths) throws UnsupportedEncodingException {

		runner.setErrorLogWriter(new PrintWriter(System.out));
		runner.setLogWriter(new PrintWriter(System.out));

		for (InputStream str : resourcesPaths) {
			runner.runScript(new InputStreamReader(str,"utf-8"));
		}
	}
}

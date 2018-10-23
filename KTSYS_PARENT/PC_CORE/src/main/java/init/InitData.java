package init;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.wxl.common.config.Global;

/**
 * 初始化数据库
 * 
 * @author Liang
 *
 */
public class InitData {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	private PathMatchingResourcePatternResolver d = new PathMatchingResourcePatternResolver();

	public void eecutor() {
		logger.debug("初始化脚本中......");
		List<Resource> resourcesList = new ArrayList<Resource>();
		resourcesList.addAll(getResources("TABLES"));
		resourcesList.addAll(getResources("CONSTRAINTS"));
		resourcesList.addAll(getResources("DATA_TABLE"));
		resourcesList.addAll(getResources("REF_CONSTRAINTS"));
		if (!resourcesList.isEmpty()) {
			for (Resource cResource : resourcesList) {
				logger.debug("执行脚本：" + cResource.getFilename());
				InputStream inputStream = null;
				try {
					inputStream = cResource.getInputStream();
					SqlFileExecutor.executor(inputStream);
				} catch (IOException e) {
					logger.error("执行脚本失败：" + cResource.getFilename());
				} finally {
					if (inputStream != null) {
						try {
							inputStream.close();
						} catch (IOException e) {
							
						}
					}
				}

			}
		}
		logger.debug("执行脚本结束");
	}

	public static void main(String[] args) throws IOException {
		InitData initData = new InitData();
		initData.eecutor();
	}

	private List<Resource> getResources(String path) {
		Resource[] x = {};
		try {
			x = d.getResources("classpath*:data" + File.separator + Global.getDBtype() + File.separator + path + File.separator + "**" + File.separator + "*.sql");
		} catch (IOException e) {
			logger.error("获取文件失败：" + path);
		}
		return Arrays.asList(x);
	}
}

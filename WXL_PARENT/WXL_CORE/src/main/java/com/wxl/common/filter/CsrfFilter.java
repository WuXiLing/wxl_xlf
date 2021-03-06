package com.wxl.common.filter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wxl.common.utils.WebUtil;

/**
 * CSRF（Cross-site request forgery）跨站请求伪造，也被称为“One Click Attack”或者Session Riding，通常缩写为CSRF或者XSRF，是一种对网站的恶意利用。<br>
 * 尽管听起来像跨站脚本（XSS），但它与XSS非常不同，XSS利用站点内的信任用户，而CSRF则通过伪装来自受信任用户的请求来利用受信任的网站。<br>
 * 与XSS攻击相比，CSRF攻击往往不大流行（因此对其进行防范的资源也相当稀少）和难以防范，所以被认为比XSS更具危险性。<br>
 * 
 * @author liangxf
 *
 */
public class CsrfFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(CsrfFilter.class);

	// 白名单
	private List<String> whiteUrls;

	private int _size = 0;

	public void init(FilterConfig filterConfig) {
		// 读取文件
		String path = CsrfFilter.class.getResource("/").getFile();
		whiteUrls = readFile(path + "csrfWhite.txt");
		_size = null == whiteUrls ? 0 : whiteUrls.size();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			// 获取请求url地址
			String url = req.getRequestURL().toString();
			String referurl = req.getHeader("Referer");
			logger.info("referurl----->" + referurl);
			if (isWhiteReq(referurl)) {
				chain.doFilter(request, response);
			} else {

				req.getRequestDispatcher("/").forward(req, res);

				// 记录跨站请求日志
				String log = "";
				String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				String clientIp = WebUtil.getHost(req);

				log = clientIp + "||" + date + "||" + referurl + "||" + url;
				logger.warn(log);
				return;
			}

		} catch (Exception e) {
			logger.error("doFilter", e);
		}

	}

	/*
	 * 判断是否是白名单
	 */
	private boolean isWhiteReq(String referUrl) {
		if (referUrl == null || "".equals(referUrl) || _size == 0) {
			return true;
		} else {
			String refHost = "";
			referUrl = referUrl.toLowerCase();
			if (referUrl.startsWith("http://")) {
				refHost = referUrl.substring(7);
			} else if (referUrl.startsWith("https://")) {
				refHost = referUrl.substring(8);
			}

			for (String urlTemp : whiteUrls) {
				if (refHost.indexOf(urlTemp.toLowerCase()) > -1) {
					return true;
				}
			}
		}

		return false;
	}

	public void destroy() {
	}

	private List<String> readFile(String fileName) {
		List<String> list = new ArrayList<String>();
		BufferedReader reader = null;
		FileInputStream fis = null;
		try {
			File f = new File(fileName);
			if (f.isFile() && f.exists()) {
				fis = new FileInputStream(f);
				reader = new BufferedReader(new InputStreamReader(fis, "UTF-8"));
				String line;
				while ((line = reader.readLine()) != null) {
					if (!"".equals(line)) {
						list.add(line);
					}
				}
			}
		} catch (Exception e) {
			logger.error("readFile", e);
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				logger.error("InputStream关闭异常", e);
			}
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				logger.error("FileInputStream关闭异常", e);
			}
		}
		return list;
	}
}

package com.wxl.common.listener;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wxl.common.config.Global;
import com.wxl.common.rest.HttpClientUtil;
import com.wxl.common.utils.IPAddressKowalski;

/**
 * open manage and front view after startup
 * 
 * @author Liang
 *
 */
public class OpenBrowerServlet extends HttpServlet {

	private static final long serialVersionUID = -1496644117614324928L;

	protected static Logger logger = LoggerFactory.getLogger(OpenBrowerServlet.class);

	public OpenBrowerServlet() {
		super();
	}

	public void init() throws ServletException {
		logger.info("init open view ... ");
		String openAddress = Global.getConfig("project.open.address");
		if("true".equals(openAddress)) {
			String domain = IPAddressKowalski.getIpAddressAndPort();
			String openAddressView = Global.getConfig("project.open.address.view");
			String [] views = StringUtils.isNoneBlank(openAddressView) ? openAddressView.split(",") : new String [] {};
			if(views !=null && views.length > 0) {
				for(String view : views) {
					logger.info("open view：" + view);
					URI uri = URI.create(domain + view);
					Desktop dp = Desktop.getDesktop();
					if (dp.isSupported(Desktop.Action.BROWSE)) {
						try {
							dp.browse(uri);
						} catch (IOException e) {
							logger.error("open error：" + view,e);
						}
					}
				}
			}
			
		}
			//String x = HttpClientUtil.get("http://127.0.0.1:8082/wxl/v2/api-docs",null,null);
			
			//System.out.println(x);
	}
}

package com.wxl.common.utils;

import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Set;

import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;
import javax.management.Query;

//本地服务相关
public class IPAddressKowalski {

	// 获取ip和port
	public static String getIpAddressAndPort(){
		String ipadd = "";
		MBeanServer beanServer = ManagementFactory.getPlatformMBeanServer();
		Set<ObjectName> objectNames;
		try {
			objectNames = beanServer.queryNames(new ObjectName("*:type=Connector,*"), Query.match(Query.attr("protocol"), Query.value("HTTP/1.1")));
			String host = InetAddress.getLocalHost().getHostAddress();
			String port = objectNames.iterator().next().getKeyProperty("port");
			ipadd = "http" + "://" + host + ":" + port;
		} catch (MalformedObjectNameException | UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ipadd;
	}

	// 获取端口
	public static int getTomcatPort() throws MalformedObjectNameException, NullPointerException {
		MBeanServer beanServer = ManagementFactory.getPlatformMBeanServer();
		Set<ObjectName> objectNames = beanServer.queryNames(new ObjectName("*:type=Connector,*"), Query.match(Query.attr("protocol"), Query.value("HTTP/1.1")));
		String port = objectNames.iterator().next().getKeyProperty("port");
		return Integer.valueOf(port);
	}

}

package com.wxl.common.rest;

import java.io.IOException;
import java.io.InputStream;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.HttpVersion;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.PoolingClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
public class HttpClientUtil {

	private static final String ENCODING = "UTF-8";

	private static HttpClient client = null;
	private static SchemeRegistry schemeRegistry; // 协议控制
	private static PoolingClientConnectionManager ccm; // HttpClient连接池(多连接的线程安全的管理器)

	static {
		try {
			/*
			 * 与https请求相关的操作
			 */
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, new TrustManager[]{new MyX509TrustManager()}, new SecureRandom());
			SSLSocketFactory socketFactory = new SSLSocketFactory(sslContext);
			/*
			 * 定义访问协议
			 */
			schemeRegistry = new SchemeRegistry();
			schemeRegistry.register(new Scheme("http", 80, PlainSocketFactory.getSocketFactory()));// http
			schemeRegistry.register(new Scheme("https", 443, socketFactory));// https
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		}

		Properties props = FileUtil.loadProps("http.properties");// 加载属性文件

		// 连接池管理
		ccm = new PoolingClientConnectionManager(schemeRegistry);
		ccm.setDefaultMaxPerRoute(FileUtil.getInt(props, "httpclient.max.conn.per.route", 20));// 每个路由的最大连接数
		ccm.setMaxTotal(FileUtil.getInt(props, "httpclient.max.conn.total", 400));// 最大总连接数

		HttpParams httpParams = new BasicHttpParams();
		httpParams.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, FileUtil.getInt(props, "httpclient.max.conn.timeout", 1000));// 连接超时时间（ms）
		httpParams.setParameter(CoreConnectionPNames.SO_TIMEOUT, FileUtil.getInt(props, "httpclient.max.socket.timeout", 2000));// 操作超时时间（ms）
		httpParams.setParameter(CoreProtocolPNames.PROTOCOL_VERSION, HttpVersion.HTTP_1_1);// 设置http1.1或http1.0

		client = new DefaultHttpClient(ccm, httpParams);// 一个客户端就有一个连接池
	}

	/**
	 * get请求
	 * 
	 * @param url
	 *            请求URL
	 * @param paramMap
	 *            请求参数
	 * @param headerMap
	 *            请求头信息
	 */
	public static String get(String url, Map<String, String> paramMap, Map<String, String> headerMap) throws ClientProtocolException, IOException {
		/*
		 * 拼接URL与参数
		 */
		if (paramMap != null && !paramMap.isEmpty()) {
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			for (String key : paramMap.keySet()) {
				params.add(new BasicNameValuePair(key, paramMap.get(key)));
			}
			String queryString = URLEncodedUtils.format(params, ENCODING);
			if (url.indexOf("?") > -1) {// 存在?，表示这时的URL已经带参数了
				url += "&" + queryString;
			} else {
				url += "?" + queryString;
			}
		}

		HttpGet httpGet = new HttpGet(url);

		/*
		 * 设置头信息
		 */
		if (headerMap != null && !headerMap.isEmpty()) {
			Set<String> keySet = headerMap.keySet();
			for (String key : keySet) {
				httpGet.addHeader(key, headerMap.get(key));
			}
		}

		String result = "";

		HttpResponse response = client.execute(httpGet); // 发出get请求
		StatusLine status = response.getStatusLine(); // 获取返回的状态码
		HttpEntity entity = response.getEntity(); // 获取返回的响应内容
		if (status.getStatusCode() == HttpStatus.SC_OK) { // 200
			result = EntityUtils.toString(entity, ENCODING);
		}

		httpGet.abort();// 中止请求，连接被释放回连接池
		return result;
	}

	/**
	 * post请求
	 * 
	 * @param url
	 *            //请求URL
	 * @param paramMap
	 *            //请求参数
	 * @param headerMap
	 *            //请求头信息
	 */
	public static String post(String url, Map<String, String> paramMap, Map<String, String> headerMap) throws ClientProtocolException, IOException {
		HttpPost httpPost = new HttpPost(url);
		/*
		 * 处理参数
		 */
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		if (paramMap != null && !paramMap.isEmpty()) {
			Set<String> keySet = paramMap.keySet();
			for (String key : keySet) {
				params.add(new BasicNameValuePair(key, paramMap.get(key)));
			}
		}

		/*
		 * 设置头信息
		 */
		if (headerMap != null && !headerMap.isEmpty()) {
			Set<String> keySet = headerMap.keySet();
			for (String key : keySet) {
				httpPost.addHeader(key, headerMap.get(key));
			}
		}

		String result = "";

		httpPost.setEntity(new UrlEncodedFormEntity(params, ENCODING));// 设置参数
		HttpResponse response = client.execute(httpPost); // 发出post请求
		StatusLine status = response.getStatusLine(); // 获取返回的状态码
		HttpEntity entity = response.getEntity(); // 获取响应内容
		if (status.getStatusCode() == HttpStatus.SC_OK) {
			result = EntityUtils.toString(entity, ENCODING);
		}

		httpPost.abort();// 中止请求，连接被释放回连接池
		return result;
	}

	/**
	 * 测试
	 */
	public static void main(String[] args) {
		try {
			System.out.println(HttpClientUtil.get("https://www.baidu.com/", null, null));
			// System.out.println(HttpClientUtil.post("http://www.cppblog.com/iuranus/archive/2010/07/04/119311.html",
			// null, null));
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

/**
 * 文件操作工具类
 */
class FileUtil {

	/**
	 * 加载属性文件*.properties
	 * 
	 * @param fileName
	 *            不是属性全路径名称，而是相对于类路径的名称
	 */
	public static Properties loadProps(String fileName) {
		Properties props = null;
		InputStream is = null;

		try {
			is = Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName);// 获取类路径下的fileName文件，并且转化为输入流
			if (is != null) {
				props = new Properties();
				props.load(is); // 加载属性文件
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return props;
	}

	/*
	 * 这里只是列出了从属性文件中获取int型数据的方法，获取其他类型的方法相似
	 */
	public static int getInt(Properties props, String key, int defaultValue) {
		int value = defaultValue;

		if (props.containsKey(key)) { // 属性文件中是否包含给定键值
			value = NumberUtils.toInt(props.getProperty(key), defaultValue);// 从属性文件中取出给定键值的value,并且转换为int型
		}

		return value;
	}

	/**
	 * 测试
	 */
	public static void main(String[] args) {
		Properties props = FileUtil.loadProps("http.properties");
		System.out.println(FileUtil.getInt(props, "httpclient.max.conn.per.route", 10));// 属性文件中有这个key
		System.out.println(FileUtil.getInt(props, "httpclient.max.conn.per.route2", 10));// 属性文件中没有这个key
	}
}

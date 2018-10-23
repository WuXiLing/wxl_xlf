package com.wxl.modules.sys.log.presistence.entity;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;
import com.wxl.common.utils.StringUtils;

/**
 * 日志Entity
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:33:31
 */
public class Log extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	private String type; // 日志类型（1：接入日志；2：错误日志）

	private String title; // 日志标题

	private String remoteAddr; // 操作用户的IP地址

	private String requestUri; // 操作的URI

	private String method; // 操作的方式

	private String param; // 操作提交的数据

	private String userAgent; // 操作用户代理信息

	private String exception; // 异常信息

	private Date beginDate; // 开始日期

	private Date endDate; // 结束日期

	private String remoteArea; // 操作地区

	private String opreatUser;

	// 日志类型（1：接入日志；2：错误日志）
	public static final String TYPE_ACCESS = "1";

	public static final String TYPE_EXCEPTION = "2";

	public Log() {

		super();
	}

	/** 执行时长 */
	private long timeDuration;

	/** 浏览器 */
	private String browser;

	/** 浏览器版本 */
	private String browserVersion;

	/** 访问终端 */
	private String terminal;

	/** 终端型号 */
	private String terminalType;

	/** 请求方式 */
	private String requestMode;
	
	//类
	private String className;
	
	//方法签名
	private String methodSign;
	
	//方法参数
	private String methodParams;

	public String getType() {

		return type;
	}

	public void setType(String type) {

		this.type = type;
	}

	public String getTitle() {

		return title;
	}

	public void setTitle(String title) {

		this.title = title;
	}

	public String getRemoteAddr() {

		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {

		this.remoteAddr = remoteAddr;
	}

	public String getUserAgent() {

		return userAgent;
	}

	public void setUserAgent(String userAgent) {

		this.userAgent = userAgent;
	}

	public String getRequestUri() {

		return requestUri;
	}

	public void setRequestUri(String requestUri) {

		this.requestUri = requestUri;
	}

	public String getMethod() {

		return method;
	}

	public void setMethod(String method) {

		this.method = method;
	}

	public String getParam() {

		return param;
	}

	public void setParam(String param) {

		this.param = param;
	}

	public String getException() {

		return exception;
	}

	public void setException(String exception) {

		this.exception = exception;
	}

	public Date getBeginDate() {

		return beginDate;
	}

	public void setBeginDate(Date beginDate) {

		this.beginDate = beginDate;
	}

	public Date getEndDate() {

		return endDate;
	}

	public void setEndDate(Date endDate) {

		this.endDate = endDate;
	}

	public String getRemoteArea() {

		return remoteArea;
	}

	public void setRemoteArea(String remoteArea) {

		this.remoteArea = remoteArea;
	}

	public String getOpreatUser() {

		return opreatUser;
	}

	public void setOpreatUser(String opreatUser) {

		this.opreatUser = opreatUser;
	}

//	public void setCreateBy(User createBy) {
//        super.setCreateBy(createBy);
//		if (createBy != null) {
//			this.setOpreatCompany(createBy.getCompany() != null?createBy.getCompany().getName(): "");
//			this.setOpreatDep(createBy.getOffice() != null?createBy.getOffice().getName(): "");
//			this.setOpreatUser(createBy.getName());
//		}
////		this.createBy = createBy;
//	}

	/**
	 * 设置请求参数
	 * 
	 * @param paramMap
	 */
	@SuppressWarnings({"unchecked", "rawtypes"})
	public void setParams(Map paramMap) {

		if (paramMap == null) {
			return;
		}
		StringBuilder params = new StringBuilder();
		for (Map.Entry<String, String[]> param : ((Map<String, String[]>) paramMap).entrySet()) {
			params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
			String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
			params.append(StringUtils.abbr(StringUtils.endsWithIgnoreCase(param.getKey(), "password") ? "" : paramValue, 100));
		}
		this.param = params.toString();
	}

	public long getTimeDuration() {
		return timeDuration;
	}

	public void setTimeDuration(long timeDuration) {
		this.timeDuration = timeDuration;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getBrowserVersion() {
		return browserVersion;
	}

	public void setBrowserVersion(String browserVersion) {
		this.browserVersion = browserVersion;
	}

	public String getTerminal() {
		return terminal;
	}

	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}

	public String getTerminalType() {
		return terminalType;
	}

	public void setTerminalType(String terminalType) {
		this.terminalType = terminalType;
	}

	public String getRequestMode() {
		return requestMode;
	}

	public void setRequestMode(String requestMode) {
		this.requestMode = requestMode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodSign() {
		return methodSign;
	}

	public void setMethodSign(String methodSign) {
		this.methodSign = methodSign;
	}

	public String getMethodParams() {
		return methodParams;
	}

	public void setMethodParams(String methodParams) {
		this.methodParams = methodParams;
	}

	@Override
	public String toString() {

		return ReflectionToStringBuilder.toString(this);
	}
}
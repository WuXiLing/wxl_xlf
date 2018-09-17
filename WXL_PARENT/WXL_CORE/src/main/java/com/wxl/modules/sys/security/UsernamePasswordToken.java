package com.wxl.modules.sys.security;

/**
 * 用户和密码（包含验证码）令牌类
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月29日 上午9:31:07
 */
public class UsernamePasswordToken extends org.apache.shiro.authc.UsernamePasswordToken {

	private static final long serialVersionUID = 1L;

	/** 验证码 */
	private String captcha;

	/** 是否移动端 */
	private boolean mobileLogin;

	public UsernamePasswordToken() {
		super();
	}

	public UsernamePasswordToken(String username, char[] password, boolean rememberMe, String host, String captcha,
			boolean mobileLogin) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
		this.mobileLogin = mobileLogin;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public boolean isMobileLogin() {
		return mobileLogin;
	}

}
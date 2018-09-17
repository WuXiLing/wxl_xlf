package com.wxl.modules.sys.user.presistence.entity;

import java.util.Date;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 登录历史
 *
 * @author wxl
 * @date 2018年1月4日 下午7:42:17
 */
public class LoginHistory extends SingleTableEntity {

	private static final long serialVersionUID = -264526707233640747L;

	private User user;

	private String loginIp; // 登陆IP

	private Date loginDate; // 登陆时间

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the loginIp
	 */
	public String getLoginIp() {
		return loginIp;
	}

	/**
	 * @param loginIp
	 *            the loginIp to set
	 */
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	/**
	 * @return the loginDate
	 */
	public Date getLoginDate() {
		return loginDate;
	}

	/**
	 * @param loginDate
	 *            the loginDate to set
	 */
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "LoginHistory [user=" + (user != null ? user.getLoginName() : "") + ", loginIp=" + loginIp
				+ ", loginDate=" + loginDate + "]";
	}
}

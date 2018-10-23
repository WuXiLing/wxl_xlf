package com.wxl.modules.sys.log.presistence.entity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 日志Entity
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:33:31
 */
public class LogTitle extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	private String title; // 日志标题

	private String uri; // 操作的URI

	public LogTitle() {

		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	@Override
	public String toString() {

		return ReflectionToStringBuilder.toString(this);
	}
}
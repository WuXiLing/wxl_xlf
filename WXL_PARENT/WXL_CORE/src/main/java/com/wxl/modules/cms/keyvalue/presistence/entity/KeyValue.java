package com.wxl.modules.cms.keyvalue.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 文章Entity
 * 
 * 
 * @author wxl
 * 
 */
public class KeyValue extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	/** 标题 */
	private String keyword;

	/** 栏目 */
	private String kevalue;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getKevalue() {
		return kevalue;
	}

	public void setKevalue(String kevalue) {
		this.kevalue = kevalue;
	}


}
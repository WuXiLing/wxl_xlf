package com.wxl.modules.sys.dict.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 字典类型
 * 
 */
public class DictType extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	/** 名称 */
	private String name;

	/** 编码 */
	private String code;

	/** 排序 */
	private Integer sort;

	public DictType() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
}
package com.wxl.modules.sys.dict.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 字典条目
 * 
 * @author Liang
 *
 */
public class DictItem extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	//字典类型ID
	private String dictTypeId;
	
	/** 名称 */
	private String name;

	/** 排序 */
	private Integer sort;

	public DictItem() {
		super();
	}
	
	public String getDictTypeId() {
		return dictTypeId;
	}

	public void setDictTypeId(String dictTypeId) {
		this.dictTypeId = dictTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
}
package com.wxl.modules.sys.office.presistence.entity;

import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

/**
 * 机构Entity
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午1:55:47
 */
public class Office extends TreeTableEntity<Office> {

	private static final long serialVersionUID = 1L;

	/** 机构类型（1：公司；2：部门；3：小组） */
	private String type;

	/** 机构等级（1：一级；2：二级；3：三级；4：四级） */
	private String grade;

	/** 联系地址 */
	private String address;

	/** 邮政编码 */
	private String zipCode;

	/**简称*/
	private String abbreviation;

	public Office() {
		super();
		this.type = "2";
	}


	public void setParentId(String parentId) {
		if (this.parent == null) {
			this.parent = new Office();
		}
		this.parent.setId(parentId);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Override
	public Office initParent() {
		return new Office();
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}
}
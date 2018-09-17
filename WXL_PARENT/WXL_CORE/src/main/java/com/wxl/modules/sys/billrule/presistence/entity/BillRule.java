package com.wxl.modules.sys.billrule.presistence.entity;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 生成单据编号Entity
 *
 * @author wxl
 * @date 2018年1月27日 下午12:14:31
 * @version 1.0
 * @since JDK 1.8
 */
public class BillRule extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	// 最大值
	private Integer maxValue;

	// 类名
	private String className;

	// 前缀
	private String prefix;

	// 年月
	private String yearMonth;

	private String allFormate;

	public Integer getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(Integer maxValue) {
		this.maxValue = maxValue;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public String getAllFormate() {
		return allFormate;
	}

	public void setAllFormate(String allFormate) {
		this.allFormate = allFormate;
	}
}

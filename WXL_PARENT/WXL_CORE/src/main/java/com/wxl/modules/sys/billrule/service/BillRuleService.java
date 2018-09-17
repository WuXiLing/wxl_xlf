package com.wxl.modules.sys.billrule.service;

import java.util.List;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.billrule.presistence.entity.BillRule;

/**
 * 生成单据编号Service
 *
 * @author wxl
 * @date 2018年1月27日 下午12:14:31
 * @version 1.0
 * @since JDK 1.8
 */
public interface BillRuleService extends SingleTableService<BillRule> {

	// 获取单据编号
	public List<BillRule> findCode(BillRule billRule);

	// 生成单据编号
	public String gengerCode(BillRule billRule);
}

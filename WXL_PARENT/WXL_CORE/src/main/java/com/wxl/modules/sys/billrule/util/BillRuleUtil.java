package com.wxl.modules.sys.billrule.util;

import java.util.Calendar;

import com.wxl.common.utils.SpringContextHolder;
import com.wxl.modules.sys.billrule.presistence.entity.BillRule;
import com.wxl.modules.sys.billrule.service.BillRuleService;

public class BillRuleUtil {

	private String billNo;
	
	private static BillRuleService billRuleService = SpringContextHolder.getBean(BillRuleService.class);
	
	private BillRuleUtil(){
		
	}
	
	private BillRuleUtil(Class<?> obj){
		BillNoPrefix billNoPrefix = obj.getAnnotation(BillNoPrefix.class);
		if(billNoPrefix != null){
			BillRule billRule = new BillRule();
			billRule.setClassName(obj.getName());
			Calendar ca = Calendar.getInstance();
			ca.get(Calendar.YEAR);
			int month = ca.get(Calendar.MONTH) + 1;
			billRule.setYearMonth(ca.get(Calendar.YEAR) + (month < 10 ? "0" + month : "" + month));
			billRule.setPrefix(billNoPrefix.value());
			billNo = billRuleService.gengerCode(billRule);
		} else {
			throw new BillNoException("实体类没有加BillNoPrefix注解");
		}
	}
	
	public static BillRuleUtil getInstance(Class<?> obj){
		return new BillRuleUtil(obj);
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public static BillRuleService getBillRuleService() {
		return billRuleService;
	}

	public static void setBillRuleService(BillRuleService billRuleService) {
		BillRuleUtil.billRuleService = billRuleService;
	}
}

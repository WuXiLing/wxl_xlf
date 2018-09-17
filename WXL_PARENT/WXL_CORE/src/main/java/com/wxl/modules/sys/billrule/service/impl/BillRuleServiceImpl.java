package com.wxl.modules.sys.billrule.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.billrule.presistence.entity.BillRule;
import com.wxl.modules.sys.billrule.presistence.mapper.BillRuleMapper;
import com.wxl.modules.sys.billrule.service.BillRuleService;

/**
 * 生成单据编号Service
 *
 * @author wxl
 * @date 2018年1月27日 下午12:14:31
 * @version 1.0
 * @since JDK 1.8
 */
@Service
@Transactional(readOnly = false)
//@CacheConfig(cacheNames = "sys_billrule")
public class BillRuleServiceImpl extends SingleTableServiceImpl<BillRule,BillRuleMapper> implements BillRuleService{

	//获取单据编号
	public List<BillRule> findCode(BillRule billRule){
		return mapper.findCode(billRule);
	}
	
	//生成单据编号
	public String gengerCode(BillRule billRule){
		List<BillRule> list = findCode(billRule);
		if(list != null && list.size() > 0){
			BillRule a = list.get(0);
			int max = a.getMaxValue();
			String maxVlaue ="";
			if(max >= 0 && max < 10){
				maxVlaue = "000" + (max + 1);
			} else if(max > 9 && max < 99){
				maxVlaue = "00" + (max + 1);
			} else if(max > 98 && max < 999){
				maxVlaue = "0" + (max + 1);
			} else if(max > 998 && max < 9999){
				maxVlaue = "" + (max + 1);
			}
			a.setMaxValue(max + 1);
			a.setYearMonth("[" + billRule.getYearMonth()  + "]");
			a.getAllFormate();
			update(a);
			return  a.getAllFormate() +  maxVlaue;
		} else {
			billRule.setAllFormate(billRule.getPrefix() + "." + "[" +  billRule.getYearMonth() + "]");
			billRule.setMaxValue(1);
			insert(billRule);
			return billRule.getAllFormate() + "0001";
		}
	}
}

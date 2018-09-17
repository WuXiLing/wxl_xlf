package com.wxl.modules.sys.billrule.presistence.mapper;

import java.util.List;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.billrule.presistence.entity.BillRule;

/**
 * 生成单据编号Mapper
 *
 * @author wxl
 * @date 2018年1月27日 下午12:14:31
 * @version 1.0
 * @since JDK 1.8
 */
@MyBatisDao
public interface BillRuleMapper extends SingleTableMapper<BillRule> {

	List<BillRule> findCode(BillRule billRule);
	
}

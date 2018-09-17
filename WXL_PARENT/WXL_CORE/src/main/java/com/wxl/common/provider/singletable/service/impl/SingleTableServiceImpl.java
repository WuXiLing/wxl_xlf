package com.wxl.common.provider.singletable.service.impl;

import java.util.List;
import java.util.Map;

import com.wxl.common.provider.base.service.impl.BaseServiceImpl;
import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.common.provider.singletable.service.SingleTableService;

/**
 * 单表基类
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public class SingleTableServiceImpl<T extends SingleTableEntity, D extends SingleTableMapper<T>>
		extends BaseServiceImpl<T, D> implements SingleTableService<T> {

	/**
	 * 验证唯一性
	 * 
	 * @param params
	 * @return true：唯一；false：不唯一
	 */
	@Override
	public boolean checkUnique(Map<String, Object> params) {
		List<T> list = mapper.checkUnique(params);
		if (list != null && !list.isEmpty()) {
			return false;
		}
		return true;
	}
}

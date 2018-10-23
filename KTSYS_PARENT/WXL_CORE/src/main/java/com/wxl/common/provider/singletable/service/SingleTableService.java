package com.wxl.common.provider.singletable.service;

import java.util.Map;

import com.wxl.common.provider.base.service.BaseService;
import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 单表基类
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public interface SingleTableService<T extends SingleTableEntity> extends BaseService<T> {

	/**
	 * 验证唯一性
	 * 
	 * @param params
	 * @return true：唯一；false：不唯一
	 */
	boolean checkUnique(Map<String, Object> params);
}

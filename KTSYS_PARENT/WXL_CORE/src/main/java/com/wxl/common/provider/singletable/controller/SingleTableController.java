package com.wxl.common.provider.singletable.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.base.controller.BaseController;
import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;
import com.wxl.common.provider.singletable.service.SingleTableService;

/**
 * 单表控制器基类
 * 
 * @param <T>
 * @param <S>
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public abstract class SingleTableController<T extends SingleTableEntity, S extends SingleTableService<T>> extends BaseController<T,S> {

	@RequestMapping(value = DO_CHECK_UNIQUE)
	@ResponseBody
	public Map<String, Object> checkUnique(Map<String,Object> params) {
		this.logger.debug("{} execute checkUnique start...");
		params.put(MSG_FLAG, this.service.checkUnique(params));
		this.logger.debug("{} execute checkUnique end...");
		return params;
	}
}
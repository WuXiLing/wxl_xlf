package com.wxl.modules.sys.log.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.log.presistence.entity.LogTitle;
import com.wxl.modules.sys.log.service.LogTitleService;

/**
 * 日志Controller
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:37:49
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log/title")
public class LogTitleController extends SingleTableController<LogTitle, LogTitleService> {

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/log/title";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected LogTitle instance() {
		return new LogTitle();
	}
}

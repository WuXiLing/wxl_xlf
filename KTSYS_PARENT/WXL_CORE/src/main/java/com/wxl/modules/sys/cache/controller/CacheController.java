package com.wxl.modules.sys.cache.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.cache.RedisCacheUtil;
import com.wxl.common.provider.base.controller.ProviderController;

/**
 * 缓存controoler
 * 
 * @author Liang
 *
 */
@Controller
@RequestMapping(value = { "${adminPath}/sys/cache" })
public class CacheController extends ProviderController {

	@Autowired
	RedisCacheUtil redisCacheUtil;

	// 执行操作
	@RequestMapping({ "flushall" })
	@ResponseBody
	public Map<String, Object> exec(HttpServletRequest request) {

		this.logger.debug("{} execute flushall start...");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DO_SUCCESS);
		this.logger.debug("{} execute exec end...");
		return map;
	}

	@Override
	protected String viewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}

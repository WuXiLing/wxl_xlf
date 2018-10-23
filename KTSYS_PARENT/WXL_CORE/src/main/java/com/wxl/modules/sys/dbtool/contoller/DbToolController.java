package com.wxl.modules.sys.dbtool.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.dbtool.presistence.entity.DbTool;
import com.wxl.modules.sys.dbtool.service.DbToolService;

/**
 * 操作数据库
 * 
 * @author Liang
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dbtool")
public class DbToolController extends SingleTableController<DbTool, DbToolService> {

	// 执行操作
	@RequestMapping({ "exec" })
	@ResponseBody
	public Map<String, Object> exec(HttpServletRequest request) {
		
		String sql = request.getParameter("sql");
		
		this.logger.debug("{} exec sql start...");
		this.logger.debug("{} exec sql：" + sql);
		service.exec(sql);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DO_SUCCESS);
		this.logger.debug("{} exec sql end...");
		return map;
	}

	// 查询操作
	@RequestMapping({ "query" })
	@ResponseBody
	public Map<String, Object> query(HttpServletRequest request) {
		String sql = request.getParameter("sql");
		this.logger.debug("{} query sql start...");
		this.logger.debug("{} query sql：" + sql);
		List<Map<String, Object>> list = service.query(sql);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DO_SUCCESS);
		map.put("data", list);
		this.logger.debug("{} query sql end...");
		return map;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/dbtool";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected DbTool instance() {
		return new DbTool();
	}
}

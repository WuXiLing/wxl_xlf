package com.wxl.modules.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/*@Controller
@RequestMapping(value = "${adminPath}/rest/api")*/
public class RestApiController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/list")
	public String first() {
		return "modules/rest/api/list";
	}

	@RequestMapping(value = "/initMonitorApi", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> initMonitorApi(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(request.getParameter("swagger"));
		map.put("msg", "ok");
		return map;
	}
}

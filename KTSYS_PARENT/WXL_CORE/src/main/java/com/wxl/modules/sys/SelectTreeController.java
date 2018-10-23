package com.wxl.modules.sys;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 选择树控制器
 * 
 * @author wxl
 * 
 * @date 2017年6月29日 下午4:06:18
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/select/tree")
public class SelectTreeController {

	@RequestMapping(value = { "to" })
	public String toTree(Model model, HttpServletRequest request) {
		model.addAttribute("type", request.getParameter("type"));
		model.addAttribute("id", request.getParameter("id"));
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("multiple", request.getParameter("multiple"));
		model.addAttribute("url", request.getParameter("url"));
		return "modules/sys/component/selectTree";
	}
	
	@RequestMapping(value = { "toUserTree" })
	public String toUserTree(Model model, HttpServletRequest request) {
		model.addAttribute("type", request.getParameter("type"));
		model.addAttribute("id", request.getParameter("id"));
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("multiple", request.getParameter("multiple"));
		model.addAttribute("url", request.getParameter("url"));
		return "modules/sys/component/userTree";
	}
	
	@RequestMapping(value = { "toIconSelect" })
	public String toIconSelect(Model model, HttpServletRequest request) {
		model.addAttribute("id", request.getParameter("id"));
		model.addAttribute("multiple", request.getParameter("multiple"));
		return "modules/sys/component/iconSelect";
	}
}

package com.wxl.modules.act.model.controoler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.act.model.presistence.entity.ActivitiModeler;
import com.wxl.modules.act.model.service.ActivitiModelerService;

@Controller
@RequestMapping("${adminPath}/act/modeler")
public class ActivitiModelerController extends SingleTableController<ActivitiModeler, ActivitiModelerService> {

	@RequestMapping({ "deploy/{id}" })
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String id) {

		this.logger.debug("{} execute deploy start...");
		service.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, service.deploy(id));
		this.logger.debug("{} execute deploy end...");
		return map;
	}
	
	@RequestMapping(value = { "design/{id}" })
	public String design(@PathVariable String id, Model model) {

		this.logger.debug("{} execute design start...");
		model.addAttribute("modelId", id);
		this.logger.debug("{} execute design end...");
		return VIEW_MODULE + viewPath() + "modeler";
	}

	@Override
	protected ActivitiModeler instance() {
		return new ActivitiModeler();
	}

	@Override
	protected String viewPath() {
		return "act/modeler";
	}
}
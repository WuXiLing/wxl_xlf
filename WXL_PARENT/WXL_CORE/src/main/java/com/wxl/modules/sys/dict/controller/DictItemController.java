package com.wxl.modules.sys.dict.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.dict.presistence.entity.DictItem;
import com.wxl.modules.sys.dict.service.DictItemService;

/**
 * 字典Controller
 * 
 * @author 梁小锋
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dictitem")
public class DictItemController extends SingleTableController<DictItem, DictItemService> {

	protected void addAfter(DictItem entity, HttpServletRequest request, Model model) {

		entity.setDictTypeId(request.getParameter("dictTypeId"));
		super.addAfter(entity, request, model);
	};

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/dict/item";
	}

	@Override
	protected DictItem instance() {
		return new DictItem();
	};

}

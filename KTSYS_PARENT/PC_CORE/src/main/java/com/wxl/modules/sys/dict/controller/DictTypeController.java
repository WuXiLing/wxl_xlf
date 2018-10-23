package com.wxl.modules.sys.dict.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.dict.presistence.entity.DictType;
import com.wxl.modules.sys.dict.service.DictTypeService;

/**
 * 字典Controller
 * 
 * @author 梁小锋
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dicttype")
public class DictTypeController extends SingleTableController<DictType,DictTypeService> {

	/* （非 Javadoc）
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/dict/type";
	}

	@Override
	protected DictType instance() {
		return new DictType();
	};
	
	@RequestMapping(value= {"check"})
	@ResponseBody
	public boolean check(HttpServletRequest requet) {
		return service.checkUnique(requet.getParameterMap());
	}
}

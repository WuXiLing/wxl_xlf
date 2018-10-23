package com.wxl.modules.cms.guestbook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.cms.columns.service.ColumnsServiceI;
import com.wxl.modules.cms.guestbook.presistence.entity.GuestBook;
import com.wxl.modules.cms.guestbook.service.GuestBookService;

/**
 * 文章Controller
 * 
 * @author wxl
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/guestbook")
public class GuestBookController extends SingleTableController<GuestBook, GuestBookService> {

	@Autowired
	ColumnsServiceI columnsServiceI;
	
	protected void addBefore(HttpServletRequest request, Model model) {

		//model.addAttribute(columnsServiceI.get(request.getParameter("columnsId")));
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {

		return "cms/guestbook";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected GuestBook instance() {

		return new GuestBook();
	}
}

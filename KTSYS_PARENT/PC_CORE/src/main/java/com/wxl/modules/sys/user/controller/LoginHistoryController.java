package com.wxl.modules.sys.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.user.presistence.entity.LoginHistory;
import com.wxl.modules.sys.user.service.LoginHistoryService;

/**
 * 用户Controller
 * 
 * @author liangxf
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/loginhistory")
public class LoginHistoryController extends SingleTableController<LoginHistory, LoginHistoryService> {

	protected void listBefore(HttpServletRequest request, Model model) {
		model.addAttribute("userId", request.getParameter("id"));
	};
	
	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {

		return "sys/user/loginHistory";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected LoginHistory instance() {

		return new LoginHistory();
	}
}

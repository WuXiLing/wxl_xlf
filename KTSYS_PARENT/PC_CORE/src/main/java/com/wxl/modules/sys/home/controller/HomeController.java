package com.wxl.modules.sys.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.home.presistence.entity.Home;
import com.wxl.modules.sys.home.service.HomeService;

@Controller
@RequestMapping(value = "${adminPath}/sys/home")
public class HomeController extends SingleTableController<Home, HomeService> {

	@Override
	protected Home instance() {
		return new Home();
	}

	@Override
	protected String viewPath() {
		return "sys/home";
	}
}

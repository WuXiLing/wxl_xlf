package com.wxl.modules.sys.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value={"${adminPath}/system/baidu/ueditor","${frontPath}/system/baidu/ueditor"})
public class UeditorAction {

	@RequestMapping(value = { "list", "" })
	public String list() {
		return "modules/ueditor/controller";
	}
}

package com.wxl.modules.doc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "${adminPath}/doc")
public class DocController {

	@RequestMapping(value = {"java" })
	public String toJava() {
		return "modules/doc/java";
	}
	
	@RequestMapping(value = {"js" })
	public String toJs() {
		return "modules/doc/js";
	}
	
	@RequestMapping(value = {"sql" })
	public String toSql() {
		return "modules/doc/sql";
	}
	
	@RequestMapping(value = {"scala" })
	public String toScala() {
		return "modules/doc/scala";
	}
	
	@RequestMapping(value = {"css" })
	public String toCss() {
		return "modules/doc/css";
	}
	
	@RequestMapping(value = {"other" })
	public String toOther() {
		return "modules/doc/other";
	}
}

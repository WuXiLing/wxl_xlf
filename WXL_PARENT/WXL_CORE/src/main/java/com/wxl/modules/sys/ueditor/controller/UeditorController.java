package com.wxl.modules.sys.ueditor.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.ueditor.ActionEnter;

/**
 * 百度富文本上传文件
 * 
 * @author Liang
 *
 */
@Controller
@RequestMapping(value = {"/sys/ueditor"})
public class UeditorController {

	/**
	 * 百度富文本编辑器：图片上传
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/upload")
	public void imgUploadByUeditor(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type", "text/html");
		ServletContext application = request.getSession().getServletContext();
//		String rootPath = request.getContextPath();
		String rootPath = application.getRealPath("/");
		PrintWriter out = response.getWriter();
		out.write(new ActionEnter(request, rootPath).exec());
	}
}

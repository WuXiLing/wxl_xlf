package com.wxl.modules.sys.storge.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.wxl.common.config.Global;
import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;
import com.wxl.modules.sys.storge.service.StorgeEntityService;

/**
 * 文件存储
 * 
 * @author wxl
 *
 */
@Controller
@RequestMapping(value = { "${adminPath}/sys/storge","${frontPath}/sys/storge" })
public class StorgeEntityAction extends SingleTableController<StorgeEntity, StorgeEntityService> {

	/**
	 * 上传页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "toUpload" })
	public String toUpload(Model model) {
		// model.addAttribute("list", service.findList(new StorgeEntity()));
		return "modules/sys/storge/upload";
	}

	/**
	 * 上传功能
	 * 
	 * @param sys
	 *            系统名称
	 * @param type
	 *            类型
	 * @param request
	 * @param response
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/upload/{sys}/{type}")
	@ResponseBody
	public Map<String, Object> upload(@PathVariable String sys, @PathVariable String type, HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {

		Map<String, Object> rMap = new HashMap<String, Object>();
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			List<StorgeEntity> resultIds = service.multiUpload(multiRequest.getFileMap(), sys, type);
			if (resultIds != null && !resultIds.isEmpty()) {
				rMap.put("ids", resultIds);
				rMap.put(MSG_FLAG, DO_SUCCESS);
			} else {
				rMap.put(MSG_FLAG, DO_ERROR);
			}

		}
		return rMap;
	}

	/**
	 * 下载前判断文件是否存在
	 * 
	 * @param sys
	 *            系统ID
	 * @param type
	 *            附件类型
	 * @param id
	 *            业务ID
	 * @return 1：成功；2：失败
	 */
	@RequestMapping("/checkexist/{sys}/{type}/{id}")
	@ResponseBody
	public String checkexist(@PathVariable String sys, @PathVariable String type, @PathVariable String id) {
		StorgeEntity entity = service.get(id);

		File file = new File(Global.getConfig("userfiles.basedir") + entity.getFilePhysicalPath());
		if (file.exists() && file.isFile()) {
			return "1";
		}
		return "2";

	}

	/**
	 * 下载
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/download/{sys}/{type}/{id}")
	public String download(@PathVariable String sys, @PathVariable String type, @PathVariable String id, HttpServletResponse response) throws UnsupportedEncodingException {
		StorgeEntity entity = service.get(id);

		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.addHeader("Content-Disposition", "attachment;filename=" + new String(entity.getPhysicalName().getBytes("gbk"), "iso-8859-1")); // 转码之后下载的文件不会出现中文乱码
		response.addHeader("Content-Length", "" + entity.getFileSize());

		try {

			InputStream inputStream = new FileInputStream(new File(Global.getCurrentFilePath(Global.getFilePath() + entity.getFilePhysicalPath())));
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[2048];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			// 这里主要关闭。
			os.close();

			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 返回值要注意，要不然就出现下面这句错误！
		// java+getOutputStream() has already been called for this response
		return null;
	}

	// 显示图片
	@RequestMapping(value = "/showImage/{sys}/{type}/{id}")
	public String showImage(@PathVariable String sys, @PathVariable String type, @PathVariable String id, HttpServletResponse response) throws Exception {
		OutputStream out = null;
		try {
			StorgeEntity entity = service.get(id);
			
			InputStream inputStream = new FileInputStream(new File(Global.getCurrentFilePath(Global.getFilePath() + entity.getFilePhysicalPath())));
			response.setContentType("multipart/form-data;charset=utf8");
			out = response.getOutputStream();
			byte[] b = new byte[1024];
			int len = -1;
			while ((len = inputStream.read(b, 0, 1024)) != -1) {
				out.write(b, 0, len);
			}
			out.flush();
			inputStream.close();
		} catch (IOException e) {
			if (out != null) {
				out.close();
			}
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping({ "/delete/{sys}/{type}/{id}" })
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String sys, @PathVariable String type, @PathVariable String id) {
		this.service.delete(sys, type, id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "del_ok");
		return map;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected StorgeEntity instance() {
		return new StorgeEntity();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.wxl.common.provider.base.controller.ProviderController#viewPath()
	 */
	@Override
	protected String viewPath() {
		// TODO Auto-generated method stub
		return "modules/sys/storge";
	}
}

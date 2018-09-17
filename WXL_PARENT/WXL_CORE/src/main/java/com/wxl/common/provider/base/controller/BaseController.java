package com.wxl.common.provider.base.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wxl.common.provider.base.presistence.entity.BaseEntity;
import com.wxl.common.provider.base.service.BaseService;
import com.wxl.common.provider.utils.BootgridPage;
import com.wxl.common.provider.utils.JqgridPage;
import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.common.utils.DateUtils;
import com.wxl.common.utils.excel.ExportExcel;
import com.wxl.common.utils.excel.ImportExcel;

/**
 * 控制器基类
 * 
 * @param <T>
 * @param <S>
 * @author wxl
 * 
 * @date 2017年6月29日 上午9:29:51
 */
public abstract class BaseController<T extends BaseEntity, S extends BaseService<T>> extends ProviderController {

	/** 业务Service */
	@Autowired
	protected S service;

	/**
	 * 跳转到列表页面
	 * 
	 * @param request
	 *            request请求
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { DO_LIST, "" })
	public String list(HttpServletRequest request, Model model) {

		listBefore(request, model);
		return VIEW_MODULE + viewPath() + VIEW_LIST;
	}

	/**
	 * 跳转之前处理
	 * 
	 * @param model
	 * @param request
	 *            request请求信息
	 */
	protected void listBefore(HttpServletRequest request, Model model) {

	};

	/**
	 * 获取分页数据
	 * 
	 * @param page
	 *            分页信息
	 * @param params
	 *            参数
	 * @return
	 */
	@RequestMapping(value = DO_SELECTPAGELIST)
	@ResponseBody
	public Map<String, Object> selectPageList(BootgridPage page) {

		this.logger.debug("{} execute selectPageList start...", page.getCurrent());
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectPageList(page);
		map.put("rows", page.getResults());
		map.put("current", page.getCurrent());
		map.put("rowCount", page.getRowCount());
		map.put("total", page.getTotalRecord());
		this.logger.debug("{} execute selectPageList end...", page.getTotal());
		return map;
	}

	/**
	 * 获取分页数据
	 * 
	 * @param page
	 *            分页信息
	 * @param params
	 *            参数
	 * @return
	 */
	@RequestMapping(value = DO_SELECTJQGRIDPAGELIST)
	@ResponseBody
	public Map<String, Object> selectJqgridPageList(JqgridPage page) {

		this.logger.debug("{} execute selectJqgridPageList start...", page.getPage());
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectJqgridPageList(page);
		map.put("rows", page.getResults());
		map.put("page", page.getPage());
		map.put("total", (page.getRecords() + page.getRows() - 1) / page.getRows());
		map.put("rowCount", page.getRows());
		map.put("records", page.getRecords());
		this.logger.debug("{} execute selectPageList end...", page.getTotal());
		return map;
	}

	@RequestMapping(value = DO_SELECTLAYUIPAGELIST)
	@ResponseBody
	public Map<String, Object> selectLayuiPageList(LayuiPage page) {

		this.logger.debug("{} execute selectLayuiPageList start...", page.getPage());
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectLayuiPageList(page);
		map.put("data", page.getData());
		map.put("count", page.getCount());
		map.put("code", StringUtils.isNotBlank(page.getCode()) ? page.getCode() : "0");
		map.put("msg", StringUtils.isNotBlank(page.getMsg()) ? page.getMsg() : "");
		this.logger.debug("{} execute selectLayuiPageList end...", page.getCount());
		return map;
	}

	/**
	 * 转到新增页面
	 * 
	 * @param request
	 *            request请求信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { DO_ADD })
	public String add(HttpServletRequest request, Model model) {

		this.logger.debug("{} execute add start...");
		addBefore(request, model);
		T entity = instance();
		addAfter(entity, request, model);
		model.addAttribute(entity);
		this.logger.debug("{} execute add end...");
		return VIEW_MODULE + viewPath() + VIEW_ADD;
	}

	/**
	 * 新增前操作
	 * 
	 * @param request
	 *            request请求信息
	 * @param model
	 */
	protected void addBefore(HttpServletRequest request, Model model) {

		this.logger.debug("{} execute addBefore process...");
	};

	/**
	 * 新增后操作
	 * 
	 * @param request
	 *            request请求信息
	 * @param model
	 */
	protected void addAfter(T entity, HttpServletRequest request, Model model) {

		this.logger.debug("{} execute addAfter process...");
	};

	/**
	 * 转到修改页面
	 * 
	 * @param id
	 *            主键
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { DO_EDIT + "/{id}" })
	public String upd(@PathVariable String id, Model model) {

		this.logger.debug("{} execute upd start...");
		T entity = service.get(id);
		updBefore(entity, model);
		model.addAttribute(entity);
		updAfter(entity, model);
		this.logger.debug("{} execute upd end...");
		return VIEW_MODULE + viewPath() + VIEW_EDIT;
	}

	/**
	 * 修改前操作
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 */
	protected void updBefore(T entity, Model model) {

		this.logger.debug("{} execute updBefore process...");
	};

	/**
	 * 修改后操作
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 */
	protected void updAfter(T entity, Model model) {

		this.logger.debug("{} execute updAfter process...");
	};

	/**
	 * 转到详细页面
	 * 
	 * @param id
	 *            主键
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { DO_DETAIL + "/{id}" })
	public String detail(@PathVariable String id, Model model) {

		this.logger.debug("{} execute detail start...");
		T entity = service.get(id);
		detailBefore(entity, model);
		model.addAttribute(entity);
		detailAfter(entity, model);
		this.logger.debug("{} execute detail end...");
		return VIEW_MODULE + viewPath() + VIEW_DETAIL;
	}

	/**
	 * 详细前操作
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 */
	protected void detailBefore(T entity, Model model) {

		this.logger.debug("{} execute detailBefore process...");
	};

	/**
	 * 详细后操作
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 */
	protected void detailAfter(T entity, Model model) {

		this.logger.debug("{} execute detailAfter process...");
	};

	/**
	 * 保存
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = DO_SAVE)
	public String save(T entity, HttpServletRequest request, RedirectAttributes redirectAttributes) {

		this.logger.debug("{} execute save start...");
		saveBefore(entity, request);
		this.service.save(entity);
		saveAfter(entity, request);
		this.logger.debug("{} execute save end...");
		return "redirect:" + adminPath + "/" + viewPath() + "/";
	}

	/**
	 * 异步保存
	 * 
	 * @param entity
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = DO_AYSNSAVE)
	@ResponseBody
	public Map<String, Object> aysnsave(@RequestBody T entity, HttpServletRequest request) {
		this.logger.debug("{} execute aysnsave start...");
		Map<String, Object> map = new HashMap<>();
		saveBefore(entity, request);
		this.service.save(entity);
		saveAfter(entity, request);
		map.put(MSG_FLAG, SAVE_SUCCESS);
		this.logger.debug("{} execute aysnsave end...");
		return map;
	}

	/**
	 * 保存前操作
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 */
	protected void saveAfter(T entity, HttpServletRequest request) {

		this.logger.debug("{} execute saveAfter process...");
	}

	/**
	 * 保存后操作
	 * 
	 * @param entity
	 *            业务信息
	 * @param model
	 */
	protected void saveBefore(T entity, HttpServletRequest request) {

		this.logger.debug("{} execute saveBefore process...");
	}

	/**
	 * 删除操作
	 * 
	 * @param id
	 *            主键
	 * @return
	 */
	@RequestMapping({ DO_DELETE + "/{id}" })
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String id) {

		this.logger.debug("{} execute delete start...");
		service.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DELETE_SUCCESS);
		this.logger.debug("{} execute delete end...");
		return map;
	}

	/**
	 * 禁用操作
	 * 
	 * @param id
	 *            主键
	 * @return
	 */
	@RequestMapping({ DO_STOP + "/{id}" })
	@ResponseBody
	public Map<String, Object> stop(@PathVariable String id) {

		this.logger.debug("{} execute delete start...");
		service.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DELETE_SUCCESS);
		this.logger.debug("{} execute delete end...");
		return map;
	}

	/**
	 * 启用操作
	 * 
	 * @param id
	 *            主键
	 * @return
	 */
	@RequestMapping({ DO_START + "/{id}" })
	@ResponseBody
	public Map<String, Object> start(@PathVariable String id) {

		this.logger.debug("{} execute delete start...");
		service.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DELETE_SUCCESS);
		this.logger.debug("{} execute delete end...");
		return map;
	}

	/**
	 * 通过操作
	 * 
	 * @param id
	 *            主键
	 * @return
	 */
	@RequestMapping({ DO_PASS + "/{id}" })
	@ResponseBody
	public Map<String, Object> pass(@PathVariable String id) {

		this.logger.debug("{} execute delete start...");
		service.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DELETE_SUCCESS);
		this.logger.debug("{} execute delete end...");
		return map;
	}

	/**
	 * 退回操作
	 * 
	 * @param id
	 *            主键
	 * @return
	 */
	@RequestMapping({ DO_DENIAL + "/{id}" })
	@ResponseBody
	public Map<String, Object> denial(@PathVariable String id) {

		this.logger.debug("{} execute delete start...");
		service.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DELETE_SUCCESS);
		this.logger.debug("{} execute delete end...");
		return map;
	}

	/**
	 * 导出数据
	 * 
	 * @param parms
	 *            参数
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "export")
	public String exportFile(Map<String, Object> parms, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {

		try {
			String fileName = moduleName() + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			new ExportExcel(moduleName(), instance().getClass()).setDataList(service.selectList(parms))
					.write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, moduleName() + "失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/" + viewPath() + "/list";
	}

	/**
	 * 导入数据
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "importInfo", method = RequestMethod.POST)
	public String importInfo(MultipartFile file, RedirectAttributes redirectAttributes) {

		try {
			int successNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel<T> ei = new ImportExcel<T>(file, 1, 0);
			List<T> list = ei.getDataList(instance());
			service.importInfo(list);
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条记录" + failureMsg);
		} catch (Exception e) {
			logger.debug("导入异常", e);
		}
		return "redirect:" + adminPath + "/" + viewPath() + "/list";
	}

	/**
	 * 下载模板
	 * 
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "importInfo/template")
	public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {

		try {
			String fileName = moduleName() + "导入模板.xlsx";
			List<T> list = new ArrayList<>();
			list.add(instance());
			new ExportExcel(moduleName() + "信息", instance().getClass(), 2).setDataList(list).write(response, fileName)
					.dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/" + viewPath() + "/list";
	}

	/**
	 * 实例化
	 * 
	 * @return
	 */
	protected abstract T instance();

	protected String moduleName() {

		return "信息";

	};
}
package com.wxl.common.provider.base.controller;

import java.beans.PropertyEditorSupport;
import java.util.Date;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;

import com.wxl.common.utils.DateUtils;

/**
 * 控制器基类
 * 
 * @author wxl
 *
 */
public abstract class ProviderController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	/** 主页面视图 */
	protected final static String VIEW_LIST = "/list";

	/** 新增视图 */
	protected final static String VIEW_ADD = "/add";

	/** 编辑视图 */
	protected final static String VIEW_EDIT = "/edit";

	/** 详细视图 */
	protected final static String VIEW_DETAIL = "/detail";

	/** 视图相对地址 */
	protected final static String VIEW_MODULE = "modules/";

	/** 主页面操作 */
	protected final static String DO_LIST = "list";

	/** 新增操作 */
	protected final static String DO_ADD = "add";

	/** 修改操作 */
	protected final static String DO_EDIT = "upd";

	/** 修改详细 */
	protected final static String DO_DETAIL = "detail";
	
	/** Bootgrid分页操作 */
	protected final static String DO_SELECTPAGELIST = "selectPageList";

	/** Jqgrid分页操作 */
	protected final static String DO_SELECTJQGRIDPAGELIST = "selectJqgridPageList";

	/** Layui分页操作 */
	protected final static String DO_SELECTLAYUIPAGELIST = "selectLayuiPageList";

	/** 删除操作 */
	protected final static String DO_DELETE = "delete";

	/** 保存操作 */
	protected final static String DO_SAVE = "save";

	/** 异步保存操作 */
	protected final static String DO_AYSNSAVE = "aysnsave";
	
	/** 验证操作 */
	protected final static String DO_VERIFY = "verify";

	/** 通过操作 */
	protected final static String DO_PASS = "pass";

	/** 退回操作 */
	protected final static String DO_DENIAL = "denial";

	/** 启用操作 */
	protected final static String DO_START = "start";

	/** 禁用操作 */
	protected final static String DO_STOP = "stop";

	/** 唯一性验证操作 */
	protected final static String DO_CHECK_UNIQUE = "checkUnique";
	
	/** 新增成功 **/
	protected final static String INSERT_SUCCESS = "insert_ok";

	/** 修改成功 **/
	protected final static String UPDATE_SUCCESS = "update_ok";

	/** 删除成功 **/
	protected final static String DELETE_SUCCESS = "del_ok";

	/** 通过成功 **/
	protected final static String PASS_SUCCESS = "pass_ok";

	/** 退回成功 **/
	protected final static String DENIAL_SUCCESS = "denial_ok";

	/** 启用成功 **/
	protected final static String START_SUCCESS = "start_ok";

	/** 禁用成功 **/
	protected final static String STOP_SUCCESS = "stop_ok";

	/** 导入成功 **/
	protected final static String IMPORT_SUCCESS = "import_ok";

	/** 导出成功 **/
	protected final static String EXPORT_SUCCESS = "export_ok";

	/** 保存成功 **/
	protected final static String SAVE_SUCCESS = "save_ok";

	/** 操作成功 **/
	protected final static String DO_SUCCESS = "do_ok";

	/** 操作失败 */
	protected final static String DO_ERROR = "do_error";

	/** 信息提示操作符 **/
	protected final static String MSG_FLAG = "msg";

	/**
	 * 视图相对路径
	 * 
	 * @return
	 */
	protected abstract String viewPath();

	/**
	 * 管理基础路径
	 */
	@Value("${adminPath}")
	protected String adminPath;

	/**
	 * 前端基础路径
	 */
	@Value("${frontPath}")
	protected String frontPath;

	/**
	 * 前端URL后缀
	 */
	@Value("${urlSuffix}")
	protected String urlSuffix;


	/**
	 * 添加Model消息
	 * 
	 * @param message
	 */
	protected void addMessage(Model model, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages) {
			sb.append(message).append(messages.length > 1 ? "<br/>" : "");
		}
		model.addAttribute("message", sb.toString());
	}

	/**
	 * 授权登录异常
	 */
	@ExceptionHandler({ AuthenticationException.class })
	public String authenticationException() {
		return "error/403";
	}

	/**
	 * 参数绑定异常
	 */
	@ExceptionHandler({ BindException.class })
	public String bindException() {
		return "error/400";
	}

	/**
	 * 初始化数据绑定 1. 将所有传递进来的String进行HTML编码，防止XSS攻击 2. 将字段中Date类型转换为String类型
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}

			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
			// @Override
			// public String getAsText() {
			// Object value = getValue();
			// return value != null ? DateUtils.formatDateTime((Date)value) : "";
			// }
		});
	}
}
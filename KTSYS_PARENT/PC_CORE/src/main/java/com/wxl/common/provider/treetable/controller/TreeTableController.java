package com.wxl.common.provider.treetable.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.base.controller.BaseController;
import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;
import com.wxl.common.provider.treetable.service.TreeTableService;
import com.wxl.modules.cms.columns.presistence.entity.Columns;

/**
 * 树控制器基类
 * 
 * @param <T>
 * @param <S>
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public abstract class TreeTableController<T extends TreeTableEntity<T>, S extends TreeTableService<T>>
		extends BaseController<T, S> {

	protected final static String DO_ADDCHILDREN = "addChildren";

	protected void updAfter(T entity, Model model) {
		super.updAfter(entity, model);
//		if(StringUtils.isNoneBlank(entity.getParent().getId())) {
//			entity.setParent(service.get(entity.getParent()));
//		}
	}
	
	/**
	 * 转到添加下级也没页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { DO_ADDCHILDREN + "/{parentId}" })
	public String addChildren(@PathVariable String parentId, Model model, HttpServletRequest request) {
		addBefore(request, model);
		T entity = instance();
		entity.setParent(this.service.get(parentId));
		addAfter(entity, request, model);
		model.addAttribute(entity);
		return VIEW_MODULE + viewPath() + VIEW_ADD;
	}

	protected void detailAfter(T entity, Model model) {

		this.logger.debug("{} execute detailAfter process...");
//		entity.setParent(service.get(entity.getParent().getId()));
	};
	
	/**
	 * 获取树数据
	 * 
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<T> list = getTreeDate();
		for (int i = 0; i < list.size(); i++) {
			T entity = list.get(i);
			if (entity != null) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("id", entity.getId());
				map.put("pId", entity.getParent().getId());
				map.put("name", entity.getName());
				map.put("code", entity.getCode());
				map.put("status", entity.getStatus());
				map.put("sysData", entity.isSysData());
				map.put("open", true);
				mapList.add(map);
			}
		}
		return mapList;
	}

	/**
	 * 获取权限数据
	 * 
	 * @return
	 */
	protected abstract List<T> getTreeDate();
}
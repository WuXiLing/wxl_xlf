package com.wxl.modules.sys.menu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.treetable.controller.TreeTableController;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
import com.wxl.modules.sys.menu.service.MenuService;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 菜单Controller
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午5:17:01
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/menu")
public class MenuController extends TreeTableController<Menu, MenuService> {

	protected void listBefore(HttpServletRequest request, Model model) {
		 model.addAttribute("list", UserUtils.getMenuList());
	};

	/**
	 * 新增后操作
	 * 
	 * @param request
	 * @param model
	 */
	protected void addAfter(Menu entity, HttpServletRequest request, Model model) {

	};

	@ResponseBody
	@RequestMapping(value = "menuData")
	public List<Map<String, Object>> menuData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Menu> list = UserUtils.getMenuList();
		for (int i = 0; i < list.size(); i++) {
			Menu entity = list.get(i);
			if (entity != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", entity.getId());
				map.put("pId", entity.getParent().getId());
				map.put("name", entity.getName());
				map.put("href", entity.getHref());
				map.put("icon", entity.getIcon());
				map.put("sort", entity.getSort());
				map.put("permission", entity.getPermission());
				map.put("status", entity.getStatus());
				map.put("sysData", entity.isSysData());
				map.put("open", true);
				mapList.add(map);
			}
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(value = "getManageData")
	public Map<String, Object> getManageData(HttpServletResponse response) {
		Map<String,Object> params = new HashMap<String,Object>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Menu> list = UserUtils.getMenuList();
		for (int i = 0; i < list.size(); i++) {
			Menu entity = list.get(i);
			if (entity != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", entity.getId());
				map.put("pId", entity.getParent().getId());
				map.put("name", entity.getName());
				map.put("href", entity.getHref());
				map.put("icon", entity.getIcon());
				map.put("sort", entity.getSort());
				map.put("permission", entity.getPermission());
				map.put("status", entity.getStatus());
				map.put("sysData", entity.isSysData());
				map.put("open", true);
				mapList.add(map);
			}
		}
		params.put("data", mapList);
		params.put("code", "0");
		params.put("msg", "ok");
		return params;
	}

	@ResponseBody
	@RequestMapping(value = "menuNavFirst")
	public List<Menu> menuNavFirst() {
		List<Menu> m = service.findByParentId("1");
		return m;
	}

	@ResponseBody
	@RequestMapping(value = "menuNavchildren/{parentId}")
	public List<Menu> menuNavOther(@PathVariable String parentId) {
		return service.findByParentId(parentId);
	}

	@ResponseBody
	@RequestMapping(value = "updateSort", method = RequestMethod.POST)
	public Map<String, Object> updateSort(@RequestBody Map<String, String> params, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.updateSort(params);
		map.put("msg", "ok");
		return map;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/menu";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected Menu instance() {
		return new Menu();
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.treetable.controller.TreeTableController#getTreeDate(
	 * )
	 */
	@Override
	protected List<Menu> getTreeDate() {
		return UserUtils.getMenuList();
	}
}
package com.wxl.modules.cms.columns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.treetable.controller.TreeTableController;
import com.wxl.modules.cms.columns.presistence.entity.Columns;
import com.wxl.modules.cms.columns.service.ColumnsServiceI;
import com.wxl.modules.cms.columns.utls.CmsUtils;
import com.wxl.modules.sys.area.presistence.entity.Area;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;
import com.wxl.modules.sys.storge.service.StorgeEntityService;

/**
 * 树控制器基类
 * 
 * @param <T>
 * @param <S>
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/columns")
public class ColumnsController extends TreeTableController<Columns, ColumnsServiceI> {

	@Autowired
	StorgeEntityService storgeEntityService;

	protected void listBefore(HttpServletRequest request, Model model) {
		model.addAttribute("list", CmsUtils.getColumnsList());
	};

	/**
	 * 新增后操作
	 * 
	 * @param request
	 * @param model
	 */
	protected void addAfter(Columns entity, HttpServletRequest request, Model model) {

		if (entity.getParent() == null || entity.getParent().getId() == null) {
			// entity.setParent(entity);
			// entity.setParent(UserUtils.getUser().getOffice().getArea());
		}
		// entity.setParent(Service.get(area.getParent().getId()));
	};

	protected void updAfter(Columns entity, Model model) {
		super.updAfter(entity, model);
		StorgeEntity storgeEntity = storgeEntityService.get(entity.getImage());
		model.addAttribute(storgeEntity);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "cms/columns";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected Columns instance() {
		return new Columns();
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.treetable.controller.TreeTableController#getTreeDate(
	 * )
	 */
	@Override
	protected List<Columns> getTreeDate() {
		return CmsUtils.getColumnsList();
	}

	@ResponseBody
	@RequestMapping(value = "getManageData")
	public Map<String, Object> getManageData(HttpServletResponse response) {
		Map<String, Object> params = new HashMap<String, Object>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Columns> list = CmsUtils.getColumnsList();
		for (int i = 0; i < list.size(); i++) {
			Columns entity = list.get(i);
			if (entity != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", entity.getId());
				map.put("pId", entity.getParent().getId());
				map.put("name", entity.getName());
				map.put("sort", entity.getSort());
				map.put("image", entity.getImage());
				map.put("type", entity.getType());
				map.put("target", entity.getTarget());
				map.put("firstnav", entity.getFirstnav());
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

}
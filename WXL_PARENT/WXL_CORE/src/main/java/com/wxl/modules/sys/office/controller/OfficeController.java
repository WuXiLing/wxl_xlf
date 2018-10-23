package com.wxl.modules.sys.office.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.treetable.controller.TreeTableController;
import com.wxl.modules.sys.office.presistence.entity.Office;
import com.wxl.modules.sys.office.service.impl.OfficeServiceImpl;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 机构Controller
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午5:17:01
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/office")
public class OfficeController extends TreeTableController<Office, OfficeServiceImpl> {

	protected void listBefore(HttpServletRequest request, Model model) {
		model.addAttribute("list", UserUtils.getOfficeList());
	};

	/**
	 * 新增后操作
	 * 
	 * @param request
	 * @param model
	 */
	protected void addAfter(Office entity,HttpServletRequest request, Model model) {
		
		if (entity.getParent() == null||entity.getParent().getId()==null){
//			entity.setParent(entity);
//			entity.setParent(UserUtils.getUser().getOffice().getArea());
		}
//		entity.setParent(Service.get(area.getParent().getId()));
	};
	
	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/office";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected Office instance() {
		return new Office();
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.treetable.controller.TreeTableController#getTreeDate()
	 */
	@Override
	protected List<Office> getTreeDate() {
		return UserUtils.getOfficeList();
	}
	
	@ResponseBody
	@RequestMapping(value = "getManageData")
	public Map<String, Object> getManageData(HttpServletResponse response) {
		Map<String,Object> params = new HashMap<String,Object>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Office> list = UserUtils.getOfficeList();
		for (int i = 0; i < list.size(); i++) {
			Office entity = list.get(i);
			if (entity != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", entity.getId());
				map.put("pId", entity.getParent().getId());
				map.put("name", entity.getName());
				map.put("abbreviation", entity.getAbbreviation());
				map.put("code",entity.getCode());
				map.put("sort",entity.getSort());
				map.put("grade", entity.getGrade());
				map.put("type", entity.getType());
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
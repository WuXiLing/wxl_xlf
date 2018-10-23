package com.wxl.modules.sys.area.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.treetable.controller.TreeTableController;
import com.wxl.modules.sys.area.presistence.entity.Area;
import com.wxl.modules.sys.area.service.AreaServiceI;
import com.wxl.modules.sys.utils.UserUtils;

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
@RequestMapping(value = "${adminPath}/sys/area")
public class AreaController extends TreeTableController<Area, AreaServiceI> {

	protected void listBefore(HttpServletRequest request, Model model) {
		model.addAttribute("list", UserUtils.getAreaList());
	};

	/**
	 * 新增后操作
	 * 
	 * @param request
	 * @param model
	 */
	protected void addAfter(Area entity, HttpServletRequest request, Model model) {

		if (entity.getParent() == null || entity.getParent().getId() == null) {
			// entity.setParent(entity);
			// entity.setParent(UserUtils.getUser().getOffice().getArea());
		}
		// entity.setParent(Service.get(area.getParent().getId()));
	};

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {
		return "sys/area";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected Area instance() {
		return new Area();
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.treetable.controller.TreeTableController#getTreeDate()
	 */
	@Override
	protected List<Area> getTreeDate() {
		return UserUtils.getAreaList();
	}

}
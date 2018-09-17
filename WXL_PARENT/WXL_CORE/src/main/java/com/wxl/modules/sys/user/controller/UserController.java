package com.wxl.modules.sys.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.service.UserService;

/**
 * 用户Controller
 * 
 * @author liangxf
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/user")
public class UserController extends SingleTableController<User, UserService> {

	@ResponseBody
	@RequestMapping(value = "findTreeDataByOffice/{officeId}")
	public List<Map<String, Object>> findTreeDataByOffice(@PathVariable("officeId") String officeId,
			HttpServletResponse response) {

		List<Map<String, Object>> mapList = new ArrayList<>();
		List<User> list = service.findByOfficeId(officeId);
		if (list != null && !list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				User entity = list.get(i);
				if (entity != null) {
					Map<String, Object> map = new HashMap<>();
					map.put("id", entity.getId());
					map.put("pId", "0");
					map.put("name", entity.getName());
					mapList.add(map);
				}
			}

		}
		return mapList;
	}

	@RequestMapping(value = "resetPwd/{userId}")
	public @ResponseBody String resetPwd() {

		return "";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {

		return "sys/user";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected User instance() {

		return new User();
	}

	@RequestMapping(value = { "index" })
	public String index(User user, Model model) {

		return "modules/sys/user/list";
	}
}

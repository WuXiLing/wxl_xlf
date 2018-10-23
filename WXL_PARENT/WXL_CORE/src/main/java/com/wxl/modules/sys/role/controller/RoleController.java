package com.wxl.modules.sys.role.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.common.utils.Collections3;
import com.wxl.modules.sys.menu.service.MenuRoleService;
import com.wxl.modules.sys.role.presistence.entity.Role;
import com.wxl.modules.sys.role.service.RoleServiceI;
import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.service.UserRoleService;
import com.wxl.modules.sys.user.service.UserService;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 角色Controller
 * 
 * @author 梁小锋
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/role")
public class RoleController extends SingleTableController<Role, RoleServiceI> {

	@Autowired
	private UserRoleService userRoleService;

	@Autowired
	private UserService userService;

	@Autowired
	private MenuRoleService menuRoleService;

	protected void detailAfter(Role entity, Model model) {

		entity.setUserList(this.userService.findByRoleId(entity.getId()));
		this.logger.debug("{} execute detailAfter process...");
	};

	/**
	 * 角色授权页面
	 * 
	 * @param roleId
	 * @param model
	 * @return
	 */
<<<<<<< HEAD
	@RequestMapping(value = "authority/{roleId}")
=======
	@RequestMapping(value = "toAuthority/{roleId}")
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	public String authority(@PathVariable("roleId") String roleId, Model model) {
		Role entity = this.service.get(roleId);
		model.addAttribute(entity);
		return "modules/" + viewPath() + "/authority";
	}

	/**
	 * 角色分配页面
	 * 
	 * @param roleId
	 * @param model
	 * @return
	 */
<<<<<<< HEAD
	@RequestMapping(value = "distribute/{roleId}")
=======
	@RequestMapping(value = "toAssign/{roleId}")
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	public String assign(@PathVariable("roleId") String roleId, Model model) {
		Role entity = this.service.get(roleId);
		entity.setUserList(this.userService.findByRoleId(entity.getId()));
		model.addAttribute(entity);
		return "modules/" + viewPath() + "/distribute";
	}

	/**
	 * 获取分配角色相关数据
	 * 
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value = "getRoleAssignData/{roleId}")
	@ResponseBody
	public Map<String, Object> getAllAssignData(@PathVariable("roleId") String roleId) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<User> userList = userService.findByRoleId(roleId);
		map.put("userList", userList);
		map.put("selectIds",
				userList != null && !userList.isEmpty() ? Collections3.extractToString(userList, "name", ",") : "");
		map.put("officeList", UserUtils.getOfficeList());
		return map;
	}

	@RequestMapping(value = "selectUserLayuiPageList/{roleId}")
	@ResponseBody
	public Map<String, Object> selectUserLayuiPageList(@PathVariable("roleId") String roleId, LayuiPage page) {

		this.logger.debug("{} execute selectUserLayuiPageList start...", page.getPage());
		Map<String, Object> map = new HashMap<>();
		page.addKey("roleId", roleId);
		service.selectUserLayuiPageList(page);
		map.put("data", page.getData());
		map.put("count", page.getCount());
		map.put("code", StringUtils.isNotBlank(page.getCode()) ? page.getCode() : "0");
		map.put("msg", StringUtils.isNotBlank(page.getMsg()) ? page.getMsg() : "");
		this.logger.debug("{} execute selectUserLayuiPageList end...", page.getCount());
		return map;
	}

	/**
	 * 角色分配 -- 根据部门编号获取用户列表
	 * 
	 * @param officeId
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "users")
	public List<Map<String, Object>> users(String officeId, HttpServletResponse response) {

		List<Map<String, Object>> mapList = new ArrayList<>();
		List<User> tempList = userService.selectAll(new HashMap<String, Object>());
		if (tempList != null && !tempList.isEmpty()) {
			for (User e : tempList) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", e.getId());
				map.put("pId", 0);
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}

	/**
	 * 角色分配 -- 从角色中移除用户
	 * 
	 * @param userId
	 *            用户ID
	 * @param roleId
	 *            角色ID
	 * @return
	 */
	@RequestMapping(value = "removeUserFromRole/{roleId}/{userId}")
	public @ResponseBody Map<String, Object> removeUserFromRole(@PathVariable("userId") String userId,
			@PathVariable("roleId") String roleId) {

		userRoleService.removeUserFromRole(userId, roleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DO_SUCCESS);
		return map;
	}

	/**
	 * 角色分配
	 * 
	 * @param roleId
	 *            角色ID
	 * @param userIds
	 *            用户ID
	 * @return
	 */
	@RequestMapping(value = "addUserToRole/{roleId}")
	public @ResponseBody Map<String, Object> addUserToRole(@PathVariable("roleId") String roleId,
			@RequestParam(value = "userIds[]") String[] userIds) {

		userRoleService.addUserToRole(userIds, roleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DO_SUCCESS);
		return map;
	}

	/**
	 * 角色授权
	 * 
	 * @param roleId
	 *            角色ID
	 * @param menuIds
	 *            用户ID
	 * @return
	 */
	@RequestMapping(value = "addMenuToRole/{roleId}", method = { RequestMethod.POST })
	public @ResponseBody Map<String, Object> addMenuToRole(@PathVariable("roleId") String roleId,
			@RequestParam(value = "menuIds[]") String[] menuIds) {

		menuRoleService.addMenuToRole(menuIds, roleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, DO_SUCCESS);
		return map;
	}

	/**
	 * 查询菜单（通过角色ID）
	 * 
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value = "getMenuByRole/{roleId}", method = { RequestMethod.GET })
	public @ResponseBody Map<String, Object> getMenuByRoleId(@PathVariable("roleId") String roleId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menus", menuRoleService.findByRoleId(roleId));
		return map;
	}

	@Override
	protected String viewPath() {

		return "sys/role";
	}

	@Override
	protected Role instance() {

		return new Role();
	}
}

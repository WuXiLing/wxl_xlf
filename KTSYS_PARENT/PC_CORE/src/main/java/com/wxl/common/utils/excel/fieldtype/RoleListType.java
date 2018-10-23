package com.wxl.common.utils.excel.fieldtype;

import java.util.ArrayList;
import java.util.List;

import com.wxl.common.utils.Collections3;
import com.wxl.common.utils.SpringContextHolder;
import com.wxl.common.utils.StringUtils;
import com.wxl.modules.sys.role.presistence.entity.Role;
import com.wxl.modules.sys.role.service.RoleServiceI;

/**
 * 字段类型转换
 * 
 * @author Liang
 *
 */
public class RoleListType {

	private static RoleServiceI roleService = SpringContextHolder.getBean(RoleServiceI.class);
	
	
	/**
	 * 获取对象值（导入）
	 */
	public static Object getValue(String val) {
		List<Role> roleList = new ArrayList<>();
		List<Role> allRoleList = roleService.selectAll(null);
		for (String s : StringUtils.split(val, ",")){
			for (Role e : allRoleList){
				if (StringUtils.trimToEmpty(s).equals(e.getName())){
					roleList.add(e);
				}
			}
		}
		return roleList.size()>0?roleList:null;
	}

	/**
	 * 设置对象值（导出）
	 */
	public static String setValue(Object val) {
		if (val != null){
			@SuppressWarnings("unchecked")
			List<Role> roleList = (List<Role>)val;
			return Collections3.extractToString(roleList, "name", ", ");
		}
		return "";
	}
	
}

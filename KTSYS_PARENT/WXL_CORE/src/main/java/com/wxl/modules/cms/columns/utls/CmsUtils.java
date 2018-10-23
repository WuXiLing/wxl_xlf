package com.wxl.modules.cms.columns.utls;

import java.util.List;

import com.wxl.common.utils.SpringContextHolder;
import com.wxl.modules.cms.columns.presistence.entity.Columns;
import com.wxl.modules.cms.columns.service.ColumnsServiceI;

/**
 * CMS工具类
 * 
 * 
 * @author wxl
 * 
 */
public class CmsUtils {

//	public static final String USER_CACHE = "userCache";
//	public static final String USER_CACHE_ID_ = "wxl_user_id_";
//	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
//	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";
	
	public static final String CMS_CACHE_FIRST_NAV_LIST = "cms_cache_first_nav_list";

	private static ColumnsServiceI columnsServiceI = SpringContextHolder.getBean(ColumnsServiceI.class);

	/**
	 * 获取当前用户授权的区域
	 * 
	 * @return
	 */
	public static List<Columns> getColumnsList() {
		List<Columns> columnsList = columnsServiceI.selectAll(null);
		if (columnsList == null) {
			columnsList = columnsServiceI.selectAll(null);
		}
		return columnsList;
	}
}

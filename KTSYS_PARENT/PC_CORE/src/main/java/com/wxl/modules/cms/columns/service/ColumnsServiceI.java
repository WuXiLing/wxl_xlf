package com.wxl.modules.cms.columns.service;

import java.util.List;

import com.wxl.common.provider.treetable.service.TreeTableService;
import com.wxl.modules.cms.columns.presistence.entity.Columns;

/**
 * 栏目
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public interface ColumnsServiceI extends TreeTableService<Columns> {

	public List<Columns> getChildrenColumnsByParentId(String columnsId);
	
	List<Columns> getFirstNavColumns();
}

package com.wxl.modules.cms.columns.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.treetable.service.impl.TreeTableServiceImpl;
import com.wxl.common.utils.CacheUtils;
import com.wxl.modules.cms.columns.presistence.entity.Columns;
import com.wxl.modules.cms.columns.presistence.mapper.ColumnsMapper;
import com.wxl.modules.cms.columns.service.ColumnsServiceI;
import com.wxl.modules.cms.columns.utls.CmsUtils;

/**
 * 栏目Service
 * 
 * @author wxl
 *
 */
@Service
@Transactional(readOnly = true)
@CacheEnable(cacheNames = "WXL_CMS_COLUMNS_KEY")
public class ColumnsServiceImpl extends TreeTableServiceImpl<Columns, ColumnsMapper> implements ColumnsServiceI {

	public List<Columns> getChildrenColumnsByParentId(String parentId) {

		return mapper.getChildrenColumnsByParentId(parentId);
	}

	@Override
	public List getFirstNavColumns() {
		List l = CacheUtils.getList(CmsUtils.CMS_CACHE_FIRST_NAV_LIST);
		if(l == null||l.isEmpty()) {
			List<Columns> l1 = mapper.getFirstNavColumns();
			for (Columns columns : l1) {
				columns.setChildrens(getChildrenColumnsByParentId(columns.getId()));
			}
			CacheUtils.putList(CmsUtils.CMS_CACHE_FIRST_NAV_LIST, l1);
			l = l1;
		}
		return l;
	}
}

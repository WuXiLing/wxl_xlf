package com.wxl.modules.sys.dict.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.dict.presistence.entity.DictItem;
import com.wxl.modules.sys.dict.presistence.mapper.DictItemMapper;
import com.wxl.modules.sys.dict.service.DictItemService;
import com.wxl.modules.sys.dict.util.DictUtil;

/**
 * 数据字典service实现
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:15:10
 */
@Service
@Transactional(readOnly = false)
@CacheEnable(cacheNames = DictUtil.WXL_DICT_ITEM_KEY)
public class DictItemServiceImpl extends SingleTableServiceImpl<DictItem, DictItemMapper> implements DictItemService {

	public List<DictItem> selectListByDictType(@Param("cm") Map<String, Object> params) {
		return mapper.selectListByDictType(params);
	}

	@Override
	public List<DictItem> getByDictTypeName(Map<String, Object> params) {
		return mapper.getByDictTypeName(params);
	}
}

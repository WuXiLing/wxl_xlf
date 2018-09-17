package com.wxl.modules.sys.dict.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.dict.presistence.entity.DictItem;

/**
 * 数据字典service
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:16:12
 */
public interface DictItemService extends SingleTableService<DictItem> {

	public List<DictItem> selectListByDictType(@Param("cm") Map<String, Object> params);
	
	public List<DictItem> getByDictTypeName(@Param("cm") Map<String, Object> params);
}

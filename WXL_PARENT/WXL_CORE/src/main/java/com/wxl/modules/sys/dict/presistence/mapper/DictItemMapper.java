package com.wxl.modules.sys.dict.presistence.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.dict.presistence.entity.DictItem;

/**
 * 字典DAO接口
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:14:25
 */
@MyBatisDao
public interface DictItemMapper extends SingleTableMapper<DictItem> {

	public List<DictItem> selectListByDictType(@Param("cm") Map<String, Object> params);

	public List<DictItem> getByDictTypeName(Map<String, Object> params);
}

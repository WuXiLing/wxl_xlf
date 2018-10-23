package com.wxl.modules.sys.dict.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.dict.presistence.entity.DictType;

/**
 * 字典DAO接口
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:14:25
 */
@MyBatisDao
public interface DictTypeMapper extends SingleTableMapper<DictType> {

}

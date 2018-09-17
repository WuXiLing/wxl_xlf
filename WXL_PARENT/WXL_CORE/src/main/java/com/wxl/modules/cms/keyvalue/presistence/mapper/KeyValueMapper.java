package com.wxl.modules.cms.keyvalue.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.cms.keyvalue.presistence.entity.KeyValue;

/**
 * 文章mapper接口
 * 
 * @author wxl
 *
 */
@MyBatisDao
public interface KeyValueMapper extends SingleTableMapper<KeyValue> {

}

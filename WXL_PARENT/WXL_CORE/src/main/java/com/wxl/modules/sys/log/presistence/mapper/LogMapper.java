package com.wxl.modules.sys.log.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.log.presistence.entity.Log;

/**
 * 日志DAO接口
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:34:17
 */
@MyBatisDao
public interface LogMapper extends SingleTableMapper<Log> {

}

package com.wxl.modules.sys.task.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.task.presistence.entity.Task;

/**
 * 任务Mapper接口
 * 
 * @author liangxf
 *
 */
@MyBatisDao
public interface TaskMapper extends SingleTableMapper<Task> {

}

package com.wxl.modules.sys.task.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.task.presistence.entity.Task;
import com.wxl.modules.sys.task.presistence.mapper.TaskMapper;
import com.wxl.modules.sys.task.service.TaskService;

/**
 * 任务service实现
 * 
 * @author liangxf
 *
 */
@Service
@Transactional(readOnly = false)
//@CacheEnable(cacheNames = "WXL_ROLE_KEY")
public class TaskServiceImpl extends SingleTableServiceImpl<Task, TaskMapper> implements TaskService {
	
}

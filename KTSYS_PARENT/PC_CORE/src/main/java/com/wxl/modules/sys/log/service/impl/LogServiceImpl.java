package com.wxl.modules.sys.log.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.log.presistence.entity.Log;
import com.wxl.modules.sys.log.presistence.mapper.LogMapper;
import com.wxl.modules.sys.log.service.LogService;

/**
 * 日志Service
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:32:58
 */
@Service
@Transactional(readOnly = true)
public class LogServiceImpl extends SingleTableServiceImpl<Log,LogMapper> implements LogService{

}

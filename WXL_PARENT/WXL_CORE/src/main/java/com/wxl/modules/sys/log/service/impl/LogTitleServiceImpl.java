package com.wxl.modules.sys.log.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.log.presistence.entity.LogTitle;
import com.wxl.modules.sys.log.presistence.mapper.LogTitleMapper;
import com.wxl.modules.sys.log.service.LogTitleService;

/**
 * 日志Service
 * 
 * @author wxl
 * 
 * @date 2017年7月27日 下午4:32:58
 */
@Service
@Transactional(readOnly = true)
public class LogTitleServiceImpl extends SingleTableServiceImpl<LogTitle,LogTitleMapper> implements LogTitleService{

}

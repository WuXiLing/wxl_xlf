package com.wxl.modules.sys.home.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.home.presistence.entity.Home;
import com.wxl.modules.sys.home.presistence.mapper.HomeMapper;
import com.wxl.modules.sys.home.service.HomeService;

/**
 * 日志Service
 * 
 * @author Liang
 *
 */
@Service
@Transactional(readOnly = true)
//@CacheConfig(cacheNames = "sys_log")
//@Cac
public class HomeServiceImpl extends SingleTableServiceImpl<Home,HomeMapper> implements HomeService{

}

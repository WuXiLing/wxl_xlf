package com.wxl.modules.sys.user.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.user.presistence.entity.LoginHistory;
import com.wxl.modules.sys.user.presistence.mapper.LoginHistoryMapper;
import com.wxl.modules.sys.user.service.LoginHistoryService;

/**
 * 登录历史Service
 *
 * @author wxl
 * @date 2018年1月4日 下午7:57:54
 */
@Service
@Transactional(readOnly = false)
//@CacheConfig(cacheNames = "sys_user_history")
public class LoginHistoryServiceImpl extends SingleTableServiceImpl<LoginHistory, LoginHistoryMapper> implements LoginHistoryService {

}

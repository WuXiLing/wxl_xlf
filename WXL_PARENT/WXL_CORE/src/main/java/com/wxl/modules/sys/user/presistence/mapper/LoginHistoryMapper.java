package com.wxl.modules.sys.user.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.user.presistence.entity.LoginHistory;

/**
 * 登录历史Mapper接口
 *
 * @author wxl
 * @date 2018年1月4日 下午7:45:40
 */
@MyBatisDao
public interface LoginHistoryMapper extends SingleTableMapper<LoginHistory> {

}

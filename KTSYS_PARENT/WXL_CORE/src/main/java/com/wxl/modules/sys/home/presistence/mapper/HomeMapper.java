package com.wxl.modules.sys.home.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.home.presistence.entity.Home;

/**
 * 日志DAO接口
 * 
 * @author Liang
 *
 */
@MyBatisDao
public interface HomeMapper extends SingleTableMapper<Home> {

}

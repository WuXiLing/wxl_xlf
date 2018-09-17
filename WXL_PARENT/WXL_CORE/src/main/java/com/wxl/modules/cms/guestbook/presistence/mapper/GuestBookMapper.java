package com.wxl.modules.cms.guestbook.presistence.mapper;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.cms.guestbook.presistence.entity.GuestBook;

/**
 * 文章mapper接口
 * 
 * @author wxl
 *
 */
@MyBatisDao
public interface GuestBookMapper extends SingleTableMapper<GuestBook> {

}

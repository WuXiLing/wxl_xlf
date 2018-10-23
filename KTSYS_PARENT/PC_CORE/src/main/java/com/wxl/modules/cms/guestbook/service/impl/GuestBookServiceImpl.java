package com.wxl.modules.cms.guestbook.service.impl;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.cms.guestbook.presistence.entity.GuestBook;
import com.wxl.modules.cms.guestbook.presistence.mapper.GuestBookMapper;
import com.wxl.modules.cms.guestbook.service.GuestBookService;

/**
 * 文章Service
 * 
 * @author wxl
 * 
 */
@Service
@CacheConfig(cacheNames = "cms_guest_book")
public class GuestBookServiceImpl extends SingleTableServiceImpl<GuestBook, GuestBookMapper> implements GuestBookService {

}

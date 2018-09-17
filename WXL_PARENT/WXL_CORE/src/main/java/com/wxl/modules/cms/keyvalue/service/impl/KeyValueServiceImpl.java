package com.wxl.modules.cms.keyvalue.service.impl;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.cms.keyvalue.presistence.entity.KeyValue;
import com.wxl.modules.cms.keyvalue.presistence.mapper.KeyValueMapper;
import com.wxl.modules.cms.keyvalue.service.KeyValueService;

/**
 * 文章Service
 * 
 * @author wxl
 * 
 */
@Service
@CacheConfig(cacheNames = "cms_key_value")
public class KeyValueServiceImpl extends SingleTableServiceImpl<KeyValue,KeyValueMapper> implements KeyValueService {

}

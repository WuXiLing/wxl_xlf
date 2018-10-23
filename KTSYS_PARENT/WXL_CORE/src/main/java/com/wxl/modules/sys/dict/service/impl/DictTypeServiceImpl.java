package com.wxl.modules.sys.dict.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.dict.presistence.entity.DictType;
import com.wxl.modules.sys.dict.presistence.mapper.DictTypeMapper;
import com.wxl.modules.sys.dict.service.DictTypeService;
import com.wxl.modules.sys.dict.util.DictUtil;

/**
 * 数据字典service实现
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 上午11:15:10
 */
@Service
@Transactional(readOnly = false)
@CacheEnable(cacheNames = DictUtil.WXL_DICT_TYPE_KEY)
public class DictTypeServiceImpl extends SingleTableServiceImpl<DictType, DictTypeMapper> implements DictTypeService {

}

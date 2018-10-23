package com.wxl.modules.sys.office.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.treetable.service.impl.TreeTableServiceImpl;
import com.wxl.modules.sys.office.presistence.entity.Office;
import com.wxl.modules.sys.office.presistence.mapper.OfficeMapper;
import com.wxl.modules.sys.office.service.OfficeService;

/**
 * 机构Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 上午10:14:44
 */
@Service
@Transactional(readOnly = true)
@CacheEnable(cacheNames = "WXL_OFFICE_KEY")
public class OfficeServiceImpl extends TreeTableServiceImpl<Office, OfficeMapper> implements OfficeService {
	
}

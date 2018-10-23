package com.wxl.modules.sys.area.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.provider.treetable.service.impl.TreeTableServiceImpl;
import com.wxl.modules.sys.area.presistence.entity.Area;
import com.wxl.modules.sys.area.presistence.mapper.AreaMapper;
import com.wxl.modules.sys.area.service.AreaServiceI;

/**
 * 区域Service
 * 
 * @author wxl
 *
 */
@Service
@Transactional(readOnly = true)
@CacheEnable(cacheNames = "WXL_AREA_KEY")
public class AreaServiceImpl extends TreeTableServiceImpl<Area, AreaMapper> implements AreaServiceI {

}

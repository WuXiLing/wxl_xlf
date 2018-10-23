package com.wxl.modules.sys.menu.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.treetable.service.impl.TreeTableServiceImpl;
import com.wxl.modules.sys.menu.presistence.entity.Menu;
import com.wxl.modules.sys.menu.presistence.mapper.MenuMapper;
import com.wxl.modules.sys.menu.service.MenuService;

/**
 * 菜单Service
 * 
 * @author wxl
 *
 */
@Service
@Transactional(readOnly = true)
public class MenuServiceImpl extends TreeTableServiceImpl<Menu, MenuMapper> implements MenuService {

}

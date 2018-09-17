package com.wxl.modules.sys.dbtool.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.dbtool.presistence.entity.DbTool;
import com.wxl.modules.sys.dbtool.presistence.mapper.DbToolMapper;
import com.wxl.modules.sys.dbtool.service.DbToolService;

/**
 * 操作数据库
 * 
 * @author Liang
 *
 */
@Service	
@Transactional(readOnly = true)
public class DbToolServiceImpl extends SingleTableServiceImpl<DbTool,DbToolMapper> implements DbToolService{

	@Override
	public void exec(String sql) {
		mapper.exec(sql);
	}

	@Override
	public List<Map<String,Object>> query(String sql) {
		return mapper.query(sql);
	}

}

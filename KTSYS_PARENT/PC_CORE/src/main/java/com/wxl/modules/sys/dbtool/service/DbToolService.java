package com.wxl.modules.sys.dbtool.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.dbtool.presistence.entity.DbTool;

/**
 * 操作数据库
 * 
 * @author Liang
 *
 */
public interface DbToolService extends SingleTableService<DbTool> {

	// 执行语句
	void exec(@Param("sql") String sql);

	// 执行查询语句
	List<Map<String,Object>> query(@Param("sql") String sql);
}

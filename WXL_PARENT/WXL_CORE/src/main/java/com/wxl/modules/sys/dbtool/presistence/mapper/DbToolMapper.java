package com.wxl.modules.sys.dbtool.presistence.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.dbtool.presistence.entity.DbTool;

/**
 * 操作数据库
 * 
 * @author Liang
 *
 */
@MyBatisDao
public interface DbToolMapper extends SingleTableMapper<DbTool> {

	// 执行语句
	void exec(@Param("sql") String sql);

	// 执行查询语句
	List<Map<String,Object>> query(@Param("sql") String sql);
}

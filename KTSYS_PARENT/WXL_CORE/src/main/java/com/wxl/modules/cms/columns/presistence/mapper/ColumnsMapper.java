package com.wxl.modules.cms.columns.presistence.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.treetable.presistence.mapper.TreeTableMapper;
import com.wxl.modules.cms.columns.presistence.entity.Columns;

/**
 * 栏目Mapper接口
 * 
 * @author wxl
 *
 */
@MyBatisDao
public interface ColumnsMapper extends TreeTableMapper<Columns> {

	final static String TABLE_NAME = "T_CMS_COLUMNS";

	// 更新子全码
	@Update("update " + TABLE_NAME
			+ " set longCode = REPLACE(longCode, #{oldLongCode}, #{newLongCode}) where longCode like CONCAT(#{oldLongCode}, '%')")
	void updateChildrenLongCode(@Param(value = "oldLongCode") String oldLongCode,
			@Param(value = "newLongCode") String newLongCode);

	// 更新子全名称
	@Update("update " + TABLE_NAME
			+ " set longName = REPLACE(longName, #{oldLongName}, #{newLongName}) where longName like CONCAT(#{oldLongName}, '%')")
	void updateChildrenLongName(@Param(value = "oldLongName") String oldLongName,
			@Param(value = "newLongName") String newLongName);

	// 更新子全深度
	@Update("update " + TABLE_NAME + " set depth = #{new_depth} where depth =#{old_depth}")
	void updateChildrenDepth(@Param(value = "old_depth") String old_depth, @Param(value = "new_depth") int new_depth);

	@Select("select * from " + TABLE_NAME + " where parentId = #{parentId} order by code desc limit 0,1")
	Columns getMaxChildren(@Param(value = "parentId") String parentId);

	List<Columns> getChildrenColumnsByParentId(@Param(value = "parentId") String c);
	
	List<Columns> getFirstNavColumns();
	
	
}

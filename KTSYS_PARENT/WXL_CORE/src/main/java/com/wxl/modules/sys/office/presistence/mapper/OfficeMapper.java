package com.wxl.modules.sys.office.presistence.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.treetable.presistence.mapper.TreeTableMapper;
import com.wxl.modules.sys.office.presistence.entity.Office;

/**
 * 机构DAO接口
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 上午10:12:13
 */
@MyBatisDao
public interface OfficeMapper extends TreeTableMapper<Office> {
	
	final static String TABLE_NAME = "sys_office";

	// 更新子全码
	@Update("update " + TABLE_NAME
			+ " set long_Code = REPLACE(long_Code, #{oldLongCode}, #{newLongCode}) where long_Code like CONCAT(#{oldLongCode}, '%')")
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

}

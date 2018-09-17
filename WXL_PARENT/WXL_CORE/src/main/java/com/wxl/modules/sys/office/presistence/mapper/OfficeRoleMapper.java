package com.wxl.modules.sys.office.presistence.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.office.presistence.entity.OfficeRole;

/**
 * 单位角色DAO接口
 * 
 * @author liangxf
 *
 */
@MyBatisDao
public interface OfficeRoleMapper extends SingleTableMapper<OfficeRole> {

	static final String DB_NAME = "sys_role_office";

	/**
	 * 根据机构ID查询
	 * 
	 * @param officeId
	 * @return
	 */
	@Select("select * from " + DB_NAME + " where office_id = #{officeId}")
	List<OfficeRole> findByOfficeId(@Param("officeId") String officeId);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 * @return
	 */
	@Select("select * from " + DB_NAME + " where role_id = #{roleId}")
	List<OfficeRole> findByRoleId(@Param("roleId") String roleId);

	@Insert("insert into " + DB_NAME + " (role_id,office_id) values(#{roleId},#{officeId}) ")
	void insert(OfficeRole entity);

	/**
	 * 根据机构ID删除
	 * 
	 * @param officeId
	 * @return
	 */
	@Delete("delete from " + DB_NAME + " where office_id = #{officeId}")
	int deleteByOfficeId(@Param("officeId") String officeId);

	/**
	 * 根据角色ID删除
	 * 
	 * @param roleId
	 * @return
	 */
	@Delete("delete from " + DB_NAME + " where role_id = #{roleId}")
	int deleteByRoleId(@Param("roleId") String roleId);

	/**
	 * 删除机构、角色关联
	 * 
	 * @param officeId
	 *            机构ID
	 * @param roleId
	 *            角色ID
	 */
	@Delete("delete from " + DB_NAME + " where role_id = #{roleId} and office_id = #{officeId}")
	void removeOfficeFromRole(@Param("officeId") String officeId, String roleId);

}

package com.wxl.modules.sys.office.service;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.office.presistence.entity.OfficeRole;

/**
 * 机构角色Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:38:26
 */
public interface OfficeRoleService extends SingleTableService<OfficeRole> {

	/**
	 * 根据机构ID查询
	 * 
	 * @param officeId
	 * @return
	 */
//	List<OfficeRole> findByOfficeId(@Param("officeId") String officeId);

	/**
	 * 根据角色ID查询
	 * 
	 * @param roleId
	 * @return
	 */
//	List<OfficeRole> findByRoleId(@Param("roleId") String roleId);

	/**
	 * 根据机构ID删除
	 * 
	 * @param officeId
	 * @return
	 */
//	int deleteByOfficeId(@Param("officeId") String officeId);

	/**
	 * 根据角色ID删除
	 * 
	 * @param roleId
	 * @return
	 */
//	int deleteByRoleId(@Param("roleId") String roleId);

	/**
	 * 添加机构、角色关联
	 * 
	 * @param officeId
	 *            机构ID
	 * @param roleId
	 *            角色ID
	 */
//	void addOfficeToRole(@Param("officeIds") String[] officeIds, @Param("roleId") String roleId);

	/**
	 * 删除机构、角色关联
	 * 
	 * @param officeId
	 *            机构ID
	 * @param roleId
	 *            角色ID
	 */
//	void removeOfficeFromRole(@Param("officeId") String officeId, @Param("roleId") String roleId);
}

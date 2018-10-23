package com.wxl.modules.sys.office.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.sys.office.presistence.entity.OfficeRole;
import com.wxl.modules.sys.office.presistence.mapper.OfficeRoleMapper;
import com.wxl.modules.sys.office.service.OfficeRoleService;

/**
 * 机构角色Service
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:40:02
 */
@Service
@Transactional(readOnly = true)
public class OfficeRoleServiceImpl extends SingleTableServiceImpl<OfficeRole, OfficeRoleMapper> implements OfficeRoleService {

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.OfficeRoleService#findByOfficeId(java.lang.String)
	 */
//	@Override
//	public List<OfficeRole> findByOfficeId(@Param("officeId")String officeId) {
//		return mapper.findByOfficeId(officeId);
//	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.OfficeRoleService#findByRoleId(java.lang.String)
	 */
//	@Override
//	public List<OfficeRole> findByRoleId(@Param("roleId")String roleId) {
//		return mapper.findByRoleId(roleId);
//	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.OfficeRoleService#deleteByOfficeId(java.lang.String)
	 */
//	@Override
//	public int deleteByOfficeId(@Param("officeId")String officeId) {
//		return mapper.deleteByOfficeId(officeId);
//	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.OfficeRoleService#deleteByRoleId(java.lang.String)
	 */
//	@Override
//	public int deleteByRoleId(@Param("roleId")String roleId) {
//		return mapper.deleteByRoleId(roleId);
//	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.OfficeRoleService#addOfficeToRole()
	 */
//	@Override
//	public void addOfficeToRole(@Param("officeIds")String[] officeIds,String roleId) {
//		for(String officeId : officeIds){
//			this.insert(new OfficeRole(officeId, roleId));
//		}
//	}

	/* （非 Javadoc）
	 * @see com.wxl.modules.sys.user.service.OfficeRoleService#removeOfficeFromRole()
	 */
//	@Override
//	public void removeOfficeFromRole(@Param("officeId")String officeId,String roleId) {
//		mapper.removeOfficeFromRole(officeId, roleId);
//	}
}

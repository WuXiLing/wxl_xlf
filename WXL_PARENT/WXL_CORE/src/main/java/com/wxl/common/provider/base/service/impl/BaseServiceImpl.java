package com.wxl.common.provider.base.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wxl.common.cache.CacheEnable;
import com.wxl.common.config.Global;
import com.wxl.common.provider.base.presistence.entity.BaseEntity;
import com.wxl.common.provider.base.presistence.mapper.BaseMapper;
import com.wxl.common.provider.base.service.BaseService;
import com.wxl.common.provider.utils.BasePage;
import com.wxl.common.utils.CacheUtils;
import com.wxl.common.utils.Constants;
import com.wxl.common.utils.IdGen;
import com.wxl.common.utils.WebUtil;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 
 * @author wxl
 * 
 * @date 2017年6月28日 下午5:27:18
 */

public class BaseServiceImpl<T extends BaseEntity, D extends BaseMapper<T>> extends ProviderServiceImpl<T, D>
		implements BaseService<T> {

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#insertbefore(java.lang.
	 * Object)
	 */
	@Override
	// @CachePut(value = "sys", key = "#entity.getId()")
	public void insertBefore(T entity) {

		entity.setId(IdGen.uuid());
		entity.setCreateDate(new Date());
		entity.setCreateUser(UserUtils.getUser());
		entity.setLastUpdateDate(new Date());
		entity.setLastUpdateUser(UserUtils.getUser());
		entity.setIp(WebUtil.getHost());
		entity.setVersion(Global.getConfig("version"));
		entity.setLastUpdateIp(WebUtil.getHost());
		entity.setLastUpdateVersion(Global.getConfig("version"));
		entity.setStatus(Constants.STATUS_ZERO);
		entity.setSysData(Constants.SYSDATA_NO);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#insertAfter(java.lang.
	 * Object)
	 */
	@Override
	public void insertAfter(T entity) {
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.put(cacheEnable.cacheNames() + DELIMITER + entity.getId(), entity);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#updatebefore(java.lang.
	 * Object)
	 */
	@Override
	public void updateBefore(T entity) {

		entity.setLastUpdateDate(new Date());
		entity.setLastUpdateUser(UserUtils.getUser());
		entity.setLastUpdateIp(WebUtil.getHost());
		entity.setLastUpdateVersion(Global.getConfig("version"));
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#updateAfter(java.lang.
	 * Object)
	 */
	@Override
	public void updateAfter(T entity) {

		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.put(cacheEnable.cacheNames() + DELIMITER + entity.getId(), entity);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#selectPageList(com.wxl.
	 * common.provider.utils.BasePage, java.util.Map)
	 */
	@Override
	public void selectPageList(BasePage page) {

		mapper.selectPageList(page);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.service.ProviderService#selectPageList(com.wxl.
	 * common.provider.utils.BasePage, java.util.Map)
	 */
	@Override
	public void selectJqgridPageList(BasePage page) {

		mapper.selectJqgridPageList(page);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#selectLayuiPageList(com.wxl.
	 * common.provider.utils.BasePage, java.util.Map)
	 */
	@Override
	public void selectLayuiPageList(BasePage page) {

		mapper.selectLayuiPageList(page);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.service.ProviderService#selectList(java.util.Map)
	 */
	@Override
	public List<T> selectList(@Param("cm") Map<String, Object> parms) {

		return mapper.selectList(parms);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.service.ProviderService#deleteBefore(java.
	 * lang.Object)
	 */
	@Override
	public void deleteBefore(String id) {
		// TODO 自动生成的方法存根

	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.service.ProviderService#deleteAfter(java.
	 * lang.Object)
	 */
	@Override
	public void deleteAfter(String id) {
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.remove(cacheEnable.cacheNames() + DELIMITER + id);
		}
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see
	 * com.wxl.common.provider.base.service.ProviderService#selectAll(java.util.
	 * Map)
	 */
	@Override
	public List<T> selectAll(@Param("cm") Map<String, Object> parms) {

		return mapper.selectAll(parms);
	}

	@Override
	@Transactional(readOnly = false)
	public void importInfo(List<T> list) {

		if (list != null && !list.isEmpty()) {
			importListBefore(list);
			for (T entity : list) {
				this.importBefore(entity);
				this.save(entity);
				this.importAfter(entity);
			}
			this.batchInsert(list);
			importListAfter(list);
		}
	}

	@Override
	public void importListBefore(List<T> list) {

	}

	@Override
	public void importListAfter(List<T> list) {

	}

	@Override
	public void importBefore(T entity) {

	}

	@Override
	public void importAfter(T entity) {

	}

	@Override
	public void startAfter(String id) {
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.remove(cacheEnable.cacheNames() + DELIMITER + id);
		}
	}

	@Override
	public void stopAfter(String id) {
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.remove(cacheEnable.cacheNames() + DELIMITER + id);
		}
	}

	@Override
	public void passAfter(String id) {
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.remove(cacheEnable.cacheNames() + DELIMITER + id);
		}
	}

	@Override
	public void denialAfter(String id) {
		CacheEnable cacheEnable = this.getClass().getAnnotation(CacheEnable.class);
		if (cacheEnable != null) {
			CacheUtils.remove(cacheEnable.cacheNames() + DELIMITER + id);
		}
	}
}

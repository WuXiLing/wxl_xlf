package com.wxl.modules.cms.article.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.modules.cms.article.presistence.entity.Article;
import com.wxl.modules.cms.article.presistence.mapper.ArticleMapper;
import com.wxl.modules.cms.article.service.ArticleService;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 文章Service
 * 
 * @author wxl
 * 
 */
@Service
@CacheConfig(cacheNames = "cms_article")
public class ArticleServiceImpl extends SingleTableServiceImpl<Article, ArticleMapper> implements ArticleService {

	/**
	 * 保存前设置<br>
	 * 状态是已发布，则设置发布人、否则发布人为空
	 * 
	 * @param entity
	 */
	public void saveBefore(Article entity) {
		if(StringUtils.isNoneEmpty(entity.getStatus())) {
			if("1".equals(entity.getStatus())) {
				entity.setReleasetor(UserUtils.getUser().getId());
			} else {
				entity.setReleasetor("");
			}
		}
	}
	
	@Override
	public List<Article> selectImageList(Map<String, Object> params) {
		return mapper.selectImageList(params);
	}

	/**
	 * 发布
	 * 
	 * @param id
	 */
	@Override
	public void release(String id) {
		mapper.release(id,UserUtils.getUser().getId());
	}
}

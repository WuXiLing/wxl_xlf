package com.wxl.modules.cms.article.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Article> selectImageList(Map<String, Object> params) {
		return mapper.selectImageList(params);
	}

	@Override
	public void release(String id) {
		mapper.release(id,UserUtils.getUser().getId());
	}
}

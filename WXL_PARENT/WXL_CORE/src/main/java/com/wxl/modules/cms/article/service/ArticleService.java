package com.wxl.modules.cms.article.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.cms.article.presistence.entity.Article;

/**
 * 文章Service
 * 
 * 
 * @author wxl
 * 
 */
public interface ArticleService extends SingleTableService<Article> {

	List<Article> selectImageList(@Param("cm") Map<String, Object> params);
	
<<<<<<< HEAD
	/**
	 * 发布
	 * 
	 * @param id
	 */
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	void release(@Param("id") String id);
}

package com.wxl.modules.cms.article.presistence.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.cms.article.presistence.entity.Article;

/**
 * 文章mapper接口
 * 
 * @author wxl
 *
 */
@MyBatisDao
public interface ArticleMapper extends SingleTableMapper<Article> {

	List<Article> selectImageList(@Param("cm") Map<String, Object> params);
	
	void release(@Param("id") String id, @Param("releasetor") String releasetor);
}

package com.wxl.modules.cms.article.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.modules.cms.article.presistence.entity.Article;
import com.wxl.modules.cms.article.service.ArticleService;
<<<<<<< HEAD
=======
import com.wxl.modules.cms.columns.presistence.entity.Columns;
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
import com.wxl.modules.cms.columns.service.ColumnsServiceI;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;
import com.wxl.modules.sys.storge.service.StorgeEntityService;

/**
 * 文章Controller
 * 
 * @author wxl
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/article")
public class ArticleController extends SingleTableController<Article, ArticleService> {

	@Autowired
	ColumnsServiceI columnsServiceI;

	@Autowired
	StorgeEntityService storgeEntityService;

	@RequestMapping(value = DO_SELECTLAYUIPAGELIST)
	@ResponseBody
	public Map<String, Object> selectLayuiPageList(LayuiPage page) {

		this.logger.debug("{} execute selectLayuiPageList start...", page.getPage());
		Map<String, Object> map = new HashMap<String, Object>();
		service.selectLayuiPageList(page);
		map.put("data", page.getData());
		map.put("count", page.getCount());
		map.put("code", StringUtils.isNotBlank(page.getCode()) ? page.getCode() : "0");
		map.put("msg", StringUtils.isNotBlank(page.getMsg()) ? page.getMsg() : "");
		this.logger.debug("{} execute selectLayuiPageList end...", page.getCount());
		return map;
	}

	@RequestMapping({ "release/{id}" })
	@ResponseBody
	public Map<String, Object> release(@PathVariable String id) {

		this.logger.debug("{} execute release start...");
		service.release(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MSG_FLAG, "release_ok");
		this.logger.debug("{} execute release end...");
		return map;
	}

	protected void addAfter(Article entity, HttpServletRequest request, Model model) {
		super.addAfter(entity, request, model);
		model.addAttribute("columnsId", request.getParameter("columnsId"));
		this.logger.debug("{} execute addAfter process...");
	};

	protected void updAfter(Article entity, Model model) {
		super.updAfter(entity, model);
		StorgeEntity storgeEntity = storgeEntityService.get(entity.getImage());
		model.addAttribute(storgeEntity);
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#viewPath()
	 */
	@Override
	protected String viewPath() {

		return "cms/article";
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see com.wxl.common.provider.base.controller.BaseController#instance()
	 */
	@Override
	protected Article instance() {

		return new Article();
	}
}

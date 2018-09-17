package com.wxl.modules.cms.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.provider.utils.LayuiPage;
import com.wxl.modules.cms.article.presistence.entity.Article;
import com.wxl.modules.cms.article.service.ArticleService;
import com.wxl.modules.cms.columns.presistence.entity.Columns;
import com.wxl.modules.cms.columns.service.ColumnsServiceI;

/**
 * 首页Controller
 * 
 * @author wxl
 *
 */
@Controller
@RequestMapping(value = "${frontPath}/cms/front")
public class FrontController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	ArticleService articleService;

	@Autowired
	ColumnsServiceI columnsService;

	protected void addBefore(HttpServletRequest request, Model model) {

		// model.addAttribute(columnsServiceI.get(request.getParameter("columnsId")));
	}

	@RequestMapping(value = "first")
	public String first() {
		return "modules/cms/front/first";
	}

	@RequestMapping(value = "selectLayuiPageList")
	@ResponseBody
	public Map<String, Object> selectLayuiPageList(LayuiPage page) {

		this.logger.debug("{} execute selectLayuiPageList start...", page.getPage());
		Map<String, Object> map = new HashMap<String, Object>();
		articleService.selectLayuiPageList(page);
		map.put("data", page.getData());
		map.put("count", page.getCount());
		map.put("code", StringUtils.isNotBlank(page.getCode()) ? page.getCode() : "0");
		map.put("msg", StringUtils.isNotBlank(page.getMsg()) ? page.getMsg() : "");
		this.logger.debug("{} execute selectLayuiPageList end...", page.getCount());
		return map;
	}

	@RequestMapping(value = "senond/{id}")
	public String senond(@PathVariable("id") String id, Model model) {
		Columns columns = columnsService.get(id);
		model.addAttribute(columns);
		return "modules/cms/front/two";
	}

	@RequestMapping(value = "article/{id}")
	@ResponseBody
	public Map<String, Object> article(@PathVariable("id") String id) {
		this.logger.debug("{} execute article start...");
		Map<String, Object> map = new HashMap<String, Object>();
		Article artilce = articleService.get(id);
		map.put("article", artilce);
		Columns columns = columnsService.get(artilce.getColumnsId());
		map.put("columns", columns);
		return map;
	}

	@RequestMapping(value = "getArticleListByColumnsId/{id}/{cmslimit}")
	@ResponseBody
	public Map<String, Object> getArticleListByColumnsId(@PathVariable("id") String id,
			@PathVariable("cmslimit") int cmslimit) {
		this.logger.debug("{} execute getArticleListByColumnsId start...");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("columnsId", id);
		map.put("cmslimit", cmslimit);
		map.put("articleList", articleService.selectList(map));
		return map;
	}
	
	@RequestMapping(value = "getImageListByColumnsId/{id}/{cmslimit}")
	@ResponseBody
	public Map<String, Object> getImageListByColumnsId(@PathVariable("id") String id,
			@PathVariable("cmslimit") int cmslimit) {
		this.logger.debug("{} execute getImageListByColumnsId start...");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("columnsId", id);
		map.put("cmslimit", cmslimit);
		map.put("articleList", articleService.selectImageList(map));
		return map;
	}
	
	@RequestMapping(value = "getFirstNavColumns")
	@ResponseBody
	public Map<String, Object> getFirstNavColumns() {
		this.logger.debug("{} execute getFirstNavColumns start...");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("columnsList", columnsService.getFirstNavColumns());
		return map;
	}

	@RequestMapping(value = "columnsThree/{id}")
	public String columnsThree(@PathVariable("id") String id, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("columnsId", id);
		List<Article>  articleList = articleService.selectList(map);
		if(articleList != null && !articleList.isEmpty()) {
			model.addAttribute("article",articleList.get(0));
		} else {
			model.addAttribute("msg","10001");
		}
		Columns columns = columnsService.get(id);
		model.addAttribute("columns",columns);
		return "modules/cms/front/three";
	}
	
	@RequestMapping(value = "three/{id}")
	public String three(@PathVariable("id") String id, Model model) {
		model.addAttribute("id", id);
		Article article = articleService.get(id);
		model.addAttribute("article",article);
		Columns columns = columnsService.get(article.getColumnsId());
		model.addAttribute("columns",columns);
		return "modules/cms/front/three";
	}
}

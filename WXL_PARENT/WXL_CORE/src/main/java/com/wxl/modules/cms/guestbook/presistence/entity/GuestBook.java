package com.wxl.modules.cms.guestbook.presistence.entity;

import java.util.Date;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 文章Entity
 * 
 * 
 * @author wxl
 * 
 */
public class GuestBook extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	/** 标题 */
	private String title;

	/** 栏目 */
	private String columnsId;

	/** 摘要 */
	private String snippet;

	/** 缩略图 */
	private String image;

	/** 置顶 */
	private Integer stick;

	/** 发布时间 */
	private Date releaseDate;

	/** 内容 */
	private String content;

	/** 点击数 */
	private Long hits;

	/** 来源 */
	private String source;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getColumnsId() {
		return columnsId;
	}

	public void setColumnsId(String columnsId) {
		this.columnsId = columnsId;
	}

	public String getSnippet() {
		return snippet;
	}

	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getStick() {
		return stick;
	}

	public void setStick(Integer stick) {
		this.stick = stick;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getHits() {
		return hits;
	}

	public void setHits(Long hits) {
		this.hits = hits;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
}
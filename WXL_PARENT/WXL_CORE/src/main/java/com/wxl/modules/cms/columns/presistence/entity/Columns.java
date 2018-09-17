package com.wxl.modules.cms.columns.presistence.entity;

import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

/**
 * 栏目Entity
 * 
 * @author wxl
 *
 */
public class Columns extends TreeTableEntity<Columns> {

	private static final long serialVersionUID = 1L;

	private String type; 	// 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
	
	private String image;
	
	private String firstnav;//首页菜单
	
	private String target;//首页菜单
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getFirstnav() {
		return firstnav;
	}

	public void setFirstnav(String firstnav) {
		this.firstnav = firstnav;
	}
	
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Override
	public Columns initParent() {
		return new Columns();
	}

}
package com.wxl.modules.sys.area.presistence.entity;

import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

/**
 * 区域Entity
 * 
 * @author wxl
 *
 */
public class Area extends TreeTableEntity<Area> {

	private static final long serialVersionUID = 1L;

	private String type; 	// 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public Area initParent() {
		return new Area();
	}

}
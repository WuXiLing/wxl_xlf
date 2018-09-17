package com.wxl.modules.act.model.presistence.entity;

import org.activiti.engine.repository.Model;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;
import com.wxl.common.utils.StringUtils;

public class ActivitiModeler extends SingleTableEntity{

	private static final long serialVersionUID = -6133249069267339672L;

	private String name;
	
	private String key;
	
	private String category;
	
	public void tranModel(Model model) {
		model.setCategory(category);
		model.setKey(StringUtils.defaultString(key));
		model.setName(name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}

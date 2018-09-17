package com.wxl.modules.act.model.service;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.act.model.presistence.entity.ActivitiModeler;

public interface ActivitiModelerService extends SingleTableService<ActivitiModeler> {

	public String deploy(String id);
}

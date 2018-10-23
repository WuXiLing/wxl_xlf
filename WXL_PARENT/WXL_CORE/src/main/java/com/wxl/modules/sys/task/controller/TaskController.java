package com.wxl.modules.sys.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.singletable.controller.SingleTableController;
import com.wxl.modules.sys.role.presistence.entity.Role;
import com.wxl.modules.sys.task.presistence.entity.Task;
import com.wxl.modules.sys.task.service.TaskService;

/**
 * 任务Controller
 * 
 * @author liangxf
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/task")
public class TaskController extends SingleTableController<Task, TaskService> {

	protected void detailAfter(Role entity, Model model) {

		this.logger.debug("{} execute detailAfter process...");
	};

	@Override
	protected String viewPath() {
		return "sys/task";
	}

	@Override
	protected Task instance() {
		return new Task();
	}
}

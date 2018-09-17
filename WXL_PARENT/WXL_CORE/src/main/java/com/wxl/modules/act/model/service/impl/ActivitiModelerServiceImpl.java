package com.wxl.modules.act.model.service.impl;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.wxl.common.aop.OperLog;
import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.common.provider.utils.BasePage;
import com.wxl.common.utils.StringUtils;
import com.wxl.modules.act.model.presistence.entity.ActivitiModeler;
import com.wxl.modules.act.model.presistence.mapper.ActivitiModelerMapper;
import com.wxl.modules.act.model.service.ActivitiModelerService;

@Service
public class ActivitiModelerServiceImpl extends SingleTableServiceImpl<ActivitiModeler, ActivitiModelerMapper>
		implements ActivitiModelerService {

	@Autowired
	RepositoryService repositoryService;

	@Autowired
	ObjectMapper objectMapper;

	@Autowired
	ProcessEngine processEngine;

	@Override
	public void selectLayuiPageList(BasePage page) {

		ModelQuery modelQuery = repositoryService.createModelQuery().latestVersion().orderByLastUpdateTime().desc();

		page.setZs(modelQuery.count());

		page.setSj(modelQuery.listPage((int) ((page.getDqy() - 1) * page.getMygs()),
				(int) ((page.getDqy()) * page.getMygs())));
	}

	@Override
	@OperLog(operType = "修改")
	public ActivitiModeler update(ActivitiModeler entity) {

		// mapper.update(entity);

		return entity;
	}

	@Override
	@OperLog(operType = "新增")
	public ActivitiModeler insert(ActivitiModeler entity) {

		ObjectNode editorNode = objectMapper.createObjectNode();
		editorNode.put("id", "canvas");
		editorNode.put("resourceId", "canvas");
		ObjectNode properties = objectMapper.createObjectNode();
		properties.put("process_author", "wxl");
		editorNode.put("properties", properties);
		ObjectNode stencilset = objectMapper.createObjectNode();
		stencilset.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
		editorNode.put("stencilset", stencilset);

		Model model = repositoryService.newModel();

		entity.tranModel(model);
		model.setVersion(Integer
				.parseInt(String.valueOf(repositoryService.createModelQuery().modelKey(model.getKey()).count() + 1)));
		ObjectNode modelObjectNode = objectMapper.createObjectNode();
		modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, model.getName());
		modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, model.getVersion());
		modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, StringUtils.defaultString(entity.getRemarks()));
		model.setMetaInfo(modelObjectNode.toString());

		repositoryService.saveModel(model);
		try {
			repositoryService.addModelEditorSource(model.getId(), editorNode.toString().getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return entity;
	}

	@Override
	@Transactional(readOnly = false)
	@OperLog(operType = "删除")
	public void delete(String id) {
		deleteBefore(id);
		RepositoryService repositoryService = processEngine.getRepositoryService();
		repositoryService.deleteModel(id);
		deleteAfter(id);
	}

	public String deploy(String id) {
		String message = "";
		try {
			org.activiti.engine.repository.Model modelData = repositoryService.getModel(id);
			BpmnJsonConverter jsonConverter = new BpmnJsonConverter();

			byte[] bytes = repositoryService.getModelEditorSource(modelData.getId());
			if (bytes == null || bytes.length == 0) {
				return "模型数据为空，请先设计流程并成功保存，再进行发布。";
			}
			JsonNode editorNode = new ObjectMapper().readTree(bytes);
			BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);

			if (bpmnModel.getProcesses().size() == 0) {
				return "数据模型不符要求，请至少设计一条主线流程。";
			}
			BpmnXMLConverter xmlConverter = new BpmnXMLConverter();
			byte[] bpmnBytes = xmlConverter.convertToXML(bpmnModel);
			String processName = modelData.getName();
			if (!StringUtils.endsWith(processName, ".bpmn20.xml")) {
				processName += ".bpmn20.xml";
			}
			ByteArrayInputStream in = new ByteArrayInputStream(bpmnBytes);
			Deployment deployment = repositoryService.createDeployment().name(modelData.getName())
					.addInputStream(processName, in).deploy();

			// 设置流程分类
			List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery()
					.deploymentId(deployment.getId()).list();
			for (ProcessDefinition processDefinition : list) {
				repositoryService.setProcessDefinitionCategory(processDefinition.getId(), modelData.getCategory());
				message = "部署成功，流程ID=" + processDefinition.getId();
			}
			if (list.size() == 0) {
				message = "部署失败，没有流程。";
			}
		} catch (Exception e) {
			message = "设计模型图不正确，检查模型正确性，模型ID=" + id;
		}
		return message;
	}
}

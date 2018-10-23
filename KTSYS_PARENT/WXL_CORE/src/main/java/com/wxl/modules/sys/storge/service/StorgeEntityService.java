package com.wxl.modules.sys.storge.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.wxl.common.provider.singletable.service.SingleTableService;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;

/**
 * 文件存储
 * 
 * @author wxl
 *
 */
public interface StorgeEntityService extends SingleTableService<StorgeEntity> {

	public List<StorgeEntity> multiUpload(Map<String, MultipartFile> fils, String sys, String type);

	public StorgeEntity upload(MultipartFile file, String sys, String type) throws IOException;

	public void delete(String sys, String type, String id);	

	public List<StorgeEntity> findByEntityId(String sys, String type, String entityId);

	public void deleteByEntityId(String sys, String type, String entityId);
}

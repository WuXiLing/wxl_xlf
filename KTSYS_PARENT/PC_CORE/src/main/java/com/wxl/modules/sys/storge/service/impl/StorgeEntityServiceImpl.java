package com.wxl.modules.sys.storge.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.wxl.common.config.Global;
import com.wxl.common.provider.singletable.service.impl.SingleTableServiceImpl;
import com.wxl.common.utils.IdGen;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;
import com.wxl.modules.sys.storge.presistence.mapper.StorgeEntityMapper;
import com.wxl.modules.sys.storge.service.StorgeEntityService;

/**
 * 文件存储
 * 
 * @author wxl
 *
 */
@Service
@Transactional(readOnly = false)
@CacheConfig(cacheNames = "sys_storge")
public class StorgeEntityServiceImpl extends SingleTableServiceImpl<StorgeEntity, StorgeEntityMapper> implements StorgeEntityService{

	public List<StorgeEntity> multiUpload(Map<String, MultipartFile> fils, String sys, String type) {
		List<StorgeEntity> ids = new ArrayList<StorgeEntity>();
		try {
			Set<Map.Entry<String, MultipartFile>> s = fils.entrySet();
			Iterator<Map.Entry<String, MultipartFile>> its = s.iterator();
			while (its.hasNext()) {
				ids.add(upload(its.next().getValue(), sys, type));
			}
		} catch (IOException e) {
			return null;
		}
		return ids;
	}

	public StorgeEntity upload(MultipartFile file, String sys, String type) throws IOException {
		// 取得当前上传文件的文件名称
		String myFileName = file.getOriginalFilename();
		// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
		String prefix = myFileName.substring(myFileName.lastIndexOf(".") + 1);

		StorgeEntity entity = new StorgeEntity();
		entity.setId(IdGen.uuid());

		entity.setFileType(prefix);
		// storgeEntity.setEntityId(entity.getId());
		// 文件大小
		entity.setFileSize(file.getSize());
		// 物理名
		entity.setPhysicalName(myFileName);

		// 文件逻辑名称
		String fileLogicalName = IdGen.randomBase62(64);
		entity.setLogicalName(fileLogicalName);

		entity.setSys(sys);
		entity.setType(type);
		// storgeEntity.setLogicalModule(entity.getClass().getName());
		// 物理存放路径
		String path = File.separator + sys + File.separator + type + File.separator + formateData() + File.separator + fileLogicalName + "." + prefix;

		entity.setFilePhysicalPath(path);
		mapper.insert(entity);
		File localFile = new File(Global.getFilePath() + path);
		if (!localFile.exists()) {
			localFile.mkdirs();
		}
		file.transferTo(localFile);
		return entity;
	}

	public void delete(String sys, String type, String id) {
		StorgeEntity entity = this.get(id);
		if (entity != null) {
			File file = new File(Global.getFilePath() + entity.getFilePhysicalPath());
			if (file.exists()) {
				file.delete();
			}
		}
		mapper.delete(id);
	}

	private String formateData() {
		Calendar a = Calendar.getInstance();
		return a.get(Calendar.YEAR) + File.separator + (a.get(Calendar.MONTH) + 1) + File.separator + a.get(Calendar.DAY_OF_MONTH);
	}

	public List<StorgeEntity> findByEntityId(String sys, String type, String entityId) {
		return mapper.findByEntityId(entityId);
	}

	public void deleteByEntityId(String sys, String type, String entityId) {
		mapper.deleteByEntityId(entityId);
	}
}

package com.wxl.modules.sys.storge.presistence.mapper;

import java.util.List;

import com.wxl.common.persistence.annotation.MyBatisDao;
import com.wxl.common.provider.singletable.presistence.mapper.SingleTableMapper;
import com.wxl.modules.sys.storge.presistence.entity.StorgeEntity;

/**
 * 文件存儲
 * 
 * @author wxl
 *
 */
@MyBatisDao
public interface StorgeEntityMapper extends SingleTableMapper<StorgeEntity> {

    /**
     * 根据业务ID获取文件集合
     * 
     * @param entityId
     * @return
     */
    public List<StorgeEntity> findByEntityId(String entityId);

    /**
     * 根据业务ID删除文件
     * 
     * @param entityId
     */
    public void deleteByEntityId(String entityId);
}

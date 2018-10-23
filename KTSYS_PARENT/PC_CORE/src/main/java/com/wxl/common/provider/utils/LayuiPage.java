package com.wxl.common.provider.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxl.common.config.Global;
import com.wxl.common.provider.base.presistence.entity.ProviderEntity;

/**
 * Layui分页对象
 * 
 * @author Liang
 *
 */
public class LayuiPage extends BasePage {

	private long limit;

	private long page;

	private long count;

	private String code;

	private List<?> data;

	private String msg;

	private Map<String, Object> key = new HashMap<String, Object>() {

		private static final long serialVersionUID = -3100895286822931850L;

		{
			put("dbType", Global.getDBtype());
		}
	};

	@Override
	public long getZs() {
		return this.count;
	}

	@Override
	public long getMygs() {
		return this.limit;
	}

	@Override
	public long getDqy() {
		return this.page;
	}

	@Override
	public long getZys() {
		return count / limit;
	}

	@Override
	public void setZs(long zs) {
		this.count = zs;
	}

	@Override
	public void setMygs(long mygs) {
		this.limit = mygs;
	}

	@Override
	public void setSj(List<?> results) {
		this.data = results;
	}

	@Override
	public void setDqy(long dqy) {
		this.page = dqy;
	}

	@Override
	public void setZys(long zys) {

	}

	public long getLimit() {
		return limit;
	}

	public void setLimit(long limit) {
		this.limit = limit;
	}

	public long getPage() {
		return page;
	}

	public void setPage(long page) {
		this.page = page;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<? extends ProviderEntity> data) {
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getKey() {
		return key;
	}

	public void setKey(Map<String, Object> key) {
		this.key = key;
	}

	public void addKey(String key, Object obj) {
		this.key.put(key, obj);
	}

	public Map<String, Object> getCm() {
		return key;
	}
}

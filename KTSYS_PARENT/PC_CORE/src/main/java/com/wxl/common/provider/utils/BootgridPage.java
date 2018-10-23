package com.wxl.common.provider.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxl.common.provider.base.presistence.entity.ProviderEntity;

/**
 * Bootgrid分页工具
 * 
 * @author wxl
 * 
 * @date 2017年7月19日 下午1:17:58
 */
public class BootgridPage extends BasePage{

	/** 当前页码 **/
	private long current;

	/** 每页数量 **/
	private long rowCount;

	/** 总记录 **/
	private long total;

	/** 总记录数, 默认为-1, 表示需要查询 **/
	protected long totalRecord = -1;

	/** 总页数, 默认为-1, 表示需要计算 **/
	protected long totalPage = -1;

	/** 当前页记录List形式 **/
	protected List<?> results;

	/** 设置页面传递的查询参数 **/
	public Map<String, Object> params = new HashMap<String, Object>();

	/** 查询参数 **/
	private String searchPhrase;

	/**
	 * @return current
	 */
	public long getCurrent() {
		return current;
	}

	/**
	 * @param current
	 *            要设置的 current
	 */
	public void setCurrent(int current) {
		this.current = current;
	}

	/**
	 * @return rowCount
	 */
	public long getRowCount() {
		return rowCount;
	}

	/**
	 * @param rowCount
	 *            要设置的 rowCount
	 */
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	/**
	 * @return total
	 */
	public long getTotal() {
		return total;
	}

	/**
	 * @param total
	 *            要设置的 total
	 */
	public void setTotal(long total) {
		this.total = total;
	}

	/**
	 * @return totalRecord
	 */
	public long getTotalRecord() {
		return totalRecord;
	}

	/**
	 * @param totalRecord
	 *            要设置的 totalRecord
	 */
	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
	}

	/**
	 * @return totalPage
	 */
	public long getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalPage
	 *            要设置的 totalPage
	 */
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return results
	 */
	public List<?> getResults() {
		return results;
	}

	/**
	 * @param results
	 *            要设置的 results
	 */
	public void setResults(List<?> results) {
		this.results = results;
	}

	/**
	 * @return params
	 */
	public Map<String, Object> getParams() {
		return params;
	}

	/**
	 * @param params
	 *            要设置的 params
	 */
	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	
	/**
	 * @return params
	 */
	public Map<String, Object> getCm() {
		return params;
	}


	/**
	 * @return searchPhrase
	 */
	public String getSearchPhrase() {
		return searchPhrase;
	}

	/**
	 * @param searchPhrase
	 *            要设置的 searchPhrase
	 */
	public void setSearchPhrase(String searchPhrase) {
		this.searchPhrase = searchPhrase;
	}

	@Override
	public long getZs() {
		return this.getTotal();
	}

	@Override
	public long getMygs() {
		return this.getRowCount();
	}

	@Override
	public long getDqy() {
		return this.getCurrent();
	}

	@Override
	public long getZys() {
		return this.getTotalPage();
	}

	@Override
	public void setZs(long zs) {
		this.total = zs;
	}

	@Override
	public void setMygs(long mygs) {
		this.rowCount = mygs;
	}

	@Override
	public void setSj(List<?> results) {
		this.setResults(results);
	}

	@Override
	public void setDqy(long dqy) {
		this.current = dqy;
	}

	@Override
	public void setZys(long zys) {
		this.setTotalPage(zys);
	}

}

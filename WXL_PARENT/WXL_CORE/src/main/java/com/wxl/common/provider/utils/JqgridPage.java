package com.wxl.common.provider.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxl.common.config.Global;
import com.wxl.common.provider.base.presistence.entity.ProviderEntity;

/**
 * Jqgrid分页工具
 * 
 * @author wxl
 * 
 * @date 2017年11月07日 下午1:17:58
 */
public class JqgridPage extends BasePage {

	/** 当前页码 **/
	private long page;

	/** 每页记录数  */
	private long rows;
	
	/** 总页数 */
	private long total;

	private String nd;
	
	/**总记录数*/
	private long records;

	private Map<String, String> searchFields = new HashMap<String, String>(0);
	
	private Map<String, String[]> searchArrays = new HashMap<String, String[]>(0);

	/** 排序属性 */
	private String sidx;

	/** 排序的方式：desc\asc */
	private String sord;

	/** 当前页记录List形式 **/
	protected List<?> results;

	/** 设置页面传递的查询参数 **/
	public Map<String, Object> params = new HashMap<String, Object>(){

		private static final long serialVersionUID = 5191873388281302611L;
		
		{
			put("dbType", Global.getDBtype());
		}
	};

	/**
	 * @return page
	 */
	public long getPage() {
		return page;
	}

	/**
	 * @param page
	 *            要设置的 page
	 */
	public void setPage(long page) {
		this.page = page;
	}

	/**
	 * @return rows
	 */
	public List<?> getResults() {
		return results;
	}

	/**
	 * @param rows
	 *            要设置的 rows
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
	 * @return the sidx
	 */
	public String getSidx() {
		return sidx;
	}

	/**
	 * @param sidx
	 *            the sidx to set
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	/**
	 * @return the sord
	 */
	public String getSord() {
		return sord;
	}

	/**
	 * @param sord
	 *            the sord to set
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}

	/**
	 * @return the rows
	 */
	public long getRows() {
		return rows;
	}

	/**
	 * @param rows the rows to set
	 */
	public void setRows(long rows) {
		this.rows = rows;
	}

	/**
	 * @return the nd
	 */
	public String getNd() {
		return nd;
	}

	/**
	 * @param nd the nd to set
	 */
	public void setNd(String nd) {
		this.nd = nd;
	}

	/**
	 * @return the searchFields
	 */
	public Map<String, String> getSearchFields() {
		return searchFields;
	}

	/**
	 * @param searchFields the searchFields to set
	 */
	public void setSearchFields(Map<String, String> searchFields) {
		this.searchFields = searchFields;
	}

	/**
	 * @return the searchArrays
	 */
	public Map<String, String[]> getSearchArrays() {
		return searchArrays;
	}

	/**
	 * @param searchArrays the searchArrays to set
	 */
	public void setSearchArrays(Map<String, String[]> searchArrays) {
		this.searchArrays = searchArrays;
	}

	/**
	 * @return the total
	 */
	public long getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(long total) {
		this.total = total;
	}

	/**
	 * @return the records
	 */
	public long getRecords() {
		return records;
	}

	/**
	 * @param records the records to set
	 */
	public void setRecords(long records) {
		this.records = records;
	}

	@Override
	public long getZs() {
		return this.getRecords();
	}

	@Override
	public long getMygs() {
		return this.getRows();
	}

	@Override
	public long getDqy() {
		return this.getPage();
	}

	@Override
	public long getZys() {
		return this.getTotal();
	}

	@Override
	public void setZs(long zs) {
		this.setRecords(zs);
	}

	@Override
	public void setMygs(long mygs) {
		this.setMygs(mygs);
	}

	@Override
	public void setSj(List<?> results) {
		this.setResults(results);
	}

	@Override
	public void setDqy(long dqy) {
		this.setPage(dqy);
	}

	@Override
	public void setZys(long zys) {
		this.setTotal(zys);
	}
}

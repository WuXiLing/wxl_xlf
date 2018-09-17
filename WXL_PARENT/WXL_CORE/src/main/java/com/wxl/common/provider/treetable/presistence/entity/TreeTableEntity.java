package com.wxl.common.provider.treetable.presistence.entity;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wxl.common.provider.base.presistence.entity.BaseEntity;

/**
 * 树基类
 * 
 * @author wxl
 * 
 * @date 2017年7月11日 下午3:24:52
 */
public abstract class TreeTableEntity<T extends BaseEntity> extends BaseEntity {

	private static final long	serialVersionUID	= 1888960337703161300L;

	protected T					parent;

	/** 编码 **/
	protected String			code;

	/** 名称 **/
	protected String			name;

	/** 层级（深度） **/
	protected int				depth;

	/** 全名称 **/
	protected String			longName;

	/** 全码 **/
	protected String			longCode;

	/** 排序号 **/
	protected int				sort;

	private boolean				isLeaf				= false;

	private boolean				expanded			= true;

	private List<T>				childrens			= new ArrayList<T>();

	/**
	 * @return parent
	 */
	public T getParent() {

		return parent;
	}
	
	@JsonIgnore
	public static void sortList(List<TreeTableEntity<?  extends BaseEntity>> list, List<TreeTableEntity<?  extends BaseEntity>> sourcelist, String parentId, boolean cascade) {

		for (int i = 0; i < sourcelist.size(); i++) {
			TreeTableEntity<?  extends BaseEntity> e = sourcelist.get(i);
			if (e.getParent() != null && e.getParent().getId() != null && e.getParent().getId().equals(parentId)) {
				list.add(e);
				if (cascade) {
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j = 0; j < sourcelist.size(); j++) {
						TreeTableEntity<?  extends BaseEntity> child = sourcelist.get(j);
						if (child.getParent() != null && child.getParent().getId() != null && child.getParent().getId().equals(e.getId())) {
							sortList(list, sourcelist, e.getId(), true);
							break;
						}
					}
				}
			}
		}
	}
	

	/**
	 * @param parent
	 *            要设置的 parent
	 */
	public void setParent(T parent) {

		this.parent = parent;
	}

	/**
	 * @param parentId
	 *            要设置的 parentId
	 */
	public void setParentId(String parentId) {
		if(this.parent == null) {
			this.parent = initParent();
		}
		this.parent.setId(parentId);
	};

	public abstract T initParent();
	
	/**
	 * @return code
	 */
	public String getCode() {

		return code;
	}

	/**
	 * @param code
	 *            要设置的 code
	 */
	public void setCode(String code) {

		this.code = code;
	}

	/**
	 * @return name
	 */
	public String getName() {

		return name;
	}

	/**
	 * @param name
	 *            要设置的 name
	 */
	public void setName(String name) {

		this.name = name;
	}

	/**
	 * @return depth
	 */
	public int getDepth() {

		return depth;
	}

	/**
	 * @param depth
	 *            要设置的 depth
	 */
	public void setDepth(int depth) {

		this.depth = depth;
	}

	/**
	 * @return longName
	 */
	public String getLongName() {

		return longName;
	}

	/**
	 * @param longName
	 *            要设置的 longName
	 */
	public void setLongName(String longName) {

		this.longName = longName;
	}

	/**
	 * @return longCode
	 */
	public String getLongCode() {

		return longCode;
	}

	/**
	 * @param longCode
	 *            要设置的 longCode
	 */
	public void setLongCode(String longCode) {

		this.longCode = longCode;
	}

	/**
	 * @return sort
	 */
	public int getSort() {

		return sort;
	}

	/**
	 * @param sort
	 *            要设置的 sort
	 */
	public void setSort(int sort) {

		this.sort = sort;
	}

	/**
	 * @return the level
	 */
//	public int getLevel() {
//
//		if (StringUtils.isNoneBlank(this.getLongCode())) {
//			String [] x = this.getLongCode().split(",");
//			if (x != null) {
//				return x.length > 1 ? x.length - 1 : 1;
//			}
//		}
//		return level;
//	}

	/**
	 * @param level
	 *            the level to set
	 */
//	public void setLevel(int level) {
//
//		this.level = level;
//	}

	/**
	 * @return the isLeaf
	 */
	public boolean getIsLeaf() {

		if (this.childrens.isEmpty()) {
			return true;
		}
		return isLeaf;
	}

	/**
	 * @param isLeaf
	 *            the isLeaf to set
	 */
	public void setIsLeaf(boolean isLeaf) {

		this.isLeaf = isLeaf;
	}

	/**
	 * @return the expanded
	 */
	public boolean isExpanded() {

		if (this.childrens.isEmpty()) {
			return false;
		}
		return expanded;
	}

	/**
	 * @param expanded
	 *            the expanded to set
	 */
	public void setExpanded(boolean expanded) {

		this.expanded = expanded;
	}

	/**
	 * @return the childrens
	 */
	public List<T> getChildrens() {

		return childrens;
	}

	/**
	 * @param childrens
	 *            the childrens to set
	 */
	public void setChildrens(List<T> childrens) {

		this.childrens = childrens;
	}
	
	/**
	 * @param isLeaf the isLeaf to set
	 */
	public void setLeaf(boolean isLeaf) {
	
		this.isLeaf = isLeaf;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {

		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + depth;
		result = prime * result + ((longCode == null) ? 0 : longCode.hashCode());
		result = prime * result + ((longName == null) ? 0 : longName.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + sort;
		return result;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public boolean equals(Object obj) {

		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		TreeTableEntity<T> other = (TreeTableEntity<T>) obj;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (depth != other.depth)
			return false;
		if (longCode == null) {
			if (other.longCode != null)
				return false;
		} else if (!longCode.equals(other.longCode))
			return false;
		if (longName == null) {
			if (other.longName != null)
				return false;
		} else if (!longName.equals(other.longName))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (sort != other.sort)
			return false;
		return true;
	}

	/*
	 * （非 Javadoc）
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {

		return "TreeTableEntity [code=" + code + ", name=" + name + ", depth=" + depth + ", longName=" + longName + ", longCode=" + longCode + ", sort=" + sort + "]";
	}
}

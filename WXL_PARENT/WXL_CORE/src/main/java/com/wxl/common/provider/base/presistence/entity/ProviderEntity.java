package com.wxl.common.provider.base.presistence.entity;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.wxl.common.json.WxlJsonPropertyNamingStrategy;

/*@Entity*/
@JsonSerialize
@JsonNaming(WxlJsonPropertyNamingStrategy.class)
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class ProviderEntity implements Serializable, Cloneable {

	private static final long	serialVersionUID	= 9120845985688338844L;

	/**
	 * 实体编号（唯一标识）
	 */
	protected String			id;

	public ProviderEntity() {

		super();
	}

	public ProviderEntity(String id) {

		super();
		this.id = id;
	}

	public String getId() {

		return id;
	}

	public void setId(String id) {

		this.id = id;
	}

	@Override
	public int hashCode() {

		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {

		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProviderEntity other = (ProviderEntity) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {

		return ReflectionToStringBuilder.toString(this);
	}

	public Object clone() throws CloneNotSupportedException {

		return super.clone();
	}
}

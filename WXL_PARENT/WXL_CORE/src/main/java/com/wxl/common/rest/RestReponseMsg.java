package com.wxl.common.rest;

import java.util.Objects;

import com.alibaba.fastjson.JSON;

public class RestReponseMsg implements java.io.Serializable {

	private static final long serialVersionUID = -6016291525217752497L;

	private int status;

	private Object reponseBody;

	private String message;

	
	public RestReponseMsg() {
		super();
	}

	public RestReponseMsg(Integer status, String message, Object data) {
		this.status = status;
		this.message = message;
		this.reponseBody = data;
		
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Object getReponseBody() {
		return reponseBody;
	}

	public void setReponseBody(Object reponseBody) {
		this.reponseBody = reponseBody;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {

		if (Objects.isNull(this.reponseBody)) {
			this.setReponseBody(new Object());
		}
		return JSON.toJSONString(this);
	}
}

package com.wxl.common.rest;

import java.util.Objects;

import com.alibaba.fastjson.JSON;

public class RestReponseMsg implements java.io.Serializable {

	private static final long serialVersionUID = -6016291525217752497L;

	private int resultcode;

	private Object reponseBody;

	private String message;

	
	public RestReponseMsg() {
		super();
		this.resultcode = ResponseFormat.SUCCESS;
	}

	public RestReponseMsg(Integer resultcode, String message, Object data) {
		this.resultcode = resultcode;
		this.message = message;
		this.reponseBody = data;
		
	}

	public int getResultcode() {
		return resultcode;
	}

	public void setResultcode(int resultcode) {
		this.resultcode = resultcode;
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

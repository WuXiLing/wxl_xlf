package com.wxl.common.rest;

public class RestReponseMsg<T> implements java.io.Serializable {

	private static final long serialVersionUID = -6016291525217752497L;
	
	private int code;

	private T reponseBody;

	private String msg;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getReponseBody() {
		return reponseBody;
	}

	public void setReponseBody(T reponseBody) {
		this.reponseBody = reponseBody;
	}

	@Override
	public String toString() {
		return "RestReponseMsg [code=" + code + ", reponseBody=" + reponseBody + ", msg=" + msg + "]";
	}
}

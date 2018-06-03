package com.anand_atm.common;

import java.util.List;

public class AjaxResponseBody {

	private String statusMessage;
	private String statusCode;
	private List<Object> resultList;
	private Object resultObject;
	private String data;
	
	public List<Object> getResultList() {
		return resultList;
	}
	public void setResultList(List<Object> resultList) {
		this.resultList = resultList;
	}
	public Object getResultObject() {
		return resultObject;
	}
	public void setResultObject(Object resultObject) {
		this.resultObject = resultObject;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getStatusMessage() {
		return statusMessage;
	}
	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public List<Object> getResult() {
		return resultList;
	}
	public void setResult(List<Object> resultList) {
		this.resultList = resultList;
	}
	
	public void setSuccess() {
		this.statusCode="200";
		this.statusMessage="SUCCESS";
	}
	public void setFailure() {
		this.statusCode="403";
		this.statusMessage="ERROR";
	}
	
}

package com.anand_atm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anand_atm.beans.MobileDetails;
import com.anand_atm.common.AjaxResponseBody;

@Controller
public class AjaxController {

	@RequestMapping(value="/getButton", method=RequestMethod.GET)
	public @ResponseBody AjaxResponseBody getMethodCall() {
		AjaxResponseBody resp = new AjaxResponseBody();
		resp.setStatusCode("200");
		resp.setStatusMessage("SUCCESS");
		resp.setData("Get Method Success");
		return resp;
	}
	
	@RequestMapping(value="/postButton", method=RequestMethod.POST)
	public @ResponseBody AjaxResponseBody postMethodCall(@RequestBody MobileDetails mobile) {
		AjaxResponseBody resp = new AjaxResponseBody();
		if(isValidData(mobile)) {
			resp.setSuccess();
			resp.setData("Mobile POST call Success.");
		}else {
			resp.setFailure();
			resp.setData("Mobile POST call Failure");
		}
		return resp;
	}
	
	@RequestMapping(value="/putButton", method=RequestMethod.PUT)
	public @ResponseBody AjaxResponseBody putMethodCall(@RequestBody MobileDetails mobile) {
		AjaxResponseBody resp = new AjaxResponseBody();
		if(isValidData(mobile)) {
			resp.setSuccess();
			resp.setData("Mobile PUT call Success.");
		}else {
			resp.setFailure();
			resp.setData("Mobile PUT call Failure");
		}
		return resp;
	}
	
	@RequestMapping(value="/deleteButton", method=RequestMethod.DELETE)
	public @ResponseBody AjaxResponseBody deleteMethodCall(@RequestBody MobileDetails mobile) {
		AjaxResponseBody resp = new AjaxResponseBody();
		if(isValidData(mobile)) {
			resp.setSuccess();
			resp.setData("Mobile DELETE call Success.");
		}else {
			resp.setFailure();
			resp.setData("Mobile DELETE call Failure");
		}
		return resp;
	}
	
	private boolean isValidData(MobileDetails mobile) {
		boolean valid = true;
		if(mobile == null) {
			valid=false;
		}
		if(StringUtils.isEmpty(mobile.getMobileNumber()) && StringUtils.isEmpty(mobile.getUserName())) {
			valid=false;
		}
		return valid;
	}
	
}

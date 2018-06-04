package com.anand_atm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.anand_atm.beans.MobileDetails;
import com.anand_atm.common.AjaxResponseBody;
import com.anand_atm.services.MobileDetailsService;

@Controller
public class MobileController {

	@Autowired
	MobileDetailsService mobileService;

	@RequestMapping(value = "/mobiles", method = RequestMethod.GET)
	public ModelAndView getAllMobile() {
		ModelAndView model = new ModelAndView("mobileData");
		List<MobileDetails> mobileList = mobileService.getMobileDetails();
		model.addObject("mobileList", mobileList);
		return model;
	}
	
	@RequestMapping(value="/saveMobile", method=RequestMethod.POST)
	public @ResponseBody AjaxResponseBody saveMobileDetails(@RequestBody MobileDetails mobile) {
		AjaxResponseBody resp = new AjaxResponseBody();
		boolean saveFlag =	mobileService.newMobileDetails(mobile);
		if(saveFlag) {
			resp.setSuccess();
			resp.setData("Successfully saved Mobile number "+mobile.getMobileNumber());
		}
		else {
			resp.setFailure();
			resp.setData("Cant not able to save Mobile Number "+mobile.getMobileNumber()+". Please Try Again.");
		}
		return resp;
	}
	
	@RequestMapping(value="/updateMobile", method=RequestMethod.POST)
	public @ResponseBody AjaxResponseBody updateMobileDetails(@RequestBody MobileDetails mobile) {
		AjaxResponseBody resp = new AjaxResponseBody();
		boolean saveFlag =	mobileService.updateMobileNumber(mobile);
		if(saveFlag) {
			resp.setSuccess();
			resp.setData("Successfully updated Mobile number "+mobile.getMobileNumber());
		}
		else {
			resp.setFailure();
			resp.setData("Cant not able to update Mobile Number "+mobile.getMobileNumber()+". Please Try Again.");
		}
		return resp;
	}
	
	@RequestMapping(value="/rechargeMobile", method=RequestMethod.POST)
	public @ResponseBody AjaxResponseBody rechargeMobileDetails(@RequestBody MobileDetails mobile) {
		AjaxResponseBody resp = new AjaxResponseBody();
		boolean saveFlag =	mobileService.rechargeMobileNumber(mobile);
		if(saveFlag) {
			resp.setSuccess();
			resp.setData("Successfully rechrged Mobile number "+mobile.getMobileNumber());
		}
		else {
			resp.setFailure();
			resp.setData("Cant not able to recharge Mobile Number "+mobile.getMobileNumber()+". Please Try Again.");
		}
		return resp;
	}
}

package com.anand_atm.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.anand_atm.beans.DTHDetails;
import com.anand_atm.common.AjaxResponseBody;
import com.anand_atm.services.DTHDetailsService;

@Controller
public class DthController {

	@Autowired
	DTHDetailsService dthService;

	@RequestMapping(value = "/dths", method = RequestMethod.GET)
	public ModelAndView getAllMobile() {
		ModelAndView model = new ModelAndView("dthData");
		List<DTHDetails> dthList = dthService.getDTHDetails();
		model.addObject("dthList", dthList);
		return model;
	}

	@RequestMapping(value = "/saveDth", method = RequestMethod.POST)
	public @ResponseBody AjaxResponseBody saveMobileDetails(@RequestBody DTHDetails dth) {
		AjaxResponseBody resp = new AjaxResponseBody();
		boolean saveFlag = dthService.newDthDetails(dth);
		if (saveFlag) {
			resp.setSuccess();
			resp.setData("Successfully saved Dth number " + dth.getDthNumber());
		} else {
			resp.setFailure();
			resp.setData("Cant not able to save Dth Number " + dth.getDthNumber() + ". Please Try Again.");
		}
		return resp;
	}
	@RequestMapping(value="/updateDth", method=RequestMethod.POST)
	public @ResponseBody AjaxResponseBody updateMobileDetails(@RequestBody DTHDetails dth) {
		AjaxResponseBody resp = new AjaxResponseBody();
		boolean saveFlag =	dthService.updateDTHNumber(dth);
		if(saveFlag) {
			resp.setSuccess();
			resp.setData("Successfully updated DTH number "+dth.getDthNumber());
		}
		else {
			resp.setFailure();
			resp.setData("Cant not able to update DTH Number "+dth.getDthNumber()+". Please Try Again.");
		}
		return resp;
	}
	
	@RequestMapping(value="/rechargeDth", method=RequestMethod.POST)
	public @ResponseBody AjaxResponseBody rechargeMobileDetails(@RequestBody DTHDetails dth) {
		AjaxResponseBody resp = new AjaxResponseBody();
		boolean saveFlag =	dthService.rechargeDTHNumber(dth);
		if(saveFlag) {
			resp.setSuccess();
			resp.setData("Successfully recharged DTH number "+dth.getDthNumber());
		}
		else {
			resp.setFailure();
			resp.setData("Cant not able to rechare DTH Number "+dth.getDthNumber()+". Please Try Again.");
		}
		return resp;
	}
}

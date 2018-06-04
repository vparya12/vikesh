package com.anand_atm.dao;

import java.util.List;

import com.anand_atm.beans.MobileDetails;

public interface MobileDAO {

	public boolean newMobileDetails(MobileDetails mobileVo);
	
	public List<MobileDetails> getMobileDetails();
	
	public boolean updateMobileNumber(MobileDetails mobileDetails);
	
	public boolean rechargeMobileNumber(MobileDetails mobileDetails);
	
	public boolean deleteMobileNumber(MobileDetails mobileDetails);
	
}

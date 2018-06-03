package com.anand_atm.services;

import java.util.List;

import com.anand_atm.beans.MobileDetails;

public interface MobileDetailsService {

	public boolean newMobileDetails(MobileDetails mobileVO);
	
	public List<MobileDetails> getMobileDetails();
	
	public boolean updateMobileNumber(MobileDetails mobileDetails);
	
	public boolean deleteMobileNumber(MobileDetails mobileDetails);
	
		
}

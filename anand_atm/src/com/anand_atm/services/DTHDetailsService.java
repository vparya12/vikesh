package com.anand_atm.services;

import java.util.List;

import com.anand_atm.beans.DTHDetails;

public interface DTHDetailsService {
	
	public boolean newDthDetails(DTHDetails dthVO);
	
	public List<DTHDetails> getDTHDetails();
	
	public boolean updateDTHNumber(DTHDetails dthDetails);
	
	public boolean deleteDTHNumber(DTHDetails dthDetails);
}

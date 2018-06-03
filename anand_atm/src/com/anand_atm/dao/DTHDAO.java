package com.anand_atm.dao;

import java.util.List;

import com.anand_atm.beans.DTHDetails;

public interface DTHDAO {

	public boolean newDthDetails(DTHDetails dthVO);
	
	public List<DTHDetails> getDTHDetails();
	
	public boolean updateDTHNumber(DTHDetails dthDetails);
	
	public boolean deleteDTHNumber(DTHDetails dthDetails);
	
}


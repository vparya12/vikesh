 package com.anand_atm.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anand_atm.beans.DTHDetails;
import com.anand_atm.dao.DTHDAO;

@Service
public class DTHDetailsServiceImpl implements DTHDetailsService {

	@Autowired
	DTHDAO dthDao;

	@Override
	public List<DTHDetails> getDTHDetails() {
		List<DTHDetails> dthList = dthDao.getDTHDetails();
		return dthList;
	}

	@Override
	public boolean updateDTHNumber(DTHDetails dthDetails) {
		return dthDao.updateDTHNumber(dthDetails);
		
	}

	@Override
	public boolean deleteDTHNumber(DTHDetails dthDetails) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean newDthDetails(DTHDetails dthVO) {
		if(dthVO.getAlternativeNumber() == null) {
			dthVO.setAlternativeNumber(0L);
		}
		dthVO.setLastRechargedAmount(dthVO.getRechargeAmount());
		boolean flag = dthDao.newDthDetails(dthVO);
		return flag;
	}

}

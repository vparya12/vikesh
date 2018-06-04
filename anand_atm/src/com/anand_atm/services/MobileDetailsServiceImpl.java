package com.anand_atm.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.anand_atm.beans.MobileDetails;
import com.anand_atm.dao.MobileDAO;


@Service
public class MobileDetailsServiceImpl implements MobileDetailsService{

	@Autowired
	private MobileDAO mobileDao;

	@Override
	public List<MobileDetails> getMobileDetails() {
		List<MobileDetails> mobileList = mobileDao.getMobileDetails();
		return mobileList;
	}

	@Override
	public boolean updateMobileNumber(MobileDetails mobileDetails) {
		return mobileDao.updateMobileNumber(mobileDetails);
	}

	@Override
	public boolean deleteMobileNumber(MobileDetails mobileDetails) {
		return false;
		
	}

	@Override
	public boolean newMobileDetails(MobileDetails mobileVO) {
		if(mobileVO.getAlternativeNumber() == null) {
			mobileVO.setAlternativeNumber(0L);
		}
		mobileVO.setLastRechargedAmount(mobileVO.getRechargeAmount());
		boolean flag = mobileDao.newMobileDetails(mobileVO);
		return flag;
	}

	@Override
	public boolean rechargeMobileNumber(MobileDetails mobileDetails) {
		return mobileDao.rechargeMobileNumber(mobileDetails);
	}

}

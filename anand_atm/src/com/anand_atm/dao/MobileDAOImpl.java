package com.anand_atm.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import com.anand_atm.beans.MobileDetails;
import com.anand_atm.common.Constant;

@Component
public class MobileDAOImpl implements MobileDAO {
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public MobileDAOImpl(DataSource dataSource) {
		namedParameterJdbcTemplate=new NamedParameterJdbcTemplate(dataSource);
	}
	
	@Override
	public boolean updateMobileNumber(MobileDetails mobileVo) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("MOBILENUMBER", mobileVo.getMobileNumber());
		parameter.put("NETWORK", mobileVo.getNetwork());
		parameter.put("USERNAME", mobileVo.getUserName());
		parameter.put("ALTNUMBER", mobileVo.getAlternativeNumber());
		parameter.put("VALADITY", mobileVo.getValidDays());
		parameter.put("AMOUNT", mobileVo.getLastRechargedAmount());
		parameter.put("PAYMENT", mobileVo.isPayment());
		parameter.put("ID", mobileVo.getId());
		
		int result = namedParameterJdbcTemplate.update(Constant.RECHARGE_MOBILE, parameter);
		if(result==1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteMobileNumber(MobileDetails mobileDetails) {
		return false;
		
	}

	@Override
	public List<MobileDetails> getMobileDetails() {
		List<MobileDetails> mobileList = namedParameterJdbcTemplate.query(Constant.GET_ALL_MOBILE_NUMBER, new HashMap<String,Object>(), rs -> {
			List<MobileDetails> mobileLists = new ArrayList<MobileDetails>();
			if(rs!=null) {
				while(rs.next()) {
					MobileDetails mobile = new MobileDetails();
					
					mobile.setMobileNumber(rs.getLong("MOBILENUMBER"));
					mobile.setAlternativeNumber(rs.getLong("ALTNUMBER"));
					mobile.setNetwork(rs.getString("NETWORK"));
					mobile.setUserName(rs.getString("USERNAME"));
					mobile.setLastRechargedDate(rs.getDate("RECHARGEDATE"));
					mobile.setLastRechargedAmount(rs.getInt("AMOUNT"));
					mobile.setPayment(rs.getBoolean("PAYMENT"));
					mobile.setValidDays(rs.getInt("VALADITY"));
					mobile.setRemainingDays(rs.getInt("LEFTDAYS"));
					mobile.setNextRechargeDate(rs.getDate("NEXTRECHARGEDATE"));
					mobile.setId(rs.getInt("ID"));
					
					mobileLists.add(mobile);
				}
			}
			return mobileLists;
		});
		return mobileList;
	}


	@Override
	public boolean newMobileDetails(MobileDetails mobileVo) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("MOBILENUMBER", mobileVo.getMobileNumber());
		parameter.put("NETWORK", mobileVo.getNetwork());
		parameter.put("USERNAME", mobileVo.getUserName());
		parameter.put("VALADITY", mobileVo.getValidDays());
		parameter.put("ALTNUMBER", mobileVo.getAlternativeNumber());
		parameter.put("AMOUNT", mobileVo.getRechargeAmount());
		parameter.put("PAYMENT", mobileVo.isPayment());
		
		int result = namedParameterJdbcTemplate.update(Constant.INSERT_NEW_MOBILE, parameter);
		if(result==1) {
			return true;
		}else {
			return false;
		}
	}


	@Override
	public boolean rechargeMobileNumber(MobileDetails mobileVo) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("VALADITY", mobileVo.getValidDays());
		parameter.put("AMOUNT", mobileVo.getRechargeAmount());
		parameter.put("PAYMENT", mobileVo.isPayment());
		parameter.put("ID", mobileVo.getId());
		
		int result = namedParameterJdbcTemplate.update(Constant.RECHARGE_MOBILE, parameter);
		if(result==1) {
			return true;
		}else {
			return false;
		}
	}
	
	
}

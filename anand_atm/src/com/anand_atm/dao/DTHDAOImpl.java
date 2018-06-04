package com.anand_atm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import com.anand_atm.beans.DTHDetails;
import com.anand_atm.common.Constant;

@Component
public class DTHDAOImpl implements DTHDAO {
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<DTHDetails> getDTHDetails() {
		//Java 8 coding
		List<DTHDetails> dthList = namedParameterJdbcTemplate.query(Constant.GET_ALL_DTH_NUMBER, new HashMap<String,Object>(), rs -> {
			List<DTHDetails> dth_List = new ArrayList<>();
			if(rs!=null) {
				while(rs.next()) {
					DTHDetails dth = new DTHDetails();
					dth.setDthNumber(rs.getLong("DTHNUMBER"));
					dth.setMobileNumber(rs.getLong("MOBILENUMBER"));
					dth.setAlternativeNumber(rs.getLong("ALTNUMBER"));
					dth.setLastRechargedDate(rs.getDate("RECHARGEDATE"));
					dth.setNetwork(rs.getString("NETWORK"));
					dth.setPayment(rs.getBoolean("PAYMENT"));
					dth.setUserName(rs.getString("USERNAME"));
					dth.setValidDays(rs.getInt("VALADITY"));
					dth.setLastRechargedAmount(rs.getInt("AMOUNT"));
					dth.setRemainingDays(rs.getInt("LEFTDAYS"));
					dth.setNextRechargeDate(rs.getDate("NEXTRECHARGEDATE"));
					dth.setId(rs.getInt("ID"));
					
					dth_List.add(dth);
				}
			}
			return dth_List;
			
		});
		return dthList;
	}

	@Override
	public boolean updateDTHNumber(DTHDetails dthVO) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("DTHNUMBER", dthVO.getDthNumber());
		parameter.put("MOBILENUMBER", dthVO.getMobileNumber());
		parameter.put("NETWORK", dthVO.getNetwork());
		parameter.put("USERNAME", dthVO.getUserName());
		parameter.put("VALADITY", dthVO.getValidDays());
		parameter.put("AMOUNT", dthVO.getLastRechargedAmount());
		parameter.put("ALTNUMBER", dthVO.getAlternativeNumber());
		parameter.put("PAYMENT", dthVO.isPayment());
		parameter.put("ID", dthVO.getId());
		
		int result = namedParameterJdbcTemplate.update(Constant.UPDATE_DTH, parameter);
		if(result==1) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean deleteDTHNumber(DTHDetails dthDetails) {
		return false;
		
	}

	@Override
	public boolean newDthDetails(DTHDetails dthVO) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("DTHNUMBER", dthVO.getDthNumber());
		parameter.put("MOBILENUMBER", dthVO.getMobileNumber());
		parameter.put("NETWORK", dthVO.getNetwork());
		parameter.put("USERNAME", dthVO.getUserName());
		parameter.put("VALADITY", dthVO.getValidDays());
		parameter.put("AMOUNT", dthVO.getRechargeAmount());
		parameter.put("ALTNUMBER", dthVO.getAlternativeNumber());
		parameter.put("PAYMENT", dthVO.isPayment());
		
		int result = namedParameterJdbcTemplate.update(Constant.INSERT_NEW_DTH, parameter);
		if(result==1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean rechargeDTHNumber(DTHDetails dthVO) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("VALADITY", dthVO.getValidDays());
		parameter.put("AMOUNT", dthVO.getRechargeAmount());
		parameter.put("PAYMENT", dthVO.isPayment());
		parameter.put("ID", dthVO.getId());
		
		int result = namedParameterJdbcTemplate.update(Constant.RECHARGE_DTH, parameter);
		if(result==1) {
			return true;
		}else {
			return false;
		}
		
	}

}

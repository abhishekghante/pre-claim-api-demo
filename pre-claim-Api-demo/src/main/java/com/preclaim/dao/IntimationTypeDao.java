package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.IntimationType;
import com.preclaim.models.IntimationTypeList;

public interface IntimationTypeDao {
	
	String add_intimationType(IntimationType intimationType);
	List<IntimationTypeList> intimationType_list(int status);
	String deleteIntimationType(int intimationId);
	String updateIntimationType(int intimationId, String intimationType, int userID);
	String updateIntimationTypeStatus(int intimationId,int status, int userID);
	public List<IntimationType> getActiveIntimationType();
}

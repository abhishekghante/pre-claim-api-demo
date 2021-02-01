package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Channel;
import com.preclaim.models.IntimationType;
import com.preclaim.models.Region;


public interface MessageDao {
	List<IntimationType> getActiveGrouplist();
	List<Region> getActiveRegionlist();
	List<Channel> getActiveChannellist();
	List<Channel> getCategoryChannellist();
	/*
	 * List<CaseDetailList> getCaseDetailList(int status); public String
	 * addcase(CaseDetails casedetail);
	 */

}

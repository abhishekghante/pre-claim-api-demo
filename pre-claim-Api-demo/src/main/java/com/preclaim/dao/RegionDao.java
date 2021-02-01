package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Region;
import com.preclaim.models.RegionList;

public interface RegionDao {

	String create_region(Region region);
	List<RegionList> region_list(int status);
	String deleteRegion(int regionId);
	String updateRegion(int regionId, String region_name);
    String updateRegionStatus(int RegionId,int status);
}

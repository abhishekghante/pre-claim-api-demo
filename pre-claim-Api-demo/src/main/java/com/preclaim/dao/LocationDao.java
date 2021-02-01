package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Location;

public interface LocationDao {

	String addLocation(Location location);
	List<Location> locationList(int status);
	String deleteLocation(int locationId);
	String updateLocation(Location location);
    String updateLocationStatus(int locationId, int status, String username);
    Location getLocationById(int locationId);
    public List<Location> getActiveLocationList();
}

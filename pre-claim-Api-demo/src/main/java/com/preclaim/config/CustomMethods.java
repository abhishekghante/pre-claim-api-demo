package com.preclaim.config;

import java.util.ArrayList;

import com.preclaim.models.Permission;

public class CustomMethods {
	
	public static boolean findString(ArrayList<Permission> permission, String check_module)
	{
		if(permission == null)
			return false;
		
		for(Permission list_permit : permission)
		{
			if(list_permit.getModule().equals(check_module))
				return true;
		}
		
		return false;
	}

}

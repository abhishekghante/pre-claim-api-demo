package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.MailConfig;
import com.preclaim.models.MailConfigList;

public interface MailConfigDao {

	String add(MailConfigList mailConfig);
	String delete(int mailConfigId);
	String update(MailConfigList mailConfig);
    String updateStatus(int mailConfigId,int status, String username);
    List<MailConfigList> getMailConfigList(int status);
	MailConfigList getActiveConfigList();
	MailConfigList getMailConfigListById(int mailConfigId);
	MailConfig getActiveConfig();
	
}

package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Channel;
import com.preclaim.models.ChannelList;

public interface ChannelDao {

	String create_channel(Channel channel);
	List<ChannelList> channel_list(int status);
	String deleteChannel(int channelId);
	String updateChannel(String channelName, String channelCode,int channelId);
	String updateChannelStatus(int channelId,int status);
	
}

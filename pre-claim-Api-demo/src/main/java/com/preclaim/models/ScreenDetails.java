package com.preclaim.models;

public class ScreenDetails {

	private String screen_name;
	private String screen_title;
	private String main_menu;
	private String sub_menu1;
	private String sub_menu2;
	private String sub_menu2_path;
	private String error_message1;
	private String error_message2;
	private String success_message1;
	private String success_message2;
	
	public ScreenDetails()
	{
		this.screen_name = "";
		this.screen_title = "";
		this.main_menu = "";
		this.sub_menu1 = "";
		this.sub_menu2 = "";
		this.sub_menu2_path = "";
		this.error_message1 = "";
		this.error_message2 = "";
		this.success_message1 = "";
		this.success_message2= "";
	}

	public String getScreen_name() {
		return screen_name;
	}

	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}

	public String getScreen_title() {
		return screen_title;
	}

	public void setScreen_title(String screen_title) {
		this.screen_title = screen_title;
	}

	public String getMain_menu() {
		return main_menu;
	}

	public void setMain_menu(String main_menu) {
		this.main_menu = main_menu;
	}

	public String getSub_menu1() {
		return sub_menu1;
	}

	public void setSub_menu1(String sub_menu1) {
		this.sub_menu1 = sub_menu1;
	}

	public String getSub_menu2() {
		return sub_menu2;
	}

	public void setSub_menu2(String sub_menu2) {
		this.sub_menu2 = sub_menu2;
	}

	public String getSub_menu2_path() {
		return sub_menu2_path;
	}

	public void setSub_menu2_path(String sub_menu2_path) {
		this.sub_menu2_path = sub_menu2_path;
	}

	public String getError_message1() {
		return error_message1;
	}

	public void setError_message1(String error_message1) {
		this.error_message1 = error_message1;
	}

	public String getError_message2() {
		return error_message2;
	}

	public void setError_message2(String error_message2) {
		this.error_message2 = error_message2;
	}

	public String getSuccess_message1() {
		return success_message1;
	}

	public void setSuccess_message1(String success_message1) {
		this.success_message1 = success_message1;
	}

	public String getSuccess_message2() {
		return success_message2;
	}

	public void setSuccess_message2(String success_message2) {
		this.success_message2 = success_message2;
	}

	@Override
	public String toString() {
		return "ScreenDetails [screen_name=" + screen_name + ", screen_title=" + screen_title + ", main_menu="
				+ main_menu + ", sub_menu1=" + sub_menu1 + ", sub_menu2=" + sub_menu2 + ", sub_menu2_path="
				+ sub_menu2_path + ", error_message1=" + error_message1 + ", error_message2=" + error_message2
				+ ", success_message1=" + success_message1 + ", success_message2=" + success_message2 + "]";
	}

	
	
		
}

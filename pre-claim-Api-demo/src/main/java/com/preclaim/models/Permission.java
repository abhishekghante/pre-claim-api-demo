package com.preclaim.models;

public class Permission {

	private String module;
	private int role_id;
	private int status;
	
	public Permission()
	{
		this.module = "";
		this.role_id = 0;
		this.status = 0;
	}
	public Permission(String module)
	{
		this.module = module;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Permission [module=" + module + ", role_id=" + role_id + ", status=" + status + "]";
	}
			
}

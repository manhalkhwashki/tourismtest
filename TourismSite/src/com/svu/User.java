package com.svu;
import java.io.Serializable;

public class User implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String name;
	private String phone;
	private int id;
	public int is_admin;
	public int is_emp;

	User(){
		this.name="";
		this.phone = "";
		this.is_admin = 0;
		
	}
	 public User(String name,String phone,int is_admin){
		this.name=name;
		this.phone=phone;
		this.is_admin=is_admin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name ;
	}
	public void setis_admin(int is_admin) {
		this.is_admin = is_admin;
	}
	public void setis_emp(int emp) {
		this.is_emp = emp;
	}
	public int getis_admin() {
		return is_admin;
	}
	public int getis_emp() {
		return is_admin;
	}
	
	

}

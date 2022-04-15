package com.priyanshu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ProductOrder {
	
	@Id
	private int pid;
	private String fname;
	private String lname;
	
	private String dates;
	
	@Column(name="productName")
	private String model;
	@Column(name="paths")
	private String path;
	@Column(name="descriptions")
	private String desc;
	private String username;
	private int price;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public ProductOrder(int pid, String fname, String lname, String dates, String model, String path, String desc,
			int price,String username) {
		super();
		this.pid = pid;
		this.fname = fname;
		this.lname = lname;
		this.dates = dates;
		this.model = model;
		this.path = path;
		this.desc = desc;
		this.price = price;
		this.username=username;
	}

	public ProductOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}

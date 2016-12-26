package com.qingke.pojo;

import java.io.Serializable;

public class Order implements Serializable{
	private int id;
	private String name;
	private String merAdd;
	private String merPhone;
	private String cname;
	private String cadd;
	private String ctel;
	private String kname;
	private String ktel;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMerAdd() {
		return merAdd;
	}
	public void setMerAdd(String merAdd) {
		this.merAdd = merAdd;
	}
	public String getMerPhone() {
		return merPhone;
	}
	public void setMerPhone(String merPhone) {
		this.merPhone = merPhone;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCadd() {
		return cadd;
	}
	public void setCadd(String cadd) {
		this.cadd = cadd;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getKtel() {
		return ktel;
	}
	public void setKtel(String ktel) {
		this.ktel = ktel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}

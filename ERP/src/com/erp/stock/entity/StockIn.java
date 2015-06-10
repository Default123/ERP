package com.erp.stock.entity;

import java.util.Date;

public class StockIn {
	private String code;//.
	private Date indate;//.
	private String supplierCode;
	private String contacter;//.
	private String telephone;//修改数据库数据
	private String fax;
	private String intype;
	private String isroad;
	private String isinvoice;
	private String remarks;
	private String isShow;
	private int nums;//.
	private int numsPrice;//.
	private String state;//.入库单据状态，1已审核0未审核
	private String compCode;
	private Date addDate;
	private String addUser;//.
	private String addUserName;
	private String addIp;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	public String getContacter() {
		return contacter;
	}
	public void setContacter(String contacter) {
		this.contacter = contacter;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getIntype() {
		return intype;
	}
	public void setIntype(String intype) {
		this.intype = intype;
	}
	public String getIsroad() {
		return isroad;
	}
	public void setIsroad(String isroad) {
		this.isroad = isroad;
	}
	public String getIsinvoice() {
		return isinvoice;
	}
	public void setIsinvoice(String isinvoice) {
		this.isinvoice = isinvoice;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public int getNumsPrice() {
		return numsPrice;
	}
	public void setNumsPrice(int numsPrice) {
		this.numsPrice = numsPrice;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCompCode() {
		return compCode;
	}
	public void setCompCode(String compCode) {
		this.compCode = compCode;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getAddUser() {
		return addUser;
	}
	public void setAddUser(String addUser) {
		this.addUser = addUser;
	}
	public String getAddUserName() {
		return addUserName;
	}
	public void setAddUserName(String addUserName) {
		this.addUserName = addUserName;
	}
	public String getAddIp() {
		return addIp;
	}
	public void setAddIp(String addIp) {
		this.addIp = addIp;
	}
	public StockIn(String code, Date indate, String supplierCode,
			String contacter, String telephone, String fax, String intype,
			String isroad, String isinvoice, String remarks, String isShow,
			int nums, int numsPrice, String state, String compCode,
			Date addDate, String addUser, String addUserName, String addIp) {
		super();
		this.code = code;
		this.indate = indate;
		this.supplierCode = supplierCode;
		this.contacter = contacter;
		this.telephone = telephone;
		this.fax = fax;
		this.intype = intype;
		this.isroad = isroad;
		this.isinvoice = isinvoice;
		this.remarks = remarks;
		this.isShow = isShow;
		this.nums = nums;
		this.numsPrice = numsPrice;
		this.state = state;
		this.compCode = compCode;
		this.addDate = addDate;
		this.addUser = addUser;
		this.addUserName = addUserName;
		this.addIp = addIp;
	}
	public StockIn() {
		super();
	}
	 
	
	
}

package com.tech.blog.entities;

public class Posts {

	private int pid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private int catid;
	private int userId;
	
	public Posts(int pid, String ptitle, String pcontent, String pcode, int catid , int userId) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.catid = catid;
		this.userId = userId;
	}
	public Posts()
	{
		
	}
	public Posts(String ptitle, String pcontent, String pcode, int catid, int userId) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.catid = catid;
		this.userId= userId;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}

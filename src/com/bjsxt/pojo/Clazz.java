package com.bjsxt.pojo;

import java.io.Serializable;

public class Clazz implements Serializable{

	private int clazzno; //教室编号
	private String dept;	//系别
	private String cname;	//班级
	private String clazzroom;	//教室名
	private String chteacher;	//班主任
	public int getClazzno() {
		return clazzno;
	}
	public void setClazzno(int clazzno) {
		this.clazzno = clazzno;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getClazzroom() {
		return clazzroom;
	}
	public void setClazzroom(String clazzroom) {
		this.clazzroom = clazzroom;
	}
	public String getChteacher() {
		return chteacher;
	}
	public void setChteacher(String chteacher) {
		this.chteacher = chteacher;
	}
	public Clazz(int clazzno, String dept, String cname, String clazzroom, String chteacher) {
		super();
		this.clazzno = clazzno;
		this.dept = dept;
		this.cname = cname;
		this.clazzroom = clazzroom;
		this.chteacher = chteacher;
	}
	public Clazz() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Clazz [clazzno=" + clazzno + ", dept=" + dept + ", cname=" + cname + ", clazzroom=" + clazzroom
				+ ", chteacher=" + chteacher + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((chteacher == null) ? 0 : chteacher.hashCode());
		result = prime * result + clazzno;
		result = prime * result + ((clazzroom == null) ? 0 : clazzroom.hashCode());
		result = prime * result + ((cname == null) ? 0 : cname.hashCode());
		result = prime * result + ((dept == null) ? 0 : dept.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Clazz other = (Clazz) obj;
		if (chteacher == null) {
			if (other.chteacher != null)
				return false;
		} else if (!chteacher.equals(other.chteacher))
			return false;
		if (clazzno != other.clazzno)
			return false;
		if (clazzroom == null) {
			if (other.clazzroom != null)
				return false;
		} else if (!clazzroom.equals(other.clazzroom))
			return false;
		if (cname == null) {
			if (other.cname != null)
				return false;
		} else if (!cname.equals(other.cname))
			return false;
		if (dept == null) {
			if (other.dept != null)
				return false;
		} else if (!dept.equals(other.dept))
			return false;
		return true;
	}
	
}

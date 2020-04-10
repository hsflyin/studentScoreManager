package com.bjsxt.pojo;

import java.io.Serializable;

public class Course implements Serializable{

	private int cno;
	private int cid;
	private String cname;
	private String credit;
	private String preiodstart;
	private String preiodend;
	private double score;
	private Teacher teacher;
	private Student student;
	private Clazz clazz;
	
	
	
	
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getPreiodstart() {
		return preiodstart;
	}
	public void setPreiodstart(String preiodstart) {
		this.preiodstart = preiodstart;
	}
	public String getPreiodend() {
		return preiodend;
	}
	public void setPreiodend(String preiodend) {
		this.preiodend = preiodend;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Course(int cno, int cid, String cname, String credit, String preiodstart, String preiodend,
			Teacher teacher) {
		super();
		this.cno = cno;
		this.cid = cid;
		this.cname = cname;
		this.credit = credit;
		this.preiodstart = preiodstart;
		this.preiodend = preiodend;
		this.teacher = teacher;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Course [cno=" + cno + ", cid=" + cid + ", cname=" + cname + ", credit=" + credit + ", preiodstart="
				+ preiodstart + ", preiodend=" + preiodend + ", teacher=" + teacher + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cid;
		result = prime * result + ((cname == null) ? 0 : cname.hashCode());
		result = prime * result + cno;
		result = prime * result + ((credit == null) ? 0 : credit.hashCode());
		result = prime * result + ((preiodend == null) ? 0 : preiodend.hashCode());
		result = prime * result + ((preiodstart == null) ? 0 : preiodstart.hashCode());
		result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
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
		Course other = (Course) obj;
		if (cid != other.cid)
			return false;
		if (cname == null) {
			if (other.cname != null)
				return false;
		} else if (!cname.equals(other.cname))
			return false;
		if (cno != other.cno)
			return false;
		if (credit == null) {
			if (other.credit != null)
				return false;
		} else if (!credit.equals(other.credit))
			return false;
		if (preiodend == null) {
			if (other.preiodend != null)
				return false;
		} else if (!preiodend.equals(other.preiodend))
			return false;
		if (preiodstart == null) {
			if (other.preiodstart != null)
				return false;
		} else if (!preiodstart.equals(other.preiodstart))
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		return true;
	}
	
}

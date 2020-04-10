package com.bjsxt.pojo;

import java.io.Serializable;

public class Student implements Serializable{

	private int sno; //主键
	private int sid; //学生编号
	private String sname;	//学生姓名
	private String gender;	//性别
	private String birthtime;	//出生日期
	private String birthplace;	//出生地
	private String intime;	//入学日期
	private String pwd; //密码
	private String clazzno; //班级编号
	private Clazz clazz;	//班级
	private Teacher teacher;
	private Course course;
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	private int rid;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthtime() {
		return birthtime;
	}
	public void setBirthtime(String birthtime) {
		this.birthtime = birthtime;
	}
	public String getBirthplace() {
		return birthplace;
	}
	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getClazzno() {
		return clazzno;
	}
	public void setClazzno(String clazzno) {
		this.clazzno = clazzno;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public Student(int sno, int sid, String sname, String gender, String birthtime, String birthplace, String intime,
			String pwd, String clazzno, Clazz clazz, int rid) {
		super();
		this.sno = sno;
		this.sid = sid;
		this.sname = sname;
		this.gender = gender;
		this.birthtime = birthtime;
		this.birthplace = birthplace;
		this.intime = intime;
		this.pwd = pwd;
		this.clazzno = clazzno;
		this.clazz = clazz;
		this.rid = rid;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Student [sno=" + sno + ", sid=" + sid + ", sname=" + sname + ", gender=" + gender + ", birthtime="
				+ birthtime + ", birthplace=" + birthplace + ", intime=" + intime + ", pwd=" + pwd + ", clazzno="
				+ clazzno + ", clazz=" + clazz + ", rid=" + rid + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birthplace == null) ? 0 : birthplace.hashCode());
		result = prime * result + ((birthtime == null) ? 0 : birthtime.hashCode());
		result = prime * result + ((clazz == null) ? 0 : clazz.hashCode());
		result = prime * result + ((clazzno == null) ? 0 : clazzno.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((intime == null) ? 0 : intime.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + rid;
		result = prime * result + sid;
		result = prime * result + ((sname == null) ? 0 : sname.hashCode());
		result = prime * result + sno;
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
		Student other = (Student) obj;
		if (birthplace == null) {
			if (other.birthplace != null)
				return false;
		} else if (!birthplace.equals(other.birthplace))
			return false;
		if (birthtime == null) {
			if (other.birthtime != null)
				return false;
		} else if (!birthtime.equals(other.birthtime))
			return false;
		if (clazz == null) {
			if (other.clazz != null)
				return false;
		} else if (!clazz.equals(other.clazz))
			return false;
		if (clazzno == null) {
			if (other.clazzno != null)
				return false;
		} else if (!clazzno.equals(other.clazzno))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (intime == null) {
			if (other.intime != null)
				return false;
		} else if (!intime.equals(other.intime))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (rid != other.rid)
			return false;
		if (sid != other.sid)
			return false;
		if (sname == null) {
			if (other.sname != null)
				return false;
		} else if (!sname.equals(other.sname))
			return false;
		if (sno != other.sno)
			return false;
		return true;
	}
	
}

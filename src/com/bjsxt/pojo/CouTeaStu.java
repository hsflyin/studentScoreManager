package com.bjsxt.pojo;

import java.io.Serializable;

public class CouTeaStu implements Serializable{

	private int ctsid;
	private int cno;
	private int tno;
	private int sno;
	private double score;
	private Student student;
	private Course course;
	private Teacher teacher;
	private Clazz clazz;
	public int getCtsid() {
		return ctsid;
	}
	public void setCtsid(int ctsid) {
		this.ctsid = ctsid;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public CouTeaStu(int ctsid, int cno, int tno, int sno, double score, Student student, Course course,
			Teacher teacher, Clazz clazz) {
		super();
		this.ctsid = ctsid;
		this.cno = cno;
		this.tno = tno;
		this.sno = sno;
		this.score = score;
		this.student = student;
		this.course = course;
		this.teacher = teacher;
		this.clazz = clazz;
	}
	@Override
	public String toString() {
		return "CouTeaStu [ctsid=" + ctsid + ", cno=" + cno + ", tno=" + tno + ", sno=" + sno + ", score=" + score
				+ ", student=" + student + ", course=" + course + ", teacher=" + teacher + ", clazz=" + clazz + "]";
	}
	public CouTeaStu() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clazz == null) ? 0 : clazz.hashCode());
		result = prime * result + cno;
		result = prime * result + ((course == null) ? 0 : course.hashCode());
		result = prime * result + ctsid;
		long temp;
		temp = Double.doubleToLongBits(score);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + sno;
		result = prime * result + ((student == null) ? 0 : student.hashCode());
		result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
		result = prime * result + tno;
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
		CouTeaStu other = (CouTeaStu) obj;
		if (clazz == null) {
			if (other.clazz != null)
				return false;
		} else if (!clazz.equals(other.clazz))
			return false;
		if (cno != other.cno)
			return false;
		if (course == null) {
			if (other.course != null)
				return false;
		} else if (!course.equals(other.course))
			return false;
		if (ctsid != other.ctsid)
			return false;
		if (Double.doubleToLongBits(score) != Double.doubleToLongBits(other.score))
			return false;
		if (sno != other.sno)
			return false;
		if (student == null) {
			if (other.student != null)
				return false;
		} else if (!student.equals(other.student))
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		if (tno != other.tno)
			return false;
		return true;
	}
	
	
}

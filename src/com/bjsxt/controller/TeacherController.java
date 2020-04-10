package com.bjsxt.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Student;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.service.TeacherService;
import com.google.gson.Gson;

@Controller
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value="selTeacher",produces="text/html;charset=utf-8")
	public String selTeacher(String dept,@RequestParam(defaultValue="1") int num,@RequestParam(defaultValue="10") int size,HttpServletRequest req){
			if(dept!=null&&dept!=""){				
				String input = "信息工程系";
				try { 
					input =new String(dept.getBytes("iso-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				List<Teacher> list = teacherService.selTeacherByDept(input);
				req.getSession().setAttribute("TeacherList", list);
				req.setAttribute("dept", input);
				return "teacher";
			}else{
				List<Teacher> list = teacherService.selTeacherByDept("信息工程系");
				req.getSession().setAttribute("TeacherList", list);
				req.setAttribute("dept", "信息工程系");
				return "teacher";
			}
	}
	
	@RequestMapping("deleteTeacher")
	public String deleteTeacher(String tno,String dept){
		int i = teacherService.deleteTeacherByTno(Integer.parseInt(tno));
		if(i>0){
			return "redirect:selTeacher?dept="+dept;
		}else{
			return "error";
		}
	}
	
	@RequestMapping("deleteTeachers")
	public String deleteTeachers(String varids,HttpServletRequest req){
		String[] sids = varids.split(",");
		int[] ints = new int[sids.length];
		for (int i = 0; i < sids.length; i++) {
			ints[i] = Integer.parseInt(sids[i]); 
		}
		Teacher teacher = teacherService.selTeacherByTno(ints[0]);
		int i = teacherService.deleteTeachers(ints);
		if(i > 0){
			return "redirect:selTeacher?dept="+teacher.getDept();
		}else{
			return "error";
		}
	}

	
	@RequestMapping("insertTeacher")
	public String insertTeacher(Teacher teacher){
		
		System.out.println(teacher.getDept());
		int i = teacherService.insertTeacher(teacher);
		if(i>0){
			return "redirect:selTeacher?dept="+teacher.getDept();
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value="selTeacherByTno",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selTeacherByTno(String tno){
		
		Teacher teacher = teacherService.selTeacherByTno(Integer.parseInt(tno));
		if(teacher != null){
			String json = new Gson().toJson(teacher);
			return json;
		}else{
			return "error";
		}
	}
	
	@RequestMapping("updateTeacher")
	public String updateTeacher(Teacher teacher){
		
		System.out.println(teacher);
		int i = teacherService.updateTeacher(teacher);
		if(i>0){
			return "redirect:selTeacher?dept="+teacher.getDept();
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value="selAllTeacher",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selAllTeacher(){
		List<Teacher> list = teacherService.selTeacher();
		String json = new Gson().toJson(list);
		return json;
	}
	
	//teacherInf.jsp中查询学生信息
	@RequestMapping("selTeacherInf")
	public String selTeacherInf(String tno,HttpServletRequest req){
		Teacher teacher = teacherService.selTeacherByTno(Integer.parseInt(tno));
		if(teacher!=null){
			req.getSession().setAttribute("teacherInformation", teacher);
			return "teacherInf";
		}
		return "error";
	}
}

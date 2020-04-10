package com.bjsxt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Course;
import com.bjsxt.service.CourseService;
import com.google.gson.Gson;

@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@RequestMapping("selCourse")
	public String selCourse(HttpServletRequest req){
		List<Course> list = courseService.selCourse();
		if(list!=null){
			req.getSession().setAttribute("CourseList", list);
			return "course";
		}
		return "error";
	}
	
	@RequestMapping("selStuCourse")
	public String selStuCourse(HttpServletRequest req){
		List<Course> list = courseService.selCourse();
		System.out.println(list);
		if(list!=null){
			req.getSession().setAttribute("CourseList", list);
			return "stucourse";
		}
		return "error";
	}
	
	
	@RequestMapping(value="selAllCourse",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selAllCourse(){
		List<Course> list = courseService.selAllCourse();
		String json = new Gson().toJson(list);
		return json;
	}
	
	@RequestMapping("deleteCourse")
	public String deleteCourse(String cno){
		int i = courseService.deleteCourse(Integer.parseInt(cno));
		if(i > 0){
			return "redirect:selCourse";
		}
		return "error";
	}
	
	@RequestMapping("deleteCourses")
	public String deleteCourses(String varids){
		String[] sids = varids.split(",");
		int[] ints = new int[sids.length];
		for (int i = 0; i < sids.length; i++) {
			ints[i] = Integer.parseInt(sids[i]); 
		}
		int i = courseService.deleteCourses(ints);
		if(i > 0){
			return "redirect:selCourse";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("insertCourse")
	public String insertCourse(Course course){
		int i = courseService.insertCourse(course);
		if(i > 0){
			return "redirect:selCourse";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value="selCourseByCno",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selCourseByCno(String cno){
		Course course = courseService.selCourseByCno(Integer.parseInt(cno));
		String json = new Gson().toJson(course);
		return json;
	}
	
	@RequestMapping("updateCourse")
	public String updateCourse(Course course){
		int i = courseService.updateCourse(course);
		if(i > 0){
			return "redirect:selCourse";
		}
		return "error";
	}
	
	@RequestMapping("insertTC")
	public String insertTC(String cno,String tno){
		int i = courseService.insertTC(Integer.parseInt(cno),Integer.parseInt(tno));
		if(i > 0){
			return "redirect:selCourse";
		}
		return "error";
	}
	
	@RequestMapping("selTC")
	@ResponseBody
	public String selTC(String cno,String tno){
		Map<Object, Object> map = courseService.selTC(Integer.parseInt(cno),Integer.parseInt(tno));
		String json = new Gson().toJson(map);
		return json;
	}
	
}

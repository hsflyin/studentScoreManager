package com.bjsxt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Clazz;
import com.bjsxt.service.ClazzService;
import com.google.gson.Gson;

@Controller
public class ClazzController {

	@Autowired
	private ClazzService clazzService;
	
	@RequestMapping("selClazz")
	public String selClazz(HttpServletRequest req){
		List<Clazz> list = clazzService.selClazz();
		req.getSession().setAttribute("clazzList", list);
		return "clazz";
	}
	
	@RequestMapping(value="selClazzs",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selClazzs(){
		List<Clazz> list = clazzService.selClazz();
		String json = new Gson().toJson(list);
		return json;
	}
	
	
	@RequestMapping("deleteClazz")
	public String deleteClazz(int clazzno){
		int i = clazzService.deleteClazz(clazzno);
		if(i>0){
			return "redirect:selClazz";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("deleteByClazzno")
	public String deleteByClazzno(String varids){
		String[] sids = varids.split(",");
		int[] ints = new int[sids.length];
		for (int i = 0; i < sids.length; i++) {
			ints[i] = Integer.parseInt(sids[i]); 
		}
		int i = clazzService.deleteByClazzno(ints);
		if(i > 0){
			return "redirect:selClazz";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("insertClazz")
	public String insertClazz(Clazz clazz){
		int i = clazzService.insertClazz(clazz);
		if(i>0){
			return "redirect:selClazz";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("updateClazz")
	public String updateClazz(Clazz clazz){
		int i = clazzService.updateClazz(clazz);
		if(i>0){
			return "redirect:selClazz";
		}else{
			return "error";
		}
	}

	@RequestMapping(value="selClazzByClazzno",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selClazzByClazzno(Clazz clazz){
		Clazz clazzs = clazzService.selClazzByClazzno(clazz);
		String json = new Gson().toJson(clazzs);
		return json;
	}
}

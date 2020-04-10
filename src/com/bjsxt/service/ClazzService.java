package com.bjsxt.service;

import java.util.List;

import com.bjsxt.pojo.Clazz;
import com.bjsxt.pojo.User;

public interface ClazzService {

	//查询所有班级信息
	List<Clazz> selClazz();
	
	//删除班级信息
	int deleteClazz(int clazzno);
	
	//批量删除班级信息
	int deleteByClazzno(int[] clazznos);
	
	//添加班级信息
	int insertClazz(Clazz clazz);
	
	//根据clazzno查询班级信息
	Clazz selClazzByClazzno(Clazz clazz);
	
	//修改班级信息
	int updateClazz(Clazz clazz);
	
	
}

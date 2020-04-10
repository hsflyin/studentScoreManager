<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>学生成绩管理系统</div>
    
    <dl class="leftmenu">
      
   	<c:choose>
    	<c:when test="${user.rid == 1}">
			   <dd>
			    <div class="title">
			    <span><img src="images/leftico01.png" /></span>信息管理
			    </div>
			    	<ul class="menuson">
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="selClazz" target="rightFrame">班级信息</a>
			            <i></i>
			            </div>
			        </li>
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="studentMessage" target="rightFrame">学生信息</a>
			            <i></i>
			            </div>
			        </li>
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="selTeacher" target="rightFrame">教师信息</a>
			            <i></i>
			            </div>             
			        </li>
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="selCourse" target="rightFrame">课程信息</a>
			            <i></i>
			            </div>                
			        </li>
			        
			        </ul>    
			    </dd>
			        
			      
			   <%--  <dd>
			    <div class="title">
			    <span><img src="images/leftico02.png" /></span>教师管理
			    </div>
			    <ul class="menuson">
			        <li><cite></cite><a href="flow.html" target="rightFrame">教师信息</a><i></i></li>
			        <li><cite></cite><a href="project.html" target="rightFrame">添加教师信息</a><i></i></li>
			        <li><cite></cite><a href="search.html" target="rightFrame">修改教师信息</a><i></i></li>
			        </ul>     
			    </dd>  --%>
			    
			   
			    
			    
    	</c:when>
    	<c:when test="${user.rid == 2}">
    		 <dd>
			    <div class="title">
			    <span><img src="images/leftico01.png" /></span>学生管理
			    </div>
			    	<ul class="menuson">
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="teacherSelectStudent" target="rightFrame">学生信息</a>
			            <i></i>
			            </div>
			        </li>
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="teacherSetScore?tno=${user.tno }" target="rightFrame">成绩录入</a>
			            <i></i>
			            </div>
			        </li>
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="selStudentScore?tno=${user.tno }" target="rightFrame">成绩查询</a>
			            <i></i>
			            </div>
			        </li>
			        
			        
			        </ul>    
			    </dd>
			     <dd><div class="title"><span><img src="images/leftico04.png" /></span>个人信息</div>
			    <ul class="menuson">
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="selTeacherInf?tno=${user.tno }" target="rightFrame">个人资料</a>
			            <i></i>
			            </div>
			        </li>
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="pwdChangeTeacher.jsp" target="rightFrame">修改密码</a>
			            <i></i>
			            </div>             
			        </li>
			    </ul>
			    
			    </dd>   
    	</c:when>
    	<c:when test="${user.rid == 3}">
    	 <dd><div class="title"><span><img src="images/leftico04.png" /></span>课程信息</div>
			    <ul class="menuson">
			        <li><cite></cite><a href="selStuCourse" target="rightFrame">学生选课</a><i></i></li>
			        <%-- <li><cite></cite><a href="selselectedCourse?sno=${user.sno }" target="rightFrame">已选课程</a><i></i></li> --%>
			        <li><cite></cite><a href="selCourseScore?sno=${user.sno }" target="rightFrame">已选课程</a><i></i></li>
			    </ul>
			    
			    </dd>   
			    <dd>
			    <div class="title">
			    <span><img src="images/leftico01.png" /></span>个人信息
			    </div>
			    	<ul class="menuson">
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="selStudentInf?sno=${user.sno }" target="rightFrame">个人资料</a>
			            <i></i>
			            </div>
			        </li>
			        
			        <li>
			            <div class="active">
			            <cite></cite>
			            <a href="pwdChange.jsp" target="rightFrame">修改密码</a>
			            <i></i>
			            </div>             
			        </li>
			       
			        
			        </ul>    
			    </dd>
			    
			    
			    
    	</c:when>
    </c:choose>
       <dd><div class="title"><span><img src="images/leftico03.png" /></span>公告</div></dd>   
    
    </dl>
</body>
</html>
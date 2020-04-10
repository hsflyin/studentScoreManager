<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
	
</style>





</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">课程信息</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">已选课程</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th width="100px">课程编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th width="150px">课程</th>
        <th>学分</th>
        <th>教师</th>
        <th>开课日期</th>
        <th>结课日期</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${selectedCourse }" var="course" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${course.cno }" /></td>
	        <td>${var.count }</td>
	        <td>${course.cname }</td>
	        <td>${course.credit }</td>
	        <td>${course.teacher.tname }</td>
	        <td>${course.preiodstart }</td>
	        <td>${course.preiodend }</td>
	        </tr> 
        	
        </c:forEach> 
 
        </tbody>
    </table>
  
  	 <br/>
    

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	<script type="text/javascript">

	
	
	</script>
</body>

</html>
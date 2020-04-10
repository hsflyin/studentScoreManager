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
	.sure{width:40px; height:30px; line-height:35px; color:blue; background:url(../images/btnbg1.png) repeat-x; font-size:14px; font-weight:bold;border-radius: 3px; cursor:pointer;}
</style>

<script type="text/javascript">
	function setScore(ctsid,credit,varid){
		var varval = $("#"+varid).val();
		
		if(varval.length>0){
			if(varval<credit){
				$.post("setScore",{ctsid:ctsid,score:varval},function(result){
					if(result == "true"){
						alert("评分成功");
						window.location.href="teacherSetScore?tno=${user.tno}";
						return;
					}else if(result == "false"){
						alert("评分失败");
						return;
					}else{
						alert("数据出错");
						return;
					}
				})
			}else{
				alert("评分不能大于总学分或输入的分数错误");
				return;
			}
			
		}else{
			alert("请输入分数");
			return;
		}
		
	}
</script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">学生信息</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">成绩录入</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th width="100px">编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th width="150px">课程</th>
        
        <th>学生</th>
        <th>班级</th>
        <th>教师</th>
        <th>学分</th>
        <th>开课日期</th>
        <th>结课日期</th>
        <th>评分</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${selectedTeacherScore }" var="cts" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${cts.ctsid }" /></td>
	        <td>${var.count }</td>
	        <td>${cts.course.cname }</td>
	        <td>${cts.student.sname }</td>
	        <td>${cts.clazz.cname  }</td>
	        <td>${cts.teacher.tname  }</td>
	        <td>${cts.course.credit  }</td>
	        <td>${cts.course.preiodstart }</td>
	        <td>${cts.course.preiodend }</td>
	        
	        <c:if test="${cts.score == 0 }">
	        	 <td><input type="text" id="${cts.course.cno}${cts.student.sno }" name="score"/>
	        	 <input type="button" class="sure"  value="评分" onclick="setScore(${cts.ctsid },${cts.course.credit },${cts.course.cno}${cts.student.sno });" />
	        	 </td>
	        	 
	        </c:if>
	        <c:if test="${cts.score != 0 }">
	        	 <td>${cts.score }</td>
	        </c:if>
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
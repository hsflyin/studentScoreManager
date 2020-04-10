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
	.tip2{width:500px; height:460px; position:absolute;top:10%; left:20%;background:#fcfdfd;box-shadow:1px 8px 10px 1px #9b9b9b;border-radius:1px;behavior:url(js/pie.htc);  display:none; z-index:999;}
	.tipinfo2{padding-top:30px;margin-left:35px; height:95px;}
	#tipbtn2{
		position:relative;
		top:40%;
		left:5%;
	}
	.tip3{width:500px; height:460px; position:absolute;top:10%; left:20%;background:#fcfdfd;box-shadow:1px 8px 10px 1px #9b9b9b;border-radius:1px;behavior:url(js/pie.htc);  display:none; z-index:999;}
	.tipinfo3{padding-top:30px;margin-left:35px; height:95px;}
	#tipbtn3{
		position:relative;
		top:40%;
		left:5%;
	}
</style>

<script type="text/javascript">



</script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">学生管理</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">学生信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
	<form action="teacherSelectStudent" id="form3" method="post">
	    <ul class="prosearch">
	   <li><i>学号</i><a><input name="likeid" type="text" class="scinput" value="${likeid }" /></a></li>
	   <li><i>姓名</i><a><input name="likename" type="text" class="scinput" value="${likename }" /></a><a><input type="submit" class="sure" value="查询" /></a></li>
	   </ul>
	
	</form>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>学号<i class="sort"><img src="images/px.gif" /></i></th>
        <th width="150px">姓名</th>
        <th>性别</th>
        <th>班级</th>
        <th>出生日期</th>
        <th>籍贯</th>
        <th>入学日期</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${pageStudentList.list }" var="student">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${student.sno }" /></td>
	        <td>${student.sid }</td>
	        <td>${student.sname }</td>
	        <td>${student.gender }</td>
	        <td>${student.clazz.cname }</td>
	        <td>${student.birthtime }</td>
	        <td>${student.birthplace }</td>
	        <td>${student.intime }</td>
	        </tr> 
        	
        </c:forEach> 
 
        </tbody>
    </table>
    
    
   <div class="pagin">
   		<div>
	    	共<i class="message">${pageStudentList.total }</i>&nbsp;条记录，
	    	当前显示第&nbsp;<i class="blue">${pageStudentList.num }/${pageStudentList.count }&nbsp;</i>页
    	</div>
        <ul class="paginList">
        <!-- 判断当前页面数是否是第一页，如果不是第一页就显示上一页页码标志 -->
        <c:if test="${pageStudentList.hasPrevious == true }">
        	<li class="paginItem"><a href="teacherSelectStudent?num=${1 }&likeid=${likeid }&likename=${likename }">首页</span></a></li>
        	<li class="paginItem"><a href="teacherSelectStudent?num=${pageStudentList.previous }&likeid=${likeid }&likename=${likename }"><span class="pagepre"></span></a></li>
        </c:if>
        <!-- 获取所有的页面数 -->
        <c:forEach begin="${pageStudentList.everyBegin }" end="${pageStudentList.everyEnd }" var="each">
        	<c:if test="${each ==pageStudentList.num }">
        	 	<li class="paginItem"><a style="color: red;font-size: 15px" href="teacherSelectStudent?num=${each }&likeid=${likeid }&likename=${likename }">${each }</a></li>
        	</c:if>
        	<c:if test="${each !=pageStudentList.num }">
        	 	<li class="paginItem"><a href="teacherSelectStudent?num=${each }">${each }</a></li>
        	</c:if>
        
        </c:forEach>
        <!-- 判断当前页面数是否是最后一页，如果不是最后一页就显示下一页页码标志 -->
        <c:if test="${pageStudentList.hasNext }">
	        <li class="paginItem"><a href="teacherSelectStudent?num=${pageStudentList.next }&likeid=${likeid }&likename=${likename }"><span class="pagenxt"></span></a></li>
        	<li class="paginItem"><a href="teacherSelectStudent?num=${pageStudentList.last }&likeid=${likeid }&likename=${likename }">尾页</span></a></li>
        </c:if>
        </ul>
    </div>
    

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>

</html>
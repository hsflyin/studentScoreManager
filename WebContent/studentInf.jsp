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
    <li><a href="javascript:void(0)">个人信息</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">个人资料</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
	
	    <ul>
	   <li><i class="sure">学号</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likeid" type="text" readonly="readonly" value="${studentInformation.sid }" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
	   <i class="sure">姓名</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likename" type="text" readonly="readonly"  value="${studentInformation.sname }" /></a></li><br/>
	   <li><i class="sure">性别</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likename" type="text" readonly="readonly" value="${studentInformation.gender }" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
	   <i class="sure">籍贯</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likename" type="text" readonly="readonly" value="${studentInformation.birthplace }" /></a></li><br/>
	   <li><i class="sure">班级</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likename" type="text" readonly="readonly" value="${studentInformation.clazz.cname }" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
	   </li><br/>
	   <li><i class="sure">出生日期</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likename" type="text" readonly="readonly" value="${studentInformation.birthtime }" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
	   <i class="sure">入学日期</i>&nbsp;&nbsp;&nbsp;&nbsp;<a><input name="likename" type="text" readonly="readonly" value="${studentInformation.intime }" /></a></li><br/>
	   
	   </ul>

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>

</html>
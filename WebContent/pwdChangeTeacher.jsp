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


<script type="text/javascript">



	function checkoldpwd(){
		var pwd = "${user.pwd }";
		var oldpwd = $("#pwd1").val();
		if(oldpwd==pwd){
			$("#span1").html("<font color='blue'>√</font>");
			return true;
		}else{
			$("#span1").html("<font color='red'>原密码错误×</font>");
			return false;
		}
	}

	function checknewpwd(){
		var varreg = /^[A-Za-z0-9]{4,40}$/;
		//var varreg = /^\d{8}$/;
		var newpwd = $("#pwd2").val();
		if(varreg.test(newpwd)){
			
			$("#span2").html("<font color='blue'>√</font>");
			return true;
		}else{
			$("#span2").html("<font color='red'>密码只能是四位以上英文或数字×</font>");
			return false;
		}
	}
	
	function checkagainpwd(){
		var newpwd = $("#pwd2").val();
		var againpwd = $("#pwd3").val();
		
		if(newpwd==againpwd){
			$("#span3").html("<font color='blue'>√</font>");
			return true;
		}else{
			$("#span3").html("<font color='red'>两次输入的密码不同×</font>");
			return false;
		}
	}
	
	function checkall(){
		
		return checkoldpwd()&&checknewpwd()&&checkagainpwd();
		
	}
	
	function sub(){
		if(checkall()){
			var tno = "${user.tno }";
			var newpwd = $("#pwd2").val();
			$.post("changePwdTeacher",{"tno":tno,"newpwd":newpwd},function(result){
				//alert(result);
				if(result==1){
					alert("修改成功，请重新登录！");
					window.parent.location.href="/studentScoreManager/login.jsp";
				}else if(result==0){
					alert("修改失败！");
				}else{
					alert("出错");
				}
			})
		}
	}
</script>



</head>


<body>
<%-- <%
     Object message = session.getAttribute("message");
    if(message!=null && !"".equals(message)){
 
  %>
     <script type="text/javascript">
         alert("<%=message%>");
     </script>
 <%} %> --%>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">个人信息</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">修改密码</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
		<input  name="sno" type="hidden" class="scinput" value="${user.tno }"/>
	    <ul class="prosearch">
	   <li><i>请输入原密码&nbsp;&nbsp;&nbsp;<font color='red'>*</font></i><a><input id="pwd1" name="oldpwd" type="password" class="scinput" value="" onblur="checkoldpwd();"/></a>
	   </li>	<span id="span1"></span><br/>
	   </ul>
	    <ul class="prosearch">
	   <li><i>请输入新密码&nbsp;&nbsp;&nbsp;<font color='red'>*</font></i><a><input id="pwd2" name="newpwd" type="password" class="scinput" value="" onblur="checknewpwd();"/></a>
	   </li>
	   <span id="span2"></span><br/></ul>
	    <ul class="prosearch">
	   <li><i>再次确定新密码<font color='red'>*</font></i>				<a><input id="pwd3" name="" type="password" class="scinput" value="" onblur="checkagainpwd();"/></a>
	   </li>
	    <span id="span3"></span><br/></ul>
	   <br/>
	   <li><a><input type="button" class="sure" value="提交" onclick="sub();"/></a></li>
	

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>

</html>
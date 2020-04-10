<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录学生成绩管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

<script type="text/javascript">
	//让用户名输入框获取焦点
	function getFocus(){
		//获取对象
		$(".loginuser").focus();
	}
	//登录名错误提示
	function check_loginusername_input(){
		var loginuser = $(".loginuser").val();
		if( loginuser == '' || loginuser == null){
			$("#spanid1").html("<font color='red'>用户名不能为空</font>");
			return false;
		}else{
			$("#spanid1").text("");
			return true;
		}
	}
	//密码错误提示
	function check_loginuserpwd_input(){
		var loginuser = $(".loginpwd").val();
		if( loginuser == '' || loginuser == null){
			$("#spanid2").html("<font color='red'>密码不能为空</font>");
			return false;
		}else{
			$("#spanid2").text("");
			return true;
		}
	}
	//总校验
	function checkall(){
		return check_loginusername_input()&&check_loginuserpwd_input();
	}
	
	function sub(){
		$("form").submit();
	}
	

	
</script>

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">


    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录学生成绩管理系统</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    	
    
    <form action="login" method="post" onsubmit="return checkall();">
	    <ul>
	    <li>
	    	<table>
	    		<tr>
	    			<th>
		    			<input name="username" type="text" class="loginuser" placeholder="请输入用户名" onblur="check_loginusername_input()"/>
	    			</th>
	    		</tr>
	    		<tr>
	    			<th>
	    				<span id="spanid1"></span>
	    			</th>
	    		</tr>
	    	</table>
	    </li>
	    
	    <li>
	    	<table>
	    		<tr>
	    			<th>
	  				 	<input name="userpwd" type="password" class="loginpwd" placeholder="请输入密码"  onblur="check_loginuserpwd_input()"/>
	    			</th>
	    		</tr>
	    		<tr>
	    			<th>
	    				<span id="spanid2"></span>
	    				<span><font color="red">${message }</font></span>
	    			</th>
	    		</tr>
	    	</table>
	    </li>
	    
	    <li><input name="" type="submit" class="loginbtn" value="登录" onclick="sub();"/>
		    <label>
		    	<input name="role" type="radio" value="1" checked="checked" />管理员
		    	<input name="role" type="radio" value="2"  />教师
		    	<input name="role" type="radio" value="3" />学生
		    </label>
	    </li>
	    </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">版权所有  2018  仅供学习交流，勿用于任何商业用途</div>
	
    
</body>

</html>
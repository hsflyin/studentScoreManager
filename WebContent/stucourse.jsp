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
    <li><a href="javascript:void(0)" onclick="location.reload()">学生选课</a></li>
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
        <c:forEach items="${CourseList }" var="course" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${course.cno },${course.teacher.tno}" /></td>
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
    
        <input type="button" class="sure" value="提交" onclick="sub();"/>
   <div class="tip" id="tip1">
    	<div class="tiptop" id="tiptop1"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo" id="tipinfo1">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright" id="tipright1">
        <p>是否确认选择 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn" id="tipbtn1">
        <input name="" type="button" id="sure1" class="sure" value="确定" />&nbsp;
        <input name="" type="button" id="cancel1" class="cancel" value="取消" />
        </div>
    
    </div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	<script type="text/javascript">

	function sub(){

		if ($(":checkbox[name=checkname]:checked").size() == 0) {
			alert("请至少选择一门课程！");
		}else if($(":checkbox[name=checkname]:checked").size() > 3){
			alert("一次最多选择三门课程！");
		}else{
		  	$("#tip1").fadeIn(200);
		}
		
		
		  /* 关闭 */
		  $("#tiptop1 a").click(function(){
		  $("#tip1").fadeOut(200);
		});


		  /* 取消 */
		  $("#cancel1").click(function(){
		  $("#tip1").fadeOut(100);
		});
		  
		
	}
	
	/* 确定 */
	  $("#sure1").click(function(){
		  $("#tip1").fadeOut(100);
		 var cnos = document.getElementsByName("checkname");
		 var sno = "${user.sno}";
		 //alert(sno);
		 //
		 var varcnos = "";
		 
		 //判断是否被选中，如果被选中获取学生的sno
		 for(var i = 0 ; i < cnos.length ; i++){
			 if(cnos[i].checked){
				 varcnos += cnos[i].value +"_";
			 }		 
		 }
		 //把学生的id传给后台服务器
		 varcnos = varcnos.substring(0,varcnos.length-1);
		 
		// window.location.href = "stuChooseCourse?varcnos="+varcnos+"&sno="+sno;
		  
		 $.post("stuChooseCourse",{"varcnos":varcnos,"sno":sno},function(result){
			 //alert(result);
			 if(result==1){
				 alert("选课成功");
				 return;
			 }else if(result==0){
				 alert("选课失败");
				 return;
			 }else if(result==2){
				 alert("你已经选择了该课程，请选择其他课程！");
				 return;
			 }else{
				 alert("出错");
				 return;
			 }
			 
		 })
	});
	
	
</script>
</body>

</html>
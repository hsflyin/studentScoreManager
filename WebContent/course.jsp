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
	.tip2{width:500px; height:260px; position:absolute;top:10%; left:20%;background:#fcfdfd;box-shadow:1px 8px 10px 1px #9b9b9b;border-radius:1px;behavior:url(js/pie.htc);  display:none; z-index:999;}
	.tipinfo2{padding-top:30px;margin-left:35px; height:95px;}
	#tipbtn2{
		position:relative;
		top:5%;
		left:5%;
	}
	.tip3{width:500px; height:260px; position:absolute;top:10%; left:20%;background:#fcfdfd;box-shadow:1px 8px 10px 1px #9b9b9b;border-radius:1px;behavior:url(js/pie.htc);  display:none; z-index:999;}
	.tipinfo3{padding-top:30px;margin-left:35px; height:95px;}
	#tipbtn3{
		position:relative;
		top:5%;
		left:5%;
	}
</style>

<script type="text/javascript">

$(document).ready(function(){
  $(".click").click(function(){
	  
	  	if ($(":checkbox[name=checkname]:checked").size() == 0) {
			alert("请至少选择一条记录进行删除操作！");
		}else{
		  	$("#tip1").fadeIn(200);
		}
	  	
  });
  
  /* 关闭 */
  $("#tiptop1 a").click(function(){
  $("#tip1").fadeOut(200);
});

  /* 确定 */
  $("#sure1").click(function(){
	 var varchecks = document.getElementsByName("checkname");
	 //
	 var varcourses = "";
	 
	 //判断是否被选中，如果被选中获取学生的sno
	 for(var i = 0 ; i < varchecks.length ; i++){
		 if(varchecks[i].checked){
			 varcourses += varchecks[i].value +",";
		 }		 
	 }
	 //把学生的id传给后台服务器
	 var varids = varcourses.substring(0,varcourses.length-1);
	 
	  window.location.href = "deleteCourses?varids="+varids;
	  
	  
});

  /* 取消 */
  $("#cancel1").click(function(){
  $("#tip1").fadeOut(100);
});

});


	$(function(){
		$.post("selAllCourse","",function(result){
			//alert(result);
			if(result.length>0){
				var json = JSON.parse(result);
				for(var i = 0 ; i < json.length ; i++){
					$("#select1").append($("<option value="+json[i].cno+">"+json[i].cname+"</option>"));
				}
			}else{
				alert("获取不到班级信息");
			}
		})
		$.post("selAllTeacher","",function(result){
			//alert(result);
			if(result.length>0){
				var json = JSON.parse(result);
				for(var i = 0 ; i < json.length ; i++){
					$("#select2").append($("<option value="+json[i].tno+">"+json[i].tname+"</option>"));
				}
			}else{
				alert("获取不到教师信息");
			}
		})
		
	})
	
	function insertTC(){
		var cno = $("#select1").val();
		var tno = $("#select2").val();
		if(cno!=""&&tno!=""){
			$.post("selTC",{"cno":cno,"tno":tno},function(result){
				if(result!="null"){
					alert("已给该教师分配过该课程");
				}else{
					$("#form3").submit();
				}
			})
		}else{
			alert("请选择课程或老师信息");
		}
	}
</script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="javascript:void(0)">信息管理</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">课程信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="add"><span><img src="images/t01.png" /></span>添加</li>
       <%--  <li><a href="javascript:" onclick="updateStudent(${student.sid });"><span><img src="images/t02.png" /></span>修改</a></li> --%>
        <li class="click"><span><img src="images/t03.png" /></span>删除</li>
        </ul>
        
        <ul class="toolbar1">
        <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>
    </div>
    
    
	<div>
	<form action="insertTC" id="form3" method="post">
	   <ul class="prosearch">
	   <li>给老师分配课程
		   <select class="scinput" id="select1" name="cno">
		   		<option value="">--请选择课程--</option>

		   </select>
		   
		   <select class="scinput" id="select2" name="tno">
		   		<option value="">--请选择老师--</option>

		   </select>
		   <input type="button" class="sure" value="分配课程" onclick="insertTC();"/>
		</li>
	   </ul>
	   </form>
	</div>

    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th  width="150px">课程编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th width="150px">课程</th>
        <th>学分</th>
        <th>教师</th>
        <th>开课日期</th>
        <th>结课日期</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${CourseList }" var="course" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${course.cno }" /></td>
	        <td>${var.count }</td>
	        <td>${course.cname }</td>
	        <td>${course.credit }</td>
	        <td>${course.teacher.tname }</td>
	        <td>${course.preiodstart }</td>
	        <td>${course.preiodend }</td>
	        <td><a href="javascript:" onclick="updateCourse(${course.cno });" class="tablelink">修改</a>     <a href="deleteCourse?cno=${course.cno }" class="tablelink"> 删除</a></td>
	        </tr> 
        	
        </c:forEach> 
 
        </tbody>
    </table>

    
    
    <div class="tip" id="tip1">
    	<div class="tiptop" id="tiptop1"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo" id="tipinfo1">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright" id="tipright1">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn" id="tipbtn1">
        <input name="" type="button" id="sure1" class="sure" value="确定" />&nbsp;
        <input name="" type="button" id="cancel1" class="cancel" value="取消" />
        </div>
    
    </div>
    
   <div class="tip2" id="tip2">
    	<div class="tiptop" id="tiptop2"><span>添加课程</span><a></a></div>
	       <div class="tipinfo2">
	     	 <form id="form1" action="insertCourse" method="post">
	       		<font>课程&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="cnameid" name="cname" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>开课日期&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input class="Wdate" id="preiodstartid" name="preiodstart" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>学分&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="creditid" name="credit" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>结课日期&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input class="Wdate" id="preiodendid" name="preiodend" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       	</form>	
	       </div>
	        
	        <div class="tipbtn" id="tipbtn2">
	        <input name="" type="button" id="sure2" class="sure" value="确定" />&nbsp;
	        <input name="" type="button" id="cancel2" class="cancel" value="取消" />
		      	
	        </div>
    </div>
    
    
    <div class="tip3" id="tip3">
    	<div class="tiptop" id="tiptop3"><span>修改课程</span><a></a></div>
	       <div class="tipinfo3">
	     	 <form id="form2" action="updateCourse" method="post">
	     	 	
	     	 	<!-- 隐藏域   tno -->
	     	 	<input type="hidden" name="cno" id="cnoid1" value=""/>
	     	 	
	       		<font>课程&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="cnameid1" name="cname" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>开课日期&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input class="Wdate" id="preiodstartid1" name="preiodstart" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>学分&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="creditid1" name="credit" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>结课日期&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input class="Wdate" id="preiodendid1" name="preiodend" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       	</form>	

	       </div>
	        
	        <div class="tipbtn" id="tipbtn3">
	        <input name="" type="button" id="sure3" class="sure" value="确定" />&nbsp;
	        <input name="" type="button" id="cancel3" class="cancel" value="取消" />
		      	
	        </div>
    </div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	<script type="text/javascript" src="js/course.js"></script>
</body>

</html>
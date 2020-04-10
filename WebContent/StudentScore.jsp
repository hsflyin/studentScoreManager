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
	function updateScore(ctsid,credit){
		$(".tip").fadeIn(200);
		
		  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});

		  $(".sure").click(function(){
			  var score = $("#scoreid").val();
			  if(score.length>0){
				  if(score<credit){
					  $.post("updateScore",{ctsid:ctsid,score:score},function(result){
						  if(result == "true"){
								alert("修改成功");
								window.location.href="selStudentScore?tno="+${user.tno};
								return;
							}else if(result == "false"){
								alert("修改失败");
								return;
							}else{
								alert("数据出错");
								return;
							}
					  })
				  }else{
					  alert("评分不能大于总学分或输入分数错误");
					  return;
				  }
			  }else{
				  alert("请输入分数");
				  return;
			  }
			  
			  
			  
		  $(".tip").fadeOut(100);
		});

		  $(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		});
	}
	
	
</script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">学生信息</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">成绩查询</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <form action="selStudentScore" id="" method="post">
    	<input type="hidden" name="tno" value="${user.tno }"/>
	    <ul class="prosearch">
	   <li><i>学号</i><a><input id="sid" name="likesid" type="text" class="scinput" value="${likesid }" /></a></li>
	   <li><i>姓名</i><a><input id="sname" name="likesname" type="text" class="scinput" value="${likesname }" /></a></li>
	   <li><i>班级</i><a><input id="cname" name="likecname" type="text" class="scinput" value="${likecname }" /></a></li>
	   <li><a><input type="submit" class="sure" value="查询" /></a></li>
	   </ul>
	   <input type="hidden" id="sortid" value="${sort }"/>
	
	</form>
    
    
    <table class="tablelist">
    	
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th width="100px">学生编号</th>
        <th width="150px">课程</th>
        
        <th>学生</th>
        <th>班级</th>
        <th>教师</th>
        <th>学分</th>
        <th>开课日期</th>
        <th>结课日期</th>
        <th><a href="javascript:" onclick="selStudentScoreAsc();">评分<i class="sort"><img src="images/px.gif" /></i></a></th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${StudentScoreList }" var="cts" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${cts.ctsid }" /></td>
	        <td>${cts.student.sid }</td>
	        <td>${cts.course.cname }</td>
	        <td>${cts.student.sname }</td>
	        <td>${cts.clazz.cname  }</td>
	        <td>${cts.teacher.tname  }</td>
	        <td>${cts.course.credit  }</td>
	        <td>${cts.course.preiodstart }</td>
	        <td>${cts.course.preiodend }</td>
	        <td>${cts.score }</td>
	        <td><a href="javascript:" onclick="updateScore(${cts.ctsid },${cts.course.credit  });" class="tablelink">修改</a></td>
	        </tr> 
        	
        </c:forEach> 
 
        </tbody>
    </table>
  
  	 <br/>
  	 
     <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
      <br/> <br/> 
        <font>请输入分数&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="scoreid" name="score" type="text" class="scinput" />
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	<script type="text/javascript">
		function selStudentScoreAsc(){
			var likesid = $("#sid").val();
			var likesname = $("#sname").val();
			var likecname = $("#cname").val();
			var sort = $("#sortid").val();
			var tno = ${user.tno};
			if(sort=="desc"){
				window.location.href="selStudentScoreAsc?tno="+tno+"&likesid="+likesid+"&likesname="+encodeURI(encodeURI(likesname))+"&likecname="+encodeURI(encodeURI(likecname));
				return;
			}else if(sort=="asc"||sort==null||sort==""){
				window.location.href="selStudentScoreDesc?tno="+tno+"&likesid="+likesid+"&likesname="+encodeURI(encodeURI(likesname))+"&likecname="+encodeURI(encodeURI(likecname));
				return;
			}
			
		}
		
	
	</script>
</body>

</html>
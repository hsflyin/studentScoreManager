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
	.tip2{width:500px; height:360px; position:absolute;top:10%; left:20%;background:#fcfdfd;box-shadow:1px 8px 10px 1px #9b9b9b;border-radius:1px;behavior:url(js/pie.htc);  display:none; z-index:999;}
	.tipinfo2{padding-top:30px;margin-left:35px; height:95px;}
	#tipbtn2{
		position:relative;
		top:30%;
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
	 var varteachers = "";
	 
	 //判断是否被选中，如果被选中获取学生的sno
	 for(var i = 0 ; i < varchecks.length ; i++){
		 if(varchecks[i].checked){
			 varteachers += varchecks[i].value +",";
		 }		 
	 }
	 //把学生的id传给后台服务器
	 var varids = varteachers.substring(0,varteachers.length-1);
	 
	  window.location.href = "deleteTeachers?varids="+varids;
	  
	  
});

  /* 取消 */
  $("#cancel1").click(function(){
  $("#tip1").fadeOut(100);
});

});

	//全选,反选，全否
	function changecheck(varstr){
		//alert(varstr)
		var varchecks = document.getElementsByName("checkname");
		if(varstr=="all"){
			for(var i = 0 ;i<varchecks.length ; i++){
				varchecks[i].checked = true;
			}
		}else if(varstr == 'no'){
			for(var i = 0 ;i<varchecks.length ; i++){
				varchecks[i].checked = false;
			}
		}else if(varstr == 'fx'){
			for(var i = 0 ;i<varchecks.length ; i++){
				varchecks[i].checked = !varchecks[i].checked;
			}
		}
	}

	function deptChange(){
		var varselect = $("select").val();
		window.location.href = "selTeacher?dept="+varselect;
	}
	$(function(){
		var varselect = $("select").val();
		var deptHidden = $("#deptHidden").val();
		$("select").val(deptHidden);
	})
</script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">信息管理</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">教师信息</a></li>
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
	   <ul class="prosearch">
	   
	   <li><input type="button" class="sure" value="选择教师系别" />
	   <input type="hidden" id="deptHidden" value="${dept }" />
		   <select class="scinput" name="dept" onchange="deptChange();">
		   		
			   	<option value="信息工程系">信息工程系</option>
			   	<option value="土木工程系">土木工程系</option>
			   	<option value="工商管理系">工商管理系</option>
			   	<option value="外国语言文学系">外国语言文学系</option>
			   	<option value="法学系">法学系</option>
			   	<option value="金融系">金融系</option>
			   	<option value="会计系">会计系</option>
		   </select>
		</li>
	   </ul>
	</div>

    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>教师编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th width="150px">姓名</th>
        <th>系别</th>
        <th>出生日期</th>
        <th>入职日期</th>
        <th>籍贯</th>
        <th>电话</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${TeacherList }" var="teacher" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${teacher.tno }" /></td>
	        <td>${teacher.tno }</td>
	        <td>${teacher.tname }</td>
	        <td>${teacher.dept }</td>
	        <td>${teacher.birthdate }</td>
	        <td>${teacher.enterdate }</td>
	        <td>${teacher.birthplace }</td>
	        <td>${teacher.phone }</td>
	        <td><a href="javascript:" onclick="updateTeacher(${teacher.tno });" class="tablelink">修改</a>     <a href="deleteTeacher?tno=${teacher.tno }&dept=${teacher.dept }" class="tablelink"> 删除</a></td>
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
    	<div class="tiptop" id="tiptop2"><span>添加教师</span><a></a></div>
	       <div class="tipinfo2">
	     	 <form id="form1" action="insertTeacher" method="post">
	       		<font>姓名&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="tnameid" name="tname" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>出生日期&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input class="Wdate" id="birthdateid" name="birthdate" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		系别&nbsp;&nbsp;&nbsp;&nbsp;	
	       		<input id="deptid" name="dept" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		入职日期&nbsp;&nbsp;&nbsp;&nbsp;
	       		<input class="Wdate" id="enterdateid" name="enterdate" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>籍贯&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input id="birthplaceid" name="birthplace" type="text" class="scinput" />
	       		
				<br/><br/>
	       		<font>电话&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input id="phoneid" name="phone" type="text" class="scinput" /> 
	       		
	       	</form>	
	       </div>
	        
	        <div class="tipbtn" id="tipbtn2">
	        <input name="" type="button" id="sure2" class="sure" value="确定" />&nbsp;
	        <input name="" type="button" id="cancel2" class="cancel" value="取消" />
		      	
	        </div>
    </div>
    
    
    <div class="tip3" id="tip3">
    	<div class="tiptop" id="tiptop3"><span>修改学生</span><a></a></div>
	       <div class="tipinfo3">
	     	 <form id="form2" action="updateTeacher" method="post">
	     	 	
	     	 	<!-- 隐藏域   tno -->
	     	 	<input type="hidden" name="tno" id="tnoid1" value=""/>
	     	 	
	       		<font>姓名&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="tnameid1" name="tname" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>出生日期&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input class="Wdate" id="birthdateid1" name="birthdate" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		系别&nbsp;&nbsp;&nbsp;&nbsp;	
	       		<input id="deptid1" name="dept" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		入职日期&nbsp;&nbsp;&nbsp;&nbsp;
	       		<input class="Wdate" id="enterdateid1" name="enterdate" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>籍贯&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input id="birthplaceid1" name="birthplace" type="text" class="scinput" />
	       		
				<br/><br/>
	       		<font>电话&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<input id="phoneid1" name="phone" type="text" class="scinput" /> 
	       		
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
	<script type="text/javascript" src="js/teacher.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
	.tip{width:500px; height:260px; position:absolute;top:10%; left:20%;background:#fcfdfd;box-shadow:1px 8px 10px 1px #9b9b9b;border-radius:1px;behavior:url(js/pie.htc);  display:none; z-index:999;}
	.tipinfo{padding-top:30px;margin-left:35px; height:95px;}
	#tipbtn{
		position:relative;
		top:40%;
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
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
	  	var dept = $("#deptid").val(); 
		var cname = $("#cnameid").val(); 
		var clazzroom = $("#clazzroomid").val(); 
		var chteacher = $("#chteacherid").val(); 

		if((dept!="")&&(cname!="")&&(clazzroom!="")&&(chteacher!="")){
			
					$("#form1").submit();
					return;
		}else{
			alert("请输入完整信息");
			return;
		}
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});

</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">信息管理</a></li>
    <li><a href="#">班级管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="images/t01.png" /></span>添加</li>
        <!-- <li class="click"><span><img src="images/t02.png" /></span>修改</li> -->
        <li><a href="javascript:" onclick="deleteByClazzno();"><span><img src="images/t03.png" /></span>删除</a></a></li>
        </ul>

        <ul class="toolbar1">
        <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>

    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th width="150px">班级编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>系别</th>
        <th>班级</th>
        <th>教室</th>
        <th>班主任</th>
        <th>操作</th>
        </tr>
        </thead>
       <tbody>
        <c:forEach items="${clazzList }" var="clazz" varStatus="var">
        	<tr>
	        <td><input name="checkname" type="checkbox" value="${clazz.clazzno }" /></td>
	        
	        <td>${var.count }</td>
	        <td>${clazz.dept }</td>
	        <td>${clazz.cname }</td>
	        <td>${clazz.clazzroom }</td>
	        <td>${clazz.chteacher }</td>
	        <td><a href="javascript:" onclick="updateClazz(${clazz.clazzno });" class="tablelink">修改</a>     <a href="deleteClazz?clazzno=${clazz.clazzno }" class="tablelink"> 删除</a></td>
	        </tr> 
        	
        </c:forEach> 
 
        </tbody>
    </table>
    
   
    
    
    <div class="tip">
    	<div class="tiptop"><span>添加班级</span><a></a></div>
      <div class="tipinfo">
      	<form id="form1" action="insertClazz" method="post">
      		<font>系别&nbsp;&nbsp;&nbsp;&nbsp;</font>
      		<input id="deptid" name="dept" type="text" class="scinput" />
	       	&nbsp;&nbsp;&nbsp;&nbsp;班级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       	<input id="cnameid" name="cname" type="text" class="scinput" />
	       	
	       	<br/><br/>
	       	
	       	<font>教室&nbsp;&nbsp;&nbsp;&nbsp;</font>
      		<input id="clazzroomid" name="clazzroom" type="text" class="scinput" />
	       	&nbsp;&nbsp;&nbsp;&nbsp;班主任&nbsp;&nbsp;&nbsp;&nbsp;
	       	<input id="chteacherid" name="chteacher" type="text" class="scinput" />
      	</form>  
      </div>
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
    
    </div>
    
    <div class="tip3" id="tip3">
    	<div class="tiptop" id="tiptop3"><span>修改学生</span><a></a></div>
	       <div class="tipinfo3">
	     	 <form id="form2" action="updateClazz" method="post">
	     	 
	     	 	<!-- 隐藏域clazzno -->
	     	 	<input type="hidden" id="clazzno1" name="clazzno"/>
	     	 	
	     	 	<font>系别&nbsp;&nbsp;&nbsp;&nbsp;</font>
	      		<input id="deptid1" name="dept" type="text" class="scinput" />
		       	&nbsp;&nbsp;&nbsp;&nbsp;班级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       	<input id="cnameid1" name="cname" type="text" class="scinput" />
		       	
		       	<br/><br/>
		       	
		       	<font>教室&nbsp;&nbsp;&nbsp;&nbsp;</font>
	      		<input id="clazzroomid1" name="clazzroom" type="text" class="scinput" />
		       	&nbsp;&nbsp;&nbsp;&nbsp;班主任&nbsp;&nbsp;&nbsp;&nbsp;
		       	<input id="chteacherid1" name="chteacher" type="text" class="scinput" />
	       	
	       	</form>	
	       </div>
	        
	        <div class="tipbtn" id="tipbtn3">
	        <input name="" type="button" id="sure3" class="sure" value="确定" />&nbsp;
	        <input name="" type="button" id="cancel3" class="cancel" value="取消" />
		      	
	        </div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	<script type="text/javascript">
	function deleteByClazzno(){
		if($(":checkbox[name=checkname]:checked").size() == 0){
			alert("请至少选择一条记录进行删除操作");
		}else{
			var varchecks = document.getElementsByName("checkname");
			var varstudentids = "";
			 
			 //判断是否被选中，如果被选中获取班级的clazzno
			 for(var i = 0 ; i < varchecks.length ; i++){
				 if(varchecks[i].checked){
					 varstudentids += varchecks[i].value +",";
				 }		 
			 }
			 //把clazzno传给后台服务器
			 var varids = varstudentids.substring(0,varstudentids.length-1);
			 
			  window.location.href = "deleteByClazzno?varids="+varids;
			  
		}
	}
	
	function updateClazz(clazzno){
		$("#tip3").fadeIn(200);
		$.post("selClazzByClazzno",{"clazzno":clazzno},function(result){
			//alert(result);
			var data = JSON.parse(result);
			$("#clazzno1").val(data.clazzno);
			$("#deptid1").val(data.dept);
			$("#cnameid1").val(data.cname);
			$("#clazzroomid1").val(data.clazzroom);
			$("#chteacherid1").val(data.chteacher);
		});
	}

	/* 确定 */
	$("#sure3").click(function(){
		var clazzno = $("#clazzno1").val();
		var dept = $("#deptid1").val();
		var cname = $("#cnameid1").val();
		var clazzroom = $("#clazzroomid1").val();
		var chteacher = $("#chteacherid1").val();

		if((dept!="")&&(cname!="")&&(clazzroom!="")&&(chteacher!="")){
		
						$("#form2").submit();
				return;
		}else{
			alert("请输入完整信息");
			return;
		}
	});
	/* 关闭 */
	$("#tiptop3 a").click(function(){
	$("#tip3").fadeOut(200);
	});
	/* 取消 */
	$("#cancel3").click(function(){
		
	$("#tip3").fadeOut(100);
	});

	</script>

</body>

</html>
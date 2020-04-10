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
	 var varstudentids = "";
	 
	 //判断是否被选中，如果被选中获取学生的sno
	 for(var i = 0 ; i < varchecks.length ; i++){
		 if(varchecks[i].checked){
			 varstudentids += varchecks[i].value +",";
		 }		 
	 }
	 //把学生的id传给后台服务器
	 var varids = varstudentids.substring(0,varstudentids.length-1);
	 
	  window.location.href = "deleteStudents?varids="+varids;
	  
	  
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

</script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="javascript:void(0)">信息管理</a></li>
    <li><a href="javascript:void(0)" onclick="location.reload()">学生信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="add"><span><img src="images/t01.png" /></span>添加</li>
       <%--  <li><a href="javascript:" onclick="f(${student.sid });"><span><img src="images/t02.png" /></span>修改</a></li> --%>
        <li class="click"><span><img src="images/t03.png" /></span>删除</li>
        <li><a href="javascript:" onclick="changecheck('all');"><span><img src="images/t04.png" /></span>全选</a></li>
        <li><a href="javascript:" onclick="changecheck('no');"><span><img src="images/t04.png" /></span>全否</a></li>
        <li><a href="javascript:" onclick="changecheck('fx');"><span><img src="images/t04.png" /></span>反选</a></li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
	<form action="studentMessage" id="form3" method="post">
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
        <th>操作</th>
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
	        <td><a href="javascript:" onclick="updateStudent(${student.sno });" class="tablelink">修改</a>     <a href="deleteStudent?sno=${student.sno }" class="tablelink"> 删除</a></td>
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
        	<li class="paginItem"><a href="studentMessage?num=${1 }&likeid=${likeid }&likename=${likename }">首页</span></a></li>
        	<li class="paginItem"><a href="studentMessage?num=${pageStudentList.previous }&likeid=${likeid }&likename=${likename }"><span class="pagepre"></span></a></li>
        </c:if>
        <!-- 获取所有的页面数 -->
        <c:forEach begin="${pageStudentList.everyBegin }" end="${pageStudentList.everyEnd }" var="each">
        	<c:if test="${each ==pageStudentList.num }">
        	 	<li class="paginItem"><a style="color: red;font-size: 15px" href="studentMessage?num=${each }&likeid=${likeid }&likename=${likename }">${each }</a></li>
        	</c:if>
        	<c:if test="${each !=pageStudentList.num }">
        	 	<li class="paginItem"><a href="studentMessage?num=${each }">${each }</a></li>
        	</c:if>
        
        </c:forEach>
        <!-- 判断当前页面数是否是最后一页，如果不是最后一页就显示下一页页码标志 -->
        <c:if test="${pageStudentList.hasNext }">
	        <li class="paginItem"><a href="studentMessage?num=${pageStudentList.next }&likeid=${likeid }&likename=${likename }"><span class="pagenxt"></span></a></li>
        	<li class="paginItem"><a href="studentMessage?num=${pageStudentList.last }&likeid=${likeid }&likename=${likename }">尾页</span></a></li>
        </c:if>
        </ul>
    </div>
    
    
    
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
    	<div class="tiptop" id="tiptop2"><span>添加学生</span><a></a></div>
	       <div class="tipinfo2">
	     	 <form id="form1" action="addStudent" method="post">
	       		<font>学号&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="studentid1" name="sid" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;出生日期&nbsp;&nbsp;&nbsp;&nbsp;
	       		<input class="Wdate" id="birthtime1" name="birthtime" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>姓名&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="snameid1" name="sname" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;入学日期&nbsp;&nbsp;&nbsp;&nbsp;
	       		<input class="Wdate" id="intimeid1" name="intime" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>姓别&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<select class="scinput" name="gender" id="gender1">
	       			<option value="男" selected>男</option>
	       			<option value="女">女</option>
	       		</select>
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>班级&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<select class="scinput" name="clazzno" id="clazzno1">
	       			<option value="" selected>--请选择班级--</option>
	       		</select>
	       		
	       		
	       		<br/><br/>
	       		<font>籍贯&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="birthplace1" name="birthplace" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		
	       		
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
	     	 <form id="form2" action="updateStudent" method="post">
	     	 	
	     	 	<!-- 隐藏域 ,学生sno-->
	     	 	<input type="hidden" name="sno" id="hiddenid"/>
	     	 	<!-- 隐藏域 ,学生oldSid-->
	     	 	<input type="hidden" name="" id="hiddenno"/>
	     	 	
	       		<font>学号&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="studentid" name="sid" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;出生日期&nbsp;&nbsp;&nbsp;&nbsp;
	       		<input class="Wdate" id="birthtimeid" name="birthtime" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>姓名&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="snameid" name="sname" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;入学日期&nbsp;&nbsp;&nbsp;&nbsp;
	       		<input class="Wdate" id="intimeid" name="intime" style="width:154px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value="" />
	       		
	       		<br/><br/>
	       		<font>籍贯&nbsp;&nbsp;&nbsp;&nbsp;</font><input id="birthplaceid" name="birthplace" type="text" class="scinput" />
	       		&nbsp;&nbsp;&nbsp;&nbsp;
	       		<font>班级&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<select class="scinput" name="clazzno" id="clazzno2">
	       			<option value="" selected>--请选择班级--</option>
	       		</select>
	       		
	       		<br/><br/>
	       		<font>姓别&nbsp;&nbsp;&nbsp;&nbsp;</font>
	       		<select class="scinput" id="genderid" name="gender">
	       			<option value="男" selected>男</option>
	       			<option value="女">女</option>
	       		</select>
	       		
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
	<script type="text/javascript" src="js/student.js"></script>
</body>

</html>